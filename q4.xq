let $docInterview := fn:doc("interview.xml")
let $docResume := fn:doc("resume.xml")

let $interviews := $docInterview//interview 
let $resume := $docResume//resume