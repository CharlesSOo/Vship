import Link from 'next/link'

export default function Privacy() {
  return (
    <main className="min-h-screen bg-black text-white">
      {/* Navigation */}
      <nav className="fixed top-0 w-full border-b border-white/10 bg-black/80 backdrop-blur-md z-50">
        <div className="max-w-4xl mx-auto px-6 h-16 flex items-center justify-between">
          <Link href="/" className="flex items-center gap-2">
            <div className="w-6 h-6 flex items-center justify-center">
              <div className="w-0 h-0 border-l-[12px] border-l-transparent border-r-[12px] border-r-transparent border-b-[20px] border-b-white"></div>
            </div>
            <span className="font-semibold text-lg">VShip</span>
          </Link>
        </div>
      </nav>

      {/* Content */}
      <article className="pt-32 pb-20 px-6">
        <div className="max-w-3xl mx-auto">
          <h1 className="text-5xl font-bold mb-4">Privacy Policy</h1>
          <p className="text-white/40 mb-12">Last updated: October 25, 2025</p>

          <div className="prose prose-invert max-w-none space-y-8">
            <section>
              <h2 className="text-2xl font-semibold mb-4">Overview</h2>
              <p className="text-white/60 leading-relaxed">
                VShip is designed with privacy as a core principle. We believe your data belongs to you,
                and we've built VShip to operate entirely on your device without collecting, transmitting,
                or storing any personal information on external servers.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold mb-4">Data Collection</h2>
              <p className="text-white/60 leading-relaxed mb-4">
                <strong className="text-white">VShip collects NO personal data.</strong> The app operates
                entirely locally on your Mac and does not track, collect, or transmit any information about you.
              </p>
              <p className="text-white/60 leading-relaxed">
                Specifically, we do not collect:
              </p>
              <ul className="list-disc list-inside space-y-2 text-white/60 ml-4 mt-4">
                <li>Personal identification information</li>
                <li>Usage analytics or statistics</li>
                <li>Crash reports or error logs</li>
                <li>Device information or system data</li>
                <li>IP addresses or location data</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-semibold mb-4">Your Vercel API Token</h2>
              <p className="text-white/60 leading-relaxed mb-4">
                To function, VShip requires your Vercel API token. Here's how we handle it:
              </p>
              <ul className="list-disc list-inside space-y-2 text-white/60 ml-4">
                <li><strong className="text-white">Stored locally:</strong> Your token is stored exclusively in your Mac's Keychain using Apple's Keychain Services</li>
                <li><strong className="text-white">Never transmitted:</strong> Your token is only used to communicate directly with Vercel's API from your device</li>
                <li><strong className="text-white">Fully encrypted:</strong> Keychain storage provides system-level encryption protected by macOS</li>
                <li><strong className="text-white">Your control:</strong> You can remove your token at any time through VShip's settings</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-semibold mb-4">Network Communication</h2>
              <p className="text-white/60 leading-relaxed">
                VShip communicates solely with Vercel's official API endpoints to fetch your deployment data.
                These API requests contain only your Vercel API token and are made directly from your device
                to Vercel's servers. No intermediary servers or third parties are involved.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold mb-4">Third-Party Services</h2>
              <p className="text-white/60 leading-relaxed">
                VShip does not integrate with any third-party analytics, tracking, or advertising services.
                The only external service VShip interacts with is Vercel's API, which is necessary for the
                app's core functionality.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold mb-4">Open Source</h2>
              <p className="text-white/60 leading-relaxed">
                VShip is open source software. You can review the complete source code to verify our
                privacy practices and see exactly how the app works. Transparency is important to us.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold mb-4">Changes to This Policy</h2>
              <p className="text-white/60 leading-relaxed">
                If we make changes to this privacy policy, we will update the "Last updated" date at the
                top of this page. We encourage you to review this policy periodically.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold mb-4">Contact</h2>
              <p className="text-white/60 leading-relaxed">
                If you have questions about this privacy policy, please reach out on{' '}
                <a
                  href="https://x.com/_CharlesSO"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="text-white hover:text-white/80 underline"
                >
                  Twitter (X)
                </a>.
              </p>
            </section>
          </div>

          <div className="mt-16 pt-8 border-t border-white/10">
            <Link href="/" className="text-white/60 hover:text-white transition-colors">
              ← Back to home
            </Link>
          </div>
        </div>
      </article>
    </main>
  )
}
