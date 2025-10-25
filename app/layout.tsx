import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "VShip - Monitor Vercel from your menu bar",
  description: "VShip is a native macOS menu bar app that keeps you informed about your Vercel deployments in real-time. Free for personal use.",
  icons: {
    icon: '/favicon.ico',
    apple: '/apple-touch-icon.png',
  },
  openGraph: {
    title: "VShip - Monitor Vercel from your menu bar",
    description: "Native macOS menu bar app for real-time Vercel deployment monitoring. Free for personal use.",
    url: 'https://vship-pl6ul8y9x-meckins-projects.vercel.app',
    siteName: 'VShip',
    images: [
      {
        url: '/api/og',
        width: 1200,
        height: 630,
        alt: 'VShip - Monitor Vercel from your menu bar',
      },
    ],
    locale: 'en_US',
    type: 'website',
  },
  twitter: {
    card: 'summary_large_image',
    title: "VShip - Monitor Vercel from your menu bar",
    description: "Native macOS menu bar app for real-time Vercel deployment monitoring. Free for personal use.",
    images: ['/api/og'],
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased`}
      >
        {children}
      </body>
    </html>
  );
}
