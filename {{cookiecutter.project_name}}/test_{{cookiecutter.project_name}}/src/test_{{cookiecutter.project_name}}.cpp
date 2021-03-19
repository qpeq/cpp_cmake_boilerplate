#include <gtest/gtest.h>
{% if cookiecutter.binary_type != "exe" %}
#include "hello.hpp"
{% endif %}

TEST(Test_{{cookiecutter.project_name}}, {{cookiecutter.project_name}}) {
}