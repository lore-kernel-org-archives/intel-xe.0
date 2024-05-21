Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A856EC25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 04:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359DD10E267;
	Tue, 21 May 2024 04:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYUf4WL1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16CD10E600;
 Tue, 21 May 2024 04:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716265063; x=1747801063;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lJbDlP6TVX8pPIXhkI0lpIaZin3b9lwbpbZ+c+Q9jEo=;
 b=NYUf4WL1OYZhdcWM/1V/HwM9VDvbZ6y4kjm8KxTv4JrLudVJoyBD4UDE
 2CvHdv7YAxdg6b8xSNzrDbaowxhT/JxQ9DFmGpsSzbuFytTuJpJr44LZO
 40xZnCJuj7DNxCxrESizCAmqw1nZU1Kjexi4LRicuVA7liu4MtpbNYhsc
 cRDVvYUD6Aef18SiE8SIizmwxPBn13MYiFjbqj0fi6JGarYtj2a82YRKy
 mlihN+gQO6zH7wGzwcEEYsnyYI1Ja67NDflf7Y70UOmuaEuDvE1D0nZzr
 KpiPFlOcGxAfshdWg5IlsW5J+n2YK0XnNN9xEZEsUF9xLl7oEI3X0QVeQ A==;
X-CSE-ConnectionGUID: b4FtfnP9Skqf/RsrjNkCug==
X-CSE-MsgGUID: 5Fm+D2v6Skej7t/YZ4XuqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23571940"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="23571940"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 21:17:40 -0700
X-CSE-ConnectionGUID: S7Cu6V81S+K+PtE1Plkecg==
X-CSE-MsgGUID: y1qGBB5UTIiAY6Glptx6/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="33200601"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 21:17:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] tests/xe: Add System Allocator test
Date: Mon, 20 May 2024 21:18:01 -0700
Message-Id: <20240521041801.1515660-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

IGT for pending SVM implementation in Xe.

Various system allocation types (malloc, mmap, mmap flags, huge pages,
different sizes, different alignments), mixing runtime allocations,
unmapping corners, testing invalid faults, and eviction have been
tested. Testing scales from single thread to multiple threads and
multiple processes. Most tests pass on PVC (though a few intermittent
KMD bugs still need to be tracked down).

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm-uapi/xe_drm.h              |    1 +
 lib/xe/xe_ioctl.c                      |   12 +
 lib/xe/xe_ioctl.h                      |    1 +
 tests/intel/xe_exec_system_allocator.c | 1281 ++++++++++++++++++++++++
 tests/meson.build                      |    1 +
 5 files changed, 1296 insertions(+)
 create mode 100644 tests/intel/xe_exec_system_allocator.c

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 0b709b3746..69c8792bbc 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -973,6 +973,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR	(1 << 4)
 	/** @flags: Bind flags */
 	__u32 flags;
 
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 94cf4c9fdc..a437fd828a 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -443,6 +443,18 @@ void *xe_bo_map(int fd, uint32_t bo, size_t size)
 	return __xe_bo_map(fd, bo, size, PROT_WRITE);
 }
 
+void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
+{
+	uint64_t mmo;
+	void *map;
+
+	mmo = xe_bo_mmap_offset(fd, bo);
+	map = mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd, mmo);
+	igt_assert(map != MAP_FAILED);
+
+	return map;
+}
+
 void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot)
 {
 	return __xe_bo_map(fd, bo, size, prot);
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index d0e6c4910b..2c7506caaf 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -85,6 +85,7 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
 void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
 uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
 void *xe_bo_map(int fd, uint32_t bo, size_t size);
+void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, long unsigned int addr);
 void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot);
 int __xe_exec(int fd, struct drm_xe_exec *exec);
 void xe_exec(int fd, struct drm_xe_exec *exec);
diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
new file mode 100644
index 0000000000..7b85f85e5e
--- /dev/null
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -0,0 +1,1281 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: Basic tests for execbuf functionality using system allocator
+ * Category: Hardware building block
+ * Sub-category: execbuf
+ * Functionality: fault mode, system allocator
+ * GPU requirements: GPU needs support for DRM_XE_VM_CREATE_FLAG_FAULT_MODE
+ */
+
+#include <fcntl.h>
+#include <linux/mman.h>
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include <string.h>
+
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+#define QUARTER_SEC		MS_TO_NS(250)
+#define FIVE_SEC		MS_TO_NS(5000)
+
+struct batch_data {
+	uint32_t batch[16];
+	uint64_t pad;
+	uint32_t data;
+	uint32_t expected_data;
+};
+
+#define WRITE_VALUE(data__, i__)	({		\
+	(data__)->expected_data = rand() << 12 | (i__);	\
+	(data__)->expected_data;			\
+})
+#define READ_VALUE(data__, i__)	((data__)->expected_data)
+
+static void write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wdata,
+			int *idx)
+{
+	batch[(*idx)++] = MI_STORE_DWORD_IMM_GEN4;
+	batch[(*idx)++] = sdi_addr;
+	batch[(*idx)++] = sdi_addr >> 32;
+	batch[(*idx)++] = wdata;
+	batch[(*idx)++] = MI_BATCH_BUFFER_END;
+}
+
+static void check_all_pages(void *ptr, uint64_t alloc_size, uint64_t stride)
+{
+	int i, n_writes = alloc_size / stride;
+
+	for (i = 0; i < n_writes; ++i) {
+		struct batch_data *data = ptr + i * stride;
+
+		igt_assert_eq(data->data, READ_VALUE(data, i));
+	}
+}
+
+static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
+			    uint64_t alloc_size, uint64_t stride)
+{
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 0,
+		.exec_queue_id = exec_queue,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint64_t addr = to_user_pointer(ptr);
+	int i, ret, n_writes = alloc_size / stride;
+	u64 *exec_ufence = NULL;
+	int64_t timeout = FIVE_SEC;
+
+	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
+			   PROT_WRITE, MAP_SHARED |
+			   MAP_ANONYMOUS, -1, 0);
+	igt_assert(exec_ufence != MAP_FAILED);
+	memset(exec_ufence, 0, SZ_4K);
+	sync[0].addr = to_user_pointer(exec_ufence);
+
+	for (i = 0; i < n_writes; ++i, addr += stride) {
+		struct batch_data *data = ptr + i * stride;
+		uint64_t sdi_offset = (char *)&data->data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int b = 0;
+
+		write_dword(data->batch, sdi_addr, WRITE_VALUE(data, i), &b);
+		igt_assert(b <= ARRAY_SIZE(data->batch));
+	}
+
+	addr = to_user_pointer(ptr);
+	for (i = 0; i < n_writes; ++i, addr += stride) {
+		struct batch_data *data = ptr + i * stride;
+		uint64_t batch_offset = (char *)&data->batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+
+		exec.address = batch_addr;
+		if (i + 1 == n_writes)
+			exec.num_syncs = 1;
+		xe_exec(fd, &exec);
+	}
+
+	ret = __xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, exec_queue,
+			       &timeout);
+	if (ret) {
+		printf("FAIL EXEC_UFENCE: 0x%016llx\n", sync[0].addr);
+
+		addr = to_user_pointer(ptr);
+		for (i = 0; i < n_writes; ++i, addr += stride) {
+			struct batch_data *data = ptr + i * stride;
+			uint64_t batch_offset = (char *)&data->batch - (char *)data;
+			uint64_t batch_addr = addr + batch_offset;
+			uint64_t sdi_offset = (char *)&data->data - (char *)data;
+			uint64_t sdi_addr = addr + sdi_offset;
+
+			printf("FAIL BATCH_ADDR: 0x%016lx\n", batch_addr);
+			printf("FAIL SDI_ADDR: 0x%016lx\n", sdi_addr);
+			printf("FAIL SDI_ADDR (in batch): 0x%016lx\n",
+			       (((u64)data->batch[2]) << 32) | data->batch[1]);
+		}
+		igt_assert_eq(ret, 0);
+	}
+	munmap(exec_ufence, SZ_4K);
+}
+
+#define bind_system_allocator(__sync, __num_sync)			\
+	__xe_vm_bind_assert(fd, vm, 0,					\
+			    0, 0, 0, 0x1ull << 56,			\
+			    DRM_XE_VM_BIND_OP_MAP,			\
+			    DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR,	\
+			    (__sync), (__num_sync), 0, 0)
+
+#define unbind_system_allocator()			\
+	__xe_vm_bind(fd, vm, 0, 0, 0, 0, 0x1ull << 56,	\
+		     DRM_XE_VM_BIND_OP_UNMAP, 0,	\
+		     NULL, 0, 0, 0, 0)
+
+#define odd(__i)	(__i & 1)
+
+#define MIX_BO_ALLOC	(0x1 << 0)
+
+#define SYNC_FILE	"/tmp/xe_exec_system_allocator_sync"
+
+struct process_data {
+	pthread_mutex_t mutex;
+	pthread_cond_t cond;
+	pthread_barrier_t barrier;
+	bool go;
+};
+
+/**
+ * SUBTEST: unaligned-alloc
+ * Description: allocate unaligned sizes of memory
+ * Test category: functionality test
+ *
+ * SUBTEST: evict-malloc
+ * Description: trigger eviction of VRAM allocated via malloc
+ * Test category: functionality test
+ *
+ * SUBTEST: evict-malloc-mix-bo
+ * Description: trigger eviction of VRAM allocated via malloc and BO create
+ * Test category: functionality test
+ *
+ * SUBTEST: processes-evict-malloc
+ * Description: multi-process trigger eviction of VRAM allocated via malloc
+ * Test category: stress test
+ *
+ * SUBTEST: processes-evict-malloc-mix-bo
+ * Description: multi-process trigger eviction of VRAM allocated via malloc and BO create
+ * Test category: stress test
+ */
+
+static void
+evict(int fd, struct drm_xe_engine_class_instance *eci, uint64_t total_alloc,
+      uint64_t alloc_size, uint64_t stride, pthread_barrier_t *barrier,
+      unsigned int flags)
+{
+	uint32_t vm, exec_queue;
+	int num_allocs = (9 * (total_alloc / alloc_size)) / 8;
+	void **allocs;
+	uint32_t *bos = NULL;
+	int i;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+
+	bind_system_allocator(NULL, 0);
+
+	allocs = malloc(sizeof(*allocs) * num_allocs);
+	igt_assert(allocs);
+	memset(allocs, 0, sizeof(*allocs) * num_allocs);
+
+	if (flags & MIX_BO_ALLOC) {
+		bos = malloc(sizeof(*bos) * num_allocs);
+		igt_assert(bos);
+		memset(bos, 0, sizeof(*bos) * num_allocs);
+	}
+
+	for (i = 0; i < num_allocs; ++i) {
+		void *alloc;
+
+		alloc = aligned_alloc(SZ_2M, alloc_size);
+		igt_assert(alloc);
+
+		if (flags & MIX_BO_ALLOC && odd(i)) {
+			uint32_t bo_flags =
+				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
+
+			bos[i] = xe_bo_create(fd, vm, alloc_size,
+					      vram_if_possible(fd, eci->gt_id),
+					      bo_flags);
+			alloc = xe_bo_map_fixed(fd, bos[i], alloc_size,
+						to_user_pointer(alloc));
+			xe_vm_bind_async(fd, vm, 0, bos[i], 0,
+					 to_user_pointer(alloc),
+					 alloc_size, 0, 0);
+		}
+		allocs[i] = alloc;
+
+		touch_all_pages(fd, exec_queue, allocs[i], alloc_size, stride);
+	}
+
+	if (barrier)
+		pthread_barrier_wait(barrier);
+
+	for (i = 0; i < num_allocs; ++i) {
+		check_all_pages(allocs[i], alloc_size, stride);
+		if (bos && bos[i]) {
+			munmap(allocs[i], alloc_size);
+			gem_close(fd, bos[i]);
+		} else {
+			free(allocs[i]);
+		}
+	}
+	if (bos)
+		free(bos);
+	free(allocs);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
+static void wait_pdata(struct process_data *pdata)
+{
+	pthread_mutex_lock(&pdata->mutex);
+	while (!pdata->go)
+		pthread_cond_wait(&pdata->cond, &pdata->mutex);
+	pthread_mutex_unlock(&pdata->mutex);
+}
+
+static void process_evict(struct drm_xe_engine_class_instance *hwe,
+			  uint64_t total_alloc, uint64_t alloc_size,
+			  uint64_t stride, unsigned int flags)
+{
+	struct process_data *pdata;
+	int map_fd;
+	int fd;
+
+	map_fd = open(SYNC_FILE, O_RDWR, 0x666);
+	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
+		     PROT_WRITE, MAP_SHARED, map_fd, 0);
+	wait_pdata(pdata);
+
+	fd = drm_open_driver(DRIVER_XE);
+	evict(fd, hwe, total_alloc, alloc_size, stride, &pdata->barrier,
+	      flags);
+	drm_close_driver(fd);
+
+	close(map_fd);
+	munmap(pdata, sizeof(*pdata));
+}
+
+static void init_pdata(struct process_data *pdata, int n_engine)
+{
+	pthread_mutexattr_t mutex_attr;
+	pthread_condattr_t cond_attr;
+	pthread_barrierattr_t barrier_attr;
+
+	pthread_mutexattr_init(&mutex_attr);
+	pthread_mutexattr_setpshared(&mutex_attr, PTHREAD_PROCESS_SHARED);
+	pthread_mutex_init(&pdata->mutex, &mutex_attr);
+
+	pthread_condattr_init(&cond_attr);
+	pthread_condattr_setpshared(&cond_attr, PTHREAD_PROCESS_SHARED);
+	pthread_cond_init(&pdata->cond, &cond_attr);
+
+	pthread_barrierattr_init(&barrier_attr);
+	pthread_barrierattr_setpshared(&barrier_attr, PTHREAD_PROCESS_SHARED);
+	pthread_barrier_init(&pdata->barrier, &barrier_attr, n_engine);
+
+	pdata->go = false;
+}
+
+static void signal_pdata(struct process_data *pdata)
+{
+	pthread_mutex_lock(&pdata->mutex);
+	pdata->go = true;
+	pthread_cond_broadcast(&pdata->cond);
+	pthread_mutex_unlock(&pdata->mutex);
+}
+
+static void
+processes_evict(int fd, uint64_t alloc_size, uint64_t stride,
+		unsigned int flags)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct process_data *pdata;
+	int n_engine_gt[2] = { 0, 0 }, n_engine = 0;
+	int map_fd;
+
+	map_fd = open(SYNC_FILE, O_RDWR | O_CREAT, 0x666);
+	posix_fallocate(map_fd, 0, sizeof(*pdata));
+	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
+		     PROT_WRITE, MAP_SHARED, map_fd, 0);
+
+	xe_for_each_engine(fd, hwe) {
+		igt_assert(hwe->gt_id < 2);
+		n_engine_gt[hwe->gt_id]++;
+		n_engine++;
+	}
+
+	init_pdata(pdata, n_engine);
+
+	xe_for_each_engine(fd, hwe) {
+		igt_fork(child, 1)
+			process_evict(hwe,
+				      xe_visible_vram_size(fd, hwe->gt_id) /
+				      n_engine_gt[hwe->gt_id], alloc_size,
+				      stride, flags);
+	}
+
+	signal_pdata(pdata);
+	igt_waitchildren();
+
+	close(map_fd);
+	munmap(pdata, sizeof(*pdata));
+}
+
+#define CPU_FAULT	(0x1 << 0)
+#define REMAP		(0x1 << 1)
+#define MIDDLE		(0x1 << 2)
+
+/**
+ * SUBTEST: partial-munmap-cpu-fault
+ * Description: munmap partially with cpu access in between
+ * Test category: functionality test
+ *
+ * SUBTEST: partial-munmap-no-cpu-fault
+ * Description: munmap partially with no cpu access in between
+ * Test category: functionality test
+ *
+ * SUBTEST: partial-remap-cpu-fault
+ * Description: remap partially with cpu access in between
+ * Test category: functionality test
+ *
+ * SUBTEST: partial-remap-no-cpu-fault
+ * Description: remap partially with no cpu access in between
+ * Test category: functionality test
+ *
+ * SUBTEST: partial-middle-munmap-cpu-fault
+ * Description: munmap middle with cpu access in between
+ * Test category: functionality test
+ *
+ * SUBTEST: partial-middle-munmap-no-cpu-fault
+ * Description: munmap middle with no cpu access in between
+ * Test category: functionality test
+ *
+ * SUBTEST: partial-middle-remap-cpu-fault
+ * Description: remap middle with cpu access in between
+ * Test category: functionality test
+ *
+ * SUBTEST: partial-middle-remap-no-cpu-fault
+ * Description: remap middle with no cpu access in between
+ * Test category: functionality test
+ */
+
+static void
+partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
+{
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	          .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+		uint32_t data;
+		uint32_t expected_data;
+	} *data;
+	size_t bo_size = SZ_2M, unmap_offset = 0;
+	uint32_t vm, exec_queue;
+	u64 *exec_ufence = NULL;
+	int i;
+	void *old, *new = NULL;
+
+	if (flags & MIDDLE)
+		unmap_offset = bo_size / 4;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+
+	data = aligned_alloc(bo_size, bo_size);
+	igt_assert(data);
+
+	data = mmap(data, bo_size, PROT_READ | PROT_WRITE,
+		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
+	igt_assert(data != MAP_FAILED);
+	memset(data, 0, bo_size);
+	old = data;
+
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	bind_system_allocator(sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
+	data[0].vm_sync = 0;
+
+	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
+			   PROT_WRITE, MAP_SHARED |
+			   MAP_ANONYMOUS, -1, 0);
+	igt_assert(exec_ufence != MAP_FAILED);
+	memset(exec_ufence, 0, SZ_4K);
+
+	for (i = 0; i < 2; i++) {
+		uint64_t addr = to_user_pointer(data);
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int b = 0;
+
+		write_dword(data[i].batch, sdi_addr, WRITE_VALUE(&data[i], i), &b);
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		if (!i)
+			data = old + unmap_offset + bo_size / 2;
+	}
+
+	data = old;
+	exec.exec_queue_id = exec_queue;
+
+	for (i = 0; i < 2; i++) {
+		uint64_t addr = to_user_pointer(data);
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+
+		sync[0].addr = new ? to_user_pointer(new) :
+			to_user_pointer(exec_ufence);
+		exec.address = batch_addr;
+		xe_exec(fd, &exec);
+
+		xe_wait_ufence(fd, new ?: exec_ufence, USER_FENCE_VALUE,
+			       exec_queue, FIVE_SEC);
+		if (i || (flags & CPU_FAULT))
+			igt_assert_eq(data[i].data, READ_VALUE(&data[i], i));
+		exec_ufence[0] = 0;
+
+		if (!i) {
+			data = old + unmap_offset + bo_size / 2;
+			munmap(old + unmap_offset, bo_size / 2);
+			if (flags & REMAP) {
+				new = mmap(old + unmap_offset, bo_size / 2,
+					   PROT_READ | PROT_WRITE,
+					   MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED |
+					   MAP_LOCKED, -1, 0);
+				igt_assert(new != MAP_FAILED);
+			}
+		}
+	}
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	munmap(exec_ufence, SZ_4K);
+	munmap(old, bo_size);
+	if (new)
+		munmap(new, bo_size / 2);
+	xe_vm_destroy(fd, vm);
+}
+
+#define MAX_N_EXEC_QUEUES	16
+
+#define MMAP		(0x1 << 0)
+#define NEW		(0x1 << 1)
+#define BO_UNMAP	(0x1 << 2)
+#define FREE		(0x1 << 3)
+#define BUSY		(0x1 << 4)
+#define BO_MAP		(0x1 << 5)
+#define RACE		(0x1 << 6)
+#define SKIP_MEMSET	(0x1 << 7)
+#define FAULT		(0x1 << 8)
+#define FILE_BACKED	(0x1 << 9)
+#define LOCK		(0x1 << 10)
+#define MMAP_SHARED	(0x1 << 11)
+#define HUGE_PAGE	(0x1 << 12)
+
+/**
+ * SUBTEST: once-%s
+ * Description: Run %arg[1] system allocator test only once
+ * Test category: functionality test
+ *
+ * SUBTEST: twice-%s
+ * Description: Run %arg[1] system allocator test twice
+ * Test category: functionality test
+ *
+ * SUBTEST: many-%s
+ * Description: Run %arg[1] system allocator test many times
+ * Test category: stress test
+ *
+ * SUBTEST: many-stride-%s
+ * Description: Run %arg[1] system allocator test many times with a stride on each exec
+ * Test category: stress test
+ *
+ * SUBTEST: many-execqueues-%s
+ * Description: Run %arg[1] system allocator test on many exec_queues
+ * Test category: stress test
+ *
+ * SUBTEST: many-large-%s
+ * Description: Run %arg[1] system allocator test many times with large allocations
+ * Test category: stress test
+ *
+ * SUBTEST: many-large-execqueues-%s
+ * Description: Run %arg[1] system allocator test on many exec_queues with large allocations
+ *
+ * SUBTEST: threads-many-%s
+ * Description: Run %arg[1] system allocator threaded test many times
+ * Test category: stress test
+ *
+ * SUBTEST: threads-many-stride-%s
+ * Description: Run %arg[1] system allocator threaded test many times with a stride on each exec
+ * Test category: stress test
+ *
+ * SUBTEST: threads-many-execqueues-%s
+ * Description: Run %arg[1] system allocator threaded test on many exec_queues
+ * Test category: stress test
+ *
+ * SUBTEST: threads-many-large-%s
+ * Description: Run %arg[1] system allocator threaded test many times with large allocations
+ * Test category: stress test
+ *
+ * SUBTEST: threads-many-large-execqueues-%s
+ * Description: Run %arg[1] system allocator threaded test on many exec_queues with large allocations
+ *
+ * SUBTEST: threads-shared-vm-many-%s
+ * Description: Run %arg[1] system allocator threaded, shared vm test many times
+ * Test category: stress test
+ *
+ * SUBTEST: threads-shared-vm-many-stride-%s
+ * Description: Run %arg[1] system allocator threaded, shared vm test many times with a stride on each exec
+ * Test category: stress test
+ *
+ * SUBTEST: threads-shared-vm-many-execqueues-%s
+ * Description: Run %arg[1] system allocator threaded, shared vm test on many exec_queues
+ * Test category: stress test
+ *
+ * SUBTEST: threads-shared-vm-many-large-%s
+ * Description: Run %arg[1] system allocator threaded, shared vm test many times with large allocations
+ * Test category: stress test
+ *
+ * SUBTEST: threads-shared-vm-many-large-execqueues-%s
+ * Description: Run %arg[1] system allocator threaded, shared vm test on many exec_queues with large allocations
+ * Test category: stress test
+ *
+ * SUBTEST: process-many-%s
+ * Description: Run %arg[1] system allocator multi-process test many times
+ * Test category: stress test
+ *
+ * SUBTEST: process-many-stride-%s
+ * Description: Run %arg[1] system allocator multi-process test many times with a stride on each exec
+ * Test category: stress test
+ *
+ * SUBTEST: process-many-execqueues-%s
+ * Description: Run %arg[1] system allocator multi-process test on many exec_queues
+ * Test category: stress test
+ *
+ * SUBTEST: process-many-large-%s
+ * Description: Run %arg[1] system allocator multi-process test many times with large allocations
+ * Test category: stress test
+ *
+ * SUBTEST: process-many-large-execqueues-%s
+ * Description: Run %arg[1] system allocator multi-process test on many exec_queues with large allocations
+ *
+ * SUBTEST: fault
+ * Description: use a bad system allocator address resulting in a fault
+ * Test category: bad input
+ *
+ * arg[1]:
+ *
+ * @malloc:				malloc single buffer for all execs
+ * @malloc-mlock:			malloc and mlock single buffer for all execs
+ * @malloc-race:			malloc single buffer for all execs with race between cpu and gpu access
+ * @malloc-bo-unmap:			malloc single buffer for all execs, bind and unbind a BO to same address before execs
+ * @malloc-busy:			malloc single buffer for all execs, try to unbind while buffer valid
+ * @mmap:				mmap single buffer for all execs
+ * @mmap-huge:				mmap huge page single buffer for all execs
+ * @mmap-shared:			mmap shared single buffer for all execs
+ * @mmap-mlock:				mmap and mlock single buffer for all execs
+ * @mmap-file:				mmap single buffer, with file backing, for all execs
+ * @mmap-file-mlock:			mmap and mlock single buffer, with file backing, for all execs
+ * @mmap-race:				mmap single buffer for all execs with race between cpu and gpu access
+ * @free:				malloc and free buffer for each exec
+ * @free-race:				malloc and free buffer for each exec with race between cpu and gpu access
+ * @new:				malloc a new buffer for each exec
+ * @new-race:				malloc a new buffer for each exec with race between cpu and gpu access
+ * @new-bo-map:				malloc a new buffer or map BO for each exec
+ * @new-busy:				malloc a new buffer for each exec, try to unbind while buffers valid
+ * @mmap-free:				mmap and free buffer for each exec
+ * @mmap-free-huge:			mmap huge page and free buffer for each exec
+ * @mmap-free-race:			mmap and free buffer for each exec with race between cpu and gpu access
+ * @mmap-new:				mmap a new buffer for each exec
+ * @mmap-new-huge:			mmap huge page a new buffer for each exec
+ * @mmap-new-race:			mmap a new buffer for each exec with race between cpu and gpu access
+ * @malloc-nomemset:			malloc single buffer for all execs, skip memset of buffers
+ * @malloc-mlock-nomemset:		malloc and mlock single buffer for all execs, skip memset of buffers
+ * @malloc-race-nomemset:		malloc single buffer for all execs with race between cpu and gpu access, skip memset of buffers
+ * @malloc-bo-unmap-nomemset:		malloc single buffer for all execs, bind and unbind a BO to same address before execs, skip memset of buffers
+ * @malloc-busy-nomemset:		malloc single buffer for all execs, try to unbind while buffer valid, skip memset of buffers
+ * @mmap-nomemset:			mmap single buffer for all execs, skip memset of buffers
+ * @mmap-huge-nomemset:			mmap huge page single buffer for all execs, skip memset of buffers
+ * @mmap-shared-nomemset:		mmap shared single buffer for all execs, skip memset of buffers
+ * @mmap-mlock-nomemset:		mmap and mlock single buffer for all execs, skip memset of buffers
+ * @mmap-file-nomemset:			mmap single buffer, with file backing, for all execs, skip memset of buffers
+ * @mmap-file-mlock-nomemset:		mmap and mlock single buffer, with file backing, for all execs, skip memset of buffers
+ * @mmap-race-nomemset:			mmap single buffer for all execs with race between cpu and gpu access, skip memset of buffers
+ * @free-nomemset:			malloc and free buffer for each exec, skip memset of buffers
+ * @free-race-nomemset:			malloc and free buffer for each exec with race between cpu and gpu access, skip memset of buffers
+ * @new-nomemset:			malloc a new buffer for each exec, skip memset of buffers
+ * @new-race-nomemset:			malloc a new buffer for each exec with race between cpu and gpu access, skip memset of buffers
+ * @new-bo-map-nomemset:		malloc a new buffer or map BO for each exec, skip memset of buffers
+ * @new-busy-nomemset:			malloc a new buffer for each exec, try to unbind while buffers valid, skip memset of buffers
+ * @mmap-free-nomemset:			mmap and free buffer for each exec, skip memset of buffers
+ * @mmap-free-huge-nomemset:		mmap huge page and free buffer for each exec, skip memset of buffers
+ * @mmap-free-race-nomemset:		mmap and free buffer for each exec with race between cpu and gpu access, skip memset of buffers
+ * @mmap-new-nomemset:			mmap a new buffer for each exec, skip memset of buffers
+ * @mmap-new-huge-nomemset:		mmap huge page new buffer for each exec, skip memset of buffers
+ * @mmap-new-race-nomemset:		mmap a new buffer for each exec with race between cpu and gpu access, skip memset of buffers
+ */
+
+static void
+test_exec(int fd, struct drm_xe_engine_class_instance *eci,
+	  int n_exec_queues, int n_execs, size_t bo_size,
+	  size_t stride, uint32_t vm, unsigned int flags)
+{
+	uint64_t addr;
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	          .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+		uint32_t data;
+		uint32_t expected_data;
+	} *data;
+	uint32_t bo_flags;
+	uint32_t bo = 0;
+	void **pending_free;
+	u64 *exec_ufence = NULL;
+	int i, b, file_fd = -1;
+	bool free_vm = false;
+	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
+
+	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
+
+	if (flags & NEW && !(flags & FREE)) {
+		pending_free = malloc(sizeof(*pending_free) * n_execs);
+		igt_assert(pending_free);
+		memset(pending_free, 0, sizeof(*pending_free) * n_execs);
+	}
+
+	if (!vm) {
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+		free_vm = true;
+	}
+	if (!bo_size) {
+		if (!stride) {
+			bo_size = sizeof(*data) * n_execs;
+			bo_size = xe_bb_size(fd, bo_size);
+		} else {
+			bo_size = stride * n_execs * sizeof(*data);
+			bo_size = xe_bb_size(fd, bo_size);
+		}
+	}
+	if (flags & HUGE_PAGE) {
+		aligned_size = ALIGN(aligned_size, SZ_2M);
+		bo_size = ALIGN(bo_size, SZ_2M);
+	}
+
+	data = aligned_alloc(aligned_size, bo_size);
+	igt_assert(data);
+	if (flags & MMAP) {
+		int mmap_flags = MAP_FIXED;
+
+		if (flags & MMAP_SHARED)
+			mmap_flags |= MAP_SHARED;
+		else
+			mmap_flags |= MAP_PRIVATE;
+
+		if (flags & HUGE_PAGE)
+			mmap_flags |= MAP_HUGETLB | MAP_HUGE_2MB;
+
+		if (flags & FILE_BACKED) {
+			char name[1024];
+
+			igt_assert(!(flags & NEW));
+
+			sprintf(name, "/tmp/xe_exec_system_allocator_dat%d\n",
+				getpid());
+			file_fd = open(name, O_RDWR | O_CREAT, 0x666);
+			posix_fallocate(file_fd, 0, bo_size);
+		} else {
+			mmap_flags |= MAP_ANONYMOUS;
+		}
+
+		data = mmap(data, bo_size, PROT_READ |
+			    PROT_WRITE, mmap_flags, file_fd, 0);
+		igt_assert(data != MAP_FAILED);
+	}
+	if (!(flags & SKIP_MEMSET))
+		memset(data, 0, bo_size);
+	if (flags & LOCK) {
+		igt_assert(!(flags & NEW));
+		mlock(data, bo_size);
+	}
+
+	for (i = 0; i < n_exec_queues; i++)
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	if (free_vm) {
+		bind_system_allocator(sync, 1);
+		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
+	}
+	data[0].vm_sync = 0;
+
+	addr = to_user_pointer(data);
+
+	if (flags & BO_UNMAP) {
+		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
+		bo = xe_bo_create(fd, vm, bo_size,
+				  vram_if_possible(fd, eci->gt_id), bo_flags);
+		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, 0, 0);
+
+		__xe_vm_bind_assert(fd, vm, 0,
+				    0, 0, addr, bo_size,
+				    DRM_XE_VM_BIND_OP_MAP,
+				    DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR, sync,
+				    1, 0, 0);
+		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
+			       FIVE_SEC);
+		data[0].vm_sync = 0;
+		gem_close(fd, bo);
+		bo = 0;
+	}
+
+	if (!(flags & RACE)) {
+		exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
+				   PROT_WRITE, MAP_SHARED |
+				   MAP_ANONYMOUS, -1, 0);
+		igt_assert(exec_ufence != MAP_FAILED);
+		memset(exec_ufence, 0, SZ_4K);
+	}
+
+	for (i = 0; i < n_execs; i++) {
+		int idx = !stride ? i : i * stride;
+		uint64_t batch_offset = (char *)&data[idx].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[idx].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int e = i % n_exec_queues, err;
+		bool fault_inject = (FAULT & flags) && i == n_execs / 2;
+		bool fault_injected = (FAULT & flags) && i > n_execs;
+
+		b = 0;
+		write_dword(data[idx].batch, sdi_addr,
+			    WRITE_VALUE(&data[idx], idx), &b);
+		igt_assert(b <= ARRAY_SIZE(data[idx].batch));
+
+		if (!exec_ufence)
+			data[idx].exec_sync = 0;
+
+		sync[0].addr = exec_ufence ? to_user_pointer(exec_ufence) :
+			addr + (char *)&data[idx].exec_sync - (char *)data;
+
+		exec.exec_queue_id = exec_queues[e];
+		if (fault_inject)
+			exec.address = batch_addr * 2;
+		else
+			exec.address = batch_addr;
+
+		if (fault_injected) {
+			err = __xe_exec(fd, &exec);
+			igt_assert(err == -ENOENT);
+		} else {
+			xe_exec(fd, &exec);
+		}
+
+		if (fault_inject || fault_injected) {
+			int64_t timeout = QUARTER_SEC;
+
+			err = __xe_wait_ufence(fd, exec_ufence ? exec_ufence :
+					       &data[idx].exec_sync,
+					       USER_FENCE_VALUE,
+					       exec_queues[e], &timeout);
+			igt_assert(err == -ETIME || err == -EIO);
+		} else {
+			xe_wait_ufence(fd, exec_ufence ? exec_ufence :
+				       &data[idx].exec_sync, USER_FENCE_VALUE,
+				       exec_queues[e], FIVE_SEC);
+			igt_assert_eq(data[idx].data,
+				      READ_VALUE(&data[idx], idx));
+		}
+
+		if (exec_ufence)
+			exec_ufence[0] = 0;
+
+		if (bo) {
+			__xe_vm_bind_assert(fd, vm, 0,
+					    0, 0, addr, bo_size,
+					    DRM_XE_VM_BIND_OP_MAP,
+					    DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR,
+					    NULL, 0, 0, 0);
+			munmap(data, bo_size);
+			gem_close(fd, bo);
+		}
+
+		if (flags & NEW) {
+			if (flags & MMAP) {
+				if (flags & FREE)
+					munmap(data, bo_size);
+				else
+					pending_free[i] = data;
+				data = mmap(NULL, bo_size, PROT_READ |
+					    PROT_WRITE, MAP_SHARED |
+					    MAP_ANONYMOUS, -1, 0);
+				igt_assert(data != MAP_FAILED);
+			} else if (flags & BO_MAP && (i % 2)) {
+				if (!bo) {
+					if (flags & FREE)
+						free(data);
+					else
+						pending_free[i] = data;
+				}
+				data = aligned_alloc(aligned_size, bo_size);
+				bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
+				bo = xe_bo_create(fd, vm, bo_size,
+						  vram_if_possible(fd, eci->gt_id),
+						  bo_flags);
+				data = xe_bo_map_fixed(fd, bo, bo_size,
+						       to_user_pointer(data));
+
+				xe_vm_bind_async(fd, vm, 0, bo, 0,
+						 to_user_pointer(data),
+						 bo_size, 0, 0);
+			} else {
+				if (!bo) {
+					if (flags & FREE)
+						free(data);
+					else
+						pending_free[i] = data;
+				}
+				bo = 0;
+				data = aligned_alloc(aligned_size, bo_size);
+				igt_assert(data);
+			}
+			addr = to_user_pointer(data);
+			if (!(flags & SKIP_MEMSET))
+				memset(data, 0, bo_size);
+		}
+	}
+
+	if (bo) {
+		__xe_vm_bind_assert(fd, vm, 0,
+				    0, 0, addr, bo_size,
+				    DRM_XE_VM_BIND_OP_MAP,
+				    DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR,
+				    NULL, 0, 0, 0);
+		munmap(data, bo_size);
+		gem_close(fd, bo);
+	}
+
+	if (flags & BUSY)
+		igt_assert_eq(unbind_system_allocator(), -EBUSY);
+
+	for (i = 0; i < n_exec_queues; i++)
+		xe_exec_queue_destroy(fd, exec_queues[i]);
+
+	if (exec_ufence)
+		munmap(exec_ufence, SZ_4K);
+
+	if (flags & LOCK)
+		munlock(data, bo_size);
+
+	if (file_fd != -1)
+		close(file_fd);
+
+	if (flags & NEW && !(flags & FREE)) {
+		for (i = 0; i < n_execs; i++) {
+			if (!pending_free[i])
+				continue;
+
+			if (flags & MMAP)
+				munmap(pending_free[i], bo_size);
+			else
+				free(pending_free[i]);
+		}
+		free(pending_free);
+	} else {
+		if (flags & MMAP)
+			munmap(data, bo_size);
+		else
+			free(data);
+	}
+	if (free_vm)
+		xe_vm_destroy(fd, vm);
+}
+
+struct thread_data {
+	pthread_t thread;
+	pthread_mutex_t *mutex;
+	pthread_cond_t *cond;
+	int fd;
+	struct drm_xe_engine_class_instance *eci;
+	int n_exec_queues;
+	int n_execs;
+	size_t bo_size;
+	size_t stride;
+	uint32_t vm;
+	unsigned int flags;
+	bool *go;
+};
+
+static void *thread(void *data)
+{
+	struct thread_data *t = data;
+
+	pthread_mutex_lock(t->mutex);
+	while (!*t->go)
+		pthread_cond_wait(t->cond, t->mutex);
+	pthread_mutex_unlock(t->mutex);
+
+	test_exec(t->fd, t->eci, t->n_exec_queues, t->n_execs,
+		  t->bo_size, t->stride, t->vm, t->flags);
+
+	return NULL;
+}
+
+static void
+threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
+	size_t stride, unsigned int flags, bool shared_vm)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct thread_data *threads_data;
+	int n_engines = 0, i = 0;
+	pthread_mutex_t mutex;
+	pthread_cond_t cond;
+	uint32_t vm = 0;
+	bool go = false;
+
+	if (FILE_BACKED & flags)
+		return;
+
+	if (shared_vm) {
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+		bind_system_allocator(NULL, 0);
+	}
+
+	xe_for_each_engine(fd, hwe)
+		++n_engines;
+
+	threads_data = calloc(n_engines, sizeof(*threads_data));
+	igt_assert(threads_data);
+
+	pthread_mutex_init(&mutex, 0);
+	pthread_cond_init(&cond, 0);
+
+	xe_for_each_engine(fd, hwe) {
+		threads_data[i].mutex = &mutex;
+		threads_data[i].cond = &cond;
+		threads_data[i].fd = fd;
+		threads_data[i].eci = hwe;
+		threads_data[i].n_exec_queues = n_exec_queues;
+		threads_data[i].n_execs = n_execs;
+		threads_data[i].bo_size = bo_size;
+		threads_data[i].stride = stride;
+		threads_data[i].vm = vm;
+		threads_data[i].flags = flags;
+		threads_data[i].go = &go;
+		pthread_create(&threads_data[i].thread, 0, thread,
+			       &threads_data[i]);
+		++i;
+	}
+
+	pthread_mutex_lock(&mutex);
+	go = true;
+	pthread_cond_broadcast(&cond);
+	pthread_mutex_unlock(&mutex);
+
+	for (i = 0; i < n_engines; ++i)
+		pthread_join(threads_data[i].thread, NULL);
+
+	if (shared_vm) {
+		int ret;
+
+		if (flags & MMAP) {
+			int tries = 300;
+
+			while (tries && (ret = unbind_system_allocator()) == -EBUSY) {
+				sleep(.01);
+				--tries;
+			}
+			igt_assert_eq(ret, 0);
+		}
+		xe_vm_destroy(fd, vm);
+	}
+	free(threads_data);
+}
+
+static void process(struct drm_xe_engine_class_instance *hwe, int n_exec_queues,
+		    int n_execs, size_t bo_size, size_t stride,
+		    unsigned int flags)
+{
+	struct process_data *pdata;
+	int map_fd;
+	int fd;
+
+	map_fd = open(SYNC_FILE, O_RDWR, 0x666);
+	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
+		     PROT_WRITE, MAP_SHARED, map_fd, 0);
+	wait_pdata(pdata);
+
+	fd = drm_open_driver(DRIVER_XE);
+	test_exec(fd, hwe, n_exec_queues, n_execs,
+		  bo_size, stride, 0, flags);
+	drm_close_driver(fd);
+
+	close(map_fd);
+	munmap(pdata, sizeof(*pdata));
+}
+
+static void
+processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
+	  size_t stride, unsigned int flags)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct process_data *pdata;
+	int map_fd;
+
+	map_fd = open(SYNC_FILE, O_RDWR | O_CREAT, 0x666);
+	posix_fallocate(map_fd, 0, sizeof(*pdata));
+	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
+		     PROT_WRITE, MAP_SHARED, map_fd, 0);
+
+	init_pdata(pdata, 0);
+
+	xe_for_each_engine(fd, hwe) {
+		igt_fork(child, 1)
+			process(hwe, n_exec_queues, n_execs, bo_size,
+				stride, flags);
+	}
+
+	signal_pdata(pdata);
+	igt_waitchildren();
+
+	close(map_fd);
+	munmap(pdata, sizeof(*pdata));
+}
+
+struct section {
+	const char *name;
+	unsigned int flags;
+};
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	const struct section sections[] = {
+		{ "malloc", 0 },
+		{ "malloc-mlock", LOCK },
+		{ "malloc-race", RACE },
+		{ "malloc-busy", BUSY },
+		{ "malloc-bo-unmap", BO_UNMAP },
+		{ "mmap", MMAP },
+		{ "mmap-huge", MMAP | HUGE_PAGE },
+		{ "mmap-shared", MMAP | LOCK | MMAP_SHARED },
+		{ "mmap-mlock", MMAP | LOCK },
+		{ "mmap-file", MMAP | FILE_BACKED },
+		{ "mmap-file-mlock", MMAP | LOCK | FILE_BACKED },
+		{ "mmap-race", MMAP | RACE },
+		{ "free", NEW | FREE },
+		{ "free-race", NEW | FREE | RACE },
+		{ "new", NEW },
+		{ "new-race", NEW | RACE },
+		{ "new-bo-map", NEW | BO_MAP },
+		{ "new-busy", NEW | BUSY },
+		{ "mmap-free", MMAP | NEW | FREE },
+		{ "mmap-free-huge", MMAP | NEW | FREE | HUGE_PAGE },
+		{ "mmap-free-race", MMAP | NEW | FREE | RACE },
+		{ "mmap-new", MMAP | NEW },
+		{ "mmap-new-huge", MMAP | NEW | HUGE_PAGE },
+		{ "mmap-new-race", MMAP | NEW | RACE },
+		{ "malloc-nomemset", SKIP_MEMSET },
+		{ "malloc-mlock-nomemset", SKIP_MEMSET | LOCK },
+		{ "malloc-race-nomemset", SKIP_MEMSET | RACE },
+		{ "malloc-busy-nomemset", SKIP_MEMSET | BUSY },
+		{ "malloc-bo-unmap-nomemset", SKIP_MEMSET | BO_UNMAP },
+		{ "mmap-nomemset", SKIP_MEMSET | MMAP },
+		{ "mmap-huge-nomemset", SKIP_MEMSET | MMAP | HUGE_PAGE },
+		{ "mmap-shared-nomemset", SKIP_MEMSET | MMAP | MMAP_SHARED },
+		{ "mmap-mlock-nomemset", SKIP_MEMSET | MMAP | LOCK },
+		{ "mmap-file-nomemset", SKIP_MEMSET | MMAP | FILE_BACKED },
+		{ "mmap-file-mlock-nomemset", SKIP_MEMSET | MMAP | LOCK | FILE_BACKED },
+		{ "mmap-race-nomemset", SKIP_MEMSET | MMAP | RACE },
+		{ "free-nomemset", SKIP_MEMSET | NEW | FREE },
+		{ "free-race-nomemset", SKIP_MEMSET | NEW | FREE | RACE },
+		{ "new-nomemset", SKIP_MEMSET | NEW },
+		{ "new-race-nomemset", SKIP_MEMSET | NEW | RACE },
+		{ "new-bo-map-nomemset", SKIP_MEMSET | NEW | BO_MAP },
+		{ "new-busy-nomemset", SKIP_MEMSET | NEW | BUSY },
+		{ "mmap-free-nomemset", SKIP_MEMSET | MMAP | NEW | FREE },
+		{ "mmap-free-huge-nomemset", SKIP_MEMSET | MMAP | NEW | FREE | HUGE_PAGE },
+		{ "mmap-free-race-nomemset", SKIP_MEMSET | MMAP | NEW | FREE | RACE },
+		{ "mmap-new-nomemset", SKIP_MEMSET | MMAP | NEW },
+		{ "mmap-new-huge-nomemset", SKIP_MEMSET | MMAP | NEW | HUGE_PAGE },
+		{ "mmap-new-race-nomemset", SKIP_MEMSET | MMAP | NEW | RACE },
+		{ NULL },
+	};
+	const struct section psections[] = {
+		{ "munmap-cpu-fault", CPU_FAULT },
+		{ "munmap-no-cpu-fault", 0 },
+		{ "remap-cpu-fault", CPU_FAULT | REMAP },
+		{ "remap-no-cpu-fault", REMAP },
+		{ "middle-munmap-cpu-fault", MIDDLE | CPU_FAULT },
+		{ "middle-munmap-no-cpu-fault", MIDDLE },
+		{ "middle-remap-cpu-fault", MIDDLE | CPU_FAULT | REMAP },
+		{ "middle-remap-no-cpu-fault", MIDDLE | REMAP },
+		{ NULL },
+	};
+	const struct section esections[] = {
+		{ "malloc", 0 },
+		{ "malloc-mix-bo", MIX_BO_ALLOC },
+		{ NULL },
+	};
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require(xe_supports_faults(fd));
+	}
+
+	for (const struct section *s = sections; s->name; s++) {
+		igt_subtest_f("once-%s", s->name)
+			xe_for_each_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 1, 0, 0, 0, s->flags);
+
+		igt_subtest_f("twice-%s", s->name)
+			xe_for_each_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 2, 0, 0, 0, s->flags);
+
+		igt_subtest_f("many-%s", s->name)
+			xe_for_each_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 128, 0, 0, 0, s->flags);
+
+		igt_subtest_f("many-stride-%s", s->name)
+			xe_for_each_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 128, 0, 256, 0, s->flags);
+
+		igt_subtest_f("many-execqueues-%s", s->name)
+			xe_for_each_engine(fd, hwe)
+				test_exec(fd, hwe, 16, 128, 0, 0, 0, s->flags);
+
+		igt_subtest_f("many-large-%s", s->name)
+			xe_for_each_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 128, SZ_2M, 0, 0, s->flags);
+
+		igt_subtest_f("many-large-execqueues-%s", s->name)
+			xe_for_each_engine(fd, hwe)
+				test_exec(fd, hwe, 16, 128, SZ_2M, 0, 0, s->flags);
+
+		igt_subtest_f("threads-many-%s", s->name)
+			threads(fd, 1, 128, 0, 0, s->flags, false);
+
+		igt_subtest_f("threads-many-stride-%s", s->name)
+			threads(fd, 1, 128, 0, 256, s->flags, false);
+
+		igt_subtest_f("threads-many-execqueues-%s", s->name)
+			threads(fd, 16, 128, 0, 0, s->flags, false);
+
+		igt_subtest_f("threads-many-large-%s", s->name)
+			threads(fd, 1, 128, SZ_2M, 0, s->flags, false);
+
+		igt_subtest_f("threads-many-large-execqueues-%s", s->name)
+			threads(fd, 16, 128, SZ_2M, 0, s->flags, false);
+
+		igt_subtest_f("threads-shared-vm-many-%s", s->name)
+			threads(fd, 1, 128, 0, 0, s->flags, true);
+
+		igt_subtest_f("threads-shared-vm-many-stride-%s", s->name)
+			threads(fd, 1, 128, 0, 256, s->flags, true);
+
+		igt_subtest_f("threads-shared-vm-many-execqueues-%s", s->name)
+			threads(fd, 16, 128, 0, 0, s->flags, true);
+
+		igt_subtest_f("threads-shared-vm-many-large-%s", s->name)
+			threads(fd, 1, 128, SZ_2M, 0, s->flags, true);
+
+		igt_subtest_f("threads-shared-vm-many-large-execqueues-%s", s->name)
+			threads(fd, 16, 128, SZ_2M, 0, s->flags, true);
+
+		igt_subtest_f("process-many-%s", s->name)
+			processes(fd, 1, 128, 0, 0, s->flags);
+
+		igt_subtest_f("process-many-stride-%s", s->name)
+			processes(fd, 1, 128, 0, 256, s->flags);
+
+		igt_subtest_f("process-many-execqueues-%s", s->name)
+			processes(fd, 16, 128, 0, 0, s->flags);
+
+		igt_subtest_f("process-many-large-%s", s->name)
+			processes(fd, 1, 128, SZ_2M, 0, s->flags);
+
+		igt_subtest_f("process-many-large-execqueues-%s", s->name)
+			processes(fd, 16, 128, SZ_2M, 0, s->flags);
+	}
+
+	igt_subtest_f("fault")
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, hwe, 4, 1, SZ_2M, 0, 0, FAULT);
+
+	for (const struct section *s = psections; s->name; s++) {
+		igt_subtest_f("partial-%s", s->name)
+			xe_for_each_engine(fd, hwe)
+				partial(fd, hwe, s->flags);
+	}
+
+	igt_subtest_f("unaligned-alloc")
+		xe_for_each_engine(fd, hwe) {
+			evict(fd, hwe, (SZ_1M + SZ_512K) * 8,
+			      SZ_1M + SZ_512K, SZ_4K, NULL, 0);
+			break;
+		}
+
+	for (const struct section *s = esections; s->name; s++) {
+		igt_subtest_f("evict-%s", s->name)
+			xe_for_each_engine(fd, hwe) {
+				evict(fd, hwe, xe_visible_vram_size(fd, hwe->gt_id),
+				      SZ_8M, SZ_1M, NULL, s->flags);
+				break;
+			}
+	}
+
+	for (const struct section *s = esections; s->name; s++) {
+		igt_subtest_f("processes-evict-%s", s->name)
+			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
+	}
+
+	igt_fixture
+		drm_close_driver(fd);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 65b8bf23b9..0e6e19ae68 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -293,6 +293,7 @@ intel_xe_progs = [
 	'xe_exec_queue_property',
 	'xe_exec_reset',
 	'xe_exec_store',
+	'xe_exec_system_allocator',
 	'xe_exec_threads',
 	'xe_exercise_blt',
 	'xe_gpgpu_fill',
-- 
2.34.1

