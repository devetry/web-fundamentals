export PATH="$HOME/.composer/vendor/bin:$PATH"
couscous generate
cp CNAME .couscous/generated/CNAME
touch .couscous/generated/.nojekyll
mkdir .couscous/generated/studios/databases/2/downloads
cp -R studios/databases/2/downloads/. .couscous/generated/studios/databases/2/downloads
gh-pages -d ./.couscous/generated -t