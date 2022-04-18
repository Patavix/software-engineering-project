<template>
  <el-card class="box-card" shadow="never">
    <div slot="header">
      <span>❤️温馨提醒</span>
    </div>
    <div>
      <div class="has-text-left block">请大家友善，理智地评论</div>
      <div class="has-text-right mt-5 block">——Super Professor团队</div>
    </div>
  </el-card>
</template>

<script>
import { getTodayTip } from "@/api/tip";

export default {
  name: "Tip",
  data() {
    return {
      tip: {},
    };
  },
  created() {
    this.fetchTodayTip();
  },
  methods: {
    fetchTodayTip() {
      getTodayTip().then((response) => {
        const { data } = response;
        this.tip = data;
      });
    },
  },
};
</script>

<style scoped>
</style>
