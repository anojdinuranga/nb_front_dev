// assets_manege.js
import * as THREE from 'three';
import { scene, textureLoader, loadTexture } from '../services/trouser/threeSetup.js';
import { GLTFLoader } from 'https://unpkg.com/three@0.139.2/examples/jsm/loaders/GLTFLoader.js';
import { loadAndConfigureModel } from '../services/trouser/modelLoader.js';

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
let fabricData = [];

// Function to fetch and load JSON data
const loadAssetsData = async () => {
  try {
    const response = await fetch('/assets/json/trouser/assetsData.json');
    assetsData = await response.json();
  } catch (error) {
    console.error('Error loading assetsData:', error);
  }
};

const loadFabricData = async () => {
  try {
    const response = await fetch('/assets/json/trouser/fabricData.json');
    fabricData = await response.json();
  } catch (error) {
    console.error('Error loading fabricData:', error);
  }
};

loadAssetsData();
loadFabricData();

/**
** Select Assets 
**/

let fabricTexture = loadTexture('/assets/textures/fabrics/04.jpg', {
  repeat: new THREE.Vector2(50, 50),
  wrapS: THREE.RepeatWrapping,
  wrapT: THREE.RepeatWrapping,
})

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

      loadAndConfigureModel(gltfLoader, scene, selectedAsset.file_path, fabricTexture, 0.65, { x: 0, y: -1.8, z: 0 }, category);

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

document.querySelectorAll('.fabric-select').forEach(function (card) {
  card.addEventListener('click', function () {
    var category = card.getAttribute('data-category');
    var fabricName = card.getAttribute('data-fabric');
    var selectedFabric = fabricData.find(fabric => fabric.name === fabricName);

    if (selectedFabric) {
      document.querySelectorAll('.fabric-select[data-category="' + category + '"]').forEach(function (otherCard) {
        otherCard.classList.remove('active');
      });
      card.classList.add('active');

      // Load the selected fabric texture
      fabricTexture = loadTexture(selectedFabric.file_path, {
        repeat: new THREE.Vector2(selectedFabric.tiling.wrapS, selectedFabric.tiling.wrapT),
        wrapS: THREE.RepeatWrapping,
        wrapT: THREE.RepeatWrapping,
      });

      // Iterate over the objects in the scene to find the group with the specified category
      const array = {
        "body": ["base", "back_pockets", "belt", "belt_loops", "hem", "piping", "pleat", "side_pockets"]
      };

      if (array[category]) {
        scene.traverse((object) => {
          if (object.isGroup && array[category].includes(object.name)) {
            applyTextureToGroup(object, fabricTexture);
          }
        });

      }
    }
  });
});

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

    if (!loadedCategories.has(category)) {
      loadAndConfigureModel(gltfLoader, scene, file_path, fabricTexture, 0.65, { x: 0, y: -1.8, z: 0 }, category);
      loadedCategories.add(category); // Mark category as loaded
    }
  });
}


window.addEventListener('load', setDefaultModel);