<div class="main-banner header-text">
    <div class="container-fluid">
        <div class="owl-banner owl-carousel">
            <?php

            $sql = "SELECT post.*,category.name as categoryName,admin.name as author FROM post INNER JOIN category ON post.category_id=category.id INNER JOIN admin ON post.admin_id=admin.id WHERE post.is_published='Published' ORDER BY post.id DESC LIMIT 9";
            $query = $conn->query($sql);
            $posts = $query->fetchAll(PDO::FETCH_OBJ);
            if ($posts) {
                foreach ($posts as $post) { ?>
                    <div class="item">
                        <img src="admin/<?php echo $post->image;?>" alt="">
                        <div class="item-content">
                            <div class="main-content">
                                <div class="meta-category">
                                    <span><?php echo $post->categoryName;?></span>
                                </div>
                                <a href="post-details.php?slug=<?php echo $post->slug; ?>">
                                    <h4><?php echo $post->title;?></h4>
                                </a>
                                <ul class="post-info">
                                    <li><a href="#"><?php echo $post->author;?></a></li>
                                    <li><a href="#">
                                    <?php
                                        $dateCreate = date_create( $post->created_at);

                                        echo $dateCreate->format('M d, Y H:i:s');
                                        
                                        ?>
                                    </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

            <?php     }
            }

            ?>


        </div>
    </div>
</div>