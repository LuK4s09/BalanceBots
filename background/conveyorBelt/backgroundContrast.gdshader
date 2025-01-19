shader_type canvas_item;

uniform float contrast : hint_range(0.0, 2.0) = 1.0; // Reduziert den Kontrast für dunkle Töne

void fragment() {
    // Originalfarbe des Pixels
    vec4 color = texture(TEXTURE, UV);
    
    // Berechne die Helligkeit (Luma) des Pixels
    float brightness = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    
    // Passe den Kontrast nur für dunkle Töne an (Helligkeit < 0.5)
    float adjusted_contrast = mix(contrast, 1.0, step(0.5, brightness));
    
    // Wende den angepassten Kontrast an
    color.rgb = mix(vec3(0.5), color.rgb, adjusted_contrast);
    
    // Setze die Farbe
    COLOR = color;
	}