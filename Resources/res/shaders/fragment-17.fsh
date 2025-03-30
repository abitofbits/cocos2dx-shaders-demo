#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_NoiseTexture;
uniform sampler2D u_CausticTexture;

varying vec4 v_fragmentColor;
varying vec2 v_texCoord1;
varying vec2 v_texCoord2;

void main(){
    float t = CC_Time[0];
	vec2 distortion = 2.0*texture2D(u_NoiseTexture, v_texCoord2*sin(t)*2.125).xy - 1.0;
    vec2 distortionOffset = distortion*0.05;
    
    float time = CC_Time[1]*10.0;
    vec2 uv = v_texCoord1;
    vec4 v_orColor = v_fragmentColor * texture2D(CC_Texture0, v_texCoord1);
    float x = gl_FragCoord.x - (0.5 - 960.0 / 2.0);
    float y = gl_FragCoord.y - (0.5 - 640.0 / 2.0);
    float mov0 = sin(time*2.)*100.;
    float mov1 = cos(x / 640.0 / 0.2 + time) + 0.5;
    float mov2 = cos(y / 960.0 / 0.4 + abs(cos(time/15.)));
    
    float c1 = 0.1015 + sin(mov2 + 1.1888*t)/1.;
    float c2 = 0.00139*c1*(sin(c1+mov1));
    float c3 = 0.00123 + cos(sin(time/324.));
    gl_FragColor = v_fragmentColor*texture2D(CC_Texture0, v_texCoord1 + distortionOffset);
    gl_FragColor += 0.5*texture2D(u_CausticTexture, v_texCoord1 - distortionOffset);
    gl_FragColor += vec4(c1,c2,c3,1)*texture2D(CC_Texture0, v_texCoord1 + distortionOffset);
}
