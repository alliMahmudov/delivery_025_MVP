import '../constants/assets.dart';
import '../model/books_model.dart';

class BookList {
  static List<Books> books = [
    Books(
        id: 12,
        name: "Anna Karenina",
        price: 19.99,
        image: Assets.anna,
        description:
            "Greta Garbo in Anna Karenina (1935), directed by Clarence Brown",
        onlineBook:
            "https://archive.org/details/annakareninatols00tolsiala/mode/1up?view=theater"),
    Books(
        id: 13,
        name: "To Kill a Mockingbird.",
        price: 20.52,
        image: Assets.mockingBird,
        description:
            "This book cover is one of many given to Harper Lee's classic work To Kill a Mockingbird (1960). The novel won a Pulitzer Prize in 1961 and the next year was made into an Academy Award-winning film",
        onlineBook:
            "https://archive.org/details/ToKillaMockingbirdFullText/mode/1up?view=theater"),
    Books(
      id: 14,
      name: "The Great Gatsby",
      price: 10.99,
      image: Assets.gatsby,
      description:
          "F. Scott Fitzgerald’s The Great Gatsby is distinguished as one of the greatest texts for introducing students to the art of reading literature critically",
      onlineBook: 'https://archive.org/details/the-great-gatsby_1922/mode/1up?view=theater',
    ),
    Books(
      id: 15,
      name: "One Hundred Years of Solitude",
      price: 18.99,
      image: Assets.winner,
      description:
          "The late Colombian author Gabriel García Márquez published his most famous work, One Hundred Years of Solitude, in 1967",
    onlineBook: "https://archive.org/details/OneHundredYearsOfSolitude_201710/mode/1up?view=theater"
    ),
    Books(
      id: 16,
      name: "A Passage to India",
      price: 7.69,
      image: Assets.toIndia,
      description:
          "E.M. Forster wrote his novel A Passage to India after multiple trips to the country throughout his early life",
   onlineBook: "https://archive.org/details/in.ernet.dli.2015.463445/mode/1up?view=theater"
    ),
    Books(
      id: 17,
      name: "Invisible Man. Ralph Ellison",
      price: 10.95,
      image: Assets.invisible,
      description:
          "Often confused with H.G. Wells’s science-fiction novella of nearly the same name (just subtract a “The”), Ralph Ellison’s Invisible Man is a groundbreaking novel in the expression of identity for the African American male",
      onlineBook: 'https://archive.org/details/pokemon-incenses/mode/1up?view=theater',
    ),
    Books(
      id: 18,
      name: "Don Quixote",
      price: 13.99,
      image: Assets.don,
      description:
          "Don Quixote (right) and his servant Sancho Panza are pictured in an illustration from the book Don Quixote, by Miguel de Cervantes. The illustration appeared in an edition of the book that was published in the 1800s.",
    onlineBook: "https://archive.org/details/miguel-de-cervantes-saavedra_don-quixote_john-ormsby/mode/1up?view=theater"
    ),
    Books(
      id: 19,
      name: "Beloved",
      price: 17.69,
      image: Assets.beloved,
      description:
          "Toni Morrison’s 1987 spiritual and haunting novel Beloved tells the story of an escaped slave named Sethe who has fled to Cincinnati, Ohio, in the year 1873",
    onlineBook: "https://archive.org/details/belovednovel0000morr_o0h6/mode/1up?view=theater"
    ),
    Books(
      id: 20,
      name: "Mrs. Dalloway",
      price: 7.69,
      image: Assets.dalloway,
      description:
          "Possibly the most idiosyncratic novel of this list, Virginia Woolf’s Mrs. Dalloway describes exactly one day in the life of a British socialite named Clarissa Dalloway",
    onlineBook: "https://archive.org/details/in.ernet.dli.2015.93420/page/n3/mode/1up?view=theater"
    ),
    Books(
      id: 21,
      name: "Things Fall Apart",
      price: 8.89,
      image: Assets.chinua,
      description:
          "The Western canon of “great literature” often focuses on writers who come from North America or Europe and often ignores accomplished writers and amazing works of literature from other parts of the world",
    onlineBook: "https://archive.org/details/AchebeChinuaThingsFallApart/mode/1up?view=theater"
    ),
    Books(
      id: 22,
      name: "Jane Eyre",
      price: 7.29,
      image: Assets.jane,
      description:
          "Charlotte Brontë’s Jane Eyre, another novel often assigned for reading in school, was initially published in 1847 under the pseudonym Currer Bell to disguise the fact that the writer was a woman",
   onlineBook: "https://archive.org/details/JaneEyre-CharlotteBronte/mode/1up?view=theater"
    ),
    Books(
      id: 23,
      name: "One Hundred Years of Solitude",
      price: 17.98,
      image: Assets.purple,
      description:
          "Though the epistolary novel (a novel in the form of letters written by one or more characters) was most popular before the 19th century, Alice Walker became a champion of the style with her 1982 novel The Color Purple, which won a Pulitzer Prize and a National Book Award",
    onlineBook: "https://archive.org/details/the-color-purple-alice-walker/mode/1up?view=theater"
    ),
  ];
}
