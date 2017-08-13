# install the plugins and build the static site
gitbook install && gitbook build

# Generate a PDF file
gitbook pdf ./ ./জীবনানন্দ-দাশের-কবিতাসমগ্র.pdf

# Generate an ePub file
gitbook epub ./ ./জীবনানন্দ-দাশের-কবিতাসমগ্র.epub

# Generate a Mobi file
gitbook mobi ./ ./জীবনানন্দ-দাশের-কবিতাসমগ্র.mobi

cd ../
# checkout to the gh-pages branch
git checkout master

# pull the latest updates
git pull origin master --rebase

# copy the static site files into the current directory.
cp -R _book/* .

# remove 'node_modules' and '_book' directory
git clean -fx node_modules
git clean -fx _book

# add all files
git add .

# commit
git commit -a -m "Update Book"

# push to the origin
git push -u origin master

# checkout to the master branch
git checkout master