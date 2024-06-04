const loadingManager = new THREE.LoadingManager()
const gltfLoader = new THREE.GLTFLoader(loadingManager);

loadingManager.onStart = function (url, itemsLoaded, itemsTotal) {
    console.log('Loading started...');
    document.getElementById("loading-background").style.display = '';
};

loadingManager.onLoad = function () {
    console.log('All models have been loaded!');
    document.getElementById("loading-background").style.display = 'none';
};

// Check if the device is a mobile device
function isMobileDevice() {
    return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
}

/* Scene */
const scene = new THREE.Scene();

/* Camera */
const camera = new THREE.PerspectiveCamera(45, 1 / 1, 0.1, 100);
camera.position.set(5.5, 2.5, 0);

/* Texture Loader */
// Create a texture loader
function createTextureLoader() {
    return new THREE.TextureLoader();
}

// Initialize the texture loader
var textureLoader = createTextureLoader();

// Load a texture with optional properties
function loadTexture(path, properties = {}) {

    var texture = textureLoader.load(path);

    // Set repeat, wrapS, wrapT properties
    texture.repeat.copy(properties.repeat || new THREE.Vector2(5, 5));
    texture.wrapS = properties.wrapS || THREE.RepeatWrapping;
    texture.wrapT = properties.wrapT || THREE.RepeatWrapping;

    // Apply additional properties
    Object.assign(texture, properties.additional || {});

    return texture;
}



// add camera to the scene
scene.add(camera);

/* Scene Canvas */
const canvas = document.querySelector('canvas.product-canvas-waistcoat')

const textures = {
    upperTexture: loadTexture('/assets/textures/fabrics/23.jpg'),
    normalTexture: loadTexture('/assets/textures/normal.jpg'),
    roughnessTexture: loadTexture('/assets/textures/roughness.jpg'),
};

function darkenScene(sceneName) {
    // Access the scene by name
    var targetScene = scene.getObjectByName(sceneName);

    // Check if the scene exists
    if (targetScene) {
        // Iterate through each child (mesh) in the target scene
        targetScene.traverse(function (child) {
            if (child.isMesh) {
                // Darken the color of the material
                child.material.color.setRGB(0.8, 0.8, 0.8); // Adjust RGB values to make it darker
            }
        });
    }
}

const meshesToSkipButtonHole = ["SM_Button_4.001_0", "SM_Button_4.002_0", "SM_Button_8*4.001_0", "SM_Button_6*3.001_0"];
const meshesToSkipButtons = ["SM_Button_4.001_1", "SM_Button_4.002_1", "SM_Button_8*4.001_1", "SM_Button_6*3.001_1"];
const meshesToSkipStitching = ["SM_Stitching_Singlefornt", "SM_Stitching_notch_reguler_lapel"];

var stitching_color = "#ffffff";
var button_color = "#ffffff";

function loadAndConfigureModel(gltfLoader, scene, path, fabricTexture, scale, position, category) {

    gltfLoader.load(path, (gltf) => {
        const model = gltf.scene;

        model.name = category


        if (isMobileDevice()) {
            model.scale.set(scale * 1.3, scale * 1.3, scale * 1.3);
            model.position.set(position.x, position.y * 1.3, position.z);
        } else {
            model.scale.set(scale, scale, scale);
            model.position.set(position.x, position.y, position.z);
        }

        const button_hole_texture = new THREE.TextureLoader().load('/assets/textures/button_hole.png');

        model.traverse(function (child) {

            if (child.isMesh && meshesToSkipButtonHole.includes(child.name)) {
                if (child.material instanceof THREE.MeshStandardMaterial) {
                    child.material.map = button_hole_texture;
                    child.material.color.setHex("0x" + parseInt(stitching_color.substring(1), 16).toString(16).padStart(6, "0"))
                    child.material.needsUpdate = true;
                }
                    
            } else if (child.isMesh && meshesToSkipButtons.includes(child.name)) {
                if (child.material instanceof THREE.MeshStandardMaterial) {
                    child.material.color.setHex("0x" + parseInt(button_color.substring(1), 16).toString(16).padStart(6, "0"))
                    child.material.needsUpdate = true;
                }
                     
            } else if (child.isMesh && child.name == "SM_Vest_Back_inside") {
                child.material.map = loadTexture('/assets/textures/fabrics/26.jpg');

            } else if(child.isMesh && meshesToSkipStitching.includes(child.name)) {
                if (child.material instanceof THREE.MeshStandardMaterial) {
                    // child.material.map = stitching_texture;
                    child.material.color.setHex("0x" + parseInt(stitching_color.substring(1), 16).toString(16).padStart(6, "0"))
                    child.material.needsUpdate = true;
                }

            } else {
                if (child.material instanceof THREE.MeshStandardMaterial) {
                    child.material.roughness = 2;
                    child.material.roughnessMap = textures.roughnessTexture;
                    child.material.map = fabricTexture;
                }
            }

        });

        scene.add(model);
        darkenScene("pockets");
        darkenScene("buckle");
        darkenScene("SM_Single_Notch_lapel");
        darkenScene("SM_Vest_front_Sigle_6*3Button_ShawlLapel_2");
        darkenScene("SM_Vest_front_Sigle_6*3_Button_Straight_peakLaple_2");
        
    });
}


let assetsData = [];

let fabricTexture = loadTexture('/assets/textures/fabrics/05.jpg')
let otherTexture = loadTexture('/assets/textures/fabrics/07.jpg')

// Function to fetch and load JSON data
const loadAssetsDataFile = async () => {
    try {
        const response = await fetch('/assets/json/waistcoat/assetsData.json');
        assetsData = await response.json();
        setDefaultModel()

    } catch (error) {
        console.error('Error loading assetsData:', error);
    }
};

loadAssetsDataFile();

/**
** Select Assets 
**/

function selectAsset(category, assetName, element) {

    localStorage.setItem(`waistcoat_${category}`, assetName);

    const selectedAsset = assetsData.find(asset => asset.name === assetName);

    const front = scene.getObjectByName('front');
    const stitching = scene.getObjectByName('stitching');

    if (selectedAsset) {
        // Remove previously loaded model of the same category
        const previousModel = scene.getObjectByName(category);

        if (previousModel) {
            scene.remove(previousModel);
        }

        if (assetName == "single_front_stiching") {
            scene.remove(front);
            loadAndConfigureModel(gltfLoader, scene, assetsData[0].file_path, fabricTexture, 0.8, { x: 0, y: -1.5, z: 0 }, 'front');

        } else if (assetName == "notch_reguler_lapel_stitching") {
            scene.remove(front);
            loadAndConfigureModel(gltfLoader, scene, assetsData[3].file_path, fabricTexture, 0.8, { x: 0, y: -1.5, z: 0 }, 'front');

        }

        if (category == "stitching") {
            loadAndConfigureModel(gltfLoader, scene, selectedAsset.file_path, fabricTexture, 0.8, { x: 0, y: -1.5, z: 0 }, category);

        } else {
            scene.remove(stitching);
            loadAndConfigureModel(gltfLoader, scene, selectedAsset.file_path, fabricTexture, 0.8, { x: 0, y: -1.5, z: 0 }, category);
        }

        
            
        document.querySelectorAll('.assets-select[data-category="' + category + '"]').forEach(function (otherCard) {
            otherCard.classList.remove('active');
        });

        element.classList.add('active');
    }
}

/**
** Select Fabric 
**/

function applyTextureToGroup(group, fabricTexture, buttonColor, stitchingColor) {
    group.traverse((child) => {

        if (child.isMesh && child.material instanceof THREE.MeshStandardMaterial) {

            if (meshesToSkipButtonHole.includes(child.name)) {

                stitching_color = stitchingColor;
                child.material.color.setHex("0x" + parseInt(stitchingColor.substring(1), 16).toString(16).padStart(6, "0"))

            } else if (meshesToSkipButtons.includes(child.name)) {
               
                button_color = buttonColor;
                child.material.color.setHex("0x" + parseInt(buttonColor.substring(1), 16).toString(16).padStart(6, "0"))

            } else if (meshesToSkipStitching.includes(child.name)) {
               
                stitchingColor = stitchingColor;
                child.material.color.setHex("0x" + parseInt(stitchingColor.substring(1), 16).toString(16).padStart(6, "0"))

            } else if (child.name == "SM_Vest_Back_inside"){

                child.material.map = loadTexture('/assets/textures/fabrics/05.jpg');

            } else {
                child.material.map = fabricTexture;
                child.material.needsUpdate = true;
            }
                

        }

    });
}

function selectFabric(id, category, tilingS, tilingT, path, name, buttonColor, stitchingColor, price, element) {

    localStorage.setItem("waistcoat_fabric", id);
    localStorage.setItem("waistcoat_price", price);

    document.getElementById("fabricPrice").innerHTML = "Rs. " + price;

    document.querySelectorAll('.fabric-select[data-category="' + category + '"]').forEach(function (otherCard) {
        otherCard.classList.remove('active');
    });

    element.classList.add('active');

    let newFabric = ''

    if (category == 'body') {
        newFabric = loadTexture(path, {
            repeat: new THREE.Vector2(tilingS, tilingT),
            wrapS: THREE.RepeatWrapping,
            wrapT: THREE.RepeatWrapping,
        })
        fabricTexture = loadTexture(path, {
            repeat: new THREE.Vector2(tilingS, tilingT),
            wrapS: THREE.RepeatWrapping,
            wrapT: THREE.RepeatWrapping,
        })

    } else if (category == 'other') {
        newFabric = loadTexture(path, {
            repeat: new THREE.Vector2(tilingS, tilingT),
            wrapS: THREE.RepeatWrapping,
            wrapT: THREE.RepeatWrapping,
        })
        otherTexture = loadTexture(path, {
            repeat: new THREE.Vector2(tilingS, tilingT),
            wrapS: THREE.RepeatWrapping,
            wrapT: THREE.RepeatWrapping,
        })
    }


    // Iterate over the objects in the scene to find the group with the specified category
    const array = {
        "body": ["back", "front", "pockets", "buckle", "stitching"],
        "other": ["lapel_lining"]
    };

    if (array[category]) {
        scene.traverse((object) => {
            if (array[category].includes(object.name)) {
                applyTextureToGroup(object, newFabric, buttonColor, stitchingColor);
            }
        });

    }
}

function setDefaultModel() {
    const loadedCategories = new Set();

    assetsData.forEach(asset => {
        const { name, category, file_path } = asset;

        localStorage.setItem(`waistcoat_${category}`, name);

        const array = {
            "body": ["back", "front", "pockets", "buckle"],
            "other": ["lining_back"]
        };

        if (!loadedCategories.has(category)) {

            if (array.body.includes(category)) {
                loadAndConfigureModel(gltfLoader, scene, file_path, fabricTexture, 0.8, { x: 0, y: -1.5, z: 0 }, category);
            } else if (array.other.includes(category)) {
                loadAndConfigureModel(gltfLoader, scene, file_path, otherTexture, 0.8, { x: 0, y: -1.5, z: 0 }, category);
            }
            loadedCategories.add(category);
        }

    });

}



/* Lightings */

//create lightings
const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);

const directionalLightBack = new THREE.DirectionalLight(0xffffff, 0.5);
directionalLightBack.castShadow = true;
directionalLightBack.shadow.mapSize.set(1024, 1024);
directionalLightBack.shadow.camera.far = 15;
directionalLightBack.shadow.camera.left = -7;
directionalLightBack.shadow.camera.top = 7;
directionalLightBack.shadow.camera.right = 7;
directionalLightBack.shadow.camera.bottom = -7;
directionalLightBack.position.set(-5, 3, 0);

const directionalLightFront = new THREE.DirectionalLight(0xffffff, 0.5);
directionalLightFront.castShadow = true;
directionalLightFront.shadow.mapSize.set(1024, 1024);
directionalLightFront.shadow.camera.far = 15;
directionalLightFront.shadow.camera.left = -7;
directionalLightFront.shadow.camera.top = 7;
directionalLightFront.shadow.camera.right = 7;
directionalLightFront.shadow.camera.bottom = -7;
directionalLightFront.position.set(5, 3, 0);

// If it's a mobile device, decrease the intensity of the lights
if (isMobileDevice()) {
    ambientLight.intensity = 0.65;
    directionalLightBack.intensity = 0.65;
    directionalLightFront.intensity = 0.65;
}

// add lighting to the scene
scene.add(ambientLight);
scene.add(directionalLightBack);
scene.add(directionalLightFront);


/* Orbit Controls */
const controls = new THREE.OrbitControls(camera, canvas);
controls.enableDamping = true;
// controls.enableZoom = false;
controls.minPolarAngle = Math.PI / 2.5;
controls.maxPolarAngle = Math.PI / 3;
controls.rotateSpeed = 0.5;


/* Renderer */
const renderer = new THREE.WebGLRenderer({
    canvas: canvas,
    antialias: true,
});
renderer.shadowMap.enabled = true;
renderer.shadowMap.type = THREE.PCFSoftShadowMap;
renderer.setSize(window.innerWidth, window.innerHeight);
renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
renderer.setClearColor(0xEFEFEF);


/* Window Size */
const sizes = {
    width: window.innerWidth,
    height: window.innerHeight
};

// Sizes and update function
const updateSizes = () => {

    if (isMobileDevice()) {
        sizes.width = window.innerWidth * 2;
    } else {
        sizes.width = window.innerWidth / 2;
    }

    
    sizes.height = window.innerHeight;

    camera.aspect = sizes.width / sizes.height;
    camera.updateProjectionMatrix();

    renderer.setSize(sizes.width, sizes.height);
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
    
};
    

window.addEventListener('resize', updateSizes);


// Render loop
const tick = () => {
    controls.update();
    renderer.render(scene, camera);
    requestAnimationFrame(tick);
};

tick(); 