Cobbler Cookbook
================
This cookbook should properly install Cobbler for installing machines via PXE. It's largely geared towards RHEL derivatives, but I'm trying to make sure that it's as cross platform as possible.

Inspiration has been taken from: 
- https://github.com/opsmatic/cobbler_master-cookbook
- https://github.com/bloomberg/chef-bcpc/


Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### packages
- `toaster` - cobbler needs toaster to brown your bagel.

#### cookbooks
- `yum` - https://github.com/opscode-cookbooks/yum

Attributes
----------
See the `attributes/cobbler.rb` file for default
values. Several attributes have values that vary based on the node's
platform and version.

The file has been documented inline with attribute values. 

Usage
-----
#### cobbler::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `cobbler` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cobbler]"
  ]
}
```

Caveats
------------
Lots. 

Currently this is a pretty messy run. The web portion should be a seperate recipie, as it's an optional seperate component, and also, i'm not sure how to properly enable it in apache. 

The debian stuff is also pretty ugly. 

I've pulled in a couple of default setups. 



Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

- Author:: Andrew Preece (<apreece@wimactel.com>)

Copyright:: 2009-2013 WiMacTel, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
