import Link from 'next/link'

export default function Legal() {
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
          <h1 className="text-5xl font-bold mb-4">Legal & Terms</h1>
          <p className="text-white/40 mb-12">Last updated: October 25, 2025</p>

          <div className="prose prose-invert max-w-none space-y-8">
            <section>
              <h2 className="text-2xl font-semibold mb-4">License</h2>
              <p className="text-white/60 leading-relaxed">
                VShip is free and open source software released under the MIT License. You are free to use,
                modify, and distribute the software in accordance with the terms of the license.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold mb-4">MIT License</h2>
              <div className="bg-white/5 border border-white/10 rounded-lg p-6 font-mono text-sm text-white/80 leading-relaxed">
                <p className="mb-4">Copyright (c) 2025 Charles</p>
                <p className="mb-4">
                  Permission is hereby granted, free of charge, to any person obtaining a copy
                  of this software and associated documentation files (the "Software"), to deal
                  in the Software without restriction, including without limitation the rights
                  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
                  copies of the Software, and to permit persons to whom the Software is
                  furnished to do so, subject to the following conditions:
                </p>
                <p className="mb-4">
                  The above copyright notice and this permission notice shall be included in all
                  copies or substantial portions of the Software.
                </p>
                <p>
                  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
                  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
                  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
                  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
                  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
                  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
                  SOFTWARE.
                </p>
              </div>
            </section>

            <section>
              <h2 className="text-2xl font-semibold mb-4">Disclaimer</h2>
              <p className="text-white/60 leading-relaxed mb-4">
                VShip is provided "as is" without warranty of any kind, either express or implied.
                We make no guarantees about the app's functionality, reliability, or suitability for
                any particular purpose.
              </p>
              <p className="text-white/60 leading-relaxed">
                By using VShip, you acknowledge that:
              </p>
              <ul className="list-disc list-inside space-y-2 text-white/60 ml-4 mt-4">
                <li>You use the software at your own risk</li>
                <li>We are not liable for any damages or data loss that may result from using the app</li>
                <li>The app's functionality depends on Vercel's API, which is outside our control</li>
                <li>We do not guarantee continuous availability or error-free operation</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-semibold mb-4">Trademarks</h2>
              <p className="text-white/60 leading-relaxed">
                "Vercel" and the Vercel logo are trademarks of Vercel Inc. VShip is an independent project
                and is not officially affiliated with, endorsed by, or sponsored by Vercel Inc.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold mb-4">Your Responsibilities</h2>
              <p className="text-white/60 leading-relaxed mb-4">
                When using VShip, you are responsible for:
              </p>
              <ul className="list-disc list-inside space-y-2 text-white/60 ml-4">
                <li>Keeping your Vercel API token secure</li>
                <li>Complying with Vercel's Terms of Service and API usage policies</li>
                <li>Using the software in accordance with applicable laws and regulations</li>
                <li>Not using the app to violate any third-party rights or terms of service</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-semibold mb-4">System Requirements</h2>
              <p className="text-white/60 leading-relaxed">
                VShip requires macOS 15.0 or later. Older versions of macOS are not supported and may not
                function correctly.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold mb-4">Support</h2>
              <p className="text-white/60 leading-relaxed">
                VShip is provided as-is with no guarantee of support. However, you can report issues on
                GitHub or reach out on Twitter (X) for community support.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold mb-4">Modifications</h2>
              <p className="text-white/60 leading-relaxed">
                We reserve the right to modify these terms at any time. Continued use of VShip after
                changes constitutes acceptance of the modified terms.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold mb-4">Contact</h2>
              <p className="text-white/60 leading-relaxed">
                For questions about these terms, please reach out on{' '}
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
