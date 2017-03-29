let $docInterview := fn:doc("interview.xml")
let $docResume := fn:doc("resume.xml")

let $interviews := $docInterview//interview 
let $resumes := $docResume//resume

for $interview in $interviews

let $skill := $interview/assessment

let $tech := $skill/techProficiency
let $communication := $skill/communication
let $enthusiasm := $skill/enthusiasm
let $collegiality := $skill/collegiality
let $allskills := ($tech | $enthusiasm | $communication | $collegiality)

let $max := max ($allskills)

let $maxSkill := (for $assess in $allskills
					where $assess = $max
					return $assess)

let $rID := $interview/@rID
let $forename := (for $resume in $resumes
					where $resume/@rID=$rID
					return  $resume/identification/name/forename)

return 
	<best resume = '{data($forename)}'
			position ='{data($interview/@pID)}'>{
		$maxSkill
	}
	</best>
	