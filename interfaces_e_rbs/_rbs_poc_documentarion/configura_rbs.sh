rm rbs_collection.lock.yaml
rm rbs_collection.yaml
rm Gemfile.lock

bundle
rbs collection init
rbs collection install
rbs validates
steep check