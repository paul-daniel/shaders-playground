// projectionMatrix - uniform
// modelViewMatrix - uniform
// position  - attribute

/*
    attributes are vertex specific datas. They are not accessible on fragment shaders.
    uniforms on the other hand are accessible in both and are the same for every vertex.

    modelViewMatrix = modelMatrix * ViewMatrix
    transform -> position, scale, rotation
    model matrix provide the "transform" for our model(the objects on the scene)
    view matrix provide the "transform" for our camera
    projection matrix : project our object on the screen taking into account aspect ration and perspective.

    MVP -> PVM (projection, view, model)

    uv is used to map textures to our model.
    varying are use to enable communication between vertex shader to fragment shader
*/

varying vec3 vPosition;
varying vec3 vNormal;
varying vec2 vUv;

void main() {
    vPosition = position;
    vNormal = normal;
    vUv = uv;

    vec4 modelViewPosition = modelViewMatrix * vec4(position, 1);
    vec4 projectedPosition = projectionMatrix * modelViewPosition;

    gl_Position = projectedPosition;
}