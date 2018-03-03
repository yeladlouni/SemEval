## Usage: gunzip -c SemEval2016-Task3-CQA-MD-dev-subtaskD.xml.gz | perl SemEval2016_task3_Arabic_generate_relevancy_file_subtaskD.pl > SemEval2016-Task3-CQA-MD-dev-subtaskD.xml.relevancy

while(<>){
	
	if(/<Question QID\="(\d+)"/){
		#print "$1\n";
		$qid = $1;
		$r = 0;
	}
	elsif(/<QApair QAID\="(\d+)" QAconf\="(\d+.\d+)" QArel\="([IRD])"/){
		#print "$1\n";
		$qaid = $1;
		$conf = $2;
		$rel = $3;
		
		if($rel eq "I"){
			$rel = "false";
		}
		elsif($rel eq "R"){
			$rel = "true";
		}

		print "$qid\t$qaid\t$r\t$conf\t$rel\n";
	}
}