<template>
  <div>
    <el-card shadow="never">
      <div slot="header" class="clearfix">
        <el-tabs v-model="activeName" @tab-click="handleClick">
          <el-tab-pane label="用户列表" name="latest">
            <article
              v-for="(item, index) in userList"
              :key="index"
              class="media"
            >
              <div class="media-content">
                <div class="">
                  <p class="ellipsis is-ellipsis-1">
                    <el-tooltip
                      class="item"
                      effect="dark"
                      :content="item.username"
                      placement="top"
                    >
                      <router-link :to="{ params: { id: item.id } }">
                        <span class="is-size-6"
                          >用户名：{{ item.username }}&nbsp;&nbsp;</span
                        ><br />
                        <span class="is-size-6"
                          >邮箱：{{ item.email }}&nbsp;&nbsp;</span
                        ><br />
                        <span class="is-size-6">密码：{{ item.password }}</span>
                        <b-input v-model="item.password" />
                        <b-button type="primary" @click="changepwd()"
                          >重置密码</b-button
                        >
                      </router-link>
                    </el-tooltip>
                  </p>
                </div>
                <nav class="level has-text-grey is-mobile is-size-7 mt-2">
                  <div class="level-left"></div>
                </nav>
              </div>
              <div class="media-right" />
            </article>
          </el-tab-pane>
        </el-tabs>
      </div>

      <!--分页-->
      <pagination
        v-show="page.total > 0"
        :total="page.total"
        :page.sync="page.current"
        :limit.sync="page.size"
        @pagination="init"
      />
    </el-card>
  </div>
</template>

<script>
import { getUserList } from "@/api/post";
import Pagination from "@/components/Pagination";
import { update } from "@/api/user";

export default {
  name: "TopicList",
  components: { Pagination },
  data() {
    return {
      activeName: "latest",
      userList: [],
      page: {
        current: 1,
        size: 10,
        total: 0,
        tab: "latest",
      },
      item: {
        id: "",
        username: "",
        alias: "",
        bio: "",
        email: "",
        avatar: "",
        password: "",
      },
    };
  },
  created() {
    this.init(this.tab);
  },
  methods: {
    init(tab) {
      getUserList(this.page.current, this.page.size, tab).then((response) => {
        const { data } = response;
        this.page.current = data.current;
        this.page.total = data.total;
        this.page.size = data.size;
        this.userList = data.records;
      });
    },
    //
    changepwd() {
      console.log(this.item);
      update(this.item).then((res) => {
        this.$message.success("密码重置成功");
      });
    },
  },
};
</script>

<style scoped>
</style>
