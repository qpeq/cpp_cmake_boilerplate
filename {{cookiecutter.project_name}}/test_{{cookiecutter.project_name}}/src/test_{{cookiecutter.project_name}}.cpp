{%- if cookiecutter.testing_framework == "gtest" -%}
#include <gtest/gtest.h>
{%- else %}
#include <catch2/catch.hpp>
{%- endif %}
{%- if cookiecutter.project_type != "exe" %}
#include "{{cookiecutter.project_name}}.hpp"
{%- endif %}

{% if cookiecutter.testing_framework == "gtest" -%}
TEST(Test_{{cookiecutter.project_name}}, {{cookiecutter.project_name}}) {
{%- else %}
TEST_CASE("Test_{{cookiecutter.project_name}}", "{{cookiecutter.project_name}}") {
{% endif -%}
}