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

        scene.add(model);
    });
}
