CPFROM="/home/philip/Documents/MLB-frontend/public"
CPTO="/home/philip/Documents/MLBprodject/apps/MLB-backend/templates/MLBfrontend"
echo "create build"

cd "${CPFROM}/.."
npm run build

echo "started copying build"

cp "${CPFROM}/index.html" "${CPTO}/index.html"
echo "!----"
cp "${CPFROM}/favicon.png" "${CPTO}/favicon.png"
echo "!!---"
cp "${CPFROM}/global.css" "${CPTO}/global.css"
echo "!!!--"
cp "${CPFROM}/build/bundle.css" "${CPTO}/build/bundle.css"
echo "!!!!-"
cp "${CPFROM}/build/bundle.js" "${CPTO}/build/bundle.js"
echo "!!!!!"

echo "done"
