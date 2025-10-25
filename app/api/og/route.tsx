import { ImageResponse } from 'next/og'

export const runtime = 'edge'

export async function GET() {
  return new ImageResponse(
    (
      <div
        style={{
          height: '100%',
          width: '100%',
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          justifyContent: 'center',
          backgroundColor: '#000',
          padding: '40px',
        }}
      >
        {/* Triangle and Beta Badge */}
        <div
          style={{
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
            marginBottom: '48px',
          }}
        >
          {/* White Triangle */}
          <div
            style={{
              width: 0,
              height: 0,
              borderLeft: '60px solid transparent',
              borderRight: '60px solid transparent',
              borderBottom: '100px solid white',
              marginBottom: '16px',
            }}
          />

          {/* Beta Badge */}
          <div
            style={{
              display: 'flex',
              paddingLeft: '16px',
              paddingRight: '16px',
              paddingTop: '8px',
              paddingBottom: '8px',
              backgroundColor: 'rgba(249, 115, 22, 0.2)',
              color: 'rgb(253, 186, 116)',
              borderRadius: '9999px',
              fontSize: '16px',
              fontWeight: '500',
              border: '1px solid rgba(249, 115, 22, 0.3)',
            }}
          >
            Beta Release
          </div>
        </div>

        {/* Title */}
        <div
          style={{
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
            textAlign: 'center',
          }}
        >
          <h1
            style={{
              fontSize: '72px',
              fontWeight: 'bold',
              color: 'white',
              margin: 0,
              marginBottom: '24px',
              lineHeight: 1.1,
            }}
          >
            Monitor Vercel
            <br />
            from your menu bar
          </h1>

          <p
            style={{
              fontSize: '28px',
              color: 'rgba(255, 255, 255, 0.6)',
              margin: 0,
              maxWidth: '800px',
            }}
          >
            VShip is a native macOS menu bar app that keeps you informed about your Vercel deployments in real-time.
          </p>
        </div>
      </div>
    ),
    {
      width: 1200,
      height: 630,
    },
  )
}
