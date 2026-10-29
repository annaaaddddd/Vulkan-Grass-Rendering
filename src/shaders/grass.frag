#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

layout(location = 0) in vec4 normal;
layout(location = 1) in vec2 uv;

layout(location = 0) out vec4 outColor;

void main() {
    vec3 darkGreen  = vec3(0.05, 0.3, 0.05);
    vec3 lightGreen = vec3(0.4, 0.8, 0.2);
    vec3 baseColor  = mix(darkGreen, lightGreen, uv.y);

    vec3 lightDir = normalize(vec3(1.0, 3.0, 2.0));

    vec3 n = normalize(normal.xyz);
    float lambert = abs(dot(n, lightDir)); // renders both faces

    // Ambient term keeps back-facing
    float ambient = 0.3;
    vec3 color = baseColor * (ambient + (1.0 - ambient) * lambert);

    outColor = vec4(color, 1.0);
}
