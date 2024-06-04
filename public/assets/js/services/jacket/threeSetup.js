// threeSetup.js
import * as THREE from 'three';
import { OrbitControls } from 'https://unpkg.com/three@0.139.2/examples/jsm/controls/OrbitControls.js';

export const createTextureLoader = () => {
    return new THREE.TextureLoader();
};

export const textureLoader = createTextureLoader();

export const loadTexture = (path, properties = {}) => {
    const texture = textureLoader.load(path);

    texture.repeat.copy(properties.repeat || new THREE.Vector2(5, 5));
    texture.wrapS = properties.wrapS || THREE.RepeatWrapping;
    texture.wrapT = properties.wrapT || THREE.RepeatWrapping;

    Object.assign(texture, properties.additional || {});

    return texture;
};

export const textures = {
    upperTexture: loadTexture('/assets/textures/fabrics/23.jpg'),
    normalTexture: loadTexture('/assets/textures/normal.jpg'),
    roughnessTexture: loadTexture('/assets/textures/roughness.jpg'),
};

export const createScene = () => {
    const scene = new THREE.Scene();
    return scene;
};

export const scene = createScene();

export const createCamera = () => {
    const camera = new THREE.PerspectiveCamera(45, 1 / 1, 0.1, 100);
    camera.position.set(5.5, 2.5, 0);
    return camera;
};

export const createRenderer = () => {
    const renderer = new THREE.WebGLRenderer({
        canvas: document.querySelector('canvas.product-canvas-jacket'),
        antialias: true,
    });
    renderer.shadowMap.enabled = true;
    renderer.shadowMap.type = THREE.PCFSoftShadowMap;
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
    renderer.setClearColor(0xEFEFEF);
    return renderer;
};

export const createControls = (camera, canvas) => {
    const controls = new OrbitControls(camera, canvas);
    controls.enableDamping = true;
    controls.enableZoom = false;
    controls.minPolarAngle = Math.PI / 2.2;
    controls.maxPolarAngle = Math.PI / 3;
    controls.rotateSpeed = 0.5;
    return controls;
};

export const createLights = () => {
    const ambientLight = new THREE.AmbientLight(0xffffff, 0.7);

    const directionalLightBack = new THREE.DirectionalLight(0xffffff, 0.5);
    directionalLightBack.castShadow = true;
    directionalLightBack.shadow.mapSize.set(1024, 1024);
    directionalLightBack.shadow.camera.far = 15;
    directionalLightBack.shadow.camera.left = -7;
    directionalLightBack.shadow.camera.top = 7;
    directionalLightBack.shadow.camera.right = 7;
    directionalLightBack.shadow.camera.bottom = -7;
    directionalLightBack.position.set(-5, 3, 0);

    const directionalLightFront = new THREE.DirectionalLight(0xffffff, 0.5);
    directionalLightFront.castShadow = true;
    directionalLightFront.shadow.mapSize.set(1024, 1024);
    directionalLightFront.shadow.camera.far = 15;
    directionalLightFront.shadow.camera.left = -7;
    directionalLightFront.shadow.camera.top = 7;
    directionalLightFront.shadow.camera.right = 7;
    directionalLightFront.shadow.camera.bottom = -7;
    directionalLightFront.position.set(5, 3, 0);

    return [ambientLight, directionalLightBack, directionalLightFront];
};
