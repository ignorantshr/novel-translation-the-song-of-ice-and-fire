base_dir=$(pwd)"/"$0
cd $(basename ${base_dir}/../docs)
dirs=$(ls -d */)
nav="\    - Home: index.md\n"

for dir in ${dirs}; do
	dir=${dir/\//}
	nav="${nav}    - ${dir}:\n"
	pages=$(ls ${dir})
	for page in ${pages}; do
		oname=${page#*/}
		fname=${oname%.*}
		fname=${fname/-/ }
		nav="${nav}        - ${fname}: ${dir}/${oname}\n"
	done
done
nav=${nav%\\*}
sed -i -r "/^ {4,8}-/d" ../mkdocs.yml
sed -i "/nav/a ${nav}" ../mkdocs.yml
