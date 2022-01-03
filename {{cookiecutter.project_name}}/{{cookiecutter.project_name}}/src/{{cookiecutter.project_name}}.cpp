#include "{{cookiecutter.project_name}}.hpp"

void {{cookiecutter.project_name}}() {
}
{% if cookiecutter.project_type == "exe" %}
int main() 
{
    return 0;
}
{% endif %}