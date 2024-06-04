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
const canvas = document.querySelector('canvas.product-canvas-jacket')

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
                child.material.color.setRGB(0.72, 0.72, 0.72); // Adjust RGB values to make it darker
            }
        });
    }
}

const meshesToSkipButtonHole = ["SM_J_B__FrontB1_1", "SM_J_B__FrontB2_1", "SM_J_B__FrontB3_1", "SM_J_B__FrontB2*1_1", "SM_J_B_FrontB4*1_1", "SM_J_B_FrontB4*2_1", "SM_J_B_FrontB6*1_1", "SM_J_B_FrontB6*2_1"];
const meshesToSkipButtons = ["SM_J_B__FrontB1_0", "SM_J_B__FrontB1_0", "SM_J_B__FrontB2_0", "SM_J_B__FrontB2*1_0", "SM_J_B__FrontB3_0", "SM_J_B_FrontB4*1_0", "SM_J_B_FrontB4*2_0", "SM_J_B_FrontB6*1_0", "SM_J_B_FrontB6*2_0"];
const meshesToSkipAMF = ["SM_Lapel_B1_Notch_R003"]


var stitching_color = "#ffffff";
var button_color = "#ffffff";

function loadAndConfigureModel(gltfLoader, scene, path, fabricTexture, scale, position, category) {

    gltfLoader.load(path, (gltf) => {
        const model = gltf.scene;

        model.name = category

        if (isMobileDevice()) {
            model.scale.set(scale * 1.4, scale * 1.4, scale * 1.4);
            model.position.set(position.x , position.y * 1.55, position.z);
        } else {
            model.scale.set(scale, scale, scale);
            model.position.set(position.x, position.y, position.z);
        }

        const button_hole_texture = new THREE.TextureLoader().load('/assets/textures/button_hole.png');
        const stitching_texture = new THREE.TextureLoader().load('/assets/textures/stiching.png');

        model.traverse(function (child) {

            if (child.isMesh && meshesToSkipButtonHole.includes(child.name)) {
                if (child.material instanceof THREE.MeshStandardMaterial) {
                    child.material.map = button_hole_texture;
                    child.material.needsUpdate = true;
                }
            } else if (child.isMesh && meshesToSkipButtons.includes(child.name)) {
                if (child.material instanceof THREE.MeshStandardMaterial) {
                    child.material.color.setHex("0x" + parseInt(button_color.substring(1), 16).toString(16).padStart(6, "0"))
                    child.material.needsUpdate = true;
                }
                     
            } else if (child.isMesh && meshesToSkipAMF.includes(child.name)) {
                if (child.material instanceof THREE.MeshStandardMaterial) {
                    // child.material.map = stitching_texture;
                    child.material.color.setHex("0x" + parseInt(button_color.substring(1), 16).toString(16).padStart(6, "0"))
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
        darkenScene("lapel");
        darkenScene("brest_pockets");

    });

}

let assetsData = [];

let fabricTexture = loadTexture('/assets/textures/fabrics/05.jpg')
let otherTexture = loadTexture('/assets/textures/fabrics/05.jpg')

// Function to fetch and load JSON data
const loadAssetsDataFile = async () => {
    try {
        const response = await fetch('/assets/json/jacket/assetsData.json');
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

function selectAsset(category, assetName, suiteType, element) {
    
    console.log("🚀 ~ selectAsset ~ scene:", scene)

    localStorage.setItem(`suit_${category}`, assetName);

    const selectedAsset = assetsData.find(asset => asset.name === assetName);

    const lapel = scene.getObjectByName('lapel');

    if (selectedAsset) {
        // Remove previously loaded model of the same category
        let previousModel = scene.getObjectByName(category);

        if (previousModel) {
            scene.remove(previousModel);
        }

        if (category !== "lapel") {

            if (suiteType === "one_button") {

                scene.remove(lapel);
                loadAndConfigureModel(gltfLoader, scene, assetsData[9].file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, 'lapel');

            } else if (suiteType === "two_button") {

                scene.remove(lapel);
                loadAndConfigureModel(gltfLoader, scene, assetsData[17].file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, 'lapel');

            } else if (suiteType === "three_button") {

                scene.remove(lapel);
                loadAndConfigureModel(gltfLoader, scene, assetsData[24].file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, 'lapel');

            } else if (suiteType === "2_1_button") {

                scene.remove(lapel);
                loadAndConfigureModel(gltfLoader, scene, assetsData[28].file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, 'lapel');

            } else if (suiteType === "4_1_button") {

                scene.remove(lapel);
                loadAndConfigureModel(gltfLoader, scene, assetsData[30].file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, 'lapel');

            } else if (suiteType === "4_2_button") {

                scene.remove(lapel);
                loadAndConfigureModel(gltfLoader, scene, assetsData[32].file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, 'lapel');

            } else if (suiteType === "6_1_button") {

                scene.remove(lapel);
                loadAndConfigureModel(gltfLoader, scene, assetsData[34].file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, 'lapel');

            } else if (suiteType === "6_2_button") {

                scene.remove(lapel);
                loadAndConfigureModel(gltfLoader, scene, assetsData[36].file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, 'lapel');

            }
        }

        loadAndConfigureModel(gltfLoader, scene, selectedAsset.file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, category);

        document.querySelectorAll('.assets-select[data-category="' + category + '"]').forEach(function (otherCard) {
            otherCard.classList.remove('active');
        });

        element.classList.add('active');
    }
    if (category === "front") {
        // loadAssetsData(suiteType);
        const allElements = document.getElementsByClassName("lapel-cls");
        // Add class 'hide' to all elements
        Array.from(allElements).forEach(element => {
            element.classList.add('d-none');
        });
        const allElements2 = document.getElementsByClassName(suiteType);
        // Add class 'hide' to all elements
        Array.from(allElements2).forEach(element => {
            element.classList.remove('d-none');
        });
    }

}

/**
** Select Fabric 
**/



function applyTextureToGroup(group, fabricTexture, buttonColor, stitchingColor) {

    group.traverse((child) => {
        if (child.isMesh && child.material instanceof THREE.MeshStandardMaterial) {

            console.log(child.name);

            // Check if the current mesh should be skipped
            if (meshesToSkipButtonHole.includes(child.name)) {

                stitching_color = stitchingColor;
                child.material.color.setHex("0x" + parseInt(stitchingColor.substring(1), 16).toString(16).padStart(6, "0"))

            } else if (meshesToSkipButtons.includes(child.name)) {
               
                button_color = buttonColor;
                child.material.color.setHex("0x" + parseInt(buttonColor.substring(1), 16).toString(16).padStart(6, "0"))

            } else {

                child.material.map = fabricTexture;
                child.material.needsUpdate = true;
            }

            
        }

    });
}

function selectFabric(category, tilingS, tilingT, path, name, buttonColor, stitchingColor, price, element) {

    localStorage.setItem("suit_fabric", name);

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
        newFabric = loadTexture(path)
        otherTexture = loadTexture(path)
    }


    // Iterate over the objects in the scene to find the group with the specified category
    const array = {
        "body": ["back_vent", "sleaves", "front", "lapel", "pockets", "ticket_pockets", "brest_pockets", "amf"],
        "other": [""]
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
    const loadedCategories = new Set(); // To keep track of loaded categories

    assetsData.forEach(asset => {
        const { name, category, file_path } = asset;

        localStorage.setItem(`suit_${category}`, name);

        if (!file_path == "") {
            if (!loadedCategories.has(category)) {
                loadAndConfigureModel(gltfLoader, scene, file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, category);
                loadedCategories.add(category); // Mark category as loaded
            }
        }


    });

}

/* Lightings */

//create lightings
const ambientLight = new THREE.AmbientLight(0xffffff, 0.62);

const directionalLightBack = new THREE.DirectionalLight(0xffffff, 0.62);
directionalLightBack.castShadow = true;
directionalLightBack.shadow.mapSize.set(1024, 1024);
directionalLightBack.shadow.camera.far = 15;
directionalLightBack.shadow.camera.left = -7;
directionalLightBack.shadow.camera.top = 7;
directionalLightBack.shadow.camera.right = 7;
directionalLightBack.shadow.camera.bottom = -7;
directionalLightBack.position.set(-5, 3, 0);

const directionalLightFront = new THREE.DirectionalLight(0xffffff, 0.62);
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
    ambientLight.intensity = 0.8;
    directionalLightBack.intensity = 0.8;
    directionalLightFront.intensity = 0.8;
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

// Sizes and update function
const sizes = {
    width: window.innerWidth,
    height: window.innerHeight
};

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