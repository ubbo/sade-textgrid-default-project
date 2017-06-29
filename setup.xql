xquery version "3.0";

declare variable $target external;

declare function local:mkcol-recursive($collection, $components) {
    if (exists($components)) then
        let $newColl := concat($collection, "/", $components[1])
        return (
            xmldb:create-collection($collection, $components[1]),
            local:mkcol-recursive($newColl, subsequence($components, 2))
        )
    else
        ()
};

(: Helper function to recursively create a collection hierarchy. :)
declare function local:mkcol($collection, $path) {
    local:mkcol-recursive($collection, tokenize($path, "/"))
};

(
    local:mkcol("/system/config/db/", "/sade-projects/textgrid/data/"),
    xmldb:copy($target || "/textgrid/", "/system/config/db/sade-projects/textgrid/data/", "collection.xconf"),
    local:mkcol("", "/sade-projects/"),
    xmldb:copy($target || "/textgrid", "/sade-projects/"),
    xmldb:copy($target || "/tutorial", "/sade-projects/"),

    xmldb:reindex("/db/sade-projects/textgrid/data/")
)
