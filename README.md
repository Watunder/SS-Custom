# SS-Custom
Custom `fragment` shaders for [OPTPiX SpriteStudio 6](http://www.webtech.co.jp/spritestudio/index.html)

## Basic code
    #version 120
    uniform sampler2D   texture2d;
    uniform float       args[16];
    uniform float       params[16];

    const int	A_TW    = 0;    // Texture width (pixel unit).
    const int	A_TH	= 1;    // Texture height (pixel unit).
    const int	A_U1	= 2;    // Texture width (normalized).
    const int	A_V1	= 3;    // Texture height (normalized).
    const int	A_LU	= 4;    // U value at the left edge.
    const int	A_TV	= 5;    // V value at the top edge.
    const int	A_CU	= 6;    // U value at the center.
    const int	A_CV	= 7;    // V value at the center.
    const int	A_RU	= 8;    // U value at the right edge.
    const int	A_BV	= 9;    // V value at the bottom edge.
    const int	A_PM	= 10;   // Passed 1.0f if "unpremultiply alpha of transparent parts with mix blend.(deprecated)" option is checked in the project settings.

    vec4 getTexColor( vec2 c )
    {
        vec4	p = texture2D( texture2d, c );

        if ( args[A_PM] <= 0.0 ) {
            return	p;
        }
        if ( p.a <= 0.0 ) {
            return	vec4( 0.0 );
        }

        return	vec4( p.rgb / p.a, p.a );
    }

    vec4 getBlendColor( vec4 p )
    {
        return	vec4( p.rgb * gl_TexCoord[1].x + mix( vec3( 1.0 ), p.rgb, gl_TexCoord[1].z ) * gl_Color.rgb * gl_TexCoord[1].y, p.a * gl_Color.a );
    }
