#include "hello.hpp"

void hello() {
}
{% if cookiecutter.binary_type == "exe" %}
int main() 
{
    return 0;
}
{% endif %}