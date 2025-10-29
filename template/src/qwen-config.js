#!/usr/bin/env node

/**
 * Qwen Configuration Reader
 * Reads configuration from qwen.md to determine auto-approval settings
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Read qwen.md from project root
const qwenPath = path.resolve(__dirname, '../qwen.md');

function readQwenConfig() {
  if (!fs.existsSync(qwenPath)) {
    console.log('qwen.md not found, using default settings');
    return { AUTO_APPROVE_FEATURE: true };
  }

  const content = fs.readFileSync(qwenPath, 'utf8');
  const config = {};

  // Extract AUTO_APPROVE_FEATURE setting
  const approveMatch = content.match(/AUTO_APPROVE_FEATURE=(true|false)/);
  if (approveMatch) {
    config.AUTO_APPROVE_FEATURE = approveMatch[1] === 'true';
  } else {
    // Default to true if not specified
    config.AUTO_APPROVE_FEATURE = true;
  }

  return config;
}

const config = readQwenConfig();

// Export for use in other modules or use directly
console.log('Qwen Configuration:', config);

export { readQwenConfig, config };

// If run directly, output the configuration
if (process.argv[1] === fileURLToPath(import.meta.url)) {
  console.log('Auto-approval feature is:', config.AUTO_APPROVE_FEATURE ? 'ENABLED' : 'DISABLED');
  
  if (config.AUTO_APPROVE_FEATURE) {
    console.log('All prompts will be automatically approved.');
  } else {
    console.log('Prompts will require manual approval.');
  }
}