function testCodeaUnitFunctionality()
    CodeaUnit.detailed = true

    _:describe("CodeaUnit Test Suite", function()

        _:before(function()
            -- Some setup
        end)

        _:after(function()
            -- Some teardown
        end)

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
            _:expect(function()
                error("Foo error")
            end).throws("Foo error")
        end)

        _:ignore("Ignored test", function()
            _:expect("Foo").is("Foo")
        end)

        _:test("Failing test", function()
            _:expect("Foo").is("Bar")
        end)

    end)
end
