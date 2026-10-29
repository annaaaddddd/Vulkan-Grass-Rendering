#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(vertices = 1) out;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

layout(location = 0) in vec4 tesc_v1[];
layout(location = 1) in vec4 tesc_v2[];
layout(location = 2) in vec4 tesc_vup[];

layout(location = 0) out vec4 tese_v1[];
layout(location = 1) out vec4 tese_v2[];
layout(location = 2) out vec4 tese_vup[];

void main() {
	// Don't move the origin location of the patch
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;

    tese_v1[gl_InvocationID] = tesc_v1[gl_InvocationID];
    tese_v2[gl_InvocationID] = tesc_v2[gl_InvocationID];
    tese_vup[gl_InvocationID] = tesc_vup[gl_InvocationID];

	// Set level of tesselation:  8 segments along both axes right now
    gl_TessLevelInner[0] = 8;
    gl_TessLevelInner[1] = 8;
    gl_TessLevelOuter[0] = 8;
    gl_TessLevelOuter[1] = 8;
    gl_TessLevelOuter[2] = 8;
    gl_TessLevelOuter[3] = 8;
}
