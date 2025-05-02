Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA07C3ABB6
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 09:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B0F10E8E7;
	Fri,  2 May 2025 09:35:31 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AABD10E8E4
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 09:35:24 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 4/4] drm/xe: Add migrate performance kunit test
Date: Fri,  2 May 2025 11:35:13 +0200
Message-ID: <20250502093514.510621-5-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250502093514.510621-1-dev@lankhorst.se>
References: <20250502093514.510621-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Ever since we added migration, we didn't have concrete numbers on how
performant our implementation is. We are currently writing pagetables,
flushing, then writing data and flushing again. Lets see what happens
when we fix this.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 235 ++++++++++++++++++++++++++
 1 file changed, 235 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 12a3318b1a5d5..d8992ba71281b 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -661,6 +661,128 @@ static struct xe_bo *migratable_bo_create_pin_map(struct kunit *test, struct xe_
 	return bo;
 }
 
+static bool handle_vm_fence(struct xe_device *xe, struct dma_fence *fence,
+			    struct kunit *test)
+{
+	bool ret;
+
+	if (!fence)
+		return false;
+
+	ret = sanity_fence_failed(xe, fence, "VM_BIND", test);
+	if (!IS_ERR(fence))
+		dma_fence_put(fence);
+	return ret;
+}
+
+#define BS_BO2BO MAX_PREEMPTDISABLE_TRANSFER
+
+static void write_bo2bo_copy(struct xe_tile *tile, struct xe_bo *batch,
+			     u64 src_ofs, u64 dst_ofs, u64 size)
+{
+	struct xe_bb bb = {
+		.cs = batch->vmap.vaddr,
+		.len = 0,
+	};
+
+	while (size) {
+		u64 block = min(size, BS_BO2BO);
+
+		emit_copy(tile->primary_gt, &bb, src_ofs, dst_ofs, block, SZ_32K);
+
+		src_ofs += block;
+		dst_ofs += block;
+		size -= block;
+	}
+	bb.cs[bb.len++] = MI_BATCH_BUFFER_END;
+	xe_gt_assert(tile->primary_gt, bb.len * 4 < batch->size);
+}
+
+static void compare_bo2bo(struct kunit *test,
+			  struct xe_tile *tile,
+			  struct xe_vm *vm,
+			  struct xe_exec_queue *q,
+			  struct xe_bo *batch_bo, u64 batch_ofs,
+			  struct xe_bo *src, u64 src_ofs,
+			  struct xe_bo *dst, u64 dst_ofs,
+			  const char *description)
+{
+	struct xe_device *xe = tile->xe;
+	s64 t_migrate = 0, t_job = 0;
+	int iter = 4;
+
+	for (int n = 0; n < iter; n++) {
+		struct xe_sched_job *job;
+		struct dma_fence *fence;
+		u64 delta;
+		ktime_t start;
+
+		start = ktime_get();
+		job = xe_sched_job_create(q, &batch_ofs);
+
+		write_bo2bo_copy(tile, batch_bo, src_ofs, dst_ofs, src->size);
+
+		xe_sched_job_arm(job);
+		fence = dma_fence_get(&job->drm.s_fence->finished);
+		xe_sched_job_push(job);
+
+		sanity_fence_failed(xe, fence, description, test);
+		if (IS_ERR(fence))
+			return;
+
+		dma_fence_put(fence);
+
+		delta = ktime_to_us(ktime_sub(ktime_get(), start));
+		drm_dbg(&xe->drm, "[%i] Job (%s) copy of %lu buffer took %llu µs\n", n, description, src->size >> 20, delta);
+		t_job += delta;
+
+		start = ktime_get();
+		fence = xe_migrate_copy(tile->migrate, src, dst, src->ttm.resource, dst->ttm.resource, false);
+		sanity_fence_failed(xe, fence, description, test);
+		if (IS_ERR(fence))
+			return;
+
+		dma_fence_put(fence);
+		delta = ktime_to_us(ktime_sub(ktime_get(), start));
+		drm_dbg(&xe->drm, "[%i] Job (%s) migration of %lu buffer took %llu µs\n", n, description, src->size >> 20, delta);
+		t_migrate += delta;
+
+		cond_resched();
+	}
+
+	drm_info(&xe->drm, "%s %lu MB buffer took on average %llu us for copy, %llu us for migrate\n", description, src->size >> 20, div_u64(t_job, iter), div_u64(t_migrate, iter));
+}
+
+static void performance_tile(struct xe_device *xe,
+			     struct xe_tile *tile,
+			     struct kunit *test,
+			     struct xe_vm *vm,
+			     struct xe_exec_queue *q,
+			     struct xe_bo *batch_bo, u64 batch_ofs,
+			     struct xe_bo *sys_bo, u64 sys_ofs,
+			     struct xe_bo *vram_bo, u64 vram_ofs,
+			     struct xe_bo *alt_bo, u64 alt_ofs)
+{
+	drm_dbg(&xe->drm, "Using %u block size for copy, %u for migrate\n",
+		BS_BO2BO, MAX_PREEMPTDISABLE_TRANSFER);
+
+	compare_bo2bo(test, tile, vm, q, batch_bo, batch_ofs,
+		      sys_bo, sys_ofs, vram_bo, vram_ofs,
+		      "sysmem -> vram");
+
+	compare_bo2bo(test, tile, vm, q, batch_bo, batch_ofs,
+		      vram_bo, vram_ofs, sys_bo, sys_ofs,
+		      "vram -> sysmem");
+
+	compare_bo2bo(test, tile, vm, q, batch_bo, batch_ofs,
+		      vram_bo, vram_ofs, alt_bo, alt_ofs,
+		      "vram -> vram");
+
+	compare_bo2bo(test, tile, vm, q, batch_bo, batch_ofs,
+		      sys_bo, sys_ofs, sys_bo, sys_ofs,
+		      "sysmem -> sysmem");
+}
+
 static void bo_unpin_map_user(struct xe_bo *bo)
 {
 	if (!bo->vm)
@@ -672,6 +794,116 @@ static void bo_unpin_map_user(struct xe_bo *bo)
 	xe_bo_put(bo);
 }
 
+static void performance_test_run_tile(struct xe_device *xe,
+				      struct xe_tile *tile,
+				      struct kunit *test)
+{
+	struct xe_bo *sys_bo, *vram_bo = NULL, *alt_bo = NULL, *batch_bo = NULL;
+	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
+	struct xe_vm *vm;
+	struct xe_exec_queue *q;
+	struct dma_fence *fence;
+	u64 size = ALIGN(tile->mem.vram.usable_size / 3, SZ_2M);
+	u64 block = ALIGN(size, SZ_1G);
+	bool failed = true;
+
+	vm = xe_vm_create(xe, XE_VM_FLAG_SET_TILE_ID(tile));
+	if (IS_ERR(vm))
+		goto out;
+
+	q = xe_migrate_create_queue(tile, vm);
+	if (IS_ERR(q))
+		goto free_vm;
+
+	xe_vm_lock(vm, false);
+
+	sys_bo = migratable_bo_create_pin_map(test, xe, vm, size, DRM_XE_GEM_CPU_CACHING_WC, XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS);
+	if (IS_ERR(sys_bo))
+		goto free_q;
+
+	alt_bo = migratable_bo_create_pin_map(test, xe, vm, size,
+					      DRM_XE_GEM_CPU_CACHING_WC,
+					      bo_flags);
+	if (IS_ERR(alt_bo))
+		goto free_sysbo;
+
+	vram_bo = migratable_bo_create_pin_map(test, xe, vm, size,
+					       DRM_XE_GEM_CPU_CACHING_WC,
+					       bo_flags);
+	if (IS_ERR(vram_bo))
+		goto free_altbo;
+
+	batch_bo = migratable_bo_create_pin_map(test, xe, vm, SZ_2M, DRM_XE_GEM_CPU_CACHING_WC, XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS);
+	if (IS_ERR(batch_bo))
+		goto free_vrambo;
+
+	xe_vm_unlock(vm);
+
+	failed = false;
+
+	fence = xe_vm_bind_kernel_bo(vm, batch_bo, NULL, SZ_2M, XE_CACHE_WT);
+	failed |= handle_vm_fence(xe, fence, test);
+
+	fence = xe_vm_bind_kernel_bo(vm, sys_bo, NULL, block, XE_CACHE_WT);
+	failed |= handle_vm_fence(xe, fence, test);
+
+	fence = xe_vm_bind_kernel_bo(vm, vram_bo, NULL, 2 * block, XE_CACHE_NONE);
+	failed |= handle_vm_fence(xe, fence, test);
+
+	fence = xe_vm_bind_kernel_bo(vm, alt_bo, NULL, 3 * block, XE_CACHE_NONE);
+	failed |= handle_vm_fence(xe, fence, test);
+	if (failed)
+		goto free_batchbo;
+
+	xe_vm_lock(vm, false);
+
+	performance_tile(xe, tile, test, vm, q,
+			 batch_bo, SZ_2M, sys_bo, block,
+			 vram_bo, 2 * block, alt_bo, 3 * block);
+
+free_batchbo:
+	bo_unpin_map_user(batch_bo);
+free_vrambo:
+	bo_unpin_map_user(vram_bo);
+free_altbo:
+	bo_unpin_map_user(alt_bo);
+free_sysbo:
+	bo_unpin_map_user(sys_bo);
+free_q:
+	xe_vm_unlock(vm);
+	xe_exec_queue_put(q);
+free_vm:
+	xe_vm_close_and_put(vm);
+out:
+	if (failed)
+		KUNIT_FAIL(test, "Test setup failed\n");
+}
+
+static void xe_migrate_performance_kunit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_tile *tile;
+	int id;
+
+	if (!IS_DGFX(xe)) {
+		kunit_skip(test, "test requires VRAM\n");
+		return;
+	}
+
+	xe_pm_runtime_get(xe);
+
+	for_each_tile(tile, xe, id) {
+		if (tile->mem.vram.io_size < tile->mem.vram.usable_size) {
+			kunit_skip(test, "Small bar device.\n");
+			break;
+		}
+
+		performance_test_run_tile(xe, tile, test);
+	}
+
+	xe_pm_runtime_put(xe);
+}
+
 static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 				       struct kunit *test)
 {
@@ -740,6 +972,9 @@ static void xe_validate_ccs_kunit(struct kunit *test)
 
 static struct kunit_case xe_migrate_tests[] = {
 	KUNIT_CASE_PARAM(xe_migrate_sanity_kunit, xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM_ATTR(xe_migrate_performance_kunit,
+			      xe_pci_live_device_gen_param,
+			      {.speed = KUNIT_SPEED_SLOW}),
 	KUNIT_CASE_PARAM(xe_validate_ccs_kunit, xe_pci_live_device_gen_param),
 	{}
 };
-- 
2.45.2

