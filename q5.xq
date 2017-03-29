let $postingPath := fn:doc("posting.xml")
let $resumePath := fn:doc("resume.xml")

let $postings := $postingPath//posting

for $posting in $postings


