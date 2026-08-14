FROM lscr.io/linuxserver/beets:latest

# Patch chroma plugin to use fpcalc binary instead of audioread/GStreamer,
# fixing fd exhaustion on large libraries (beetbox/beets#5171).
RUN find /lsiopy -name "chroma.py" -path "*/beetsplug/*" | xargs sed -i \
    -e 's/acoustid\.fingerprint_file(util\.syspath(path))/acoustid.fingerprint_file(util.syspath(path), force_fpcalc=True)/g' \
    -e 's/acoustid\.fingerprint_file(util\.syspath(item\.path))/acoustid.fingerprint_file(util.syspath(item.path), force_fpcalc=True)/g'
