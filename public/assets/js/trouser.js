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
const canvas = document.querySelector('canvas.product-canvas-trouser')

const textures = {
    upperTexture: loadTexture('/assets/textures/fabrics/23.jpg'),
    normalTexture: loadTexture('/assets/textures/normal.jpg'),
    roughnessTexture: loadTexture('/assets/textures/roughness.jpg'),
};


let fabricTexture = loadTexture('/assets/textures/fabrics/23.jpg', {
  repeat: new THREE.Vector2(1, 1),
  wrapS: THREE.RepeatWrapping,
  wrapT: THREE.RepeatWrapping,
})

function darkenScene(sceneName) {
    // Access the scene by name
    var targetScene = scene.getObjectByName(sceneName);

    // Check if the scene exists
    if (targetScene) {
        // Iterate through each child (mesh) in the target scene
        targetScene.traverse(function(child) {
            if (child.isMesh) {
                // Darken the color of the material
                child.material.color.setRGB(0.7, 0.7, 0.7); // Adjust RGB values to make it darker
            }
        });
    }
}


/* Model Loader */
function loadAndConfigureModel(gltfLoader, scene, path, fabricTexture, scale, position, category) {
console.log("🚀 ~ loadAndConfigureModel ~ path:", path)

    if(path == "") {
        return
    }

    gltfLoader.load(path, (gltf) => {
        const model = gltf.scene;

        model.name = category

        model.traverse((node) => {
            if (node.isMesh) {
                if (node.material instanceof THREE.MeshStandardMaterial) {
                    node.material.roughness = 2;
                    node.material.roughnessMap = textures.roughnessTexture;

                    // Set the fabric texture
                    node.material.map = fabricTexture;
                }
            }
        });

        if (isMobileDevice()) {
            model.scale.set(scale * 1.2, scale * 1.2, scale * 1.2);
            model.position.set(position.x , position.y * 1.3, position.z);
        } else {
            model.scale.set(scale, scale, scale);
            model.position.set(position.x, position.y, position.z);
        }

        scene.add(model);

        darkenScene("back_pockets");
        darkenScene("side_pockets");
        darkenScene("piping");
        darkenScene("belt_loops");

    });
}


let assetsData = [];

// Function to fetch and load JSON data
const loadAssetsDataFile = async () => {
    try {
        const response = await fetch('/assets/json/trouser/assetsData.json');
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

    localStorage.setItem(`trouser_${category}`, assetName);

    const selectedAsset = assetsData.find(asset => asset.name === assetName);

    if (selectedAsset) {
        // Remove previously loaded model of the same category
        const previousModel = scene.getObjectByName(category);

        if (previousModel) {
            scene.remove(previousModel);
        }

        if (assetName === "no_piping") {
            document.querySelectorAll('.assets-select[data-category="' + category + '"]').forEach(function (otherCard) {
                otherCard.classList.remove('active');
            });

            element.classList.add('active');

            return
        }

        loadAndConfigureModel(gltfLoader, scene, selectedAsset.file_path, fabricTexture, 0.65, { x: 0, y: -1.8, z: 0 }, category);


        document.querySelectorAll('.assets-select[data-category="' + category + '"]').forEach(function (otherCard) {
            otherCard.classList.remove('active');
        });

        element.classList.add('active');
    }
}

/**
** Select Fabric 
**/

function selectFabric(category, tilingS, tilingT, path, name, buttonColor, stitchingColor, price, element) {

        localStorage.setItem("trouser_fabric", name);

        document.getElementById("fabricPrice").innerHTML = "Rs. " + price;

        document.querySelectorAll('.fabric-select[data-category="' + category + '"]').forEach(function (otherCard) {
            otherCard.classList.remove('active');
        });
        element.classList.add('active');

        fabricTexture = loadTexture(path, {
            repeat: new THREE.Vector2(tilingS, tilingT),
            wrapS: THREE.RepeatWrapping,
            wrapT: THREE.RepeatWrapping,
        });

        // Iterate over the objects in the scene to find the group with the specified category
        const array = {
            "body": ["base", "back_pockets", "belt", "belt_loops", "hem", "piping", "pleat", "side_pockets"]
        };

        if (array[category]) {
            scene.traverse((object) => {
                if (array[category].includes(object.name)) {
                    applyTextureToGroup(object, fabricTexture);
                }
            });

        }
}

function applyTextureToGroup(group, fabricTexture) {
    group.traverse((child) => {
        if (child.isMesh && child.material instanceof THREE.MeshStandardMaterial) {
            // Update the material's map to the selected fabric texture
            child.material.map = fabricTexture;
            child.material.needsUpdate = true; // Ensure material update
        }
    });
}

function setDefaultModel() {
    const loadedCategories = new Set(); // To keep track of loaded categories

    

    assetsData.forEach(asset => {
        const { name, category, file_path } = asset;

        localStorage.setItem(`trouser_${category}`, name);

        if (!loadedCategories.has(category)) {
            loadAndConfigureModel(gltfLoader, scene, file_path, fabricTexture, 0.65, { x: 0, y: -1.8, z: 0 }, category);
            loadedCategories.add(category); // Mark category as loaded
        }
    });
}

// setDefaultModel()

/* Lightings */

//create lightings
const ambientLight = new THREE.AmbientLight(0xffffff, 0.72);

const directionalLightBack = new THREE.DirectionalLight(0xffffff, 0.72);
directionalLightBack.castShadow = true;
directionalLightBack.shadow.mapSize.set(1024, 1024);
directionalLightBack.shadow.camera.far = 15;
directionalLightBack.shadow.camera.left = -7;
directionalLightBack.shadow.camera.top = 7;
directionalLightBack.shadow.camera.right = 7;
directionalLightBack.shadow.camera.bottom = -7;
directionalLightBack.position.set(-5, 3, 0);

const directionalLightFront = new THREE.DirectionalLight(0xffffff, 0.72);
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
controls.enableZoom = false;
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