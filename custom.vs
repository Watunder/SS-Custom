#version 120
attribute vec4	varg;

void main()
{
	gl_TexCoord[0] = gl_TextureMatrix[0] * gl_MultiTexCoord0;

	gl_Position = ftransform();

	gl_FrontColor = gl_Color;

	gl_TexCoord[1] = varg;
}