
ContinuePath = require "../continuepath.coffee"
assert = require "assert"


describe "cp", () ->
    cp = new ContinuePath()
    cp.add((p)-> 
        if (p.dt >= 5)
            return "ok"
        console.log "tick"
        return "continue"
    ).add(() ->
        console.log "done"
        )


    for i in [1..10]
        cp.update(1)