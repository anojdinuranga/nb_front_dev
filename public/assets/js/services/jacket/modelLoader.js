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
        const buttonNames = ["SM_J_B__FrontB1_2","SM_J_B__FrontB2_2","SM_J_B__FrontB2*1_2","SM_J_B__FrontB3_2","SM_J_B_FrontB4*1_2","SM_J_B_FrontB4*2_2","SM_J_B_FrontB6*1_2","SM_J_B_FrontB6*2_2"];

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
