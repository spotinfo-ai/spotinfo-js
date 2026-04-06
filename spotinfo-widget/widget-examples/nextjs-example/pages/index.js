// pages/index.js

import Head from 'next/head';
import Script from 'next/script';
import dynamic from 'next/dynamic';

// Dynamically import the Chat Widget component (this part remains the same).
const ChatWidget = dynamic(
  () => import('../components/SpotInfoChat'),
  {
    ssr: false,
    loading: () => <p>Loading Chat...</p>
  }
);

// We'll define all our styles in a single object for cleanliness.
const styles = {
  container: {
    fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif',
    color: '#333',
    maxWidth: '960px',
    margin: '0 auto',
    padding: '0 1rem',
  },
  header: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: '1rem 0',
    borderBottom: '1px solid #eaeaea',
  },
  logo: {
    fontSize: '1.5rem',
    fontWeight: 'bold',
  },
  nav: {
    display: 'flex',
    gap: '1.5rem',
  },
  navLink: {
    textDecoration: 'none',
    color: '#0070f3',
    fontSize: '1rem',
  },
  main: {
    padding: '4rem 0',
    textAlign: 'center',
  },
  productCard: {
    border: '1px solid #eaeaea',
    borderRadius: '10px',
    padding: '2rem',
    marginTop: '2rem',
    boxShadow: '0 4px 14px 0 rgba(0, 0, 0, 0.05)',
  },
  productImage: {
    maxWidth: '100%',
    height: '40px',
    borderRadius: '8px',
    marginBottom: '1rem',
  },
  buyButton: {
    backgroundColor: '#0070f3',
    color: 'white',
    border: 'none',
    padding: '0.75rem 1.5rem',
    fontSize: '1rem',
    borderRadius: '5px',
    cursor: 'pointer',
    marginTop: '1rem',
  },
  footer: {
    padding: '2rem 0',
    borderTop: '1px solid #eaeaea',
    textAlign: 'center',
    fontSize: '0.9rem',
    color: '#666',
  },
};


export default function Home() {
  return (
    <div style={styles.container}>
      <Head>
        <title>SpotInfo AI Next JS Demo Page | Welcome</title>
        <meta name="description" content="The best place to buy amazing things." />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      {/* This Script tag loads your widget's code. Keep it here. */}
      <Script
        src="https://www.spotinfo.ai/js/widget.umd.js"
        strategy="afterInteractive"
        onLoad={() => {
          console.log("Spotinfo chat script has loaded successfully!");
        }}
        onError={(e) => {
          console.error("Error loading the Spotinfo chat script:", e);
        }}
      />

      {/* --- HEADER --- */}
      <header style={styles.header}>
        <div style={styles.logo}>SpotInfo AI</div>
        <nav style={styles.nav}>
          <a href="#" style={styles.navLink}>Home</a>
          <a href="#" style={styles.navLink}>Products</a>
          <a href="#" style={styles.navLink}>About</a>
        </nav>
      </header>

      {/* --- MAIN CONTENT --- */}
      <main style={styles.main}>
        <h1>Welcome to SpotInfo AI!</h1>
        <p>We help convert leads to customers for high involvement purchases.</p>

        <div style={styles.productCard}>
          <h2>Our Featured Product</h2>
          <img
            src="https://picsum.photos/400/250"
            alt="A placeholder image of our amazing product"
            style={styles.productImage}
          />
          <h3>The Amazing AI Agents</h3>
          <p>SpotInfo's AI Agents will convert leads to paying customers by engaging leads in Product Discovery, Product Research and Lead Prioritization.</p>
          <button style={styles.buyButton} onClick={() => alert('Thanks for your interest!')}>
            Buy Now
          </button>
        </div>

        <p style={{ marginTop: '3rem' }}>Have questions? Ask our AI assistant in the corner!</p>

      </main>

      {/* --- FOOTER --- */}
      <footer style={styles.footer}>
        <p>© {new Date().getFullYear()} SpotInfo AI Private Limited. All rights reserved.</p>
      </footer>

      {/* This renders your actual chat widget component. It will float on the page. */}
      <ChatWidget />
    </div>
  );
}