# zoneminder Cookbook

Installs and configures the package `zoneminder` on Debian/Ubuntu systems. Note that the zoneminder package will also install mysql and apache2 servers as a dependency.

Monitors are stored in the database instead of conf files, so configuration is mostly manual.

## Requirements

### Platforms

- Debian (requires jessie-backports or wheezy-backports repos to be enabled)
- Ubuntu 12.04-16.04

### Chef

- Chef 11+

### Cookbooks

- apt

## Usage

### zoneminder::default

Include `zoneminder` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[zoneminder]"
  ]
}
```

## Contributing

1. Fork the repository on GitHub
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using GitHub

## License and Authors

Author:: Matt Ray [matt@getchef.com](mailto:matt@getchef.com)

Copyright:: 2013-2014 Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

```
http://www.apache.org/licenses/LICENSE-2.0
```

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
