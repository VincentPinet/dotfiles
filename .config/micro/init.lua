function init()
    linter.removeLinter("g++")
    linter.makeLinter("g++", "c++", "g++", {"-fsyntax-only", "-std=c++26", "-Wall", "-Wextra", "%f"}, "%f:%l:%c:.+: %m")
end
