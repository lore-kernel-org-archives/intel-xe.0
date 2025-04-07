Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23956C3601E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 13:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D254D10E45E;
	Mon,  7 Apr 2025 13:05:12 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B04B10E45A
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 13:05:07 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [CI 11/14] drm/xe: Add GGTT updates to migration engine
Date: Mon,  7 Apr 2025 15:04:46 +0200
Message-ID: <20250407130449.1010470-12-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407130449.1010470-1-dev@lankhorst.se>
References: <20250407130449.1010470-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Allow for pipelining of GGTT updates, as pinning huge buffers to GGTT
might end up being really slow.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  2 +
 drivers/gpu/drm/xe/tests/xe_migrate.c         | 74 ++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.c               | 87 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h               | 12 +++
 4 files changed, 175 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index eba582058d550..11477ef8fd241 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -48,6 +48,8 @@
 #define   MI_LRI_FORCE_POSTED		REG_BIT(12)
 #define   MI_LRI_LEN(x)			(((x) & 0xff) + 1)
 
+#define MI_UPDATE_GTT			__MI_INSTR(0x23)
+
 #define MI_FLUSH_DW			__MI_INSTR(0x26)
 #define   MI_FLUSH_DW_PROTECTED_MEM_EN	REG_BIT(22)
 #define   MI_FLUSH_DW_STORE_INDEX	REG_BIT(21)
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index d5fe0ea889ad8..d6770ed4126c1 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -365,6 +365,79 @@ static void xe_migrate_sanity_kunit(struct kunit *test)
 	migrate_test_run_device(xe);
 }
 
+static void update_gtt(void *arg, u32 ggtt_offset, u32 local_offset, u64 *pte, u32 num_pte)
+{
+	while (num_pte--) {
+		*pte++ = 0x1234567890000abcULL | local_offset;
+
+		local_offset += XE_PAGE_SIZE;
+	}
+}
+
+static void xe_migrate_test_ggtt(struct kunit *test,
+				 struct xe_migrate *m,
+				 struct xe_ggtt *ggtt)
+{
+	struct xe_ggtt_node *node = xe_ggtt_node_init(ggtt);
+	struct dma_fence *fence;
+	u32 i;
+	int ret;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, node);
+	if (IS_ERR(node))
+		return;
+
+	ret = xe_ggtt_node_insert(node, SZ_32M, XE_PAGE_SIZE);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	if (ret)
+		goto out;
+
+	fence = xe_migrate_update_gtt(m, update_gtt, NULL, node->base.start, node->base.size / XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fence);
+	if (IS_ERR(fence))
+		goto out;
+
+	dma_fence_wait(fence, false);
+
+	for (i = 0; i < node->base.size; i += SZ_1M) {
+		u64 pte = xe_ggtt_read_pte(ggtt, node->base.start + i);
+		u64 expected = 0x1234567890000abc | i;
+
+		check(pte, expected, "GGTT update doesn't match expected update", test);
+
+	}
+	dma_fence_put(fence);
+
+out:
+	xe_ggtt_node_remove(node, false);
+}
+
+static void xe_migrate_test_ggtt_device(struct kunit *test, struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	int id;
+
+	xe_pm_runtime_get(xe);
+
+	for_each_tile(tile, xe, id) {
+		struct xe_migrate *m = tile->migrate;
+
+		kunit_info(test, "Testing tile id %d.\n", id);
+		xe_vm_lock(m->q->vm, false);
+		xe_migrate_test_ggtt(test, m, tile->mem.ggtt);
+		xe_vm_unlock(m->q->vm);
+	}
+
+	xe_pm_runtime_put(xe);
+}
+
+static void xe_migrate_ggtt_kunit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	xe_migrate_test_ggtt_device(test, xe);
+}
+
 static struct dma_fence *blt_copy(struct xe_tile *tile,
 				  struct xe_bo *src_bo, struct xe_bo *dst_bo,
 				  bool copy_only_ccs, const char *str, struct kunit *test)
@@ -773,6 +846,7 @@ static void xe_validate_ccs_kunit(struct kunit *test)
 
 static struct kunit_case xe_migrate_tests[] = {
 	KUNIT_CASE_PARAM(xe_migrate_sanity_kunit, xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM(xe_migrate_ggtt_kunit, xe_pci_live_device_gen_param),
 	KUNIT_CASE_PARAM(xe_validate_ccs_kunit, xe_pci_live_device_gen_param),
 	{}
 };
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c1277d599a11d..cf35ba0487d51 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1723,6 +1723,93 @@ struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
 
 #endif
 
+struct dma_fence *xe_migrate_update_gtt(struct xe_migrate *m,
+					xe_migrate_update_gtt_cb set_ptes_cb,
+					void *arg,
+					u32 ggtt_offset, u32 num_pte)
+{
+	struct xe_gt *gt = m->tile->primary_gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct dma_fence *fence = NULL;
+	u32 local_offset = 0;
+	int err;
+
+	while (num_pte) {
+		struct xe_sched_job *job;
+		struct xe_bb *bb;
+		u32 batch_size, update_idx;
+		bool usm = xe->info.has_usm;
+		/*
+		 * batch up to 33 MI_UPDATE_GTT commands,
+		 * this is enough to map a 64MiB 3840x2160x8 buffer
+		 * with the size ending up just above 32kB.
+		 */
+		u32 avail_ptes = min(num_pte, 33 * 511);
+		num_pte -= avail_ptes;
+
+		/* 2 * MI_BATCH_BUFFER_END + align + #PTEs + MI_UPDATE_GTT */
+		batch_size = 4 + 2 * avail_ptes + 2 * DIV_ROUND_UP(avail_ptes, 511);
+
+		bb = xe_bb_new(gt, batch_size, usm);
+		if (IS_ERR(bb)) {
+			err = PTR_ERR(bb);
+			goto err_sync;
+		}
+
+		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+		bb->len++; /* align to u64 */
+		update_idx = bb->len;
+		while (avail_ptes) {
+			u32 batched_ptes = min(avail_ptes, 511);
+			bb->cs[bb->len++] = MI_UPDATE_GTT | (2 * batched_ptes);
+			bb->cs[bb->len++] = ggtt_offset + local_offset;
+
+			set_ptes_cb(arg, ggtt_offset, local_offset, (u64 *)&bb->cs[bb->len], batched_ptes);
+			bb->len += 2 * batched_ptes;
+
+			local_offset += XE_PAGE_SIZE * batched_ptes;
+			avail_ptes -= batched_ptes;
+		}
+
+		job = xe_bb_create_migration_job(m->q, bb,
+						 xe_migrate_batch_base(m, usm),
+						 update_idx);
+		if (IS_ERR(job)) {
+			err = PTR_ERR(job);
+			goto err;
+		}
+
+		xe_sched_job_add_migrate_flush(job, MI_FLUSH_DW_CCS);
+
+		mutex_lock(&m->job_mutex);
+		xe_sched_job_arm(job);
+		dma_fence_put(fence);
+		fence = dma_fence_get(&job->drm.s_fence->finished);
+		xe_sched_job_push(job);
+
+		dma_fence_put(m->fence);
+		m->fence = dma_fence_get(fence);
+
+		mutex_unlock(&m->job_mutex);
+
+		xe_bb_free(bb, fence);
+		continue;
+
+err:
+		xe_bb_free(bb, NULL);
+err_sync:
+		/* Sync partial copies if any. FIXME: job_mutex? */
+		if (fence) {
+			dma_fence_wait(fence, false);
+			dma_fence_put(fence);
+		}
+
+		return ERR_PTR(err);
+	}
+
+	return fence;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_migrate.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 6ff9a963425c1..e03f28b7a021d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -130,4 +130,16 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 void xe_migrate_wait(struct xe_migrate *m);
 
 struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
+
+typedef void (*xe_migrate_update_gtt_cb)(void *arg,
+					 u32 ggtt_offset,
+					 u32 local_offset,
+					 u64 *pte,
+					 u32 num_pte);
+
+struct dma_fence *xe_migrate_update_gtt(struct xe_migrate *m,
+					xe_migrate_update_gtt_cb set_ptes_cb,
+					void *arg,
+					u32 ggtt_offset, u32 num_pte);
+
 #endif
-- 
2.45.2

