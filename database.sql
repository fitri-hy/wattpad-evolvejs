-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Agu 2024 pada 12.43
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(1, 'Romansa'),
(2, 'Petualangan'),
(3, 'Fantasi'),
(4, 'Misteri');

-- --------------------------------------------------------

--
-- Struktur dari tabel `story`
--

CREATE TABLE `story` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `img` varchar(200) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `story`
--

INSERT INTO `story` (`id`, `title`, `content`, `img`, `date`, `id_category`) VALUES
(1, 'Kerajaan Awan', '<p>Di dunia yang terletak jauh di atas awan, terdapat sebuah kerajaan yang dikenal dengan nama <strong>Aeloria</strong>. Kerajaan ini tidak terlihat oleh mata manusia biasa, melayang di antara awan putih yang lembut. Penduduk Aeloria adalah makhluk yang dikenal sebagai <strong>Elara</strong>, para penjaga langit dengan kemampuan magis yang menakjubkan.</p>\r\n\r\n<p><strong>Elara</strong>, sang putri kerajaan Aeloria, adalah seorang gadis muda dengan rambut perak yang memantulkan cahaya matahari dan mata biru seperti langit yang tak berujung. Meskipun dia adalah ahli sihir yang berbakat, Elara merasa hidupnya terlalu monoton. Dia sering memandangi ke bawah dari menara istana, memikirkan dunia di bawah awan yang tidak pernah dia kunjungi.</p>\r\n\r\n<p>Suatu malam, saat bulan purnama memancarkan sinarnya yang lembut, Elara menemukan sebuah objek misterius terjatuh dari langit. Dengan rasa penasaran yang besar, dia terbang ke tempat jatuhnya objek itu dan menemukan sebuah <strong>bola kristal</strong> bersinar. Ketika dia menyentuhnya, bola kristal tersebut mengeluarkan cahaya yang sangat terang dan membimbingnya menuju sebuah pintu rahasia di dalam sebuah gua tersembunyi.</p>\r\n\r\n<p>Pintu rahasia itu membawanya ke sebuah dunia yang sangat berbeda dari Aeloria. Di sana, Elara menemukan sebuah kerajaan yang dilanda kekacauan dan kegelapan. Dunia bawah awan ternyata adalah tempat yang telah lama ditinggalkan dan terlupakan, yang dikuasai oleh makhluk jahat bernama <strong>Nyx</strong>, penguasa kegelapan.</p>\r\n<p><strong>Nyx</strong> telah mencuri cahaya dari dunia bawah awan dan mengurungnya dalam sebuah kristal hitam yang besar. Tanpa cahaya, kerajaan ini terperangkap dalam kegelapan abadi, dan penduduknya hidup dalam ketakutan dan kesedihan.</p>\r\n\r\n<p>Elara bertemu dengan kelompok pemberani yang berjuang untuk mengalahkan Nyx dan mengembalikan cahaya ke dunia mereka. Mereka terdiri dari seorang kesatria bernama <strong>Loran</strong>, seorang penyihir bijaksana bernama <strong>Mira</strong>, dan seorang pencuri licik bernama <strong>Kael</strong>. Bersama-sama, mereka memulai perjalanan berbahaya untuk menemukan kunci kristal hitam dan membebaskan kerajaan dari cengkraman kegelapan.</p>\r\n\r\n<p>Dalam perjalanan mereka, Elara dan teman-temannya menghadapi berbagai rintangan, mulai dari labirin yang penuh dengan jebakan magis hingga pertempuran melawan makhluk kegelapan yang menakutkan. Selama petualangan ini, Elara menemukan kekuatan dalam dirinya yang belum pernah dia ketahui sebelumnya. Dia belajar untuk mengendalikan kekuatan sihirnya dengan lebih baik dan memimpin kelompoknya dengan keberanian dan kebijaksanaan.</p>\r\n\r\n<p>Di puncak menara kegelapan, Elara dan teman-temannya menghadapi Nyx dalam pertempuran terakhir. Dengan keberanian dan persahabatan, mereka berhasil menghancurkan kristal hitam dan mengembalikan cahaya ke dunia bawah awan. Kerajaan yang dulu gelap kini kembali bersinar dengan warna-warni yang cerah.</p>\r\n\r\n<p>Setelah kemenangan mereka, Elara memutuskan untuk kembali ke Aeloria dengan membawa pelajaran berharga dari dunia bawah awan. Dia kembali dengan rasa syukur dan kebanggaan yang mendalam, serta persahabatan baru yang tak ternilai harganya.</p>\r\n\r\n<p>Kerajaan Aeloria merayakan kepulangan Elara dengan festival cahaya yang megah, dan Elara menjadi seorang pemimpin yang dihormati, dikenal tidak hanya karena kekuatan sihirnya tetapi juga karena hati dan keberaniannya. Dia menyadari bahwa dunia di bawah awan bukan hanya tentang keajaiban, tetapi juga tentang keberanian, persahabatan, dan kekuatan hati untuk mengatasi kegelapan.</p>', '1724658228309.jpg', '2024-08-25', 2),
(2, 'Cahaya di Antara Dua Dunia', 'Di sebuah negeri yang terlupakan oleh waktu, hiduplah seorang penyihir muda bernama Alana. Alana adalah penjaga hutan magis, tempat di mana keajaiban dan misteri hidup berdampingan. Dengan rambut hitam panjang yang bersinar seperti malam dan mata hijau seperti zamrud, Alana memiliki kekuatan untuk berkomunikasi dengan alam dan menjaga keseimbangan di dunia magis.\r\n\r\nSuatu hari, saat fajar pertama muncul, Alana merasakan getaran aneh di dalam hutan. Dia mengikuti instingnya dan menemukan seorang pria tergeletak tak sadarkan diri di tepi danau kristal. Pria itu tampak asing, dengan pakaian yang tidak pernah dilihat Alana sebelumnya, dan seberkas cahaya lembut mengelilingi tubuhnya.\r\n\r\nAlana merasakan ikatan yang kuat dan aneh dengan pria tersebut. Tanpa ragu, dia menggunakan sihirnya untuk menyembuhkan luka-luka pria itu. Saat pria itu terbangun, Alana terkejut melihat bahwa matanya berwarna biru cerah, seperti langit di atas hutan. Pria itu memperkenalkan dirinya sebagai Kaelan, seorang pangeran dari kerajaan manusia di dunia lain yang terpisah dari dunia magis oleh tabir misterius.\r\n\r\nKaelan menceritakan bahwa dia adalah pewaris takhta yang terkutuk. Kutukan tersebut membuatnya terpisah dari dunia manusia dan terdampar di dunia magis. Satu-satunya cara untuk mematahkan kutukan itu adalah dengan menemukan \"Cahaya Kehidupan,\" sebuah artefak kuno yang tersembunyi di dalam hutan magis yang hanya bisa ditemukan oleh hati yang tulus dan penuh cinta.\r\n\r\nAlana merasa tergerak oleh penderitaan Kaelan dan memutuskan untuk membantunya mencari Cahaya Kehidupan. Mereka mulai menjelajahi hutan bersama, menghadapi berbagai rintangan dan teka-teki yang menantang. Selama perjalanan ini, keduanya mulai merasakan sesuatu yang lebih dari sekadar persahabatan. Alana, yang selalu hidup dalam kesendirian, menemukan kebahagiaan dalam kehadiran Kaelan, sementara Kaelan merasakan harapan baru di dunia yang penuh dengan keajaiban ini.\r\n\r\nSetiap langkah membawa mereka lebih dekat, tidak hanya kepada artefak yang mereka cari, tetapi juga kepada satu sama lain. Malam-malam mereka diisi dengan percakapan yang hangat di sekitar api unggun, berbagi cerita dan mimpi yang selama ini terpendam. Di tengah hutan, di bawah langit yang dipenuhi bintang, Kaelan dan Alana saling mengakui perasaan mereka.\r\n\r\nNamun, cinta mereka diuji ketika kutukan Kaelan mulai menunjukkan efeknya. Kekuatan gelap dari kutukan tersebut mulai memburu mereka, berusaha menghentikan mereka sebelum mereka bisa menemukan Cahaya Kehidupan. Kaelan mulai merasa dirinya melemah, dan Alana menyadari bahwa waktu mereka hampir habis.\r\n\r\nDi saat-saat terakhir mereka, Alana menemukan lokasi Cahaya Kehidupan—sebuah bunga yang bersinar terang di puncak tebing yang tinggi. Dengan sisa kekuatannya, Kaelan memanjat tebing tersebut dengan bantuan sihir Alana. Ketika mereka mencapai puncak, mereka menyadari bahwa hanya cinta sejati yang bisa memetik bunga tersebut.\r\n\r\nDengan hati yang dipenuhi cinta dan keberanian, mereka memetik bunga itu bersama. Cahaya dari bunga tersebut memancar terang, mematahkan kutukan Kaelan dan menyatukan dunia manusia dan dunia magis untuk selamanya.\r\n\r\nSetelah kutukan itu hilang, Kaelan dan Alana kembali ke dunia manusia, di mana mereka disambut dengan penuh suka cita. Cinta mereka telah mengubah dua dunia dan membawa kedamaian yang telah lama diidamkan. Kaelan dinobatkan sebagai raja, dan Alana menjadi ratu yang dihormati di kedua dunia.\r\n\r\nMereka memerintah dengan bijaksana, menjaga keseimbangan antara dunia manusia dan dunia magis. Cinta mereka menjadi legenda, sebuah cerita tentang bagaimana kekuatan cinta bisa mengatasi segala rintangan, bahkan yang berasal dari dunia yang berbeda.\r\n\r\nDi istana mereka yang megah, di tengah-tengah taman yang dipenuhi bunga-bunga ajaib, Kaelan dan Alana hidup bahagia selamanya, membawa cahaya baru ke dalam kehidupan mereka dan dunia di sekitar mereka.', '1724655576763.jpg', '2024-08-26', 3);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `story`
--
ALTER TABLE `story`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `story`
--
ALTER TABLE `story`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
