#!/bin/sh
set -eu

usage() {
  cat <<'EOF'
Install the apifire Claude Code skill.

Usage:
  sh install.sh [--project] [--user] [--target DIR]

Options:
  --project       Install into ./.claude/skills/apifire (default)
  --user          Install into "$HOME/.claude/skills/apifire"
  --target DIR    Install into DIR/apifire
  -h, --help      Show this help

Examples:
  sh install.sh
  sh install.sh --user
  sh install.sh --target /path/to/.claude/skills
EOF
}

TARGET_BASE=''
MODE='project'

while [ "$#" -gt 0 ]; do
  case "$1" in
    --project)
      MODE='project'
      TARGET_BASE=''
      ;;
    --user)
      MODE='user'
      TARGET_BASE=''
      ;;
    --target)
      if [ "$#" -lt 2 ]; then
        echo "Error: --target requires a directory path." >&2
        exit 1
      fi
      MODE='target'
      TARGET_BASE=$2
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Error: unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
  shift
done

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
SOURCE_DIR="$SCRIPT_DIR/skills/apifire"

if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: skill source directory not found: $SOURCE_DIR" >&2
  exit 1
fi

case "$MODE" in
  project)
    TARGET_BASE=$(pwd)/.claude/skills
    ;;
  user)
    TARGET_BASE=${HOME}/.claude/skills
    ;;
  target)
    ;;
esac

case "$TARGET_BASE" in
  */)
    TARGET_BASE=${TARGET_BASE%/}
    ;;
esac

if [ -z "$TARGET_BASE" ]; then
  echo "Error: target directory cannot be empty." >&2
  exit 1
fi

TARGET_DIR="$TARGET_BASE/apifire"

mkdir -p "$TARGET_BASE"

if [ -e "$TARGET_DIR" ]; then
  echo "Replacing existing installation at $TARGET_DIR"
  rm -rf "$TARGET_DIR"
else
  echo "Installing apifire skill to $TARGET_DIR"
fi

cp -R "$SOURCE_DIR" "$TARGET_DIR"

if [ ! -f "$TARGET_DIR/SKILL.md" ]; then
  echo "Error: installation failed; SKILL.md was not copied." >&2
  exit 1
fi

echo "Done."
echo "Installed files:"
echo "- $TARGET_DIR/SKILL.md"
echo "- $TARGET_DIR/examples.md"
echo "- $TARGET_DIR/README.md"
echo
echo "Next step: restart Claude Code or open a project where this skills directory is available."
