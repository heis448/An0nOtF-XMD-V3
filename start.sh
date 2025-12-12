#!/bin/bash
echo "=============================================="
echo "🚀 Starting 🅰️𝐧𝟎𝐧𝐎𝐭𝐅-𝐕𝟑 𝐗𝐌𝐃 Bot"
echo "=============================================="

# Check Node version
NODE_VERSION=$(node -v)
echo "🔧 Node Version: $NODE_VERSION"

# Install dependencies if package.json exists
if [ -f "package.json" ]; then
    echo "📦 Installing dependencies..."
    npm install --production
fi

# Load environment variables
if [ -f ".env" ]; then
    echo "🔐 Loading environment variables..."
    export $(cat .env | grep -v '^#' | xargs)
else
    echo "⚠️  No .env file found, using defaults"
fi

# Create necessary directories
mkdir -p session
mkdir -p temp
mkdir -p logs

# Start the bot
echo "🤖 Starting WhatsApp Bot..."
node index.js