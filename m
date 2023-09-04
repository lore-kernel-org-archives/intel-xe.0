Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF20C83F33
	for <intel-xe@archiver.kernel.org>; Mon,  4 Sep 2023 13:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F6F10E353;
	Mon,  4 Sep 2023 13:16:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F5510E353;
 Mon,  4 Sep 2023 13:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693833417; x=1725369417;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=omoOsXtGcR/rJ/Z8qV69RWxCg+093YW+BJCOHsgNnkk=;
 b=e/GeyJUNzxGytovrWx8jVTG9Ex/WfdUCA1/4My5SEfuKa8dnCVyb9ZBN
 rkFpZpy3ODIEzhWeLN0AgUl/jkhcY4ImchBsIjbhFSlPvo6Clxbnibl/L
 wl8nlOQHh96c0qJGQ9UYDqO08/VEf7w34qzlO+fhlFIV9rtPsXUPam+J2
 TXK5+VodrrEG3Siq2M5NmlbknarJO6z4o4JiLUKvQYgeiEGEhpJhu5kPF
 3MTjFDTiW2mU8qHD0sXsutbA5Enoq7Fv17oiQ51ruEX4oORfplUFraos8
 EjfDO2aOoVExqzlQ6dHCMRAlleaTTPzihUM0lL1YRM5usSuGZoj02S9jq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="375489779"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="375489779"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 06:16:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="864351175"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="864351175"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga004.jf.intel.com with ESMTP; 04 Sep 2023 06:16:39 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  4 Sep 2023 18:54:15 +0530
Message-Id: <20230904132415.3131740-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [intel-xe] tests/xe: Add tests to read and verify fdinfo
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
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This test verifies fdinfo published by xe KMD with
following tests :
@basic
@drm-total-residents
@drm-shared
@drm-active

TODO : drm-purgeable test is not possbile as we consider objects in
system memory to be purgeable but current xe KMD does not allow
BOs to be created in system memory (instead KMD creates it in
XE_PL_TT which is VRAM backed system memory).

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 285 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 2 files changed, 286 insertions(+)
 create mode 100644 tests/intel/xe_drm_fdinfo.c

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
new file mode 100644
index 000000000..4f9dcdb66
--- /dev/null
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -0,0 +1,285 @@
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
+ *
+ * SUBTEST: basic
+ * Category: Software building block
+ * Sub-category: driver
+ * Description: Check if basic fdinfo content is present
+ * Functionality: Per client memory statistics
+ * Run type: FULL
+ * Test category: SysMan
+ *
+ * SUBTEST: drm-total-resident
+ * Category: Software building block
+ * Sub-category: driver
+ * Description: Create and compare total and resident memory consumption by client
+ * Functionality: Per client memory statistics
+ * Run type: FULL
+ * Test category: SysMan
+ *
+ * SUBTEST: drm-shared
+ * Category: Software building block
+ * Sub-category: driver
+ * Description: Create and compare shared memory consumption by client
+ * Functionality: Per client memory statistics
+ * Run type: FULL
+ * Test category: SysMan
+ *
+ * SUBTEST: drm-shared
+ * Category: Software building block
+ * Sub-category: driver
+ * Description: Create and compare shared memory consumption by client
+ * Functionality: Per client memory statistics
+ * Run type: FULL
+ * Test category: SysMan
+ *
+ * SUBTEST: drm-active
+ * Category: Software building block
+ * Sub-category: driver
+ * Description: Create and compare active memory consumption by client
+ * Functionality: Per client memory statistics
+ * Run type: FULL
+ * Test category: SysMan
+ */
+
+IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption using fdinfo");
+
+/* Subtests */
+static void test_active(int fd, struct drm_xe_engine_class_instance *eci)
+{
+        struct drm_client_fdinfo info = { };
+	uint32_t vm;
+        uint64_t addr = 0x1a0000;
+        struct drm_xe_sync sync[2] = {
+                { .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+                { .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+        };
+        struct drm_xe_exec exec = {
+                .num_batch_buffer = 1,
+                .num_syncs = 2,
+                .syncs = to_user_pointer(sync),
+        };
+#define N_EXEC_QUEUES   2
+        uint32_t exec_queues[N_EXEC_QUEUES];
+        uint32_t bind_exec_queues[N_EXEC_QUEUES];
+        uint32_t syncobjs[N_EXEC_QUEUES + 1];
+        size_t bo_size;
+        uint32_t bo = 0;
+	int region = 0x2; /* VRAM 0 */
+        struct {
+                struct xe_spin spin;
+                uint32_t batch[16];
+                uint64_t pad;
+                uint32_t data;
+        } *data;
+        int i, b;
+
+        vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+        bo_size = sizeof(*data) * N_EXEC_QUEUES;
+        bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+                        xe_get_default_alignment(fd));
+        bo = xe_bo_create_flags(fd, vm, bo_size,
+                                region);
+        data = xe_bo_map(fd, bo, bo_size);
+
+        for (i = 0; i < N_EXEC_QUEUES; i++) {
+                exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+                bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0);
+                syncobjs[i] = syncobj_create(fd, 0);
+        }
+        syncobjs[N_EXEC_QUEUES] = syncobj_create(fd, 0);
+
+        sync[0].handle = syncobj_create(fd, 0);
+        xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr, bo_size,
+                         sync, 1);
+
+        for (i = 0; i < N_EXEC_QUEUES; i++) {
+                uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
+                uint64_t spin_addr = addr + spin_offset;
+                int e = i;
+
+                if (i == 0) {
+                        xe_spin_init(&data[i].spin, spin_addr, true);
+                        exec.exec_queue_id = exec_queues[e];
+                        exec.address = spin_addr;
+                        sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+                        sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+                        sync[1].handle = syncobjs[e];
+                        xe_exec(fd, &exec);
+                        xe_spin_wait_started(&data[i].spin);
+
+                        addr += bo_size;
+                        sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+                        sync[1].handle = syncobjs[e];
+                        xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo, 0, addr,
+                                         bo_size, sync + 1, 1);
+                        addr += bo_size;
+                } else {
+                        sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+                        xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo, 0, addr,
+                                         bo_size, sync, 1);
+                }
+
+		b = igt_parse_drm_fdinfo(fd, &info, NULL, 0, NULL, 0);
+		igt_assert(b);
+
+		/* Client memory consumption includes public objects
+		 * as well as internal objects hence if bo is active on
+		 * N_EXEC_QUEUES consumption should be
+		 * >= bo_size + bo_size * N_EXEC_QUEUES */
+		printf("info.total:%ld active:%ld bo_size:%ld\n",
+		       info.region_mem[region].total,
+		       info.region_mem[region].active, bo_size);
+		igt_assert(info.region_mem[region].active >=
+			      bo_size + bo_size * N_EXEC_QUEUES);
+        }
+	xe_spin_end(&data[0].spin);
+
+	syncobj_destroy(fd, sync[0].handle);
+        sync[0].handle = syncobj_create(fd, 0);
+        sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+        xe_vm_unbind_all_async(fd, vm, 0, bo, sync, 1);
+        igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+        syncobj_destroy(fd, sync[0].handle);
+        for (i = 0; i < N_EXEC_QUEUES; i++) {
+                syncobj_destroy(fd, syncobjs[i]);
+                xe_exec_queue_destroy(fd, exec_queues[i]);
+                xe_exec_queue_destroy(fd, bind_exec_queues[i]);
+        }
+
+        munmap(data, bo_size);
+        gem_close(fd, bo);
+        xe_vm_destroy(fd, vm);
+}
+
+static void test_shared(int xe)
+{
+        struct drm_client_fdinfo info = { };
+        struct drm_gem_flink flink;
+        struct drm_gem_open open_struct;
+	uint32_t bo;
+	int region = 0x1;
+        int ret;
+
+	bo = xe_bo_create_flags(xe, 0, 4096, region);
+
+        flink.handle = bo;
+        ret = igt_ioctl(xe, DRM_IOCTL_GEM_FLINK, &flink);
+        igt_assert_eq(ret, 0);
+
+        open_struct.name = flink.name;
+        ret = igt_ioctl(xe, DRM_IOCTL_GEM_OPEN, &open_struct);
+        igt_assert_eq(ret, 0);
+        igt_assert(open_struct.handle != 0);
+
+	ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
+	igt_assert(ret);
+
+	printf("info.total:%ld shared:%ld\n",
+			info.region_mem[region].total,
+			info.region_mem[region].shared);
+	igt_assert_eq(info.region_mem[region].shared,
+			2 * 4096);
+
+	gem_close(xe, bo);
+}
+
+static void test_total_resident(int xe)
+{
+        struct drm_xe_query_mem_region *memregion;
+        uint64_t memreg = all_memory_regions(xe), region;
+        struct drm_client_fdinfo info = { };
+        uint32_t vm;
+        uint32_t handle;
+	uint64_t addr = 0x1a0000;
+        int ret;
+
+        vm = xe_vm_create(xe, DRM_XE_VM_CREATE_SCRATCH_PAGE, 0);
+
+        xe_for_each_mem_region(xe, memreg, region) {
+                memregion = xe_mem_region(xe, region);
+
+		handle = xe_bo_create_flags(xe, vm, memregion->min_page_size, region);
+		xe_vm_bind_sync(xe, vm, handle, 0, addr, memregion->min_page_size);
+
+		ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
+		igt_assert(ret);
+		/* currently xe KMD maps I915_MEMORY_CLASS_SYSTEM region to
+		 * XE_PL_TT thus we need memregion->instance + 1 */
+		printf("info.total:%ld resident:%ld for instance: %d bo_size:%d\n",
+		       info.region_mem[memregion->instance + 1].total,
+		       info.region_mem[memregion->instance + 1].resident,
+		       memregion->instance, memregion->min_page_size);
+		/* Client memory consumption includes public objects
+		 * as well as internal objects hence it should be
+		 * >= memregion->min_page_size */
+		igt_assert(info.region_mem[memregion->instance + 1].total >=
+			   memregion->min_page_size);
+		igt_assert(info.region_mem[memregion->instance + 1].resident >=
+			   memregion->min_page_size);
+		xe_vm_unbind_sync(xe, vm, 0, addr, memregion->min_page_size);
+		gem_close(xe, handle);
+        }
+
+        xe_vm_destroy(xe, vm);
+}
+
+static void basic(int xe)
+{
+        struct drm_client_fdinfo info = { };
+        unsigned int ret;
+
+        ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
+        igt_assert(ret);
+
+        igt_assert(!strcmp(info.driver, "xe"));
+}
+
+igt_main
+{
+        int xe;
+
+        igt_fixture {
+                struct drm_client_fdinfo info = { };
+
+		xe = drm_open_driver(DRIVER_XE);
+		igt_require_xe(xe);
+                igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
+        }
+
+	igt_describe("Check if basic fdinfo content is present");
+        igt_subtest("basic")
+                basic(xe);
+
+	igt_describe("Create and compare total and resident memory consumption by client");
+        igt_subtest("drm-total-resident")
+                test_total_resident(xe);
+
+	igt_describe("Create and compare shared memory consumption by client");
+	igt_subtest("drm-shared")
+                test_shared(xe);
+
+	igt_describe("Create and compare active memory consumption by client");
+	igt_subtest("drm-active")
+		test_active(xe, xe_hw_engine(xe, 0));
+
+	igt_fixture
+                drm_close_driver(xe);
+}
diff --git a/tests/meson.build b/tests/meson.build
index aa8e3434c..f5f495050 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -275,6 +275,7 @@ intel_xe_progs = [
 	'xe_compute',
 	'xe_dma_buf_sync',
 	'xe_debugfs',
+	'xe_drm_fdinfo',
 	'xe_evict',
 	'xe_exec_balancer',
 	'xe_exec_basic',
-- 
2.25.1

