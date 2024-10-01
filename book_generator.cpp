#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib> 

// Generate random words
std::string generateRandomWord(int length) {
    std::string word = "";
    for (int i = 0; i < length; i++) {
        char letter = 'a' + rand() % 26;//26 English letters
        word += letter;
    }
    return word;
}

// Function to generate random chapter content
std::string generateChapterContent() {
    std::string content = "";
    for (int i = 0; i < 100; i++) { // Only 100 words per chapter
        content += generateRandomWord(5) + " "; // 5-letter words 
    }
    content += "\n\n"; //Make some space for joining later with other files
    return content;
}

int main() {
    std::string author;
    std::cout << "Enter the name of the author (your name): ";
    std::getline(std::cin, author);

    // Create Markdown files
    std::ofstream headerMd("header.md");
    headerMd << "# A book by " << author << "\n\n";
    headerMd.close();

    for (int i = 1; i <= 4; i++) { // 4 chapters
        std::ofstream chapterMd("chapter" + std::to_string(i) + ".md");
        chapterMd << "# Chapter " << i << "\n";
        chapterMd << generateChapterContent() << "\n";
        chapterMd.close();
    }

    // Create asciidoc files
    std::ofstream headerAdoc("header.adoc");
    headerAdoc << "= A book by " << author << "\n\n";
    headerAdoc.close();

    for (int i = 1; i <= 4; i++) { // 4 chapters
        std::ofstream chapterAdoc("chapter" + std::to_string(i) + ".adoc");
        chapterAdoc << "== Chapter " << i << "\n";
        chapterAdoc << generateChapterContent() << "\n";
        chapterAdoc.close();
    }

    return 0;
}
