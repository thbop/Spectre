shader_type canvas_item;

uniform sampler2D screen_texture : source_color, hint_screen_texture, filter_nearest;

uniform float crt_curve: hint_range(0.0, 1.0) = 0.05;

float frac(float i) {
	return i - floor(i);
}

float random( float i ) {
	return frac( sin(i) * 24809.03 );
}



void fragment() {
	vec2 crt_curve_shift = (vec2(1.0) - sin(UV.yx * PI)) * crt_curve;
	vec2 crt_curve_scale = vec2(1.0) + crt_curve_shift * 2.0;
	
	vec2 newUV = UV * crt_curve_scale - crt_curve_shift;
	vec4 tex = texture(screen_texture, newUV);
	
	if ( newUV.x < 0.0 || newUV.y < 0.0 || newUV.x > 1.0 || newUV.y > 1.0 ) {
		tex = vec4(0.1, 0.1, 0.1, 1.0);
	}
	
	COLOR = tex + random(dot(UV, vec2(TIME, 453)))*0.1;
}
