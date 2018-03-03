###
### Description: Scoring script for the baselines for SemEval-2017 Task 3
### Author: Preslav Nakov
### Last modified: February 2, 2017
###

echo 1. Scoring the random baselines
bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test-subtaskA.xml.subtaskA.relevancy _baseline/subtask_A_baseline_random.txt || exit -1
bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test.xml.subtaskB.relevancy _baseline/subtask_B_baseline_random.txt || exit -2
bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test.xml.subtaskC.relevancy _baseline/subtask_C_baseline_random.txt || exit -3
bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-MD-test.xml.subtaskD.relevancy _baseline/subtask_D_baseline_random.txt || exit -4

echo 2. Scoring TRUE baselines
bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test-subtaskA.xml.subtaskA.relevancy _baseline/subtask_A_baseline_true.txt || exit -5
bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test.xml.subtaskB.relevancy _baseline/subtask_B_baseline_true.txt || exit -6
bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test.xml.subtaskC.relevancy _baseline/subtask_C_baseline_true.txt || exit -7
bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-MD-test.xml.subtaskD.relevancy _baseline/subtask_D_baseline_true.txt || exit -8

echo 3. Scoring FALSE baselines
bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test-subtaskA.xml.subtaskA.relevancy _baseline/subtask_A_baseline_false.txt || exit -9
bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test.xml.subtaskB.relevancy _baseline/subtask_B_baseline_false.txt || exit -10
bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-QL-test.xml.subtaskC.relevancy _baseline/subtask_C_baseline_false.txt || exit -11
bash _scripts/run_scorer.sh _gold/SemEval2017-Task3-CQA-MD-test.xml.subtaskD.relevancy _baseline/subtask_D_baseline_false.txt || exit -12
