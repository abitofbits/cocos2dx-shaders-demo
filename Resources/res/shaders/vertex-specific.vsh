uniform vec2 u_ViewSizeInPixels;
uniform vec2 u_NoiseTextureSize;

attribute vec4 a_position;
attribute vec2 a_texCoord;
attribute vec4 a_color;

varying vec4 v_fragmentColor;
varying vec2 v_texCoord1;
varying vec2 v_texCoord2;

void main(){
	gl_Position = CC_PMatrix * a_position;
    v_fragmentColor = clamp(a_color, 0.0, 1.0);
	v_texCoord1 = a_texCoord;
	v_texCoord2 = a_texCoord;
}
