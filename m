Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2640CD1284
	for <intel-xe@archiver.kernel.org>; Sun, 31 Mar 2024 18:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF0610E72C;
	Sun, 31 Mar 2024 18:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FwAdyx+2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D91E10E72C
 for <intel-xe@lists.freedesktop.org>; Sun, 31 Mar 2024 18:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711911589; x=1743447589;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5Exvm8qHD+tC0rb+/zD6FBDum33M4Ar2MT/ujulKPf0=;
 b=FwAdyx+2m7PJi2z38tuagy7J4zUdutLQAYtitz6QVmRZE4wS8k8ZquZz
 JdI4DoKVH+eD/z/zb34rg9ad2+Jzk3DV844uKc5+60QpcaWBGISxqfHhv
 lnewnBTu0MDHGfNSZLM/vfV1NqUH4NLp6HMRTjWTLKyMTuX0zs8UcPBmX
 IuuJYB8trxoiw9BRriFjtnJtdLcDidYfi4p9y22KRr71YDwNCiCjZgmfj
 9b54EImTarlbPR8T32NuR3lbdiNxhJjEJ/vnIBdgo/t2xCWGH1wazyQ05
 JTdOwpthogj3pfEamcrXjPt8vDTnVQgdxEmm0T+a+FhQNiFGSBKDGnPdR g==;
X-CSE-ConnectionGUID: /SCdV8/zQ8myOnvX6Qb5iA==
X-CSE-MsgGUID: Q4EiT58NTiar9ktJvTBvNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="17662286"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; d="scan'208";a="17662286"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2024 11:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; d="scan'208";a="48486544"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa002.jf.intel.com with ESMTP; 31 Mar 2024 11:59:45 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH] lib/xe/xe_util: Creating the helper functions
Date: Mon,  1 Apr 2024 00:29:49 +0530
Message-Id: <20240331185949.110269-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
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

Creating the helper functions which can be reused by many tests,
as part of this patch xe_exec_compute_mode and xe_exec_fault_mode
are used this helper functions.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
---
 lib/xe/xe_util.c                   | 194 +++++++++++++++++++++++++++++
 lib/xe/xe_util.h                   |  48 +++++++
 tests/intel/xe_exec_compute_mode.c | 190 ++++------------------------
 tests/intel/xe_exec_fault_mode.c   | 179 +++-----------------------
 4 files changed, 282 insertions(+), 329 deletions(-)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 050162b5e..17cd45e45 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -255,3 +255,197 @@ bool xe_is_gt_in_c6(int fd, int gt)
 
 	return strcmp(gt_c_state, "gt-c6") == 0;
 }
+
+struct cpu_va *create_xe_bo(int fd, uint32_t vm, uint32_t *bo,
+		uint32_t bo_size, uint64_t placement, unsigned int flags)
+{
+	struct cpu_va *data;
+
+	if (flags & USERPTR) {
+		if (flags & INVALIDATE) {
+			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ | PROT_WRITE,
+					MAP_SHARED | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		} else {
+			data = aligned_alloc(xe_get_default_alignment(fd), bo_size);
+			igt_assert(data);
+		}
+	} else {
+		*bo = xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0, bo_size, placement,
+				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		data = xe_bo_map(fd, *bo, bo_size);
+	}
+
+	memset(data, 0, bo_size);
+
+	return data;
+}
+
+void create_exec_queue(int fd, uint32_t vm, uint32_t *exec_queues,
+		uint32_t *bind_exec_queues, int n_exec_queues,
+		struct drm_xe_engine_class_instance *eci, unsigned int flags)
+{
+	int i;
+
+	for (i = 0; i < n_exec_queues; i++) {
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		if (flags & BIND_EXEC_QUEUE)
+			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0);
+		else
+			bind_exec_queues[i] = 0;
+	};
+}
+
+void xe_bo_bind(int fd, uint32_t vm, uint32_t bind_exec_queues, uint32_t bo,
+		uint32_t bo_size, uint64_t addr, struct drm_xe_sync *sync,
+		struct cpu_va *data, unsigned int flags)
+{
+	int64_t fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	if (bo)
+		xe_vm_bind_async(fd, vm, bind_exec_queues, bo, 0, addr, bo_size, sync, 1);
+	else
+		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues,
+				to_user_pointer(data), addr,
+				bo_size, sync, 1);
+
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+			bind_exec_queues, fence_timeout);
+	data[0].vm_sync = 0;
+
+	if (flags & PREFETCH) {
+		/* Should move to system memory */
+		xe_vm_prefetch_async(fd, vm, bind_exec_queues, 0, addr,
+				bo_size, sync, 1, 0);
+		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+				bind_exec_queues, fence_timeout);
+		data[0].vm_sync = 0;
+	}
+}
+
+void insert_store(uint64_t dst, struct cpu_va *data, uint32_t val, int i)
+{
+	int b = 0;
+	data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data[i].batch[b++] = dst;
+	data[i].batch[b++] = dst >> 32;
+	data[i].batch[b++] = val;
+	data[i].batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data[i].batch));
+}
+
+void xe_execbuf(int fd, uint32_t vm, struct drm_xe_exec *exec, int n_execs,
+		uint32_t *exec_queues, uint32_t *bind_exec_queues,
+		int n_exec_queues, uint32_t bo, uint32_t bo_size,
+		struct drm_xe_sync *sync, uint64_t addr, struct cpu_va *data,
+		int *map_fd, unsigned int flags)
+{
+	int i;
+	int64_t fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int e = i % n_exec_queues;
+
+		if (flags & INVALID_VA)
+			sdi_addr = 0x1fffffffffff000;
+
+		insert_store(sdi_addr, data, 0xc0ffee, i);
+
+		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
+
+		exec->exec_queue_id = exec_queues[e];
+		exec->address = batch_addr;
+		xe_exec(fd, exec);
+
+		if (flags & REBIND && i + 1 != n_execs) {
+			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+					exec_queues[e], fence_timeout);
+			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
+					addr, bo_size, NULL, 0);
+
+			sync[0].addr = to_user_pointer(&data[0].vm_sync);
+			addr += bo_size;
+
+			if (bo)
+				xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo,
+						0, addr, bo_size, sync, 1);
+			else
+				xe_vm_bind_userptr_async(fd, vm,
+						bind_exec_queues[e],
+						to_user_pointer(data),
+						addr, bo_size, sync, 1);
+
+			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+					bind_exec_queues[e], fence_timeout);
+			data[0].vm_sync = 0;
+		}
+
+		if (flags & INVALIDATE && i + 1 != n_execs) {
+			if (!(flags & RACE)) {
+				/*
+				 * Wait for exec completion and check data as
+				 * userptr will likely change to different
+				 * physical memory on next mmap call triggering
+				 * an invalidate.
+				 */
+				xe_wait_ufence(fd, &data[i].exec_sync,
+						USER_FENCE_VALUE, exec_queues[e],
+						fence_timeout);
+				igt_assert_eq(data[i].data, 0xc0ffee);
+			} else if (i * 2 != n_execs) {
+				/*
+				 * We issue 1 mmap which races against running
+				 * jobs. No real check here aside from this test
+				 * not faulting on the GPU.
+				 */
+				continue;
+			}
+
+			if (flags & RACE) {
+				*map_fd = open("/tmp", O_TMPFILE | O_RDWR,
+						0x666);
+				write(*map_fd, data, bo_size);
+				data = mmap((void *)MAP_ADDRESS, bo_size,
+						PROT_READ | PROT_WRITE, MAP_SHARED |
+						MAP_FIXED, *map_fd, 0);
+			} else {
+				data = mmap((void *)MAP_ADDRESS, bo_size,
+						PROT_READ | PROT_WRITE, MAP_SHARED |
+						MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+			}
+
+			igt_assert(data != MAP_FAILED);
+		}
+	}
+}
+
+void xe_vm_unbind(int fd, uint32_t vm, uint32_t bind_exec_queues,
+		struct drm_xe_sync *sync, struct cpu_va *data, uint64_t addr,
+		uint32_t bo_size)
+{
+	int64_t fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	xe_vm_unbind_async(fd, vm, bind_exec_queues, 0, addr, bo_size,
+			sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+			bind_exec_queues, fence_timeout);
+}
+
+void destory_exec_queue(int fd, uint32_t *exec_queues,
+		uint32_t *bind_exec_queues, int n_exec_queues)
+{
+	int i;
+
+	for (i = 0; i < n_exec_queues; i++) {
+		xe_exec_queue_destroy(fd, exec_queues[i]);
+		if (bind_exec_queues[i])
+			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
+	}
+}
+
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index 6480ea01a..aa1b0dcc1 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -47,4 +47,52 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t bind_engine,
 
 bool xe_is_gt_in_c6(int fd, int gt);
 
+
+#define USERPTR			(0x1 << 0)
+#define REBIND			(0x1 << 1)
+#define INVALIDATE		(0x1 << 2)
+#define RACE			(0x1 << 3)
+#define BIND_EXEC_QUEUE		(0x1 << 4)
+#define PREFETCH		(0x1 << 5)
+#define INVALID_FAULT		(0x1 << 6)
+#define INVALID_VA		(0x1 << 7)
+#define ENABLE_SCRATCH		(0x1 << 8)
+#define VM_FOR_BO		(0x1 << 9)
+#define EXEC_QUEUE_EARLY	(0x1 << 10)
+
+#define MAX_N_EXEC_QUEUES	16
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+#define MAP_ADDRESS		0x00007fadeadbe000
+
+#define ONE_SEC		MS_TO_NS(1000)
+#define HUNDRED_SEC	MS_TO_NS(100000)
+
+struct cpu_va {
+	uint32_t batch[16];
+	uint64_t pad;
+	uint64_t vm_sync;
+	uint64_t exec_sync;
+	uint32_t data;
+};
+
+struct cpu_va *create_xe_bo(int fd, uint32_t vm, uint32_t *bo,
+		uint32_t bo_size, uint64_t placement,  unsigned int flags);
+void create_exec_queue(int fd, uint32_t vm, uint32_t *exec_queues,
+		uint32_t *bind_exec_queues, int n_exec_queues,
+		struct drm_xe_engine_class_instance *eci, unsigned int flags);
+void xe_bo_bind(int fd, uint32_t vm, uint32_t bind_exec_queues, uint32_t bo,
+		uint32_t bo_size, uint64_t addr, struct drm_xe_sync *sync,
+		struct cpu_va *data, unsigned int flags);
+void xe_execbuf(int fd, uint32_t vm, struct drm_xe_exec *exec, int n_execs,
+		uint32_t *exec_queues, uint32_t *bind_exec_queues,
+		int n_exec_queues, uint32_t bo, uint32_t bo_size,
+		struct drm_xe_sync *sync, uint64_t addr, struct cpu_va *data,
+		int *map_fd, unsigned int flags);
+void insert_store(uint64_t dst, struct cpu_va *data, uint32_t val, int i);
+void xe_vm_unbind(int fd, uint32_t vm, uint32_t bind_exec_queues,
+		struct drm_xe_sync *sync, struct cpu_va *data,
+		uint64_t addr, uint32_t bo_size);
+void destory_exec_queue(int fd, uint32_t *exec_queues,
+		uint32_t *bind_exec_queues, int n_exec_queues);
+
 #endif /* XE_UTIL_H */
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 3ec848164..e8d82cc69 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -15,6 +15,7 @@
 #include "igt.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
+#include "lib/xe/xe_util.h"
 #include <sys/ioctl.h>
 #include "xe_drm.h"
 
@@ -23,15 +24,6 @@
 #include "xe/xe_spin.h"
 #include <string.h>
 
-#define MAX_N_EXECQUEUES 	16
-#define USERPTR				(0x1 << 0)
-#define REBIND				(0x1 << 1)
-#define INVALIDATE			(0x1 << 2)
-#define RACE				(0x1 << 3)
-#define BIND_EXECQUEUE		(0x1 << 4)
-#define VM_FOR_BO			(0x1 << 5)
-#define EXEC_QUEUE_EARLY	(0x1 << 6)
-
 /**
  * SUBTEST: twice-%s
  * Description: Run %arg[1] compute machine test twice
@@ -88,7 +80,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 {
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
-#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
 		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
 		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
@@ -99,161 +90,38 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		.num_syncs = 1,
 		.syncs = to_user_pointer(sync),
 	};
-	uint32_t exec_queues[MAX_N_EXECQUEUES];
-	uint32_t bind_exec_queues[MAX_N_EXECQUEUES];
+	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
+	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
 	size_t bo_size;
 	uint32_t bo = 0;
-	struct {
-		uint32_t batch[16];
-		uint64_t pad;
-		uint64_t vm_sync;
-		uint64_t exec_sync;
-		uint32_t data;
-	} *data;
-	int i, j, b;
+	struct cpu_va *data;
+	int i, j;
 	int map_fd = -1;
 	int64_t fence_timeout;
+	uint64_t placement;
 
-	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
+	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(fd, bo_size);
 
-	for (i = 0; (flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
-		if (flags & BIND_EXECQUEUE)
-			bind_exec_queues[i] =
-				xe_bind_exec_queue_create(fd, vm, 0);
-		else
-			bind_exec_queues[i] = 0;
-	};
+	if (flags & EXEC_QUEUE_EARLY)
+		create_exec_queue(fd, vm, exec_queues, bind_exec_queues, n_exec_queues, eci, flags);
 
-	if (flags & USERPTR) {
-#define	MAP_ADDRESS	0x00007fadeadbe000
-		if (flags & INVALIDATE) {
-			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
-				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
-				    MAP_ANONYMOUS, -1, 0);
-			igt_assert(data != MAP_FAILED);
-		} else {
-			data = aligned_alloc(xe_get_default_alignment(fd),
-					     bo_size);
-			igt_assert(data);
-		}
-	} else {
-		bo = xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
-				  bo_size, vram_if_possible(fd, eci->gt_id),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-		data = xe_bo_map(fd, bo, bo_size);
-	}
-	memset(data, 0, bo_size);
+	placement = vram_if_possible(fd, eci->gt_id);
 
-	for (i = 0; !(flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
-		if (flags & BIND_EXECQUEUE)
-			bind_exec_queues[i] =
-				xe_bind_exec_queue_create(fd, vm, 0);
-		else
-			bind_exec_queues[i] = 0;
-	};
+	data = create_xe_bo(fd, vm, &bo, bo_size, placement, flags);
 
-	sync[0].addr = to_user_pointer(&data[0].vm_sync);
-	if (bo)
-		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
-				 bo_size, sync, 1);
-	else
-		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
-					 to_user_pointer(data), addr,
-					 bo_size, sync, 1);
-#define ONE_SEC	MS_TO_NS(1000)
-#define HUNDRED_SEC	MS_TO_NS(100000)
+	if(!(flags & EXEC_QUEUE_EARLY))
+		create_exec_queue(fd, vm, exec_queues, bind_exec_queues, n_exec_queues, eci, flags);
+
+	xe_bo_bind(fd, vm, bind_exec_queues[0], bo, bo_size, addr, sync, data, flags);
 
 	fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
 
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-		       bind_exec_queues[0], fence_timeout);
-	data[0].vm_sync = 0;
-
-	for (i = 0; i < n_execs; i++) {
-		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
-		uint64_t batch_addr = addr + batch_offset;
-		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
-		uint64_t sdi_addr = addr + sdi_offset;
-		int e = i % n_exec_queues;
-
-		b = 0;
-		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
-		data[i].batch[b++] = sdi_addr;
-		data[i].batch[b++] = sdi_addr >> 32;
-		data[i].batch[b++] = 0xc0ffee;
-		data[i].batch[b++] = MI_BATCH_BUFFER_END;
-		igt_assert(b <= ARRAY_SIZE(data[i].batch));
-
-		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
-
-		exec.exec_queue_id = exec_queues[e];
-		exec.address = batch_addr;
-		xe_exec(fd, &exec);
-
-		if (flags & REBIND && i + 1 != n_execs) {
-			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-				       exec_queues[e], fence_timeout);
-			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
-					   addr, bo_size, NULL, 0);
-
-			sync[0].addr = to_user_pointer(&data[0].vm_sync);
-			addr += bo_size;
-			if (bo)
-				xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo,
-						 0, addr, bo_size, sync, 1);
-			else
-				xe_vm_bind_userptr_async(fd, vm,
-							 bind_exec_queues[e],
-							 to_user_pointer(data),
-							 addr, bo_size, sync,
-							 1);
-			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-				       bind_exec_queues[e], fence_timeout);
-			data[0].vm_sync = 0;
-		}
-
-		if (flags & INVALIDATE && i + 1 != n_execs) {
-			if (!(flags & RACE)) {
-				/*
-				 * Wait for exec completion and check data as
-				 * userptr will likely change to different
-				 * physical memory on next mmap call triggering
-				 * an invalidate.
-				 */
-				xe_wait_ufence(fd, &data[i].exec_sync,
-					       USER_FENCE_VALUE, exec_queues[e],
-					       fence_timeout);
-				igt_assert_eq(data[i].data, 0xc0ffee);
-			} else if (i * 2 != n_execs) {
-				/*
-				 * We issue 1 mmap which races against running
-				 * jobs. No real check here aside from this test
-				 * not faulting on the GPU.
-				 */
-				continue;
-			}
-
-			if (flags & RACE) {
-				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
-					      0x666);
-				write(map_fd, data, bo_size);
-				data = mmap((void *)MAP_ADDRESS, bo_size,
-					    PROT_READ | PROT_WRITE, MAP_SHARED |
-					    MAP_FIXED, map_fd, 0);
-			} else {
-				data = mmap((void *)MAP_ADDRESS, bo_size,
-					    PROT_READ | PROT_WRITE, MAP_SHARED |
-					    MAP_FIXED | MAP_ANONYMOUS, -1, 0);
-			}
-			igt_assert(data != MAP_FAILED);
-		}
-	}
+	xe_execbuf(fd, vm, &exec, n_execs, exec_queues, bind_exec_queues,
+			n_exec_queues, bo, bo_size, sync, addr, data, &map_fd, flags);
 
 	j = flags & INVALIDATE ? n_execs - 1 : 0;
 	for (i = j; i < n_execs; i++)
@@ -264,20 +132,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & INVALIDATE)
 		usleep(250000);
 
-	sync[0].addr = to_user_pointer(&data[0].vm_sync);
-	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
-			   sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-		       bind_exec_queues[0], fence_timeout);
+	xe_vm_unbind(fd, vm, bind_exec_queues[0], sync, data, addr, bo_size);
 
 	for (i = j; i < n_execs; i++)
 		igt_assert_eq(data[i].data, 0xc0ffee);
 
-	for (i = 0; i < n_exec_queues; i++) {
-		xe_exec_queue_destroy(fd, exec_queues[i]);
-		if (bind_exec_queues[i])
-			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
-	}
+	destory_exec_queue(fd, exec_queues, bind_exec_queues, n_exec_queues);
 
 	if (bo) {
 		munmap(data, bo_size);
@@ -492,14 +352,14 @@ igt_main
 		{ "userptr-rebind", USERPTR | REBIND },
 		{ "userptr-invalidate", USERPTR | INVALIDATE },
 		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
-		{ "bindexecqueue", BIND_EXECQUEUE },
-		{ "bindexecqueue-userptr", BIND_EXECQUEUE | USERPTR },
-		{ "bindexecqueue-rebind",  BIND_EXECQUEUE | REBIND },
-		{ "bindexecqueue-userptr-rebind",  BIND_EXECQUEUE | USERPTR |
+		{ "bindexecqueue", BIND_EXEC_QUEUE },
+		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE | USERPTR },
+		{ "bindexecqueue-rebind",  BIND_EXEC_QUEUE | REBIND },
+		{ "bindexecqueue-userptr-rebind",  BIND_EXEC_QUEUE | USERPTR |
 			REBIND },
-		{ "bindexecqueue-userptr-invalidate",  BIND_EXECQUEUE | USERPTR |
+		{ "bindexecqueue-userptr-invalidate",  BIND_EXEC_QUEUE | USERPTR |
 			INVALIDATE },
-		{ "bindexecqueue-userptr-invalidate-race", BIND_EXECQUEUE | USERPTR |
+		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE | USERPTR |
 			INVALIDATE | RACE },
 		{ NULL },
 	};
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 40fe1743e..7b2fef224 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -16,24 +16,13 @@
 #include "igt.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
+#include "lib/xe/xe_util.h"
 #include "xe_drm.h"
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include <string.h>
 
-#define MAX_N_EXEC_QUEUES	16
-
-#define USERPTR		(0x1 << 0)
-#define REBIND		(0x1 << 1)
-#define INVALIDATE	(0x1 << 2)
-#define RACE		(0x1 << 3)
-#define BIND_EXEC_QUEUE	(0x1 << 4)
-#define PREFETCH	(0x1 << 5)
-#define INVALID_FAULT	(0x1 << 6)
-#define INVALID_VA	(0x1 << 7)
-#define ENABLE_SCRATCH  (0x1 << 8)
-
 /**
  * SUBTEST: invalid-va
  * Description: Access invalid va and check for EIO through user fence.
@@ -99,7 +88,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 {
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
-#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
 		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
@@ -113,14 +101,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
 	size_t bo_size;
 	uint32_t bo = 0;
-	struct {
-		uint32_t batch[16];
-		uint64_t pad;
-		uint64_t vm_sync;
-		uint64_t exec_sync;
-		uint32_t data;
-	} *data;
-	int i, j, b;
+	struct cpu_va *data;
+	uint64_t placement;
+	int i, j;
 	int map_fd = -1;
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
@@ -134,144 +117,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(fd, bo_size);
 
-	if (flags & USERPTR) {
-#define	MAP_ADDRESS	0x00007fadeadbe000
-		if (flags & INVALIDATE) {
-			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
-				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
-				    MAP_ANONYMOUS, -1, 0);
-			igt_assert(data != MAP_FAILED);
-		} else {
-			data = aligned_alloc(xe_get_default_alignment(fd),
-					     bo_size);
-			igt_assert(data);
-		}
-	} else {
-		if (flags & PREFETCH)
-			bo = xe_bo_create(fd, 0, bo_size,
-					  all_memory_regions(fd) |
-					  vram_if_possible(fd, 0),
-					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-		else
-			bo = xe_bo_create(fd, 0, bo_size,
-					  vram_if_possible(fd, eci->gt_id),
-					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-		data = xe_bo_map(fd, bo, bo_size);
-	}
-	memset(data, 0, bo_size);
-
-	for (i = 0; i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
-		if (flags & BIND_EXEC_QUEUE)
-			bind_exec_queues[i] =
-				xe_bind_exec_queue_create(fd, vm, 0);
-		else
-			bind_exec_queues[i] = 0;
-	};
-
-	sync[0].addr = to_user_pointer(&data[0].vm_sync);
-	if (bo)
-		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr, bo_size, sync, 1);
-	else
-		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
-					 to_user_pointer(data), addr,
-					 bo_size, sync, 1);
-#define ONE_SEC	MS_TO_NS(1000)
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-		       bind_exec_queues[0], ONE_SEC);
-	data[0].vm_sync = 0;
-
-	if (flags & PREFETCH) {
-		/* Should move to system memory */
-		xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0, addr,
-				     bo_size, sync, 1, 0);
-		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-			       bind_exec_queues[0], ONE_SEC);
-		data[0].vm_sync = 0;
-	}
-
-	for (i = 0; i < n_execs; i++) {
-		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
-		uint64_t batch_addr = addr + batch_offset;
-		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
-		uint64_t sdi_addr = addr + sdi_offset;
-		int e = i % n_exec_queues;
+	placement = (flags & PREFETCH) ? all_memory_regions(fd) |
+		vram_if_possible(fd, 0) : vram_if_possible(fd, eci->gt_id);
 
-		b = 0;
-		if (flags & INVALID_VA)
-			sdi_addr = 0x1fffffffffff000;
+	data = create_xe_bo(fd, vm, &bo, bo_size, placement, flags);
 
-		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
-		data[i].batch[b++] = sdi_addr;
-		data[i].batch[b++] = sdi_addr >> 32;
-		data[i].batch[b++] = 0xc0ffee;
-		data[i].batch[b++] = MI_BATCH_BUFFER_END;
-		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+	create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
+			n_exec_queues, eci, flags);
 
-		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
+	xe_bo_bind(fd, vm, bind_exec_queues[0], bo, bo_size, addr, sync, data, flags);
 
-		exec.exec_queue_id = exec_queues[e];
-		exec.address = batch_addr;
-		xe_exec(fd, &exec);
+	xe_execbuf(fd, vm, &exec, n_execs, exec_queues, bind_exec_queues,
+			n_exec_queues, bo, bo_size, sync, addr, data, &map_fd, flags);
 
-		if (flags & REBIND && i + 1 != n_execs) {
-			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-				       exec_queues[e], ONE_SEC);
-			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
-					   addr, bo_size, NULL, 0);
-
-			sync[0].addr = to_user_pointer(&data[0].vm_sync);
-			addr += bo_size;
-			if (bo)
-				xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo,
-						 0, addr, bo_size, sync, 1);
-			else
-				xe_vm_bind_userptr_async(fd, vm,
-							 bind_exec_queues[e],
-							 to_user_pointer(data),
-							 addr, bo_size, sync,
-							 1);
-			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-				       bind_exec_queues[e], ONE_SEC);
-			data[0].vm_sync = 0;
-		}
-
-		if (flags & INVALIDATE && i + 1 != n_execs) {
-			if (!(flags & RACE)) {
-				/*
-				 * Wait for exec completion and check data as
-				 * userptr will likely change to different
-				 * physical memory on next mmap call triggering
-				 * an invalidate.
-				 */
-				xe_wait_ufence(fd, &data[i].exec_sync,
-					       USER_FENCE_VALUE, exec_queues[e],
-					       ONE_SEC);
-				igt_assert_eq(data[i].data, 0xc0ffee);
-			} else if (i * 2 != n_execs) {
-				/*
-				 * We issue 1 mmap which races against running
-				 * jobs. No real check here aside from this test
-				 * not faulting on the GPU.
-				 */
-				continue;
-			}
-
-			if (flags & RACE) {
-				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
-					      0x666);
-				write(map_fd, data, bo_size);
-				data = mmap((void *)MAP_ADDRESS, bo_size,
-					    PROT_READ | PROT_WRITE, MAP_SHARED |
-					    MAP_FIXED, map_fd, 0);
-			} else {
-				data = mmap((void *)MAP_ADDRESS, bo_size,
-					    PROT_READ | PROT_WRITE, MAP_SHARED |
-					    MAP_FIXED | MAP_ANONYMOUS, -1, 0);
-			}
-			igt_assert(data != MAP_FAILED);
-		}
-	}
 	if (!(flags & INVALID_FAULT)) {
 		int64_t timeout = ONE_SEC;
 
@@ -286,22 +144,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 							       exec_queues[i % n_exec_queues], &timeout), 0);
 		}
 	}
-	sync[0].addr = to_user_pointer(&data[0].vm_sync);
-	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
-			   sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-		       bind_exec_queues[0], ONE_SEC);
+
+	xe_vm_unbind(fd, vm, bind_exec_queues[0], sync, data, addr, bo_size);
 
 	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
 		for (i = j; i < n_execs; i++)
 				igt_assert_eq(data[i].data, 0xc0ffee);
 	}
 
-	for (i = 0; i < n_exec_queues; i++) {
-		xe_exec_queue_destroy(fd, exec_queues[i]);
-		if (bind_exec_queues[i])
-			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
-	}
+	destory_exec_queue(fd, exec_queues, bind_exec_queues, n_exec_queues);
 
 	if (bo) {
 		munmap(data, bo_size);
-- 
2.25.1

