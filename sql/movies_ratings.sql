-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 29, 2019 at 04:34 PM
-- Server version: 10.2.27-MariaDB
-- PHP Version: 7.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u484190787_movies_ratings`
--

-- --------------------------------------------------------

--
-- Table structure for table `movies_ratings`
--

CREATE TABLE `movies_ratings` (
  `id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `poster_path` varchar(32) NOT NULL,
  `rating` int(11) NOT NULL,
  `overview` varchar(485) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movies_ratings`
--

INSERT INTO `movies_ratings` (`id`, `title`, `poster_path`, `rating`, `overview`) VALUES
(1, 'Star Wars: The Rise of Skywalker', '/db32LaOibwEliAmSL2jjDF6oDdj.jpg', 2, 'The surviving Resistance faces the First Order once again as the journey of Rey, Finn and Poe Dameron continues. With the power and knowledge of generations behind them, the final battle begins.'),
(2, 'Ad Astra', '/xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg', 3, 'The near future, a time when both hope and hardships drive humanity to look to the stars and beyond. While a mysterious phenomenon menaces to destroy life on planet Earth, astronaut Roy McBride undertakes a mission across the immensity of space and its many perils to uncover the truth about a lost expedition that decades before boldly faced emptiness and silence in search of the unknown.'),
(3, 'Jumanji: The Next Level', '/jyw8VKYEiM1UDzPB7NsisUgBeJ8.jpg', 3, 'As the gang return to Jumanji to rescue one of their own, they discover that nothing is as they expect. The players will have to brave parts unknown and unexplored in order to escape the world’s most dangerous game.'),
(4, 'Frozen II', '/pjeMs3yqRmFL3giJy4PMXWZTTPa.jpg', 5, 'Elsa, Anna, Kristoff and Olaf head far into the forest to learn the truth about an ancient mystery of their kingdom.'),
(5, 'Zombieland: Double Tap', '/pIcV8XXIIvJCbtPoxF9qHMKdRr2.jpg', 5, 'Columbus, Tallahassee, Wichita, and Little Rock move to the American heartland as they face off against evolved zombies, fellow survivors, and the growing pains of the snarky makeshift family.'),
(6, '6 Underground', '/lnWkyG3LLgbbrIEeyl5mK5VRFe4.jpg', 3, 'After faking his death, a tech billionaire recruits a team of international operatives for a bold and bloody mission to take down a brutal dictator.'),
(7, 'Red Shoes and the Seven Dwarfs', '/MBiKqTsouYqAACLYNDadsjhhC0.jpg', 4, 'Princes who have been turned into Dwarfs seek the red shoes of a lady in order to break the spell, although it will not be easy.'),
(8, 'Ip Man 4: The Finale', '/2MwpeDrI7RbgD6bipT31kpMZe9u.jpg', 3, 'Ip Man 4 is an upcoming Hong Kong biographical martial arts film directed by Wilson Yip and produced by Raymond Wong. It is the fourth in the Ip Man film series based on the life of the Wing Chun grandmaster of the same name and features Donnie Yen reprising the role. The film began production in April 2018 and ended in July the same year.'),
(9, 'Code 8', '/84Xz2Jh60tC3ICO1CY27wc0zwgC.jpg', 5, 'In Lincoln City, some inhabitants have extraordinary abilities. Most live below the poverty line, under the close surveillance of a heavily militarized police force. Connor, a construction worker with powers, involves with a criminal gang to help his ailing mother. (Based on the short film “Code 8,” 2016.)'),
(10, 'Spies in Disguise', '/30YacPAcxpNemhhwX0PVUl9pVA3.jpg', 5, 'When the world\'s best spy is turned into a pigeon, he must rely on his nerdy tech officer to save the world.'),
(11, 'Rambo: Last Blood', '/kTQ3J8oTTKofAVLYnds2cHUz9KO.jpg', 3, 'After fighting his demons for decades, John Rambo now lives in peace on his family ranch in Arizona, but his rest is interrupted when Gabriela, the granddaughter of his housekeeper María, disappears after crossing the border into Mexico to meet her biological father. Rambo, who has become a true father figure for Gabriela over the years, undertakes a desperate and dangerous journey to find her.'),
(12, 'One Piece: Stampede', '/4E2lyUGLEr3yH4q6kJxPkQUhX7n.jpg', 5, 'One Piece: Stampede is a stand-alone film that celebrates the anime\'s 20th Anniversary and takes place outside the canon of the \"One Piece\" TV series. Monkey D. Luffy and his Straw Hat pirate crew are invited to a massive Pirate Festival that brings many of the most iconic characters from throughout the franchise to participate in competition with the Straw Hats to find Roger\'s treasure. It also pits the Straw Hats against a new enemy named Bullet, a former member of Roger\'s crew.'),
(13, 'Cats', '/9zvjgr1v8pwFYQNHZTtnKNQUWmw.jpg', 5, 'A tribe of cats called the Jellicles must decide yearly which one will ascend to the Heaviside Layer and come back to a new Jellicle life.'),
(14, 'Knives Out', '/pThyQovXQrw2m0s9x82twj48Jq4.jpg', 3, 'When renowned crime novelist Harlan Thrombey is found dead at his estate just after his 85th birthday, the inquisitive and debonair Detective Benoit Blanc is mysteriously enlisted to investigate. From Harlan\'s dysfunctional family to his devoted staff, Blanc sifts through a web of red herrings and self-serving lies to uncover the truth behind Harlan\'s untimely death.'),
(15, 'Angel Has Fallen', '/fapXd3v9qTcNBTm39ZC4KUVQDNf.jpg', 5, 'After a treacherous attack, Secret Service agent Mike Banning is charged with attempting to assassinate President Trumbull. Chased by his own colleagues and the FBI, Banning begins a race against the clock to clear his name.'),
(16, 'The Irishman', '/mbm8k3GFhXS0ROd9AD1gqYbIFbM.jpg', 2, 'Pennsylvania, 1956. Frank Sheeran, a war veteran of Irish origin who works as a truck driver, accidentally meets mobster Russell Bufalino. Once Frank becomes his trusted man, Bufalino sends him to Chicago with the task of helping Jimmy Hoffa, a powerful union leader related to organized crime, with whom Frank will maintain a close friendship for nearly twenty years.'),
(17, 'Marriage Story', '/pZekG6xabTmZxjmYw10wN84Hp8d.jpg', 3, 'A stage director and an actress struggle through a grueling, coast-to-coast divorce that pushes them to their personal extremes.'),
(18, 'Parasite', '/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg', 5, 'All unemployed, Ki-taek\'s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.'),
(19, 'The Lighthouse', '/3nk9UoepYmv1G9oP18q6JJCeYwN.jpg', 5, 'Two lighthouse keepers try to maintain their sanity while living on a remote and mysterious New England island in the 1890s.'),
(20, 'The Aeronauts', '/kZHnblqmTBUBgzYBIxWIz9txsEi.jpg', 5, 'In 1862, daredevil balloon pilot Amelia Wren teams up with pioneering meteorologist James Glaisher  to advance human knowledge of the weather and fly higher than anyone in history. While breaking records and advancing scientific discovery, their voyage to the very edge of existence helps the unlikely pair find their place in the world they have left far below them. But they face physical and emotional challenges in the thin air, as the ascent becomes a fight for survival.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movies_ratings`
--
ALTER TABLE `movies_ratings`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
