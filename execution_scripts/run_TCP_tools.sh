# provide 3 args (dirs actual for your machine):
# 1) Path till the cloned GeTLO project, e.g. "/home/misha/TCP_tools/GeTLO"
# 2) Path till the cloned Modificare project, e.g. "/home/misha/TCP_tools/modificare"
# 3) Path till the current project, e.g. "/home/misha/PycharmProjects/TCP_scripts"
# TODO: Uncomment for all the projects!
#projects=(chart lang math closure time)
projects=(chart lang)

# Preprocess and copy data to the GeTLO dir
python ./src/getlo/getlo_data_processing/getlo_coverage_preprocessor.py $1 ${projects[*]}

# Copy data and run the Modificare tool.
python ./src/modificare/copy_data.py $2 ${projects[*]}
Rscript $2/run_experiments.R ${projects[*]}
python ./src/modificare/move_results.py $2 $3 ${projects[*]}
