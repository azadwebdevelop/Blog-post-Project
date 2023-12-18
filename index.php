<!DOCTYPE html>
<html lang="en">

<head>

  <?php include "layout/head.php" ?>

</head>

<body>

  <!-- ***** Preloader Start ***** -->
  <!-- <div id="preloader">
    <div class="jumper">
      <div></div>
      <div></div>
      <div></div>
    </div>
  </div> -->
  <!-- ***** Preloader End ***** -->

  <!-- Header start-->
  <?php include "layout/header.php" ?>
  <!-- Header end -->
  

  <!-- Page Content -->
  <!-- Banner Starts Here -->
  <?php include "slider.php" ?>
  <!-- Banner Ends Here -->

  <section class="blog-posts">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
          <div class="all-blog-posts">
            <div class="row">
              <?php

              $sql = "SELECT post.*,category.name as categoryName,admin.name as author FROM post INNER JOIN category ON post.category_id=category.id INNER JOIN admin ON post.admin_id=admin.id WHERE post.is_published='Published' ORDER BY post.id DESC LIMIT 3";
              $query = $conn->query($sql);
              $posts = $query->fetchAll(PDO::FETCH_OBJ);
              if ($posts) {
                foreach ($posts as $post) { ?>
                  <div class="col-lg-12">
                    <div class="blog-post">
                      <div class="blog-thumb">
                        <img src="admin/<?php echo $post->image?>" alt="">
                      </div>
                      <div class="down-content">
                        <span><?php echo $post->categoryName; ?></span>
                        <a href="post-details.php?slug=<?php echo $post->slug; ?>">
                          <h4><?php echo $post->title; ?></h4>
                        </a>
                        <ul class="post-info">
                          <li><a href="#"><?php echo $post->author; ?></a></li>
                          <li><a href="#">
                            <?php
                           $dateCreate = date_create( $post->created_at);

                           echo $dateCreate->format('M d, Y');
                           
                           ?></a></li>
                        </ul>
                        <p>
                        <?php echo html_entity_decode( str_limit ($post->description,800)); ?>
                        </p>
                        <div class="post-options">
                          <div class="row">
                            <div class="col-6">
                              <ul class="post-tags">
                                <li><i class="fa fa-tags"></i></li>
                                <?php
                            $sql = "SELECT tag.* FROM tag INNER JOIN post_tag ON tag.id = post_tag.tag_id WHERE post_id=:postId";
                            $stmt = $conn->prepare($sql);
                            $stmt->bindParam(':postId', $post->id, PDO::PARAM_INT);
                            $stmt->execute();
                            $tags = $stmt->fetchAll(PDO::FETCH_OBJ);
                            if ($tags) {
                                foreach ($tags as $key => $tag) { ?>
                                   
                                    <li><a href="tag-post.php?slug=<?php echo $tag->slug; ?>"><?php echo $tag->name; ?></a>,</li>
                            <?php
                                }
                            }
                          
                            ?>
                               
                              
                              </ul>
                            </div>
                            <div class="col-6">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

              <?php
                }
              }
              ?>


              <div class="col-lg-12">
                <div class="main-button">
                  <a href="blog.html">View All Posts</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="sidebar">
            <?php include "layout/sidebar.php" ?>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- footer start -->
  <?php include "layout/footer.php" ?>

</body>

</html>