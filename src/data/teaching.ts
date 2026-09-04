// Courses served as a teaching assistant.

export interface Course {
  title: string;
  term: string;
  lab?: { label: string; href: string; note?: string };
}

export const courses: Course[] = [
  {
    title: "Software Analysis and Verification",
    term: "Spring 2021-2023",
    lab: {
      label: "CMinor-Verifier",
      href: "https://github.com/thufv/CMinor-Verifier",
      note: "(in Chinese)",
    },
  },
  {
    title: "Principles and Practice of Compiler Construction",
    term: "Fall 2020-2021",
    lab: {
      label: "MiniDecaf",
      href: "https://github.com/decaf-lang/minidecaf-tutorial",
      note: "(in Chinese)",
    },
  },
  {
    title: "Data Structure and Algorithms",
    term: "Fall 2020",
  },
];
