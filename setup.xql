xquery version "3.0";

import module namespace xdb="http://exist-db.org/xquery/xmldb";

declare variable $target external;

declare function local:mkcol-recursive($collection, $components) {
    if (exists($components)) then
        let $newColl := concat($collection, "/", $components[1])
        return (
            xdb:create-collection($collection, $components[1]),
            local:mkcol-recursive($newColl, subsequence($components, 2))
        )
    else
        ()
};

(: Helper function to recursively create a collection hierarchy. :)
declare function local:mkcol($collection, $path) {
    local:mkcol-recursive($collection, tokenize($path, "/"))
};


local:mkcol("", "/sade-projects/"),
xdb:copy($target || "/textgrid", "/sade-projects/"),
xdb:copy($target || "/tutorial", "/sade-projects/")

