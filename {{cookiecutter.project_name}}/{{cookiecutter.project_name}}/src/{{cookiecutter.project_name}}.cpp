#include "{{cookiecutter.project_name}}.hpp"

void {{cookiecutter.project_name}}() {
}
{% if cookiecutter.binary_type == "exe" %}
int main() 
{
    return 0;
}
{% endif %}