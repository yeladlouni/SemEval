###
### Description: Scoring script for all results for SemEval-2017 Task 3
### Author: Preslav Nakov
### Last modified: February 2, 2017
###

find . -name subtask_A_primary.txt -exec bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test-subtaskA.xml.subtaskA.relevancy {} \; || exit -1
find . -name subtask_A_contrastive1.txt -exec bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test-subtaskA.xml.subtaskA.relevancy {} \; || exit -2
find . -name subtask_A_contrastive2.txt -exec bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test-subtaskA.xml.subtaskA.relevancy {} \; || exit -3

find . -name subtask_B_primary.txt -exec bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test.xml.subtaskB.relevancy {} \; || exit -4
find . -name subtask_B_contrastive1.txt -exec bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test.xml.subtaskB.relevancy {} \; || exit -5
find . -name subtask_B_contrastive2.txt -exec bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test.xml.subtaskB.relevancy {} \; || exit -6

find . -name subtask_C_primary.txt -exec bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test.xml.subtaskC.relevancy {} \; || exit -7
find . -name subtask_C_contrastive1.txt -exec bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test.xml.subtaskC.relevancy {} \; || exit -8
find . -name subtask_C_contrastive2.txt -exec bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test.xml.subtaskC.relevancy {} \; || exit -9

find . -name subtask_D_primary.txt -exec bash _scripts/run_scorer_subtaskD.sh _gold/SemEval2017-Task3-CQA-MD-test.xml.subtaskD.relevancy {} \; || exit -10
find . -name subtask_D_contrastive1.txt -exec bash _scripts/run_scorer_subtaskD.sh _gold/SemEval2017-Task3-CQA-MD-test.xml.subtaskD.relevancy {} \; || exit -11
find . -name subtask_D_contrastive2.txt -exec bash _scripts/run_scorer_subtaskD.sh _gold/SemEval2017-Task3-CQA-MD-test.xml.subtaskD.relevancy {} \; || exit -12

find . -name "subtask_A_primary.txt.score" -exec grep -H Official {} \; | perl -p -e 's/\.txt\.score:\*\*\* Official score \(MAP for SYS\):/\t/' | perl -p -e 's/^\.\///' | perl -p -e 's/\//\t/' |sort -k3 -n -r > results_subtask_A_primary.txt || exit -13
find . -name "subtask_B_primary.txt.score" -exec grep -H Official {} \; | perl -p -e 's/\.txt\.score:\*\*\* Official score \(MAP for SYS\):/\t/' | perl -p -e 's/^\.\///' | perl -p -e 's/\//\t/' |sort -k3 -n -r > results_subtask_B_primary.txt || exit -14
find . -name "subtask_C_primary.txt.score" -exec grep -H Official {} \; | perl -p -e 's/\.txt\.score:\*\*\* Official score \(MAP for SYS\):/\t/' | perl -p -e 's/^\.\///' | perl -p -e 's/\//\t/' |sort -k3 -n -r > results_subtask_C_primary.txt || exit -15
find . -name "subtask_D_primary.txt.score" -exec grep -H Official {} \; | perl -p -e 's/\.txt\.score:\*\*\* Official score \(MAP for SYS\):/\t/' | perl -p -e 's/^\.\///' | perl -p -e 's/\//\t/' |sort -k3 -n -r > results_subtask_D_primary.txt || exit -16


find . -name "subtask_A_*.txt.score" -exec grep -H Official {} \; | perl -p -e 's/\.txt\.score:\*\*\* Official score \(MAP for SYS\):/\t/' | perl -p -e 's/^\.\///' | perl -p -e 's/\//\t/' |sort -k3 -n -r > results_subtask_A_all.txt || exit -17
find . -name "subtask_B_*.txt.score" -exec grep -H Official {} \; | perl -p -e 's/\.txt\.score:\*\*\* Official score \(MAP for SYS\):/\t/' | perl -p -e 's/^\.\///' | perl -p -e 's/\//\t/' |sort -k3 -n -r > results_subtask_B_all.txt || exit -18
find . -name "subtask_C_*.txt.score" -exec grep -H Official {} \; | perl -p -e 's/\.txt\.score:\*\*\* Official score \(MAP for SYS\):/\t/' | perl -p -e 's/^\.\///' | perl -p -e 's/\//\t/' |sort -k3 -n -r > results_subtask_C_all.txt || exit -19
find . -name "subtask_D_*.txt.score" -exec grep -H Official {} \; | perl -p -e 's/\.txt\.score:\*\*\* Official score \(MAP for SYS\):/\t/' | perl -p -e 's/^\.\///' | perl -p -e 's/\//\t/' |sort -k3 -n -r > results_subtask_D_all.txt || exit -20

### Check for errors
find . -name "*score" -exec grep -H -i error {} \; || exit -21

### Create the tables
find . -name "subtask_A_*.txt.score" -exec grep -H "ALL SCORES:" {} \; | perl -p -e 's/\.txt\.score:ALL SCORES:/\t/' | perl -p -e 's/^\.\///' | perl -p -e 's/\/subtask_A_/\-/' | sort -k1 > results_subtask_A.tab || exit -22
find . -name "subtask_B_*.txt.score" -exec grep -H "ALL SCORES:" {} \; | perl -p -e 's/\.txt\.score:ALL SCORES:/\t/' | perl -p -e 's/^\.\///' | perl -p -e 's/\/subtask_B_/\-/' | sort -k1 > results_subtask_B.tab || exit -23
find . -name "subtask_C_*.txt.score" -exec grep -H "ALL SCORES:" {} \; | perl -p -e 's/\.txt\.score:ALL SCORES:/\t/' | perl -p -e 's/^\.\///' | perl -p -e 's/\/subtask_C_/\-/' | sort -k1 > results_subtask_C.tab || exit -24
find . -name "subtask_D_*.txt.score" -exec grep -H "ALL SCORES:" {} \; | perl -p -e 's/\.txt\.score:ALL SCORES:/\t/' | perl -p -e 's/^\.\///' | perl -p -e 's/\/subtask_D_/\-/' | sort -k1 > results_subtask_D.tab || exit -25

### Generate LaTeX tables
cat results_subtask_A.tab \
   | sort -k8 -n -r | perl _scripts/number_column_k.pl -k 7 -t -m \
   | sort -k7 -n -r | perl _scripts/number_column_k.pl -k 6 -t -m \
   | sort -k6 -n -r | perl _scripts/number_column_k.pl -k 5 -t -m \
   | sort -k5 -n -r | perl _scripts/number_column_k.pl -k 4 -t -m \
   | sort -k4 -n -r | perl _scripts/number_column_k.pl -k 3 -t \
   | sort -k3 -n -r | perl _scripts/number_column_k.pl -k 2 -m -t \
   | sort -k2 -n -r | perl _scripts/number_column_k.pl -k 1 -m \
   | perl _scripts/make_latex_table.pl \
   | perl -pe "s/Table caption./Subtask A, English (Question-Comment Similarity): results for all submissions. The first column shows the rank of the primary runs with respect to the official MAP score. The second column contains the team's name and its submission type (primary vs. contrastive).
The following columns show the results for the primary, and then for other, unofficial evaluation measures. The subindices show the rank of the primary runs with respect to the evaluation measure in the respective column./" \
       > results_subtask_A.tex || exit -26

cat results_subtask_B.tab \
   | sort -k8 -n -r | perl _scripts/number_column_k.pl -k 7 -t -m \
   | sort -k7 -n -r | perl _scripts/number_column_k.pl -k 6 -t -m \
   | sort -k6 -n -r | perl _scripts/number_column_k.pl -k 5 -t -m \
   | sort -k5 -n -r | perl _scripts/number_column_k.pl -k 4 -t -m \
   | sort -k4 -n -r | perl _scripts/number_column_k.pl -k 3 -t \
   | sort -k3 -n -r | perl _scripts/number_column_k.pl -k 2 -m -t \
   | sort -k2 -n -r | perl _scripts/number_column_k.pl -k 1 -m \
   | perl _scripts/make_latex_table.pl \
   | perl -pe "s/Table caption./Subtask B, English (Question-Question Similarity): results for all submissions. The first column shows the rank of the primary runs with respect to the official MAP score. The second column contains the team's name and its submission type (primary vs. contrastive).
The following columns show the results for the primary, and then for other, unofficial evaluation measures. The subindices show the rank of the primary runs with respect to the evaluation measure in the respective column./" \
       > results_subtask_B.tex || exit -27

cat results_subtask_C.tab \
   | sort -k8 -n -r | perl _scripts/number_column_k.pl -k 7 -t -m \
   | sort -k7 -n -r | perl _scripts/number_column_k.pl -k 6 -t -m \
   | sort -k6 -n -r | perl _scripts/number_column_k.pl -k 5 -t -m \
   | sort -k5 -n -r | perl _scripts/number_column_k.pl -k 4 -t -m \
   | sort -k4 -n -r | perl _scripts/number_column_k.pl -k 3 -t \
   | sort -k3 -n -r | perl _scripts/number_column_k.pl -k 2 -m -t \
   | sort -k2 -n -r | perl _scripts/number_column_k.pl -k 1 -m \
   | perl _scripts/make_latex_table.pl \
   | perl -pe "s/Table caption./Subtask C, English (Question-External Comment Similarity): results for all submissions. The first column shows the rank of the primary runs with respect to the official MAP score. The second column contains the team's name and its submission type (primary vs. contrastive). The following columns show the results for the primary, and then for other, unofficial evaluation measures. The subindices show the rank of the primary runs with respect to the evaluation measure in the respective column./" \
       > results_subtask_C.tex || exit -28

cat results_subtask_D.tab \
   | sort -k8 -n -r | perl _scripts/number_column_k.pl -k 7 -t -m \
   | sort -k7 -n -r | perl _scripts/number_column_k.pl -k 6 -t -m \
   | sort -k6 -n -r | perl _scripts/number_column_k.pl -k 5 -t -m \
   | sort -k5 -n -r | perl _scripts/number_column_k.pl -k 4 -t -m \
   | sort -k4 -n -r | perl _scripts/number_column_k.pl -k 3 -t \
   | sort -k3 -n -r | perl _scripts/number_column_k.pl -k 2 -m -t \
   | sort -k2 -n -r | perl _scripts/number_column_k.pl -k 1 -m \
   | perl _scripts/make_latex_table.pl \
   | perl -pe "s/Table caption./Subtask D, Arabic (Reranking the correct answers for a new question): results for all submissions. The first column shows the rank of the primary runs with respect to the official MAP score. The second column contains the team's name and its submission type (primary vs. contrastive). The following columns show the results for the primary, and then for other, unofficial evaluation measures. The subindices show the rank of the primary runs with respect to the evaluation measure in the respective column./" \
       > results_subtask_D.tex || exit -29

mv *.txt *.tab *.tex _results/

