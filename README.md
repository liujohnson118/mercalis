# README

This solution is for the advanced option of the assignment. 

* Ruby version

3.3.6

* Configuration

* How to run the test suite
```
bundle exec rspec
```

## ModThreeFsm
Example runs: 
```
mercalis(dev)> ModThreeFsm.call("110")
=> 0
mercalis(dev)> ModThreeFsm.call("1010")
=> 1
mercalis(dev)> ModThreeFsm.call("1101")
=> 1
mercalis(dev)> ModThreeFsm.call("1110")
=> 2
mercalis(dev)> ModThreeFsm.call("1111")
=> 0
```
