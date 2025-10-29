<template>
  <div class="container">
    <header class="header">
      <h1>Welcome to Vue 3 + Vite</h1>
      <p class="subtitle">Built with the Vue 3 + Vite + Nix + Podman template</p>
    </header>
    
    <main class="main">
      <div class="card">
        <h2>Get Started</h2>
        <ul>
          <li>Run <code>pnpm dev</code> to start the development server</li>
          <li>Run <code>pnpm build</code> to create a production build</li>
          <li>Edit <code>src/App.vue</code> to start developing</li>
        </ul>
      </div>
      
      <div class="card">
        <h2>Environment Info</h2>
        <p>Your development environment includes:</p>
        <ul>
          <li>Vue 3 with Composition API</li>
          <li>Vite as build tool</li>
          <li>Nix for reproducible environments</li>
          <li>Podman for containerization</li>
          <li>Conventional Commits enforcement</li>
        </ul>
      </div>
      
      <div class="card">
        <h2>AI Integration</h2>
        <p>This template includes AI-assisted development features:</p>
        <ul>
          <li>Auto-approval configuration in <code>qwen.md</code></li>
          <li>Configurable with <code>AUTO_APPROVE_FEATURE=true/false</code></li>
          <li>Default: Enabled (auto-approve all prompts)</li>
        </ul>
        <div class="toggle-container">
          <label class="toggle-label">
            Auto-approval: 
            <span :class="{'enabled': autoApproveEnabled, 'disabled': !autoApproveEnabled}">
              {{ autoApproveEnabled ? 'ENABLED' : 'DISABLED' }}
            </span>
          </label>
        </div>
      </div>
    </main>
    
    <footer class="footer">
      <p>Made with ❤️ using Vue 3 + Vite template</p>
    </footer>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';

// Default to enabled
const autoApproveEnabled = ref(true);

// In a real app, this would read from the configuration file
function loadConfig() {
  // Simulate loading config - in real implementation, this would read the qwen.md file
  // For now, we'll just set the value based on our default
  autoApproveEnabled.value = true; // This would come from the config file
}

onMounted(() => {
  loadConfig();
});
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  line-height: 1.6;
  color: #2c3e50;
  background-color: #f5f5f5;
}

.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 2rem;
}

.header {
  text-align: center;
  margin-bottom: 2rem;
  padding: 1rem;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border-radius: 8px;
}

.header h1 {
  font-size: 2.5rem;
  margin-bottom: 0.5rem;
}

.subtitle {
  font-size: 1.2rem;
  opacity: 0.9;
}

.main {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1.5rem;
  margin-bottom: 2rem;
}

/* For larger screens, show 2 columns for first two cards */
@media (min-width: 768px) {
  .main {
    grid-template-columns: 1fr 1fr;
  }
  
  .main > div:nth-child(3) {
    grid-column: span 2;
  }
}

.card {
  background: white;
  padding: 1.5rem;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.card h2 {
  margin-bottom: 1rem;
  color: #34495e;
}

.card ul {
  padding-left: 1.5rem;
}

.card li {
  margin-bottom: 0.5rem;
}

code {
  background: #f8f9fa;
  padding: 0.2rem 0.4rem;
  border-radius: 4px;
  font-family: monospace;
  border: 1px solid #e9ecef;
}

.footer {
  text-align: center;
  padding: 1rem;
  background: #ecf0f1;
  border-radius: 8px;
  color: #7f8c8d;
}

.toggle-container {
  margin-top: 1rem;
  padding-top: 1rem;
  border-top: 1px solid #eee;
}

.toggle-label {
  font-weight: bold;
}

.enabled {
  color: #27ae60;
  font-weight: bold;
}

.disabled {
  color: #e74c3c;
  font-weight: bold;
}
</style>