// modelLoader.js
import * as THREE from 'three';
import { textures } from './threeSetup.js';


export function loadAndConfigureModel(gltfLoader, scene, path, fabricTexture, scale, position, category) {

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

    model.scale.set(scale, scale, scale);
    model.position.set(position.x, position.y, position.z);

    const button_hole_texture = new THREE.TextureLoader().load('/assets/textures/button_hole.png');
    // const stitching_texture = new THREE.TextureLoader().load('/assets/textures/stiching.png');

    const buttonNames = ["SM_Button_6*3001", "SM_Button_6*3_1", "SM_Button_8*4_1", "SM_Button_4_1", "SM_Button_4001", "SM_Button_6001", "SM_Button_5001", "SM_Button_8*4001", "SM_Button_4.001_0"];
    // const stitchingName = ["SM_Stitching_notch_reguler_lapel*3001"];

    model.traverse(function (child) {
      if (child.isMesh && buttonNames.includes(child.name)) {
        if (child.material instanceof THREE.MeshStandardMaterial) {
          child.material.map = button_hole_texture;
          child.material.needsUpdate = true;
        }
      }
    });



    scene.add(model);


  });
}
