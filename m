Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64773CD4846
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 16:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F2110E6A8;
	Fri, 22 Sep 2023 16:54:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFC710E6A6
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 16:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695401657; x=1726937657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TUkMWG1yBqGtif1lBDNp4SgpqSdIYQ9YWsMaiEEVpTQ=;
 b=JKguXUpdCF9tfdKiqX3VwPWAxomOFYnXHQRP9ZfcURDzBPZakEiw6P7h
 fXfI66UKvYrXhoT2fSNZ/Rpu4KQIXiRNnmEzVgsdnARHDQ/Gd2x/m1P1F
 iaUR1MlvB6ZLUY/8d9f06spbtFKcD3Jp3jeMOiSZ/BftD44uIDn+eLdkc
 wBZgt7wOa4Tg+/0iXEuYGqpyX/sDL5t6fJAX8pwbQNqsP4+tMz3AqmwDd
 VI4GYhwjWgcbXXKCiwVYRHyVSnXQj+s9fUBYlJnsFjmR7mj8qXGIbxCQ/
 KIdSFqfLV0KZcRj8nlXZChJ11T9AGInV0dauRU3MixjjcGRrGePfFLG44 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="447365064"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="447365064"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 09:54:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="750909673"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="750909673"
Received: from dut125tglh.fm.intel.com ([10.105.23.10])
 by fmsmga007.fm.intel.com with ESMTP; 22 Sep 2023 09:54:16 -0700
From: Bommithi Sakeena <bommithi.sakeena@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 16:54:04 +0000
Message-Id: <20230922165404.17649-2-bommithi.sakeena@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922165404.17649-1-bommithi.sakeena@intel.com>
References: <20230922165404.17649-1-bommithi.sakeena@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] tests/xe_drm_fdinfo: Add tests to read and
 verify fdinfo
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
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Tejas Upadhyay <tejas.upadhyay@intel.com>

Add tests to verify fdinfo published by xe KMD with
following subtests :
@basic
@drm-total-residents
@drm-shared
@drm-active

Example fdinfo format:

pos:    0
flags:  0100002
mnt_id: 23
ino:    1140
drm-driver:     xe
drm-client-id:  19
drm-pdev:       0000:4d:00.0
drm-total-system:       0
drm-shared-system:      0
drm-active-system:      0
drm-resident-system:    0
drm-purgeable-system:   0
drm-total-gtt:  4 KiB
drm-shared-gtt: 0
drm-active-gtt: 0
drm-resident-gtt:       4 KiB
drm-total-vram0:        20 KiB
drm-shared-vram0:       0
drm-active-vram0:       0
drm-resident-vram0:     20 KiB
drm-total-vram1:        20 KiB
drm-shared-vram1:       0
drm-active-vram1:       0
drm-resident-vram1:     20 KiB

TODO: drm-purgeable test is not possbile as we consider objects in
system memory to be purgeable but current xe KMD does not allow
BOs to be created in system memory (instead KMD creates it in
XE_PL_TT which is VRAM backed system memory).

V4:
  - Put pre_size checks - Rahul
  - Check all test for all regions - Rahul
V3:
  - Expand basic test - Rahul
  - Use defined var at all places - Rahul
  - Update commit message - Rahul
  - Adapt spin_init API change
V2:
  - Replace printf with igt_info - Kamil
  - run checkpatch - Kamil
  - use igt_assert_f - Kamil

Reviewed-by: Janga Rahul Kumar<janga.rahul.kumar@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 321 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 2 files changed, 322 insertions(+)
 create mode 100644 tests/intel/xe_drm_fdinfo.c

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
new file mode 100644
index 000000000..22e410e14
--- /dev/null
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_core.h"
+#include "igt_device.h"
+#include "igt_drm_fdinfo.h"
+#include "lib/igt_syncobj.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
+/**
+ * TEST: xe drm fdinfo
+ * Description: Read and verify drm client memory consumption using fdinfo
+ * Feature: SMI, core
+ * Category: Software building block
+ * Sub-category: driver
+ * Functionality: Per client memory statistics
+ * Run type: FULL
+ * Test category: SysMan
+ *
+ * SUBTEST: basic
+ * Description: Check if basic fdinfo content is present
+ *
+ * SUBTEST: drm-total-resident
+ * Description: Create and compare total and resident memory consumption by client
+ *
+ * SUBTEST: drm-shared
+ * Description: Create and compare shared memory consumption by client
+ *
+ * SUBTEST: drm-active
+ * Description: Create and compare active memory consumption by client
+ */
+
+IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption using fdinfo");
+
+#define BO_SIZE (65536)
+
+/* Subtests */
+static void test_active(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	struct drm_xe_query_mem_region *memregion;
+	uint64_t memreg = all_memory_regions(fd), region;
+	struct drm_client_fdinfo info = { };
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+#define N_EXEC_QUEUES   2
+	uint32_t exec_queues[N_EXEC_QUEUES];
+	uint32_t bind_exec_queues[N_EXEC_QUEUES];
+	uint32_t syncobjs[N_EXEC_QUEUES + 1];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		struct xe_spin spin;
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	struct xe_spin_opts spin_opts = { .preempt = true };
+	int i, b, ret;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = sizeof(*data) * N_EXEC_QUEUES;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	xe_for_each_mem_region(fd, memreg, region) {
+		uint64_t pre_size;
+
+		memregion = xe_mem_region(fd, region);
+
+		ret = igt_parse_drm_fdinfo(fd, &info, NULL, 0, NULL, 0);
+		igt_assert_f(ret != 0, "failed with err:%d\n", errno);
+		pre_size = info.region_mem[memregion->instance + 1].active;
+
+		bo = xe_bo_create_flags(fd, vm, bo_size, region);
+		data = xe_bo_map(fd, bo, bo_size);
+
+		for (i = 0; i < N_EXEC_QUEUES; i++) {
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0);
+			syncobjs[i] = syncobj_create(fd, 0);
+		}
+		syncobjs[N_EXEC_QUEUES] = syncobj_create(fd, 0);
+
+		sync[0].handle = syncobj_create(fd, 0);
+		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr, bo_size,
+				 sync, 1);
+
+		for (i = 0; i < N_EXEC_QUEUES; i++) {
+			uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
+			uint64_t spin_addr = addr + spin_offset;
+			int e = i;
+
+			if (i == 0) {
+				/* Cork 1st exec_queue with a spinner */
+				spin_opts.addr = spin_addr;
+				xe_spin_init(&data[i].spin, &spin_opts);
+				exec.exec_queue_id = exec_queues[e];
+				exec.address = spin_opts.addr;
+				sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+				sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+				sync[1].handle = syncobjs[e];
+				xe_exec(fd, &exec);
+				xe_spin_wait_started(&data[i].spin);
+
+				addr += bo_size;
+				sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+				sync[1].handle = syncobjs[e];
+				xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo, 0, addr,
+						 bo_size, sync + 1, 1);
+				addr += bo_size;
+			} else {
+				sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+				xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo, 0, addr,
+						 bo_size, sync, 1);
+			}
+		}
+
+		b = igt_parse_drm_fdinfo(fd, &info, NULL, 0, NULL, 0);
+		igt_assert_f(b != 0, "failed with err:%d\n", errno);
+
+		/* Client memory consumption includes public objects
+		 * as well as internal objects hence if bo is active on
+		 * N_EXEC_QUEUES active memory consumption should be
+		 * > = bo_size
+		 */
+		igt_info("total:%ld active:%ld pre_size:%ld bo_size:%ld\n",
+			 info.region_mem[memregion->instance + 1].total,
+			 info.region_mem[memregion->instance + 1].active,
+			 pre_size,
+			 bo_size);
+		igt_assert(info.region_mem[memregion->instance + 1].active >=
+			   pre_size + bo_size);
+
+		xe_spin_end(&data[0].spin);
+
+		syncobj_destroy(fd, sync[0].handle);
+		sync[0].handle = syncobj_create(fd, 0);
+		sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+		xe_vm_unbind_all_async(fd, vm, 0, bo, sync, 1);
+		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+		syncobj_destroy(fd, sync[0].handle);
+		for (i = 0; i < N_EXEC_QUEUES; i++) {
+			syncobj_destroy(fd, syncobjs[i]);
+			xe_exec_queue_destroy(fd, exec_queues[i]);
+			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
+		}
+
+		munmap(data, bo_size);
+		gem_close(fd, bo);
+	}
+	xe_vm_destroy(fd, vm);
+}
+
+static void test_shared(int xe)
+{
+	struct drm_xe_query_mem_region *memregion;
+	uint64_t memreg = all_memory_regions(xe), region;
+	struct drm_client_fdinfo info = { };
+	struct drm_gem_flink flink;
+	struct drm_gem_open open_struct;
+	uint32_t bo;
+	int ret;
+
+	xe_for_each_mem_region(xe, memreg, region) {
+		uint64_t pre_size;
+
+		memregion = xe_mem_region(xe, region);
+
+		ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
+		igt_assert_f(ret != 0, "failed with err:%d\n", errno);
+		pre_size = info.region_mem[memregion->instance + 1].shared;
+
+		bo = xe_bo_create_flags(xe, 0, BO_SIZE, region);
+
+		flink.handle = bo;
+		ret = igt_ioctl(xe, DRM_IOCTL_GEM_FLINK, &flink);
+		igt_assert_eq(ret, 0);
+
+		open_struct.name = flink.name;
+		ret = igt_ioctl(xe, DRM_IOCTL_GEM_OPEN, &open_struct);
+		igt_assert_eq(ret, 0);
+		igt_assert(open_struct.handle != 0);
+
+		ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
+		igt_assert_f(ret != 0, "failed with err:%d\n", errno);
+
+		igt_info("total:%ld pre_size:%ld shared:%ld\n",
+			 info.region_mem[memregion->instance + 1].total,
+			 pre_size,
+			 info.region_mem[memregion->instance + 1].shared);
+		igt_assert(info.region_mem[memregion->instance + 1].shared >=
+			   pre_size + BO_SIZE);
+
+		gem_close(xe, open_struct.handle);
+		gem_close(xe, bo);
+	}
+}
+
+static void test_total_resident(int xe)
+{
+	struct drm_xe_query_mem_region *memregion;
+	uint64_t memreg = all_memory_regions(xe), region;
+	struct drm_client_fdinfo info = { };
+	uint32_t vm;
+	uint32_t handle;
+	uint64_t addr = 0x1a0000;
+	int ret;
+
+	vm = xe_vm_create(xe, DRM_XE_VM_CREATE_SCRATCH_PAGE, 0);
+
+	xe_for_each_mem_region(xe, memreg, region) {
+		uint64_t pre_size;
+
+		memregion = xe_mem_region(xe, region);
+
+		ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
+		igt_assert_f(ret != 0, "failed with err:%d\n", errno);
+		pre_size = info.region_mem[memregion->instance + 1].shared;
+
+		handle = xe_bo_create_flags(xe, vm, BO_SIZE, region);
+		xe_vm_bind_sync(xe, vm, handle, 0, addr, BO_SIZE);
+
+		ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
+		igt_assert_f(ret != 0, "failed with err:%d\n", errno);
+		/* currently xe KMD maps memory class system region to
+		 * XE_PL_TT thus we need memregion->instance + 1
+		 */
+		igt_info("total:%ld resident:%ld pre_size:%ld bo_size:%d\n",
+			 info.region_mem[memregion->instance + 1].total,
+			 info.region_mem[memregion->instance + 1].resident,
+			 pre_size, BO_SIZE);
+		/* Client memory consumption includes public objects
+		 * as well as internal objects hence it should be
+		 * >= pre_size + BO_SIZE
+		 */
+		igt_assert(info.region_mem[memregion->instance + 1].total >=
+			   pre_size + BO_SIZE);
+		igt_assert(info.region_mem[memregion->instance + 1].resident >=
+			   pre_size + BO_SIZE);
+		xe_vm_unbind_sync(xe, vm, 0, addr, BO_SIZE);
+		gem_close(xe, handle);
+	}
+
+	xe_vm_destroy(xe, vm);
+}
+
+static void basic(int xe)
+{
+	struct drm_xe_query_mem_region *memregion;
+	uint64_t memreg = all_memory_regions(xe), region;
+	struct drm_client_fdinfo info = { };
+	unsigned int ret;
+
+	ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
+	igt_assert_f(ret != 0, "failed with err:%d\n", errno);
+
+	igt_assert(!strcmp(info.driver, "xe"));
+
+	xe_for_each_mem_region(xe, memreg, region) {
+		memregion = xe_mem_region(xe, region);
+		igt_assert(info.region_mem[memregion->instance + 1].total >=
+			   0);
+		igt_assert(info.region_mem[memregion->instance + 1].shared >=
+			   0);
+		igt_assert(info.region_mem[memregion->instance + 1].resident >=
+			   0);
+		igt_assert(info.region_mem[memregion->instance + 1].active >=
+			   0);
+		if (memregion->instance == 0)
+			igt_assert(info.region_mem[memregion->instance].purgeable >=
+				   0);
+	}
+}
+
+igt_main
+{
+	int xe;
+
+	igt_fixture {
+		struct drm_client_fdinfo info = { };
+
+		xe = drm_open_driver(DRIVER_XE);
+		igt_require_xe(xe);
+		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
+	}
+
+	igt_describe("Check if basic fdinfo content is present");
+	igt_subtest("basic")
+		basic(xe);
+
+	igt_describe("Create and compare total and resident memory consumption by client");
+	igt_subtest("drm-total-resident")
+		test_total_resident(xe);
+
+	igt_describe("Create and compare shared memory consumption by client");
+	igt_subtest("drm-shared")
+		test_shared(xe);
+
+	igt_describe("Create and compare active memory consumption by client");
+	igt_subtest("drm-active")
+		test_active(xe, xe_hw_engine(xe, 0));
+
+	igt_fixture {
+		drm_close_driver(xe);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 31492bf7b..974cb433b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -276,6 +276,7 @@ intel_xe_progs = [
 	'xe_compute',
 	'xe_dma_buf_sync',
 	'xe_debugfs',
+	'xe_drm_fdinfo',
 	'xe_evict',
 	'xe_exec_balancer',
 	'xe_exec_basic',
-- 
2.34.1

