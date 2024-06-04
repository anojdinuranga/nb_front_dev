// mainScript.js
import * as THREE from 'three';
import { scene, createCamera, createRenderer, createControls, createLights} from './threeSetup.js';

// Create the scene, camera, renderer, lights, etc.
const camera = createCamera();
const renderer = createRenderer();
const controls = createControls(camera, renderer.domElement);
const lights = createLights();
lights.forEach(light => scene.add(light));


// Sizes and update function
const sizes = {
    width: window.innerWidth,
    height: window.innerHeight
};

const updateSizes = () => {
    sizes.width = window.innerWidth;
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
