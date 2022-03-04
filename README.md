# SS-Custom
Custom `fragment` shaders for [OPTPiX SpriteStudio 6](http://www.webtech.co.jp/spritestudio/index.html)

## Basic code
    #version 120
    uniform sampler2D   texture2d;
    uniform float       args[16];
    uniform float		params[16];

    const int	A_TW    = 0;
    const int	A_TH	= 1;
    const int	A_U1	= 2;
    const int	A_V1	= 3;
    const int	A_LU	= 4;
    const int	A_TV	= 5;
    const int	A_CU	= 6;
    const int	A_CV	= 7;
    const int	A_RU	= 8;
    const int	A_BV	= 9;
    const int	A_PM	= 10;

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
