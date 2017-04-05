declare variable $dataset0 external;
declare variable $dataset1 external;
<histogram>{
let $postingPath := $dataset0
let $resumePath := $dataset1

let $resumes := $resumePath//resume
let $postings := $postingPath//posting
let $skills := $postings/reqSkill/string(@what)

for $skill in distinct-values($skills)

let $count := (for $level in 1 to 5
		let $resumeWithSkill := $resumes/skills/skill[@what = $skill]
		let $resumeWithLevel := $resumes/skills/skill[@level = $level]
		let $levelCount := count(($resumeWithSkill) intersect ($resumeWithLevel))
		return (<count level = '{data($level)}' n='{data($levelCount)}'> </count>))
return
	<skill name = '{data($skill)}'>{ 
		$count
	}
	</skill>
}
</histogram>