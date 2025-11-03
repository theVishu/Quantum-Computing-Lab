cat > scripts/lint.sh <<'EOF'
#!/usr/bin/env bash
# Lint all Python and notebook files using nbqa+pylint inside uv environment

set -e
cd "$(git rev-parse --show-toplevel)"  # ensure repo root

echo "🔍 Collecting Python and notebook files..."

# Tracked Python files
PY_FILES=$(git ls-files '*.py' | xargs)

# All Jupyter notebooks
NB_FILES=$(find . -type f -name "*.ipynb" -not -path "*/.ipynb_checkpoints/*" | xargs)

echo "🚀 Running nbqa pylint..."
uv run nbqa pylint \
  --disable=R0801 \
  --exit-zero \
  $PY_FILES $NB_FILES

echo "✅ Lint completed successfully!"
EOF
