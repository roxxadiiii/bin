#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: media_to_wav.sh [OPTIONS] INPUT OUTPUT.wav

Convert the first audio stream in a media file to 24-bit PCM WAV.

Options:
  -h, --help             Show this help
  --sample-rate RATE     Output sample rate in Hz (default: 48000)
  --channels N           Output channels: 1 (mono) or 2 (stereo; default: 2)

Example:
  media_to_wav.sh video.mp4 audio.wav
  media_to_wav.sh --sample-rate 96000 input.mkv output.wav
EOF
}

sample_rate=48000
channels=2

while (($#)); do
  case "$1" in
  -h | --help)
    usage
    exit 0
    ;;
  --sample-rate)
    (($# >= 2)) || {
      echo "Error: --sample-rate needs a value." >&2
      exit 2
    }
    sample_rate=$2
    shift 2
    ;;
  --channels)
    (($# >= 2)) || {
      echo "Error: --channels needs a value." >&2
      exit 2
    }
    channels=$2
    shift 2
    ;;
  --)
    shift
    break
    ;;
  -*)
    echo "Error: unknown option: $1" >&2
    usage >&2
    exit 2
    ;;
  *)
    break
    ;;
  esac
done

if (($# != 2)); then
  echo "Error: provide INPUT and OUTPUT.wav." >&2
  usage >&2
  exit 2
fi

input=$1
output=$2

command -v ffmpeg >/dev/null 2>&1 || {
  echo "Error: ffmpeg is not installed or not on PATH." >&2
  exit 1
}

[[ $output == *.wav ]] || {
  echo "Error: output filename must end in .wav." >&2
  exit 2
}

[[ $sample_rate =~ ^[1-9][0-9]*$ ]] || {
  echo "Error: sample rate must be a positive integer." >&2
  exit 2
}

[[ $channels == 1 || $channels == 2 ]] || {
  echo "Error: channels must be 1 or 2." >&2
  exit 2
}

ffmpeg -hide_banner -i "$input" \
  -vn -map 0:a:0 \
  -c:a pcm_s24le -ar "$sample_rate" -ac "$channels" \
  -y "$output"
