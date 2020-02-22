---
sidebarDepth: 3
---

# Introduction

**tkctl** is a wrapper tool which executes any other best of breed tool such as [Terraform](https://www.terraform.io/) [Ansible](https://www.ansible.com/) and any other tools you may wish to add.
In our first Fuseday we decided our MVP would be to setup a VPC on the 3 major cloud providers + a Kubentes cluster.
This `basic plugins` will enable us to compose more robust & complex architectures by maintaining configuration profiles.
  
![MVP](./../assets/tkctl-mvp.svg)

## Why - Philosophy
Life is complicated, but it shouldn't be ! So:

After over 2 decades of Consultancy when our first decade included an offering was an ALM suite, and after another one as pure ALM/DevOps/SecOps consultants we realise our code/tools isn't the main thing we bring to the table,
and considering re-use is in our nature.
This tool doesn't come to replace any tool out there, this tool is hopefully our collective way of thinking of **Infrastructure Design**.

We purely designed it as a **DevOps tools** any Recommendations you may have a more than welcome!

## Why - Technologically

2 Trends we see growing from **multi-cloud** to **poly-cloud** and in the background as DevOps and a whole lot of **Tooling**, the irony is we need all of them to get s**t done !

Our biggest "fear" of `Generic Tools` is what get's in or will my things / way of thinking get's in or not so - it's simple ;): 
If we share something and 3 people use it in `dev` branch, let's share it with `*`, let's use PR's / Github Issues to discuss these.

## Goals

1. Initial cli with the following command line args:
   * `init` - Instantiate .tkctl + load configuration
     * ---cloud `aws`,`gcp`,`azure`
   * `deploy infra` - a wrapper to creating states 
     * wrapper for create vpc state
     * `-i` `--interactive` for step by step
   * `deploy app state`
   * `destroy` - a wrapper to destroying apps, destroy vpc

2. 3 modules vpc
   * `gcp`
   * `azure`
   * `aws`

3. Managed Kubernetens - Phase 1
   
4. ClusterAPI for Kubernetes initialization - Phase 2


