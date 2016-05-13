//
//  main.m
//  LinkedLIst
//
//  Created by Robert Baghai on 4/7/16.
//  Copyright © 2016 Robert Baghai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct Node {
    int data;
    struct Node *nextNode;
} Node;

struct Node *head;     //represents the head of the list
struct Node *current;  //tracks current position in list
struct Node *previous; //tracks previous position in list

void createHead();
void createNode(int);
void traverseThroughList();
void deleteLastNodeFromList();

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        head     = NULL;
        current  = NULL;
        previous = NULL;
        
        createHead();    //creates head for the list
        createNode(2);   //create new node(s) with data
        createNode(3);
        createNode(1);
        createNode(5);
        
        traverseThroughList();
        deleteLastNodeFromList();
    }
    return 0;
}

void createHead() {
    head           = (Node*)malloc(sizeof(Node));
    head->nextNode = NULL;
    current        = head;
}

void createNode(int nodeValue) {
    if (head != NULL) {
        current->nextNode = (Node*)malloc(sizeof(Node));
        current           = current->nextNode;
        current->data     = nodeValue;
        current->nextNode = NULL;
    }
}

void traverseThroughList(){
    if (head != NULL) {
        int elementCounter = 0;
        Node *ptr = head->nextNode;
        
        while (ptr != NULL) {
            NSLog(@"%d",ptr->data);
            ptr = ptr->nextNode;
            elementCounter++;
        }
        NSLog(@"There are %d elements in the list.\n\n",elementCounter);
    }
}

void deleteLastNodeFromList() {
    
    if (head != NULL) {
        current  = head;
        previous = head;
        
        while (current->nextNode != NULL) {
            previous = current;
            current  = current->nextNode;
        }
        previous->nextNode = NULL;
        NSLog(@"List after deleting last element: \n");
        traverseThroughList(); //check to see if last element was deleted
    }
}
