# CodeaUnit
CodeaUnit is a unit testing framework for Codea on iPad. I understand that many people may think of Codea as a playground to simply hack together ideas and perhaps testing doesn't matter to them. I personally feel test-driving code can get you to your desired goal faster and more efficiently.

Codea is a fantastic tool for coders and CodeaUnit is intended to provide means of proper unit testing for it.

## Installation
1. Simply create a new project called 'CodeaUnit'.
   ![](https://github.com/jakesankey/CodeaUnit/blob/master/screenshots/IMG_0433.PNG)

2. Clear out the content in the 'Main' tab (it isn't needed).

3. Create a new class/tab called 'CodeaUnit' and paste in the contents of `CodeaUnit.lua`.
   ![](https://github.com/jakesankey/CodeaUnit/blob/master/screenshots/IMG_0434.PNG)

4. Add your new CodeaUnit project as a dependency of project that you want to make testable.
   ![](https://github.com/jakesankey/CodeaUnit/blob/master/screenshots/IMG_0432.PNG)

## Usage
When you add the CodeaUnit dependency to your project you get a couple of things.
 1. A global instance of the CodeaUnit framework will be available via the `_` (underscore) variable.
 2. When you run your code you will see a button titled 'CodeaUnit Runner' in the parameters view.
   
    ![](https://github.com/jakesankey/CodeaUnit/blob/master/screenshots/IMG_0431.PNG)

### CodeaUnit Runner
CodeaUnit provides a runner which is currently fairly primitive but is still pretty convenient. Simply hit the 'CodeaUnit Runner' button (or `CodeaUnit.execute()` programmatically). The runner will look for any functions in your entire application (all classes) whose names start with 'test' and it will execute them for you. For cleanliness, a best practice will be to put your test functions in test classes but location really doesn't matter.

### Manual Execution
The runner is optional. You can also fire your tests off inline anywhere you want by called the `describe` function. More detail in the example below.

### Supported Expectations
- `is()`
- `isnt()`
- `has()` (check if array/table contains item)
- `throws()`

### Examples
```lua
-- The runner would find and execute this method due to its name starting with 'test'
function testCodeaUnitFunctionality()
    -- This option changes verbosity of the output. Defaults to true.
    -- only feature names, failed tests, and the summary will show if set to false.
    CodeaUnit.detailed = false

    -- Nested describe calls are not currently supported.
    -- However, multiple can of course be used next to eachother.
    -- describe("feature name", callback)
    _:describe("CodeaUnit Test Suite", function()
    
        -- Executed before each test
        _:before(function()
            -- Some setup
        end)

        -- Executed after each test
        _:after(function()
            -- Some teardown
        end)
        
        -- The callback doesn't have to be inline like this
        -- can also be a reference to the function which is declared elsewhere
        _:test("Equality test", function()
            _:expect("Foo").is("Foo")
        end)

        _:test("Negation test", function()
            _:expect("Bar").isnt("Foo")
        end)

        _:test("Containment test", function()
            _:expect({"Foo", "Bar", "Baz"}).has("Foo")
        end)

        _:test("Thrown test", function()
            -- When using the 'throws' expectation, you need to pass in a function
            -- reference to the 'expect' method.
            _:expect(function()
                error("Foo error")
            end).throws("Foo error")
        end)

        -- Use ignore instead of test if you want to temporarily skip this execution
        _:ignore("Ignored test", function()
            _:expect("Foo").is("Foo")
        end)

        _:test("Failing test", function()
            _:expect("Foo").is("Bar")
        end)

    end)
end
```
