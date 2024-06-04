// assets_manege.js
import * as THREE from 'three';
import { scene, textureLoader, loadTexture } from '../services/national/threeSetup.js';
import { GLTFLoader } from 'https://unpkg.com/three@0.139.2/examples/jsm/loaders/GLTFLoader.js';
import { loadAndConfigureModel } from '../services/national/modelLoader.js';

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

// Function to fetch and load JSON data
const loadAssetsData = async () => {
  try {
    const response = await fetch('/assets/json/national/assetsData.json');
    assetsData = await response.json();
  } catch (error) {
    console.error('Error loading assetsData:', error);
  }
};

loadAssetsData();


let upperTexture = loadTexture('/assets/textures/fabrics/05.jpg');
let sarongTexture = loadTexture('/assets/textures/fabrics/08.jpg');
let shawalTexture = loadTexture('/assets/textures/fabrics/08.jpg');

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

      const array = {
        "body": ["height", "coller", "sleeves", "frontClose", "frontOpen"],
        "shawl": ["shawl"],
        "sarong": ["sarong"]
      };

      if (category === 'frontClose') {
        // If the selected category is 'frontClose', remove the 'frontOpen' model
        const frontOpenModel = scene.getObjectByName('frontOpen');
        const heightModel = scene.getObjectByName('height');

        if (frontOpenModel) {
          scene.remove(frontOpenModel);
        }

        if (!heightModel) {
          loadAndConfigureModel(gltfLoader, scene, assetsData[4].file_path, upperTexture, 0.5, { x: 0, y: -2, z: 0 }, 'height');
        }

      } else if (category === 'frontOpen') {
        // If the selected category is 'frontOpen', remove the 'frontClose' model
        const frontCloseModel = scene.getObjectByName('frontClose');
        const heightModel = scene.getObjectByName('height');

        if (heightModel) {
          console.log("have heightModel")
          scene.remove(heightModel);
        }

        if (frontCloseModel) {
          console.log("have frontCloseModel")

          scene.remove(frontCloseModel);
        }

      } else if (category === 'height') {
        // If the selected category is 'height', remove both 'frontClose' and 'frontOpen' models
        const frontCloseModel = scene.getObjectByName('frontClose');
        if (frontCloseModel) {
          scene.remove(frontCloseModel);
        }

        const frontOpenModel = scene.getObjectByName('frontOpen');
        if (frontOpenModel) {
          scene.remove(frontOpenModel);
        }
      }

      // Load the selected model based on the category
      if (array.body.includes(category)) {

        loadAndConfigureModel(gltfLoader, scene, selectedAsset.file_path, upperTexture, 0.5, { x: 0, y: -2, z: 0 }, category);

      } else if (array.shawl.includes(category)) {

        loadAndConfigureModel(gltfLoader, scene, selectedAsset.file_path, shawalTexture, 0.5, { x: 0, y: -2, z: 0 }, category);

      } else if (array.sarong.includes(category)) {

        loadAndConfigureModel(gltfLoader, scene, selectedAsset.file_path, sarongTexture, 0.5, { x: 0, y: -2, z: 0 }, category);

      }

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
      upperTexture = loadTexture(path)

    } else if (category == 'sarong') {
      newFabric = loadTexture(path)
      sarongTexture = loadTexture(path)

    } else if (category == 'shawl') {
      newFabric = loadTexture(path)
      shawalTexture = loadTexture(path)

    }


    // Iterate over the objects in the scene to find the group with the specified category
    const array = {
      "body": ["height", "coller", "sleaves", "frontClose", "frontOpen"],
      "shawl": ["shawl"],
      "sarong": ["sarong"]
    };

    if (array[category]) {
      scene.traverse((object) => {
        if (object.isGroup && array[category].includes(object.name)) {
          applyTextureToGroup(object, newFabric);
        }
      });

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

  const loadedCategories = new Set();

  assetsData.forEach(asset => {
    const { name, category, file_path } = asset;

    const array = {
      "body": ["height", "coller", "sleeves", "frontClose", "frontOpen"],
      "shawl": ["shawl"],
      "sarong": ["sarong"]
    };

    if (category !== "frontOpen" && !loadedCategories.has(category)) {
      if (array.body.includes(category)) {

        loadAndConfigureModel(gltfLoader, scene, file_path, upperTexture, 0.5, { x: 0, y: -2, z: 0 }, category);

      } else if (array.shawl.includes(category)) {

        loadAndConfigureModel(gltfLoader, scene, file_path, shawalTexture, 0.5, { x: 0, y: -2, z: 0 }, category);

      } else if (array.sarong.includes(category)) {

        loadAndConfigureModel(gltfLoader, scene, file_path, sarongTexture, 0.5, { x: 0, y: -2, z: 0 }, category);

      }
      loadedCategories.add(category);
    }
  });
}

window.addEventListener('load', setDefaultModel);
