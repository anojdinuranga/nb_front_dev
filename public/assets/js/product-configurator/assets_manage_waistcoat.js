// assets_manege.js
import * as THREE from 'three';
import { scene, textureLoader, loadTexture } from '../services/waistcoat/threeSetup.js';
import { GLTFLoader } from 'https://unpkg.com/three@0.139.2/examples/jsm/loaders/GLTFLoader.js';
import { loadAndConfigureModel } from '../services/waistcoat/modelLoader.js';

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

let fabricTexture = loadTexture('/assets/textures/fabrics/05.jpg')
let otherTexture = loadTexture('/assets/textures/fabrics/05.jpg')

// Function to fetch and load JSON data
const loadAssetsData = async () => {
  try {
    const response = await fetch('/assets/json/waistcoat/assetsData.json');
    assetsData = await response.json();
  } catch (error) {
    console.error('Error loading assetsData:', error);
  }
};

loadAssetsData();

/**
** Select Assets 
**/

document.querySelectorAll('.assets-select').forEach(function (card) {
  card.addEventListener('click', function () {
    const category = card.getAttribute('data-category');
    const assetName = card.getAttribute('data-asset');
    const selectedAsset = assetsData.find(asset => asset.name === assetName);

    if (selectedAsset) {
      // Remove previously loaded model of the same category
      const previousModel = scene.getObjectByName(category);
      
      if (previousModel) {
        scene.remove(previousModel);
      }

      loadAndConfigureModel(gltfLoader, scene, selectedAsset.file_path, fabricTexture, 0.8, { x: 0, y: -1.5, z: 0 }, category);

      document.querySelectorAll('.assets-select[data-category="' + category + '"]').forEach(function (otherCard) {
        otherCard.classList.remove('active');
      });

      card.classList.add('active');
    }
  });
});

/**
** Select Fabric 
**/

const meshesToSkip = ["SM_Button_6*3001", "SM_Button_6*3_1", "SM_Button_8*4_1", "SM_Button_4_1", "SM_Button_4001", "SM_Button_6001", "SM_Button_5001"];

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
      newFabric = loadTexture(path)
      fabricTexture = loadTexture(path)

    } else if (category == 'other') {
      newFabric = loadTexture(path)
      otherTexture = loadTexture(path)
    }


    // Iterate over the objects in the scene to find the group with the specified category
    const array = {
      "body": ["back", "front", "pockets", "buckle"],
      "other": ["lapel_lining"]
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

function setDefaultModel() {
  const loadedCategories = new Set();

  assetsData.forEach(asset => {
    const { name, category, file_path } = asset;

    const array = {
      "body": ["back", "front", "pockets", "buckle"],
      "other": ["lapel_lining"]
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


window.addEventListener('load', setDefaultModel);