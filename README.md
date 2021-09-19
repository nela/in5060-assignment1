# IN5060 Assignment 1

`device-1` folder contains only 1 leaf node in addition to the bottleneck nodes.
`device-2` folder contains 2 leaf nodes on each side, in addition to the
bottleneck nodes.

---

## Useful commands

The files in the folders are outputs from the simulation. Our task is to
statistically analyse this output and find interesting results.

Commands I have found useful when examining the files:

- List the various devices in this file:
  ```
  cut -d ' ' -f3 <bottleneck-or-leafnode.tr> | sort | uniq -c
  ```

- List enqueued, dequeued, received devices:
  ```
  cut -d ' ' -f1,3,29-31 <bottheneck-or-leafnode.tr>
  ```

- Relate id's from `qdisc-drop` to the `bottleneck`:
  ```
  awk 'NR==FNR{a[$13];next} $19 in a{print $0 }' <qdisc-drop.tr> <bottleneck.tr>
  ```
