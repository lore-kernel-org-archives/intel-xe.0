Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ECAC04FFE
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 00:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CAC510E1BD;
	Wed, 15 May 2024 00:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UPIW0vbG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012E310E1BD;
 Wed, 15 May 2024 00:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715733222; x=1747269222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MCq4xYcycRhEHaTCgYeZPGlSsaq8VdEz3N236KT9y2g=;
 b=UPIW0vbGptxhZu1o+nKPwrrkVAv655mVO4dDvSnVU+Qks3mkEpVTSAom
 fLwgi/YFaotY5Ua1buVL791AnkOVQs9bpLYbpvqH2aawjtA7pTzT7ogZ5
 rn06b/1g6apXqMTays9mKYTvVwu/yTn/fIZtcbL2hNxNv2xSCeOxBrKDM
 22NJMMvKkmQxZqDtrB1eMtVtDdyFO4DNPZGHgxWkXPaxk3bdLjE5pxAEf
 4Nkt9DuTGNN8X+6TvLb+dn9gupOavHYn2YdMW+pbggK1SXa/Qx/Gdqurp
 i+DthSC8KTaEkxdxh+cSGIatxL7WdhJeUEEVYIJacVVp7Na+749WbklhZ g==;
X-CSE-ConnectionGUID: YU+zzXldTXGqDHzNukMoLg==
X-CSE-MsgGUID: UAcXcD3lSU+Jy5/qt4AfhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11698724"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="11698724"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 17:33:41 -0700
X-CSE-ConnectionGUID: 48ZI4HzCTkqg0wJpjSM23A==
X-CSE-MsgGUID: Bm8mf/0HS++F1NPkC6JVGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="35361537"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 17:33:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] tests/intel/xe_vm: Add bind array conflict tests
Date: Tue, 14 May 2024 17:34:13 -0700
Message-Id: <20240515003413.99777-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add bind array conflict tests which modify the same address space within
1 bind array. Not a use case but stresses the driver logic. Also add an
error injection section which tests error of bind IOCTL.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_ioctl.c   |  19 ++++
 lib/xe/xe_ioctl.h   |   4 +
 tests/intel/xe_vm.c | 263 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 286 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 934c877ebc..94cf4c9fdc 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -96,6 +96,25 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exec_queue,
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind), 0);
 }
 
+void xe_vm_bind_array_enospc(int fd, uint32_t vm, uint32_t exec_queue,
+			     struct drm_xe_vm_bind_op *bind_ops,
+			     uint32_t num_bind, struct drm_xe_sync *sync,
+			     uint32_t num_syncs)
+{
+	struct drm_xe_vm_bind bind = {
+		.vm_id = vm,
+		.num_binds = num_bind,
+		.vector_of_binds = (uintptr_t)bind_ops,
+		.num_syncs = num_syncs,
+		.syncs = (uintptr_t)sync,
+		.exec_queue_id = exec_queue,
+	};
+
+	igt_assert(num_bind > 1);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind), -1);
+	igt_assert_eq(-errno, -ENOSPC);
+}
+
 int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
 		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 4d08402e0b..d0e6c4910b 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -57,6 +57,10 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exec_queue,
 		      struct drm_xe_vm_bind_op *bind_ops,
 		      uint32_t num_bind, struct drm_xe_sync *sync,
 		      uint32_t num_syncs);
+void xe_vm_bind_array_enospc(int fd, uint32_t vm, uint32_t exec_queue,
+			     struct drm_xe_vm_bind_op *bind_ops,
+			     uint32_t num_bind, struct drm_xe_sync *sync,
+			     uint32_t num_syncs);
 void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
 			    uint32_t bo, struct drm_xe_sync *sync,
 			    uint32_t num_syncs);
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 77cf1f7e67..7be85da62f 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -869,6 +869,257 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: bind-array-conflict
+ * Description: Test bind array with conflicting address
+ * Functionality: bind exec_queues and page table updates
+ * Test category: functionality test
+ *
+ * SUBTEST: bind-no-array-conflict
+ * Description: Test binding with conflicting address
+ * Functionality: bind and page table updates
+ * Test category: functionality test
+ *
+ * SUBTEST: bind-array-conflict-error-inject
+ * Description: Test bind array with conflicting address plus error injection
+ * Functionality: bind exec_queues and page table updates error paths
+ * Test category: functionality test
+ */
+static void
+test_bind_array_conflict(int fd, struct drm_xe_engine_class_instance *eci,
+			 bool no_array, bool error_inject)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a00000;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t exec_queue;
+#define BIND_ARRAY_CONFLICT_NUM_BINDS	4
+	struct drm_xe_vm_bind_op bind_ops[BIND_ARRAY_CONFLICT_NUM_BINDS] = { };
+#define ONE_MB	0x100000
+	size_t bo_size = 8 * ONE_MB;
+	uint32_t bo = 0, bo2 = 0;
+	void *map, *map2 = NULL;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data = NULL;
+	const struct binds {
+		uint64_t size;
+		uint64_t offset;
+		uint32_t op;
+	} bind_args[] = {
+		{ ONE_MB, 0, DRM_XE_VM_BIND_OP_MAP },
+		{ 2 * ONE_MB, ONE_MB, DRM_XE_VM_BIND_OP_MAP },
+		{ 3 * ONE_MB, 3 * ONE_MB, DRM_XE_VM_BIND_OP_MAP },
+		{ 4 * ONE_MB, ONE_MB, DRM_XE_VM_BIND_OP_UNMAP },
+	};
+	const struct execs {
+		uint64_t offset;
+	} exec_args[] = {
+		{ 0 },
+		{ ONE_MB / 2 },
+		{ ONE_MB / 4 },
+		{ 5 * ONE_MB },
+	};
+	int i, b, n_execs = 4;
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	map = xe_bo_map(fd, bo, bo_size);
+
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+
+	/* Map some memory that will be over written */
+	if (error_inject) {
+		bo2 = xe_bo_create(fd, vm, bo_size,
+				   vram_if_possible(fd, eci->gt_id),
+				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		map2 = xe_bo_map(fd, bo2, bo_size);
+
+		i = 0;
+		sync[0].handle = syncobj_create(fd, 0);
+		xe_vm_bind_async(fd, vm, 0, bo2, bind_args[i].offset,
+				 addr + bind_args[i].offset, bind_args[i].size,
+				 sync, 1);
+		{
+			uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+			uint64_t batch_addr = addr + exec_args[i].offset + batch_offset;
+			uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+			uint64_t sdi_addr = addr + exec_args[i].offset + sdi_offset;
+			data = map2 + exec_args[i].offset;
+
+			b = 0;
+			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+			data[i].batch[b++] = sdi_addr;
+			data[i].batch[b++] = sdi_addr >> 32;
+			data[i].batch[b++] = 0xc0ffee;
+			data[i].batch[b++] = MI_BATCH_BUFFER_END;
+			igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+			sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+			sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+			sync[1].handle = syncobj_create(fd, 0);
+			exec.num_syncs = 2;
+
+			exec.exec_queue_id = exec_queue;
+			exec.address = batch_addr;
+			xe_exec(fd, &exec);
+		}
+
+		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+		igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));
+
+		syncobj_reset(fd, &sync[0].handle, 1);
+		syncobj_destroy(fd, sync[1].handle);
+
+		data = map2 + exec_args[i].offset;
+		igt_assert_eq(data[i].data, 0xc0ffee);
+	}
+
+	if (no_array) {
+		sync[0].handle = syncobj_create(fd, 0);
+		for (i = 0; i < BIND_ARRAY_CONFLICT_NUM_BINDS; ++i) {
+			if (bind_args[i].op == DRM_XE_VM_BIND_OP_MAP)
+				xe_vm_bind_async(fd, vm, 0, bo,
+						 bind_args[i].offset,
+						 addr + bind_args[i].offset,
+						 bind_args[i].size,
+						 sync, 1);
+			else
+				xe_vm_unbind_async(fd, vm, 0,
+						   bind_args[i].offset,
+						   addr + bind_args[i].offset,
+						   bind_args[i].size,
+						   sync, 1);
+		}
+	} else {
+		for (i = 0; i < BIND_ARRAY_CONFLICT_NUM_BINDS; ++i) {
+			bind_ops[i].obj = bind_args[i].op == DRM_XE_VM_BIND_OP_MAP ?
+				bo : 0;
+			bind_ops[i].obj_offset = bind_args[i].offset;
+			bind_ops[i].range = bind_args[i].size;
+			bind_ops[i].addr = addr + bind_args[i].offset;
+			bind_ops[i].op = bind_args[i].op;
+			bind_ops[i].flags = 0;
+			bind_ops[i].prefetch_mem_region_instance = 0;
+			bind_ops[i].pat_index = intel_get_pat_idx_wb(fd);
+			bind_ops[i].reserved[0] = 0;
+			bind_ops[i].reserved[1] = 0;
+		}
+
+		if (error_inject) {
+			sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+			bind_ops[BIND_ARRAY_CONFLICT_NUM_BINDS - 1].flags |=
+				0x1 << 31;
+			xe_vm_bind_array_enospc(fd, vm, 0, bind_ops,
+						BIND_ARRAY_CONFLICT_NUM_BINDS,
+						sync, 1);
+			bind_ops[BIND_ARRAY_CONFLICT_NUM_BINDS - 1].flags &=
+				~(0x1 << 31);
+
+			/* Verify existing mappings still works */
+			i = 1;
+			{
+				uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+				uint64_t batch_addr = addr + exec_args[i].offset + batch_offset;
+				uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+				uint64_t sdi_addr = addr + exec_args[i].offset + sdi_offset;
+				data = map2 + exec_args[i].offset;
+
+				b = 0;
+				data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+				data[i].batch[b++] = sdi_addr;
+				data[i].batch[b++] = sdi_addr >> 32;
+				data[i].batch[b++] = 0xc0ffee;
+				data[i].batch[b++] = MI_BATCH_BUFFER_END;
+				igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+				sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+				sync[1].handle = syncobj_create(fd, 0);
+				exec.num_syncs = 2;
+
+				exec.exec_queue_id = exec_queue;
+				exec.address = batch_addr;
+				xe_exec(fd, &exec);
+			}
+
+			igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+			igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));
+
+			syncobj_destroy(fd, sync[0].handle);
+			syncobj_destroy(fd, sync[1].handle);
+
+			data = map2 + exec_args[i].offset;
+			igt_assert_eq(data[i].data, 0xc0ffee);
+			sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+		}
+		sync[0].handle = syncobj_create(fd, 0);
+		xe_vm_bind_array(fd, vm, 0, bind_ops,
+				 BIND_ARRAY_CONFLICT_NUM_BINDS, sync, 1);
+	}
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + exec_args[i].offset + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + exec_args[i].offset + sdi_offset;
+		data = map + exec_args[i].offset;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+		if (i == n_execs - 1) {
+			sync[1].handle = syncobj_create(fd, 0);
+			exec.num_syncs = 2;
+		} else {
+			exec.num_syncs = 1;
+		}
+
+		exec.exec_queue_id = exec_queue;
+		exec.address = batch_addr;
+		xe_exec(fd, &exec);
+	}
+
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));
+
+	for (i = 0; i < n_execs; i++) {
+		data = map + exec_args[i].offset;
+		igt_assert_eq(data[i].data, 0xc0ffee);
+	}
+
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, sync[1].handle);
+	xe_exec_queue_destroy(fd, exec_queue);
+
+	munmap(map, bo_size);
+	if (map2)
+		munmap(map, bo_size);
+	gem_close(fd, bo);
+	if (bo2)
+		gem_close(fd, bo2);
+	xe_vm_destroy(fd, vm);
+}
+
+
 #define LARGE_BIND_FLAG_MISALIGNED	(0x1 << 0)
 #define LARGE_BIND_FLAG_SPLIT		(0x1 << 1)
 #define LARGE_BIND_FLAG_USERPTR		(0x1 << 2)
@@ -2016,6 +2267,18 @@ igt_main
 			test_bind_array(fd, hwe, 16,
 					BIND_ARRAY_BIND_EXEC_QUEUE_FLAG);
 
+	igt_subtest("bind-array-conflict")
+		xe_for_each_engine(fd, hwe)
+			test_bind_array_conflict(fd, hwe, false, false);
+
+	igt_subtest("bind-no-array-conflict")
+		xe_for_each_engine(fd, hwe)
+			test_bind_array_conflict(fd, hwe, true, false);
+
+	igt_subtest("bind-array-conflict-error-inject")
+		xe_for_each_engine(fd, hwe)
+			test_bind_array_conflict(fd, hwe, false, true);
+
 	for (bind_size = 0x1ull << 21; bind_size <= 0x1ull << 31;
 	     bind_size = bind_size << 1) {
 		igt_subtest_f("large-binds-%lld",
-- 
2.34.1

