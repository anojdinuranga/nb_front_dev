// assets_manege.js
import * as THREE from 'three';
import { scene, textureLoader, loadTexture } from '../services/jacket/threeSetup.js';
import { GLTFLoader } from 'https://unpkg.com/three@0.139.2/examples/jsm/loaders/GLTFLoader.js';
import { loadAndConfigureModel } from '../services/jacket/modelLoader.js';

const loadingManager = new THREE.LoadingManager()
const gltfLoader = new GLTFLoader(loadingManager);

loadingManager.onStart = function (url, itemsLoaded, itemsTotal) {
  console.log('Loading started...');
  document.getElementById("loading-background").style.display = '';
};

loadingManager.onLoad = function () {
  console.log('All models have been loaded!');
  document.getElementById("loading-background").style.display = 'none';
};

let assetsData = [];

let fabricTexture = loadTexture('/assets/textures/fabrics/05.jpg', {
  repeat: new THREE.Vector2(15, 15),
  wrapS: THREE.RepeatWrapping,
  wrapT: THREE.RepeatWrapping,
})

let otherTexture = loadTexture('/assets/textures/fabrics/04.jpg')

// Function to fetch and load JSON data
const loadAssetsData = async () => {
  try {
    const response = await fetch('/assets/json/jacket/assetsData.json');
    assetsData = await response.json();
  } catch (error) {
    console.error('Error loading assetsData:', error);
  }
};

loadAssetsData();

/**
** Select Assets 
**/


function addEventListeners() {
  document.querySelectorAll('.assets-select').forEach(function (card) {
    card.addEventListener('click', function () {
      const category = card.getAttribute('data-category');
      const assetsPath = card.getAttribute('data-path');
      const suiteType = card.getAttribute('data-type');
      const lapel = scene.getObjectByName('lapel');


      // Remove previously loaded model of the same category
      let previousModel = scene.getObjectByName(category);


      if (previousModel) {
        scene.remove(previousModel);
      } previousModel = scene.getObjectByName(category);
      if (previousModel) {
        scene.remove(previousModel);
      } previousModel = scene.getObjectByName(category);
      if (previousModel) {
        scene.remove(previousModel);
      } previousModel = scene.getObjectByName(category);
      if (previousModel) {
        scene.remove(previousModel);
      } previousModel = scene.getObjectByName(category);
      if (previousModel) {
        scene.remove(previousModel);
      } previousModel = scene.getObjectByName(category);
      if (previousModel) {
        scene.remove(previousModel);
      } previousModel = scene.getObjectByName(category);
      if (previousModel) {
        scene.remove(previousModel);
      } previousModel = scene.getObjectByName(category);
      if (previousModel) {
        scene.remove(previousModel);
      } previousModel = scene.getObjectByName(category);
      if (previousModel) {
        scene.remove(previousModel);
      } previousModel = scene.getObjectByName(category);



      if (suiteType == "one_button") {

        scene.remove(lapel);
        loadAndConfigureModel(gltfLoader, scene, assetsData[9].file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, 'lapel');

      } else if (suiteType == "two_button") {

        scene.remove(lapel);
        loadAndConfigureModel(gltfLoader, scene, assetsData[17].file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, 'lapel');

      } else if (suiteType == "three_button") {

        scene.remove(lapel);
        loadAndConfigureModel(gltfLoader, scene, assetsData[24].file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, 'lapel');

      } else if (suiteType == "2_1_button") {

        scene.remove(lapel);
        loadAndConfigureModel(gltfLoader, scene, assetsData[28].file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, 'lapel');

      } else if (suiteType == "4_1_button") {

        scene.remove(lapel);
        loadAndConfigureModel(gltfLoader, scene, assetsData[30].file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, 'lapel');

      } else if (suiteType == "4_2_button") {

        scene.remove(lapel);
        loadAndConfigureModel(gltfLoader, scene, assetsData[32].file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, 'lapel');

      } else if (suiteType == "6_1_button") {

        scene.remove(lapel);
        loadAndConfigureModel(gltfLoader, scene, assetsData[34].file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, 'lapel');

      } else if (suiteType == "6_2_button") {

        scene.remove(lapel);
        loadAndConfigureModel(gltfLoader, scene, assetsData[36].file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, 'lapel');

      }

      loadAndConfigureModel(gltfLoader, scene, assetsPath, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, category);

      document.querySelectorAll('.assets-select[data-category="' + category + '"]').forEach(function (otherCard) {
        otherCard.classList.remove('active');
      });

      card.classList.add('active');
    });
  });
}
addEventListeners()



/**
** Select Fabric 
**/

const meshesToSkip = ["SM_J_B__FrontB1_2", "SM_J_B__FrontB2_2", "SM_J_B__FrontB2*1_2", "SM_J_B__FrontB3_2", "SM_J_B_FrontB4*1_2", "SM_J_B_FrontB4*2_2", "SM_J_B_FrontB6*1_2", "SM_J_B_FrontB6*2_2"];

function applyTextureToGroup(group, fabricTexture, meshesToSkip) {
  group.traverse((child) => {
    if (child.isMesh && child.material instanceof THREE.MeshStandardMaterial) {

      // Check if the current mesh should be skipped
      if (meshesToSkip.includes(child.name)) {
        // Skip applying the texture to this mesh
        return;
      }

      // Update the material's map to the selected fabric texture
      child.material.map = fabricTexture;
      child.material.needsUpdate = true; // Ensure material update
    }
  });
}



document.querySelectorAll('.fabric-select').forEach(function (card) {
  card.addEventListener('click', function () {
    var category = card.getAttribute('data-category');
    var path = card.getAttribute('data-path');
    var tilingS = card.getAttribute('data-tilingS');
    var tilingT = card.getAttribute('data-tilingT ')

    document.querySelectorAll('.fabric-select[data-category="' + category + '"]').forEach(function (otherCard) {
      otherCard.classList.remove('active');
    });
    card.classList.add('active');

    let newFabric = ''

    if (category == 'body') {
      newFabric = loadTexture(path, {
        repeat: new THREE.Vector2(15, 15),
        wrapS: THREE.RepeatWrapping,
        wrapT: THREE.RepeatWrapping,
      })
      fabricTexture = loadTexture(path, {
        repeat: new THREE.Vector2(15, 15),
        wrapS: THREE.RepeatWrapping,
        wrapT: THREE.RepeatWrapping,
      })

    } else if (category == 'other') {
      newFabric = loadTexture(path)
      otherTexture = loadTexture(path)
    }


    // Iterate over the objects in the scene to find the group with the specified category
    const array = {
      "body": ["back_vent", "sleaves", "front", "lapel", "pockets", "ticket_pockets"],
      "other": ["", ""]
    };

    if (array[category]) {
      scene.traverse((object) => {
        if (object.isGroup && array[category].includes(object.name)) {
          applyTextureToGroup(object, newFabric, meshesToSkip);
        }
      });

    }
  });
});

document.getElementById("a").addEventListener('click', function () {
  addEventListeners();
});


function setDefaultModel() {
  const loadedCategories = new Set(); // To keep track of loaded categories

  assetsData.forEach(asset => {
    const { name, category, file_path } = asset;

    if (!loadedCategories.has(category)) {
      loadAndConfigureModel(gltfLoader, scene, file_path, fabricTexture, 0.7, { x: 0, y: -2, z: 0 }, category);
      loadedCategories.add(category); // Mark category as loaded
    }
  });

}


document.getElementById("setDefaultModels").addEventListener('click', function () {
  setDefaultModel();
});

window.addEventListener('load', setDefaultModel);