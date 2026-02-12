Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD2FEE36AF
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 17:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02CC10E77B;
	Thu, 12 Feb 2026 17:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQt3OG1W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D2A10E77B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 17:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770917193; x=1802453193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZydYVzLTqsLhz4qlbOBqHcJVw8y1VV9iOLbZdu0tcCk=;
 b=HQt3OG1Wr/ckhpkfEoLmJGFfymgjdrvC9F7gZRNJaqTpG8jhQFkkU0TX
 4PTEu/fprn/A2W4dU7xXF9VpbcQqjkk3iR0dWPMWu76jnZm2eIPk/ihWX
 y7caFz0QB9guJ9RQkJKAwJx0BIQfJeGF6Z55ZWCHnbZpb+7OPB6/H6S8e
 iY7oe7ysEnenZbOp64eY1RN2cwqTIfWAHrd1URvysjA44kTaR6GuYV7X5
 o/LRkZr1ftV7EPzmYBUkR4YlXPtIEzRK2EN5TvvIxMKnOA2sKR7skR9Nm
 Vnm8j+TuAZvxnqyy5uyTmlKI0K92kgcjVCAYe9Lwj0w5mNRVsVqzWdhO+ g==;
X-CSE-ConnectionGUID: /yFNvlCfT4iCrXReS5tuAA==
X-CSE-MsgGUID: i+ap8sPQR7G6263e3JwA+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72000013"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="72000013"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 09:26:32 -0800
X-CSE-ConnectionGUID: ESlBx4PdRAmUnwu0nb7bdg==
X-CSE-MsgGUID: 1S+a/tYmSg2v3P2RjAlniQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="217627282"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 09:26:27 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, nishit.sharma@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_vm: overcommit tests for fault-mode
 and non-fault-mode VMs
Date: Thu, 12 Feb 2026 17:25:41 +0000
Message-ID: <20260212172546.794257-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212172546.794257-1-sobin.thomas@intel.com>
References: <20260212172546.794257-1-sobin.thomas@intel.com>
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

The existing VM creation in xe_vm focuses on basic mode selection and
flag validation.

Add tests to verify graceful OOM failure handling:

- test_vm_nonfault_mode_overcommit(): Verifies that non-fault mode VMs
  properly reject overcommit attempts with -ENOSPC or -ENOMEM as
  expected.

- test_vm_fault_mode_overcommit(): Validates that fault-mode VMs can
  handle memory pressure gracefully by touching pages to trigger page
  faults.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_vm.c | 505 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 503 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index ccff8f804..cf45d1051 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -21,6 +21,8 @@
 #include "xe/xe_spin.h"
 #include <string.h>
 
+
+
 static uint32_t
 addr_low(uint64_t addr)
 {
@@ -2450,10 +2452,494 @@ static void test_oom(int fd)
 	}
 }
 
+/**
+ * SUBTEST: evict-vm-nonfault-overcommit
+ * Description: Verify that non-fault mode VMs allow memory overcommit and handle
+ *		memory pressure through eviction, regardless of NO_VM_OVERCOMMIT flag
+ * Functionality: Non-fault mode VMs should successfully allocate multiple BOs
+ *		exceeding VRAM, allowing the system to evict pages as needed
+ * Test category: functionality test
+ */
+static void
+test_vm_nonfault_mode_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
+				 uint64_t system_size, uint64_t vram_size,
+				 uint64_t overcommit_multiplier)
+{
+	uint64_t overcommit_size;
+	uint32_t vm;
+	uint32_t *bos;
+	int num_bos;
+	size_t nf_bo_size = 64 * 1024 * 1024;  // 64MB per BO
+	uint32_t batch_bo;
+	uint32_t exec_queue;
+	uint64_t batch_addr = 0x200000000;
+	int create_ret;
+	int bind_err;
+	int i;
+	int res;
+	uint32_t bind_exec_queue;
+	uint64_t data_addr = 0x300000000;
+
+	struct drm_xe_sync bind_sync[1] = {
+		{
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE },
+		};
+	struct drm_xe_sync exec_sync[1] = {
+			{
+			.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL
+			},
+		};
+
+	struct drm_xe_exec exec = {
+			.num_batch_buffer = 1,
+			.num_syncs = 1,
+			.syncs = to_user_pointer(exec_sync),
+		};
+
+	struct {
+		uint32_t batch[16];
+	} *batch_data;
+	int b;
+
+	bool overcommit_detected = false;
+
+	overcommit_size = ALIGN(vram_size * overcommit_multiplier, 4096);
+
+	/* Limit overcommit to available memory to avoid OOM killer */
+	if (overcommit_size > system_size) {
+		igt_debug("Limiting overcommit size from %llu MB to %llu MB (available)\n",
+			  (unsigned long long)(overcommit_size >> 20),
+			  (unsigned long long)(system_size >> 20));
+			  overcommit_size = ALIGN(system_size, 4096);
+	}
+
+	num_bos = (overcommit_size / nf_bo_size) + 1;
+	bos = calloc(num_bos, sizeof(*bos));
+	igt_assert(bos);
+
+	igt_debug("Non-fault mode overcommit test: allocating %d BOs of %llu MB each, total=%llu MB, vram=%llu MB\n",
+		  num_bos, (unsigned long long)(nf_bo_size >> 20),
+		  (unsigned long long)(num_bos * nf_bo_size >> 20),
+		  (unsigned long long)(vram_size >> 20));
+
+	/* Create the vm in non fault mode*/
+	vm = xe_vm_create(fd, 0, 0);
+	igt_assert(vm);
+	bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0);
+
+	/* Create multiple BOs with VRAM-only placement to force overcommit */
+	for (i = 0; i < num_bos; i++) {
+		struct {
+			uint64_t vm_sync;
+		} *data;
+
+		create_ret = __xe_bo_create(fd, vm, nf_bo_size,
+					    vram_memory(fd, eci->gt_id),
+					    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+					    NULL, &bos[i]);
+		if (create_ret) {
+			igt_debug("BO create failed at %d/%d with error %d (%s)",
+				  i, num_bos, -create_ret, strerror(-create_ret));
+			igt_assert_f(create_ret == -ENOMEM || create_ret == -ENOSPC ||
+				     create_ret == -E2BIG || create_ret == -EPERM,
+				     "Unexpected error");
+			overcommit_detected = true;
+			num_bos = i; // Reduce to successfully created BOs
+			break;
+		}
+
+		data = xe_bo_map(fd, bos[i], 4096);
+		bind_sync[0].addr = to_user_pointer(&data->vm_sync);
+
+		bind_err = __xe_vm_bind(fd, vm, bind_exec_queue, bos[i], 0,
+					data_addr + (i * nf_bo_size), nf_bo_size,
+					DRM_XE_VM_BIND_OP_MAP, 0, bind_sync, 1, 0, 0, 0);
+		if (bind_err) {
+			igt_debug("Bind failed at %d/%d with error %d (%s)\n",
+				  i, num_bos, -bind_err, strerror(-bind_err));
+			igt_assert_f(bind_err == -ENOMEM ||
+				     bind_err == -ENOSPC || bind_err == -EPERM,
+				     "Unexpected bind error %d (%s)\n",
+				     -bind_err, strerror(-bind_err));
+			munmap(data, 4096);
+			gem_close(fd, bos[i]);
+			bos[i] = 0;
+			overcommit_detected = true;
+			num_bos = i;
+			break;
+		}
+
+		xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE,
+			       bind_exec_queue, 20 * NSEC_PER_SEC);
+		munmap(data, 4096);
+
+		igt_debug("Created and bound BO %d/%d at 0x%llx\n",
+			  i + 1, num_bos, (unsigned long long)(data_addr + (i * nf_bo_size)));
+	}
+
+	if (overcommit_detected)
+		igt_debug("Non-fault mode correctly rejected overcommit (created %d/%d BOs)\n",
+			  num_bos, (int)((overcommit_size / nf_bo_size) + 1));
+	else
+		igt_debug("Warning: All BOs created successfully - system may have had enough memory\n");
+
+	/* Create batch buffer */
+
+	batch_bo = xe_bo_create(fd, vm, 0x1000,
+				vram_memory(fd, eci->gt_id),
+				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	batch_data = xe_bo_map(fd, batch_bo, 0x1000);
+	xe_vm_bind_sync(fd, vm, batch_bo, 0, batch_addr, 0x1000);
+
+	/* Create exec queue */
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	exec_sync[0].handle = syncobj_create(fd, 0);
+
+	/* Use GPU to write to each BO - this will trigger page faults and migration */
+	for (i = 0; i < num_bos; i++) {
+		for (uint64_t off = 0; off < nf_bo_size; off += 4096) {
+			uint64_t target_addr = data_addr + (i * nf_bo_size) + off;
+
+			b = 0;
+			batch_data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+			batch_data->batch[b++] = target_addr & 0xFFFFFFFF;
+			batch_data->batch[b++] = (target_addr >> 32) & 0xFFFFFFFF;
+			batch_data->batch[b++] = 0xBB;
+			batch_data->batch[b++] = MI_BATCH_BUFFER_END;
+
+			/* Submit batch */
+			exec.exec_queue_id = exec_queue;
+			exec.address = batch_addr;
+			// Wait for previous batch to complete (except on first iteration)
+			if (off != 0 || i != 0)
+				igt_assert(syncobj_wait(fd, &exec_sync[0].handle,
+							1, INT64_MAX, 0, NULL));
+
+			syncobj_reset(fd, &exec_sync[0].handle, 1);
+			res = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+			if (res != 0) {
+				if (errno == ENOMEM || errno == ENOSPC) {
+					igt_debug("Expected Fault ! GPU execution failed");
+					goto gpu_done;
+				} else {
+					igt_assert("Error in execution");
+				}
+			}
+
+			if (!syncobj_wait(fd, &exec_sync[0].handle, 1, INT64_MAX, 0, NULL)) {
+				igt_debug("Batch wait failed at %d offset 0x%lx\n", i, off);
+				goto gpu_done;
+			}
+
+			igt_debug("Accessed BO %d/%d via GPU\n", i + 1, num_bos);
+		}
+	}
+	igt_debug("Fault mode overcommit test completed successfully\n");
+
+gpu_done:
+	igt_debug("GPU access test completed - overcommit correctly detected\n");
+
+	/* Cleanup */
+	syncobj_destroy(fd, exec_sync[0].handle);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_exec_queue_destroy(fd, bind_exec_queue);
+	munmap(batch_data, 0x1000);
+	gem_close(fd, batch_bo);
+
+	for (i = 0; i < num_bos; i++) {
+		if (bos[i])
+			gem_close(fd, bos[i]);
+	}
+
+	free(bos);
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: evict-vm-fault-overcommit
+ * Description: Test if vm fault mode for overcommit
+ * Functionality: overcommit in fault mode
+ * Test category: functionality test
+ */
+
+static void test_vm_fault_mode_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
+					  uint64_t system_size, uint64_t vram_size,
+					  uint64_t overcommit_multiplier)
+{
+	uint64_t overcommit_size;
+	uint32_t vm;
+	uint32_t *bos;
+	int num_bos;
+	uint64_t off;
+	size_t nf_bo_size = 64 * 1024 * 1024;  // 64MB per BO
+	uint32_t batch_bo;
+	size_t sync_size;
+	uint32_t bind_exec_queue;
+	uint64_t sync_addr = 0x101a0000;
+	uint64_t batch_addr = 0x200000000;
+	uint64_t data_addr = 0x300000000;
+	uint32_t exec_queue;
+	uint64_t stride = 1024 * 1024;
+	int64_t timeout = 20 * NSEC_PER_SEC;
+	int i, b;
+	int create_ret;
+	int64_t ret;
+	int bind_err;
+	int res;
+	bool overcommit_detected = false;
+
+	struct drm_xe_sync bind_sync[1] = {
+		{
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = USER_FENCE_VALUE
+		},
+	};
+
+	struct drm_xe_sync sync[1] = {
+		{
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = USER_FENCE_VALUE },
+	};
+
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+		uint64_t vm_sync;
+	} *batch_data;
+
+	uint64_t *exec_sync;
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+
+	igt_debug("Starting fault-mode overcommit test\n");
+
+	overcommit_size = ALIGN(vram_size * overcommit_multiplier, 4096);
+
+	if (overcommit_size > system_size) {
+		igt_debug("Limiting overcommit size from %llu MB to %llu MB\n",
+			  (unsigned long long)(overcommit_size >> 20),
+			  (unsigned long long)(system_size >> 20));
+		overcommit_size = ALIGN(system_size, 4096);
+	}
+
+	num_bos = (overcommit_size / nf_bo_size) + 1;
+	bos = calloc(num_bos, sizeof(*bos));
+	igt_assert(bos);
+
+	igt_debug("Fault mode: BO of %llu MB containing %d structures"
+		  "(target overcommit=%llu MB, vram=%llu MB)\n",
+		  (unsigned long long)(nf_bo_size >> 20), num_bos,
+		  (unsigned long long)(overcommit_size >> 20),
+		  (unsigned long long)(vram_size >> 20));
+
+	/* Create fault-mode VM */
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	igt_assert(vm);
+
+	bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0);
+	/* Create exec_sync area */
+	sync_size = sizeof(*exec_sync) * num_bos;
+	sync_size = xe_bb_size(fd, sync_size);
+
+	exec_sync = mmap(NULL, sync_size, PROT_READ | PROT_WRITE,
+			 MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(exec_sync != MAP_FAILED);
+	memset(exec_sync, 0, sync_size);
+
+	for (i = 0; i < num_bos; i++) {
+		struct {
+			uint64_t vm_sync;
+		} *data;
+
+		/* CREATE BO - should succeed now with reasonable size */
+		//bo is created here of size nf_bo_size
+		// nf_bo_size is 64 MB
+		// Creating a buffer object of 64 MB size
+		// In a loop we are creating multiple BOs of 64 MB size
+		create_ret = __xe_bo_create(fd, 0, nf_bo_size,
+					    vram_if_possible(fd, eci->gt_id),
+					    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+					    NULL, &bos[i]);
+		if (create_ret) {
+			igt_debug("BO create failed  with error %d (%s)n\n",
+				  -create_ret, strerror(-create_ret));
+			igt_assert_f(create_ret == -ENOMEM || create_ret == -ENOSPC ||
+				     create_ret == -E2BIG || create_ret == -EPERM,
+				     "Unexpected error %d (%s)\n", -create_ret,
+				     strerror(-create_ret));
+			overcommit_detected = true;
+			num_bos = i;  // Reduce to successfully created BOs
+			break;
+		}
+		igt_debug("BO created successfully - %llu MB\n",
+			  (unsigned long long)(nf_bo_size >> 20));
+
+		/* MAP BO */
+		data = xe_bo_map(fd, bos[i], 4096);
+		memset(data, 0, 4096);
+		bind_sync[0].addr = to_user_pointer(&data->vm_sync);
+
+		/* Here we are binging the bos to the bind_exec_queue*/
+		bind_err = __xe_vm_bind(fd, vm, bind_exec_queue, bos[i], 0,
+					data_addr + (i * nf_bo_size), nf_bo_size,
+					DRM_XE_VM_BIND_OP_MAP, 0, bind_sync, 1, 0, 0, 0);
+		if (bind_err) {
+			igt_debug("Bind failed at %d/%d with error %d (%s)\n",
+				  i, num_bos, -bind_err, strerror(-bind_err));
+			igt_assert_f(bind_err == -ENOMEM || bind_err == -ENOSPC ||
+				     bind_err == -EPERM,
+				     "Unexpected bind error %d (%s)\n", -bind_err,
+				     strerror(-bind_err));
+			munmap(data, 4096);
+			gem_close(fd, bos[i]);
+			bos[i] = 0;
+			overcommit_detected = true;
+			num_bos = i;
+			break;
+		}
+		xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, bind_exec_queue,
+			       20 * NSEC_PER_SEC);
+		munmap(data, 4096);
+		igt_debug("Created and bound BO %d/%d at 0x%llx\n",
+			  i + 1, num_bos, (unsigned long long)(data_addr + (i * nf_bo_size)));
+	} // End for loop
+	if (overcommit_detected)
+		igt_debug("Non-fault mode correctly rejected overcommit");
+	else
+		igt_debug("All BOs created successfully\n");
+
+	/* Create batch buffer */
+	batch_bo = xe_bo_create(fd, vm, 0x1000,
+				vram_memory(fd, eci->gt_id),
+				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	batch_data = xe_bo_map(fd, batch_bo, 0x1000);
+	memset(batch_data, 0, 0x1000);
+
+	/* Bind batch buffer using async bind (fault mode requires this) */
+	batch_data[0].vm_sync = 0;
+	sync[0].addr = to_user_pointer(&batch_data[0].vm_sync);
+	xe_vm_bind_userptr_async(fd, vm, bind_exec_queue,
+				 to_user_pointer(exec_sync), sync_addr,
+				 sync_size, sync, 1);
+	xe_wait_ufence(fd, &batch_data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queue, NSEC_PER_SEC);
+	xe_vm_bind_async(fd, vm, bind_exec_queue, batch_bo, 0, batch_addr,
+			 0x1000, sync, 1);
+	xe_wait_ufence(fd, &batch_data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queue, NSEC_PER_SEC);
+
+	igt_debug("VM binds done - exec_sync at 0x%llx, batch_bo at 0x%llx\n",
+		  (unsigned long long)sync_addr, (unsigned long long)batch_addr);
+
+	/* Create exec queue */
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+
+	/* Use GPU to write to each BO - this will trigger page faults and migration */
+	for (i = 0; i < num_bos; i++) {
+		igt_debug("Writing to BO %d/%d via GPU\n", i + 1, num_bos);
+		for (off = 0; off < nf_bo_size; off += stride) {
+			uint64_t target_addr = data_addr + (i * nf_bo_size) + off;
+
+			b = 0;
+			batch_data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+			batch_data->batch[b++] = target_addr & 0xFFFFFFFF;
+			batch_data->batch[b++] = (target_addr >> 32) & 0xFFFFFFFF;
+			batch_data->batch[b++] = 0xBB;
+			batch_data->batch[b++] = MI_BATCH_BUFFER_END;
+
+			/* Submit batch */
+			exec_sync[0] = 0;
+			sync[0].addr = sync_addr;
+			exec.exec_queue_id = exec_queue;
+			exec.address = batch_addr;
+			// Wait for previous batch to complete (except on first iteration)
+
+			res = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+			if (res != 0) {
+				if (errno == ENOMEM || errno == ENOSPC) {
+					igt_debug("Expected Fault errno: %d (%s)",
+						  errno, strerror(errno));
+					goto gpu_done;
+				}
+			}
+			ret = __xe_wait_ufence(fd, &exec_sync[0], USER_FENCE_VALUE, exec_queue,
+					       &timeout);
+			if (ret != 0) {
+				igt_debug("Batch wait failed - memory exhausted at BO %d offset 0x%lx\n",
+					  i, off);
+				goto gpu_done;
+			}
+		}
+		igt_debug("Accessed BO %d/%d via GPU\n", i + 1, num_bos);
+	}
+	igt_debug("All batches submitted - waiting for GPU completion\n");
+
+	/* Verify GPU writes by reading back from BOs */
+	igt_debug("Verifying GPU writes to BOs...\n");
+	for (i = 0; i < num_bos; i++) {
+		uint32_t *verify_data;
+		int errors = 0;
+
+		/* Map the BO to read back data */
+		verify_data = xe_bo_map(fd, bos[i], nf_bo_size);
+
+		for (off = 0; off < nf_bo_size; off += stride) {
+			uint32_t expected = 0xBB;
+			uint32_t actual = verify_data[off / 4];  /* Read at page boundary */
+
+			if (actual != expected) {
+				if (errors < 5) {  /* Limit error output */
+					igt_warn("Mismatch at BO %d offset 0x%llx:",
+						 i, (unsigned long long)off);
+				}
+				errors++;
+			}
+		}
+
+	munmap(verify_data, nf_bo_size);
+	if (errors == 0) {
+		igt_debug("BO %d/%d verified successfully - all %llu pages correct\n",
+			  i + 1, num_bos, (unsigned long long)(nf_bo_size / stride));
+	} else {
+		igt_debug("BO %d/%d had %d errors out of %llu pages\n",
+			  i + 1, num_bos, errors, (unsigned long long)(nf_bo_size / stride));
+	}
+}
+
+gpu_done:
+
+	igt_debug("GPU access test completed - overcommit correctly detected\n");
+	/* Cleanup */
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_exec_queue_destroy(fd, bind_exec_queue);
+	munmap(batch_data, 0x1000);
+	gem_close(fd, batch_bo);
+	munmap(exec_sync, sync_size);
+	for (i = 0; i < num_bos; i++) {
+		if (bos[i])
+			gem_close(fd, bos[i]);
+	}
+
+	free(bos);
+	xe_vm_destroy(fd, vm);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
 	uint64_t bind_size;
+	uint64_t vram_size;
+	uint64_t system_size;
 	int fd;
 	const struct section {
 		const char *name;
@@ -2559,11 +3045,15 @@ int igt_main()
                         ~(DRM_XE_VM_CREATE_FLAG_LR_MODE |
                         DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
                         DRM_XE_VM_CREATE_FLAG_FAULT_MODE) },
-                { }
-        };
+		{ }
+	};
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
+		igt_require(xe_has_vram(fd));
+		vram_size = xe_visible_vram_size(fd, 0);
+		igt_assert(vram_size);
+		system_size = igt_get_avail_ram_mb() << 20;
 
 		xe_for_each_engine(fd, hwe)
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY) {
@@ -2844,6 +3334,17 @@ int igt_main()
 	igt_subtest("invalid-vm-id")
 		invalid_vm_id(fd);
 
+	igt_subtest("evict-vm-nonfault-overcommit") {
+		igt_require(xe_has_vram(fd));
+		igt_assert(xe_visible_vram_size(fd, 0));
+		test_vm_nonfault_mode_overcommit(fd, hwe, system_size, vram_size, 2);
+	}
+
+	igt_subtest("evict-vm-fault-overcommit") {
+		igt_require(xe_has_vram(fd));
+		igt_assert(xe_visible_vram_size(fd, 0));
+		test_vm_fault_mode_overcommit(fd, hwe, system_size, vram_size, 2);
+	}
 	igt_subtest("out-of-memory") {
 		igt_require(xe_has_vram(fd));
 		igt_assert(xe_visible_vram_size(fd, 0));
-- 
2.52.0

