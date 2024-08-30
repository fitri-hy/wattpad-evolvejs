-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Agu 2024 pada 05.11
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
-- Struktur dari tabel `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `id_story` int(11) NOT NULL,
  `comment_name` varchar(100) NOT NULL,
  `comment_email` varchar(100) NOT NULL,
  `comment_text` text NOT NULL,
  `comment_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `comment`
--

INSERT INTO `comment` (`comment_id`, `id_story`, `comment_name`, `comment_email`, `comment_text`, `comment_date`) VALUES
(1, 1, 'Bagas Setiaji', 'bagas@gmail.com', 'Keren ceritanya sangat menarik dan seru.', '2024-08-28'),
(2, 5, 'Asep Maulana', 'asep-m@gmail.com', 'Menarik sekali ceritanya.', '2024-08-28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `site_title` varchar(100) NOT NULL,
  `site_tagline` varchar(150) NOT NULL,
  `site_desc` text NOT NULL,
  `site_keyword` text NOT NULL,
  `site_logo` varchar(200) NOT NULL,
  `site_favicon` varchar(200) NOT NULL,
  `site_og` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `site_title`, `site_tagline`, `site_desc`, `site_keyword`, `site_logo`, `site_favicon`, `site_og`) VALUES
(1, 'R-Stories', 'Tempat Baca Cerita Original', 'Rumah bagi 97 juta orang yang menghabiskan lebih dari 26 miliar menit sebulan untuk terlibat dalam cerita orisinal, R-Stories telah mendemokratisasi cara bercerita untuk generasi baru penulis Gen Z yang beragam dan penggemarnya. ', 'stories, cerita, wattpad, dongeng, cerpen', '1724985171231.png', '1724985171235.png', '1724985171237.jpg');

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
(2, 'Cahaya di Antara Dua Dunia', 'Di sebuah negeri yang terlupakan oleh waktu, hiduplah seorang penyihir muda bernama Alana. Alana adalah penjaga hutan magis, tempat di mana keajaiban dan misteri hidup berdampingan. Dengan rambut hitam panjang yang bersinar seperti malam dan mata hijau seperti zamrud, Alana memiliki kekuatan untuk berkomunikasi dengan alam dan menjaga keseimbangan di dunia magis.\r\n\r\nSuatu hari, saat fajar pertama muncul, Alana merasakan getaran aneh di dalam hutan. Dia mengikuti instingnya dan menemukan seorang pria tergeletak tak sadarkan diri di tepi danau kristal. Pria itu tampak asing, dengan pakaian yang tidak pernah dilihat Alana sebelumnya, dan seberkas cahaya lembut mengelilingi tubuhnya.\r\n\r\nAlana merasakan ikatan yang kuat dan aneh dengan pria tersebut. Tanpa ragu, dia menggunakan sihirnya untuk menyembuhkan luka-luka pria itu. Saat pria itu terbangun, Alana terkejut melihat bahwa matanya berwarna biru cerah, seperti langit di atas hutan. Pria itu memperkenalkan dirinya sebagai Kaelan, seorang pangeran dari kerajaan manusia di dunia lain yang terpisah dari dunia magis oleh tabir misterius.\r\n\r\nKaelan menceritakan bahwa dia adalah pewaris takhta yang terkutuk. Kutukan tersebut membuatnya terpisah dari dunia manusia dan terdampar di dunia magis. Satu-satunya cara untuk mematahkan kutukan itu adalah dengan menemukan \"Cahaya Kehidupan,\" sebuah artefak kuno yang tersembunyi di dalam hutan magis yang hanya bisa ditemukan oleh hati yang tulus dan penuh cinta.\r\n\r\nAlana merasa tergerak oleh penderitaan Kaelan dan memutuskan untuk membantunya mencari Cahaya Kehidupan. Mereka mulai menjelajahi hutan bersama, menghadapi berbagai rintangan dan teka-teki yang menantang. Selama perjalanan ini, keduanya mulai merasakan sesuatu yang lebih dari sekadar persahabatan. Alana, yang selalu hidup dalam kesendirian, menemukan kebahagiaan dalam kehadiran Kaelan, sementara Kaelan merasakan harapan baru di dunia yang penuh dengan keajaiban ini.\r\n\r\nSetiap langkah membawa mereka lebih dekat, tidak hanya kepada artefak yang mereka cari, tetapi juga kepada satu sama lain. Malam-malam mereka diisi dengan percakapan yang hangat di sekitar api unggun, berbagi cerita dan mimpi yang selama ini terpendam. Di tengah hutan, di bawah langit yang dipenuhi bintang, Kaelan dan Alana saling mengakui perasaan mereka.\r\n\r\nNamun, cinta mereka diuji ketika kutukan Kaelan mulai menunjukkan efeknya. Kekuatan gelap dari kutukan tersebut mulai memburu mereka, berusaha menghentikan mereka sebelum mereka bisa menemukan Cahaya Kehidupan. Kaelan mulai merasa dirinya melemah, dan Alana menyadari bahwa waktu mereka hampir habis.\r\n\r\nDi saat-saat terakhir mereka, Alana menemukan lokasi Cahaya Kehidupan—sebuah bunga yang bersinar terang di puncak tebing yang tinggi. Dengan sisa kekuatannya, Kaelan memanjat tebing tersebut dengan bantuan sihir Alana. Ketika mereka mencapai puncak, mereka menyadari bahwa hanya cinta sejati yang bisa memetik bunga tersebut.\r\n\r\nDengan hati yang dipenuhi cinta dan keberanian, mereka memetik bunga itu bersama. Cahaya dari bunga tersebut memancar terang, mematahkan kutukan Kaelan dan menyatukan dunia manusia dan dunia magis untuk selamanya.\r\n\r\nSetelah kutukan itu hilang, Kaelan dan Alana kembali ke dunia manusia, di mana mereka disambut dengan penuh suka cita. Cinta mereka telah mengubah dua dunia dan membawa kedamaian yang telah lama diidamkan. Kaelan dinobatkan sebagai raja, dan Alana menjadi ratu yang dihormati di kedua dunia.\r\n\r\nMereka memerintah dengan bijaksana, menjaga keseimbangan antara dunia manusia dan dunia magis. Cinta mereka menjadi legenda, sebuah cerita tentang bagaimana kekuatan cinta bisa mengatasi segala rintangan, bahkan yang berasal dari dunia yang berbeda.\r\n\r\nDi istana mereka yang megah, di tengah-tengah taman yang dipenuhi bunga-bunga ajaib, Kaelan dan Alana hidup bahagia selamanya, membawa cahaya baru ke dalam kehidupan mereka dan dunia di sekitar mereka.', '1724655576763.jpg', '2024-08-26', 3),
(4, 'Bayangan di Rumah Tua', '<p>Di sebuah desa kecil yang jauh dari hiruk pikuk kota, berdirilah sebuah rumah tua yang sudah lama tidak berpenghuni. Rumah itu terlihat menyeramkan, dengan dindingnya yang mulai retak, jendela yang pecah, dan atap yang nyaris runtuh. Penduduk desa sering membicarakan rumah itu dengan nada berbisik, seolah takut membangkitkan sesuatu yang tidak ingin mereka temui.</p><p>Rumor mengatakan bahwa rumah tua itu pernah dihuni oleh seorang keluarga kaya yang tiba-tiba menghilang tanpa jejak pada suatu malam yang dingin. Sejak saat itu, rumah tersebut menjadi kosong dan tak seorang pun berani mendekatinya, terutama setelah beberapa penduduk desa mengaku melihat bayangan aneh yang bergerak di dalam rumah pada malam hari.</p><p>Tiba suatu hari, seorang penulis muda bernama Andi datang ke desa itu. Ia sedang mencari inspirasi untuk novel barunya, dan cerita tentang rumah tua itu menarik perhatiannya. Meski penduduk desa memperingatkannya untuk tidak mendekati rumah tersebut, rasa penasaran Andi terlalu kuat untuk diabaikan.</p><p>Pada suatu malam yang sunyi, Andi memutuskan untuk mengunjungi rumah tua itu. Dengan senter di tangan, ia perlahan mendekati pintu depan yang berderit saat didorongnya. Di dalam, suasana rumah terasa sangat dingin, meski tak ada angin yang berhembus. Bau lembab menyengat hidungnya, dan lantai kayu berderit setiap kali ia melangkah.</p><p>Andi mulai menyusuri setiap ruangan, berharap menemukan petunjuk tentang apa yang sebenarnya terjadi pada keluarga yang pernah tinggal di sana. Namun, yang ia temukan hanyalah perabotan tua yang tertutup debu dan foto-foto usang yang sudah hampir tak dikenali lagi.</p><p>Ketika Andi mencapai lantai dua, ia merasakan sesuatu yang aneh. Suasana tiba-tiba berubah, dan jantungnya berdegup lebih cepat. Dari sudut matanya, ia melihat bayangan bergerak di salah satu ruangan. Dengan gugup, ia mendekati ruangan itu dan menemukan sebuah cermin besar yang retak di tengahnya. Di cermin itulah, bayangan itu terlihat sekilas, seperti ada seseorang yang berdiri di belakangnya.</p><p>Andi segera berbalik, namun tak ada siapa pun di sana. Ketakutannya semakin menjadi ketika ia mendengar suara langkah kaki di belakangnya. Ia berlari keluar dari ruangan itu, turun ke lantai satu, dan segera menuju pintu keluar. Namun, saat ia hampir mencapai pintu, ia merasakan tangan dingin yang mencengkeram bahunya.</p><p>Ia berbalik dan melihat seorang wanita berpakaian putih berdiri di hadapannya. Wajah wanita itu pucat dengan mata kosong yang menatap tajam ke arah Andi. \"Tolong, keluarkan aku dari sini,\" bisik wanita itu dengan suara yang hampir tak terdengar.</p><p>Andi berusaha berlari, namun tubuhnya seakan membeku. Wanita itu mendekat, dan Andi merasakan hawa dingin yang menusuk. Dengan sisa tenaga yang ia miliki, Andi menggerakkan kakinya dan berlari keluar dari rumah itu. Ia tak berhenti berlari hingga tiba di rumah penginapannya.</p><p>Malam itu, Andi tidak bisa tidur. Setiap kali ia menutup mata, bayangan wanita itu muncul di benaknya. Ia merasa seperti diawasi, dan suara-suara aneh terdengar di seluruh kamar. Ketika pagi tiba, Andi memutuskan untuk meninggalkan desa itu dan tak pernah kembali.</p><p>Namun, sejak saat itu, hidup Andi tidak pernah sama lagi. Di manapun ia berada, ia selalu merasa diikuti oleh bayangan wanita itu. Cerita yang seharusnya menjadi inspirasi novel barunya, kini menjadi mimpi buruk yang menghantui setiap langkahnya.</p><p><strong>Epilog:</strong></p><p>Beberapa tahun kemudian, seorang penulis muda lainnya tiba di desa itu, tertarik dengan cerita rumah tua yang pernah menjadi bahan pembicaraan penduduk. Namun, ketika ia mencari tahu tentang Andi, tak seorang pun penduduk desa yang tahu apa yang terjadi padanya setelah malam itu. Yang mereka tahu hanyalah bahwa Andi, seperti keluarga sebelumnya, menghilang tanpa jejak.</p><p>Dan rumah tua itu? Bayangannya tetap ada, menunggu pengunjung berikutnya yang cukup berani atau bodoh untuk memasuki pintunya.</p>', '1724807918764.webp', '2024-08-28', 4),
(5, 'Di Balik Senja', '<p>Senja selalu menjadi waktu favorit Dara, saat langit berubah warna menjadi jingga dan matahari perlahan tenggelam di balik cakrawala. Bagi Dara, senja adalah momen yang sempurna untuk merenung, mengingat kenangan masa lalu, dan berharap akan masa depan. Namun, ia tak pernah menyangka bahwa senja kali ini akan mengubah hidupnya selamanya.</p><p>Dara adalah seorang fotografer yang tengah mencari inspirasi untuk pameran fotonya yang akan datang. Ia sering berkeliling kota, mencari tempat-tempat indah untuk diabadikan. Suatu sore, ia menemukan sebuah kafe kecil di pinggir kota yang menawarkan pemandangan senja yang menakjubkan. Kafe itu terlihat sederhana, namun suasananya hangat dan nyaman. Tanpa berpikir panjang, Dara memutuskan untuk masuk.</p><p>Di dalam kafe, Dara duduk di dekat jendela besar yang menghadap langsung ke arah matahari terbenam. Ia mengeluarkan kamera dari tasnya dan mulai memotret pemandangan senja yang memukau. Saat itulah ia mendengar suara lembut dari meja sebelah.</p><p>\"Senja selalu indah, ya?\"</p><p>Dara menoleh dan melihat seorang pria duduk di meja sebelahnya. Wajahnya teduh, dengan senyum yang ramah. Pria itu tampak seumuran dengannya, dengan rambut sedikit berantakan dan mata cokelat yang hangat. Dara mengangguk sambil tersenyum.</p><p>\"Iya, aku selalu suka momen ini,\" jawab Dara.</p><p>Pria itu memperkenalkan dirinya sebagai Arga, seorang penulis yang sering datang ke kafe itu untuk mencari inspirasi. Percakapan mereka pun mengalir begitu saja, seolah-olah mereka sudah lama saling mengenal. Arga bercerita tentang novel yang sedang ia tulis, sementara Dara berbagi tentang proyek fotografi yang sedang ia kerjakan. Mereka tertawa, berbagi cerita, dan tanpa sadar waktu berlalu begitu cepat.</p><p>Sejak pertemuan itu, Dara dan Arga menjadi semakin dekat. Mereka sering bertemu di kafe yang sama, menikmati senja bersama sambil berbagi kisah dan mimpi. Dara merasa nyaman berada di dekat Arga, dan begitu pula sebaliknya. Keduanya saling menginspirasi, saling mendukung dalam pekerjaan mereka. Hubungan mereka berkembang secara alami, dari pertemanan menjadi sesuatu yang lebih dalam.</p><p>Namun, di balik kebahagiaan yang mereka rasakan, ada sebuah rahasia yang disimpan rapat oleh Arga. Setiap kali senja tiba, Arga selalu tampak sedikit murung, meski ia berusaha menutupinya dengan senyum. Dara merasa ada sesuatu yang ingin dikatakan Arga, namun pria itu selalu mengalihkan pembicaraan setiap kali Dara mencoba mengorek lebih dalam.</p><p>Suatu malam, saat mereka duduk di tepi pantai menikmati pemandangan laut di bawah sinar bulan, Arga akhirnya membuka dirinya. Dengan suara pelan, ia menceritakan tentang masa lalunya yang kelam. Arga pernah mengalami kehilangan besar dalam hidupnya. Tunangannya, yang sangat ia cintai, meninggal dunia beberapa tahun lalu dalam sebuah kecelakaan tragis. Sejak saat itu, Arga merasa sulit untuk membuka hatinya kembali.</p><p>\"Aku pikir aku tidak akan pernah bisa mencintai lagi,\" ujar Arga dengan mata yang berkaca-kaca. \"Tapi sejak bertemu denganmu, Dara, aku merasa ada harapan. Tapi aku juga takut... takut kehilangan lagi.\"</p><p>Dara terdiam sejenak, merasakan kesedihan yang mendalam di balik kata-kata Arga. Ia meraih tangan Arga dan menggenggamnya erat.</p><p>\"Kehilangan adalah bagian dari hidup, Arga. Tapi bukan berarti kita harus berhenti hidup. Kamu berhak untuk bahagia, dan aku akan selalu ada di sini, bersama kamu, apapun yang terjadi.\"</p><p>Malam itu, di bawah langit berbintang, Arga merasa beban di hatinya sedikit terangkat. Untuk pertama kalinya setelah sekian lama, ia merasa ada harapan untuk masa depan. Sejak malam itu, hubungan mereka semakin erat. Arga mulai belajar untuk melepaskan masa lalunya, sementara Dara dengan sabar mendukungnya di setiap langkah.</p><p>Seiring berjalannya waktu, cinta mereka tumbuh semakin kuat. Dara dan Arga saling melengkapi, saling menguatkan. Mereka menemukan kebahagiaan dalam hal-hal kecil, seperti menikmati senja bersama atau berjalan-jalan di pantai. Dan ketika Arga akhirnya berhasil menyelesaikan novelnya, ia mendedikasikannya untuk Dara, wanita yang telah mengembalikan warna dalam hidupnya.</p><p><strong>Epilog:</strong></p><p>Pada hari pameran foto Dara, Arga berada di barisan depan, menyaksikan karya-karya indah yang terinspirasi dari senja yang mereka nikmati bersama. Di salah satu foto, ada bayangan mereka berdua yang tampak bahagia, berdiri di tepi pantai dengan latar belakang senja. Foto itu diberi judul \"Di Balik Senja,\" sebagai simbol dari cinta mereka yang lahir di antara keindahan dan keheningan senja.</p><p>Kini, setiap kali senja tiba, Dara dan Arga tak lagi merasakan kesedihan, melainkan harapan dan cinta yang tak akan pernah pudar, seperti senja yang selalu kembali setiap hari, membawa keindahan dan janji akan hari esok yang lebih baik.</p>', '1724808031982.JPG', '2024-08-28', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
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
-- AUTO_INCREMENT untuk tabel `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `story`
--
ALTER TABLE `story`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
