<template>
  <el-card class="box-card" shadow="never">
    <div slot="header">
      <span>🥂 推广</span>
    </div>
    <div>
      <p class="block">
        广告位出租
      </p>
    </div>
  </el-card>
</template>

<script>
import { getList } from "@/api/promote";

export default {
  name: "Promotion",
  data() {
    return {
      list: [],
    };
  },
  created() {
    this.fetchList();
  },
  methods: {
    fetchList() {
      getList().then((response) => {
        const { data } = response;
        this.list = data;
      });
    },
  },
};
</script>

<style scoped>
</style>
