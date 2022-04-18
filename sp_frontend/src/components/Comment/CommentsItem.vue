<template>
  <article class="media">
    <figure class="media-left image is-48x48">
      <img
        :src="`https://cn.gravatar.com/avatar/${comment.userId}?s=164&d=monsterid`"
      />
    </figure>
    <div class="media-content">
      <div class="content">
        <p>
          <strong>{{ comment.username }}</strong>
          <small class="ml-2">{{ comment.createTime | date }}</small>
          <br />
          {{ comment.content }}
        </p>
      </div>
      <nav class="level is-mobile">
        <div class="level-left">
          <a class="level-item">
            <span class="icon is-small"><i class="fas fa-thumbs-up"></i></span>
          </a>
          <a class="level-item">
            <span class="icon is-small">
              <i class="fas fa-thumbs-down"></i
            ></span>
          </a>
        </div>
      </nav>
    </div>
  </article>
</template>

<script>
export default {
  name: "LvCommentsItem",
  props: {
    comment: {
      type: Object,
      required: true,
    },
  },
};
</script>

<style scoped>
</style>
