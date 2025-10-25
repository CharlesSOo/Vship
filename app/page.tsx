import Link from 'next/link'

export default function Home() {
  return (
    <main className="min-h-screen bg-black text-white">
      {/* Navigation */}
      <nav className="fixed top-0 w-full border-b border-white/10 bg-black/80 backdrop-blur-md z-50">
        <div className="max-w-6xl mx-auto px-6 h-16 flex items-center justify-between">
          <div className="flex items-center gap-2">
            <div className="w-6 h-6 flex items-center justify-center">
              <div className="w-0 h-0 border-l-[12px] border-l-transparent border-r-[12px] border-r-transparent border-b-[20px] border-b-white"></div>
            </div>
            <span className="font-semibold text-lg">VShip</span>
          </div>
          <div className="flex items-center gap-6">
            <Link href="/privacy" className="text-sm text-white/60 hover:text-white transition-colors">
              Privacy
            </Link>
            <Link href="/legal" className="text-sm text-white/60 hover:text-white transition-colors">
              Legal
            </Link>
            <a
              href="https://x.com/_CharlesSO"
              target="_blank"
              rel="noopener noreferrer"
              className="text-sm text-white/60 hover:text-white transition-colors"
            >
              @_CharlesSO
            </a>
          </div>
        </div>
      </nav>

      {/* Hero Section */}
      <section className="pt-32 pb-20 px-6">
        <div className="max-w-4xl mx-auto text-center">
          <div className="flex flex-col items-center mb-6">
            <div className="w-20 h-20 flex items-center justify-center mb-3">
              <div className="w-0 h-0 border-l-[40px] border-l-transparent border-r-[40px] border-r-transparent border-b-[68px] border-b-white"></div>
            </div>
            <span className="px-3 py-1 bg-orange-500/20 text-orange-300 rounded-full text-sm font-medium border border-orange-500/30">
              Beta Release
            </span>
          </div>

          <h1 className="text-6xl md:text-7xl font-bold mb-6 tracking-tight">
            Monitor Vercel<br />
            from your menu bar
          </h1>

          <p className="text-xl text-white/60 mb-12 max-w-2xl mx-auto">
            VShip is a native macOS menu bar app that keeps you informed about your Vercel deployments in real-time.
          </p>

          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <a
              href="https://github.com/CharlesSOo/Vship/releases/download/v0.9.0/VShip-0.9.0.dmg"
              className="px-6 py-3 bg-white text-black rounded-md font-medium hover:bg-white/90 transition-colors text-center"
            >
              Download for macOS
            </a>
          </div>

          <p className="text-sm text-white/40 mt-6">
            macOS 15.0 or later • Free for personal use • Beta
          </p>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-20 px-6 border-t border-white/10">
        <div className="max-w-6xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold mb-16 text-center">
            Built for developers
          </h2>

          <div className="grid md:grid-cols-3 gap-8">
            <div className="p-8 border border-white/10 rounded-lg">
              <div className="w-12 h-12 mb-4 flex items-center justify-center rounded-full bg-white/5">
                <div className="w-0 h-0 border-l-[10px] border-l-transparent border-r-[10px] border-r-transparent border-b-[16px] border-b-green-500"></div>
              </div>
              <h3 className="text-xl font-semibold mb-3">Real-time Status</h3>
              <p className="text-white/60">
                See your deployment status instantly in the menu bar. Click the triangle to view detailed deployment information including commit messages, branches, and timestamps.
              </p>
            </div>

            <div className="p-8 border border-white/10 rounded-lg">
              <div className="w-12 h-12 mb-4 flex items-center justify-center rounded-full bg-white/5">
                <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                </svg>
              </div>
              <h3 className="text-xl font-semibold mb-3">Secure by Default</h3>
              <p className="text-white/60">
                Your Vercel API token is stored securely in macOS Keychain with system-level encryption. Never saved in plain text. Remove it anytime from settings.
              </p>
            </div>

            <div className="p-8 border border-white/10 rounded-lg">
              <div className="w-12 h-12 mb-4 flex items-center justify-center rounded-full bg-white/5">
                <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
                </svg>
              </div>
              <h3 className="text-xl font-semibold mb-3">Native Performance</h3>
              <p className="text-white/60">
                Built with Swift and SwiftUI for a fast, lightweight experience. Automatic light/dark mode support with zero battery impact.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Status Indicators Section */}
      <section className="py-20 px-6 border-t border-white/10">
        <div className="max-w-4xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold mb-8 text-center">
            Know your deployment status at a glance
          </h2>
          <p className="text-center text-white/60 mb-12 max-w-2xl mx-auto">
            The menu bar triangle changes color based on your latest deployment status
          </p>

          <div className="grid md:grid-cols-3 gap-6">
            {/* Green - Success */}
            <div className="border border-white/10 rounded-lg p-8 text-center">
              <div className="w-16 h-16 mx-auto mb-4 flex items-center justify-center">
                <div className="w-0 h-0 border-l-[26px] border-l-transparent border-r-[26px] border-r-transparent border-b-[44px] border-b-green-500"></div>
              </div>
              <h3 className="text-xl font-semibold mb-2 text-green-500">Ready</h3>
              <p className="text-white/60 text-sm">
                Deployment successful and live
              </p>
            </div>

            {/* Yellow - Building */}
            <div className="border border-white/10 rounded-lg p-8 text-center">
              <div className="w-16 h-16 mx-auto mb-4 flex items-center justify-center">
                <div className="w-0 h-0 border-l-[26px] border-l-transparent border-r-[26px] border-r-transparent border-b-[44px] border-b-yellow-500"></div>
              </div>
              <h3 className="text-xl font-semibold mb-2 text-yellow-500">Building</h3>
              <p className="text-white/60 text-sm">
                Deployment in progress
              </p>
            </div>

            {/* Red - Error */}
            <div className="border border-white/10 rounded-lg p-8 text-center">
              <div className="w-16 h-16 mx-auto mb-4 flex items-center justify-center">
                <div className="w-0 h-0 border-l-[26px] border-l-transparent border-r-[26px] border-r-transparent border-b-[44px] border-b-red-500"></div>
              </div>
              <h3 className="text-xl font-semibold mb-2 text-red-500">Error</h3>
              <p className="text-white/60 text-sm">
                Deployment failed or canceled
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Customization Section */}
      <section className="py-20 px-6 border-t border-white/10">
        <div className="max-w-6xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold mb-16 text-center">
            Customize to your preference
          </h2>

          <div className="grid md:grid-cols-2 gap-12">
            <div>
              <h3 className="text-2xl font-semibold mb-4">Triangle Styles</h3>
              <p className="text-white/60 mb-6">
                Choose between bordered or solid triangle indicators. Customize the icon color for optimal visibility on any wallpaper.
              </p>
              <ul className="space-y-3 text-white/60">
                <li className="flex items-start gap-3">
                  <span className="text-green-500 mt-1">✓</span>
                  <span>Colored border with white/black fill</span>
                </li>
                <li className="flex items-start gap-3">
                  <span className="text-green-500 mt-1">✓</span>
                  <span>Solid status color fill</span>
                </li>
                <li className="flex items-start gap-3">
                  <span className="text-green-500 mt-1">✓</span>
                  <span>Automatic timeout after successful deployments</span>
                </li>
              </ul>
            </div>

            <div>
              <h3 className="text-2xl font-semibold mb-4">Success Timeouts</h3>
              <p className="text-white/60 mb-6">
                Reduce visual clutter by automatically fading the success indicator after a configurable timeout period.
              </p>
              <ul className="space-y-3 text-white/60">
                <li className="flex items-start gap-3">
                  <span className="text-green-500 mt-1">✓</span>
                  <span>5, 10, 30 minutes, or 1 hour options</span>
                </li>
                <li className="flex items-start gap-3">
                  <span className="text-green-500 mt-1">✓</span>
                  <span>Green indicator fades to white/black after timeout</span>
                </li>
                <li className="flex items-start gap-3">
                  <span className="text-green-500 mt-1">✓</span>
                  <span>Resets on new deployment activity</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 px-6 border-t border-white/10">
        <div className="max-w-2xl mx-auto text-center">
          <h2 className="text-4xl md:text-5xl font-bold mb-6">
            Start monitoring today
          </h2>
          <p className="text-xl text-white/60 mb-8">
            Download VShip and keep track of your Vercel deployments from your menu bar.
          </p>
          <a
            href="https://github.com/CharlesSOo/Vship/releases/download/v0.9.0/VShip-0.9.0.dmg"
            className="inline-block px-8 py-4 bg-white text-black rounded-md font-medium text-lg hover:bg-white/90 transition-colors"
          >
            Download VShip 0.9.0 Beta
          </a>
          <p className="text-sm text-white/40 mt-6">
            Free for personal use • macOS 15.0+ • Beta Release
          </p>
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-white/10 py-12 px-6">
        <div className="max-w-6xl mx-auto">
          <div className="flex flex-col md:flex-row justify-between items-center gap-6">
            <div className="flex items-center gap-2">
              <div className="w-5 h-5 flex items-center justify-center">
                <div className="w-0 h-0 border-l-[10px] border-l-transparent border-r-[10px] border-r-transparent border-b-[16px] border-b-white"></div>
              </div>
              <span className="font-semibold">VShip</span>
            </div>

            <div className="flex items-center gap-6 text-sm text-white/60">
              <Link href="/privacy" className="hover:text-white transition-colors">
                Privacy Policy
              </Link>
              <Link href="/legal" className="hover:text-white transition-colors">
                Legal
              </Link>
              <a
                href="https://x.com/_CharlesSO"
                target="_blank"
                rel="noopener noreferrer"
                className="hover:text-white transition-colors"
              >
                Twitter (X)
              </a>
            </div>
          </div>

          <div className="mt-8 pt-8 border-t border-white/10 text-center text-sm text-white/40">
            <p className="mb-3">Made with ♥ for Vercel developers by <a href="https://x.com/_CharlesSO" target="_blank" rel="noopener noreferrer" className="text-white/60 hover:text-white transition-colors">@_CharlesSO</a></p>
            <p className="text-xs">
              VShip is an independent project and is not officially affiliated with, endorsed by, or sponsored by Vercel Inc.
              "Vercel" and the Vercel logo are trademarks of Vercel Inc. All rights to Vercel and its trademarks belong to Vercel Inc.
            </p>
          </div>
        </div>
      </footer>
    </main>
  )
}
