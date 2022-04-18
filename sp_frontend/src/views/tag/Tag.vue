<template>
  <div id="tag" class="columns">
    <div class="column is-three-quarters">
      <el-card class="box-card" shadow="never">
        <div slot="header" class="">
          🔍 检索到
          <span class="has-text-info">{{ topics.length }}</span> 篇有关
          <span class="has-text-info">{{ this.$route.params.name }}</span>
          的话题
        </div>

        <div class="text item">
          <article
            v-for="(item, index) in topics"
            :key="index"
            class="media mt-3"
          >
            <div class="media-content">
              <div class="content">
                <el-tooltip
                  class="item"
                  effect="dark"
                  :content="item.title"
                  placement="top"
                >
                  <router-link
                    :to="{ name: 'post-detail', params: { id: item.id } }"
                  >
                    {{ item.title }}
                  </router-link>
                </el-tooltip>
              </div>

              <nav class="level has-text-grey is-size-7">
                <div class="level-left"></div>
              </nav>
            </div>
          </article>
        </div>
      </el-card>
    </div>

  </div>
</template>

<script>
import { getTopicsByTag } from "@/api/tag";

export default {
  name: "Tag",
  data() {
    return {
      topics: [],
      tags: [],
      paramMap: {
        name: this.$route.params.name,
        page: 1,
        size: 10,
      },
    };
  },
  created() {
    this.fetchList();
  },
  methods: {
    fetchList: function () {
      getTopicsByTag(this.paramMap).then((response) => {
        console.log(response);
        this.topics = response.data.topics.records;
        this.tags = response.data.hotTags.records;
      });
    },
  },
};
</script>

<style scoped>
#tag {
  min-height: 500px;
}
</style>
