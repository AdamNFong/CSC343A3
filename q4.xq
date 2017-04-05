declare variable $dataset0 external;
declare variable $dataset1 external;

<bestskills>{
let $docInterview := $dataset0
let $docResume := $dataset1

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
					
let $best := ( for $ms in $maxSkill
				return (<best resume = '{data($forename)}'
						position ='{data($interview/@pID)}'>{
							$ms
						}
						</best>)
				)
return 
	$best
}
</bestskills>
	