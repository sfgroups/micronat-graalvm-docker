package main

import (
    "fmt"
    "strings"
    "io/ioutil"
    "log"
    "sort"
    "os"
)
func RemoveDuplicates(xs *[]string) {
    found := make(map[string]bool)
    j := 0
    for i, x := range *xs {
    if !found[x] {
    found[x] = true
    (*xs)[j] = (*xs)[i]
    j++
    }
    }
    *xs = (*xs)[:j]
    }

func main() {

    fmt.Println("HOME:", os.Getenv("HOME"))
 
    // Read entire file content, giving us little control but
    // making it very simple. No need to close the file.
    content, err := ioutil.ReadFile("/go/a.txt")
    if err != nil {
        log.Fatal(err)
    }

    // Convert []byte to string and print to screen
    text := string(content)
    fmt.Println(text)

    w := strings.Fields(text)
    j := strings.Join(w, "','")
    fmt.Println(j)
    result := "('" + j + "')"
  
    fmt.Println("New string 2: ", result) 

    RemoveDuplicates(&w)
    sort.Strings(w)
fmt.Println(w)
}
