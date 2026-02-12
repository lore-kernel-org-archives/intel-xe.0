Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312E2EE3698
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 17:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEE010E779;
	Thu, 12 Feb 2026 17:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7yXCKKr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937D710E77B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 17:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770917193; x=1802453193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=knaf0/ylJHbUzSbGA8kAOvQG8rqw1pmUxs2gY4uU3Uk=;
 b=e7yXCKKrbWragpcPu6JCXhbXKMxFzAPLwtBE12nFromvOebHRHRkNJ0z
 TKkvOQVBsk+w8DfE20FMo1sNXmnltl3FErO8nipqxHWZFBTE6RTWm8omA
 2Dv5LVsgWO3C5JEJBl4NoKB7bW0nULs7nsL/ahfUjj/gFhUDpGAr93r8r
 QdYIS+bB82jBuBIMkX06ttkK+2u2Gp8vDjXTsTnZ9iVsxtrux4RPOLIRC
 cNjN1sN4GxEeHVNFw2r5/n0lHDxFBLKoRNIotpuxduVmPW6iOjo0CP9ST
 uM8f1rBqXD3p8SdPyw8w6Ajm2ju9Wd6ematmD4sguo+J/IUMFv1T5cXW0 A==;
X-CSE-ConnectionGUID: MlDFTLNdRIaFcxn9klRhlg==
X-CSE-MsgGUID: D/DNywRYRwuwibh/OdSJaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72000014"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="72000014"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 09:26:33 -0800
X-CSE-ConnectionGUID: ndin+J3TSOCuEGoA/o8TyA==
X-CSE-MsgGUID: bgZ1GqlLTbGuR6p5Lka9Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="217627313"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 09:26:29 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, nishit.sharma@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 2/2] test/intel/xe_vm: Test to check no overcommit flag
 in fault mode
Date: Thu, 12 Feb 2026 17:25:42 +0000
Message-ID: <20260212172546.794257-3-sobin.thomas@intel.com>
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

In existing tests there is no support to check no overcommit flag
(DRM_XE_VM_CREATE_NO_VM_OVERCOMMIT) which will disallow overcommit
during bind

- test_vm_fault_mode_no_overcommit(): Tests that fault-mode VMs with
  DRM_XE_VM_CREATE_NO_VM_OVERCOMMIT enabled properly prevent eviction
  and validate OOM error handling.

These tests ensure deterministic VM behavior and prevent unpredictable
eviction-related performance degradation in memory-constrained scenarios.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 include/drm-uapi/xe_drm.h |   1 +
 tests/intel/xe_vm.c       | 131 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 128 insertions(+), 4 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 077e66a68..2efe27ad5 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -983,6 +983,7 @@ struct drm_xe_vm_create {
 #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
 #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
 #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
+#define DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT  (1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
 
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index cf45d1051..d908f6005 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -21,7 +21,9 @@
 #include "xe/xe_spin.h"
 #include <string.h>
 
-
+#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
+#define BO_SIZE xe_bb_size(fd, SZ_512M)
+#define MAX_BUFS ((int)(xe_visible_vram_size(fd, 0) / BO_SIZE))
 
 static uint32_t
 addr_low(uint64_t addr)
@@ -2387,9 +2389,6 @@ static void invalid_vm_id(int fd)
  */
 static void test_oom(int fd)
 {
-#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
-#define BO_SIZE xe_bb_size(fd, SZ_512M)
-#define MAX_BUFS ((int)(xe_visible_vram_size(fd, 0) / BO_SIZE))
 	uint64_t addr = 0x1a0000;
 	uint64_t vm_sync;
 	uint32_t bo[MAX_BUFS + 1];
@@ -2934,6 +2933,125 @@ gpu_done:
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: evict-vm-fault-no-overcommit
+ * Description: Test if vm fault mode with NO_VM_OVERCOMMIT flag prevents overcommit
+ * Functionality: NO_VM_OVERCOMMIT flag prevents per-VM overcommit in fault mode
+ * Test category: functionality test
+ */
+static void test_vm_fault_no_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
+					uint64_t system_size, uint64_t vram_size,
+					uint64_t overcommit_multiplier)
+{
+	uint64_t overcommit_size;
+	uint32_t vm;
+	uint32_t *bos;
+	int num_bos;
+	size_t nf_bo_size = 64 * 1024 * 1024;  // 64MB per BO
+	int i;
+	int create_ret;
+	int bind_err;
+	bool overcommit_detected = false;
+	uint32_t bind_exec_queue;
+	uint64_t data_addr = 0x300000000;
+
+	struct drm_xe_sync bind_sync[1] = {
+		{
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = USER_FENCE_VALUE
+		},
+	};
+
+	igt_debug("Starting fault-mode NO_VM_OVERCOMMIT test");
+
+	overcommit_size = ALIGN(vram_size * overcommit_multiplier, 4096);
+
+	if (overcommit_size > system_size) {
+		igt_debug("Limiting overcommit size from %llu MB to %llu MB",
+			  (unsigned long long)(overcommit_size >> 20),
+			  (unsigned long long)(system_size >> 20));
+		overcommit_size = ALIGN(system_size, 4096);
+	}
+
+	num_bos = (overcommit_size / nf_bo_size) + 1;
+	bos = calloc(num_bos, sizeof(*bos));
+	igt_assert(bos);
+
+	igt_debug("Fault mode NO_OVERCOMMIT: allocating %d BOs of %llu MB each, "
+		  "target overcommit=%llu MB, vram=%llu MB",
+		  num_bos, (unsigned long long)(nf_bo_size >> 20),
+		  (unsigned long long)(overcommit_size >> 20),
+		  (unsigned long long)(vram_size >> 20));
+
+	/* Create fault-mode VM with NO_VM_OVERCOMMIT flag */
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+		       DRM_XE_VM_CREATE_FLAG_FAULT_MODE |
+		       DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT, 0);
+	igt_assert(vm);
+
+	bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0);
+
+	/* Try to create and bind BOs - should eventually fail or limit overcommit */
+	for (i = 0; i < num_bos; i++) {
+		struct {
+			uint64_t vm_sync;
+		} *data;
+
+		/* CREATE BO */
+		create_ret = __xe_bo_create(fd, 0, nf_bo_size,
+					    vram_if_possible(fd, eci->gt_id),
+					    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+					    NULL, &bos[i]);
+		if (create_ret) {
+			igt_debug("BO create failed with error %d (%s)",
+				  -create_ret, strerror(-create_ret));
+			overcommit_detected = true;
+			num_bos = i;
+			break;
+		}
+
+		igt_debug("BO created successfully - %llu MB",
+			  (unsigned long long)(nf_bo_size >> 20));
+
+		/* MAP BO */
+		data = xe_bo_map(fd, bos[i], 4096);
+		memset(data, 0, 4096);
+		bind_sync[0].addr = to_user_pointer(&data->vm_sync);
+
+		/* Try to bind with IMMEDIATE flag - subject to no overcommit check */
+		bind_err = __xe_vm_bind(fd, vm, bind_exec_queue, bos[i], 0,
+					data_addr + (i * nf_bo_size), nf_bo_size,
+					DRM_XE_VM_BIND_OP_MAP, DRM_XE_VM_BIND_FLAG_IMMEDIATE,
+					bind_sync, 1, 0, 0, 0);
+		if (bind_err) {
+			igt_debug("Bind failed at %d/%d with error %d (%s)",
+				  i, num_bos, -bind_err, strerror(-bind_err));
+			igt_assert_f(bind_err == -ENOMEM || bind_err == -ENOSPC,
+				     "Unexpected bind error %d (%s)", -bind_err,
+				     strerror(-bind_err));
+			overcommit_detected = true;
+			num_bos = i;
+			break;
+		}
+
+		munmap(data, 4096);
+	}
+
+	igt_debug("NO_VM_OVERCOMMIT test: overcommit %s (created %d BOs)",
+		  overcommit_detected ? "limited" : "completed",
+		  num_bos);
+
+	/* Cleanup */
+	xe_exec_queue_destroy(fd, bind_exec_queue);
+	for (i = 0; i < num_bos; i++) {
+		if (bos[i])
+			gem_close(fd, bos[i]);
+	}
+	free(bos);
+	xe_vm_destroy(fd, vm);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
@@ -3350,6 +3468,11 @@ int igt_main()
 		igt_assert(xe_visible_vram_size(fd, 0));
 		test_oom(fd);
 	}
+	igt_subtest("evict-vm-fault-no-overcommit") {
+		igt_require(xe_has_vram(fd));
+		igt_assert(xe_visible_vram_size(fd, 0));
+		test_vm_fault_no_overcommit(fd, hwe, system_size, vram_size, 2);
+	}
 
 	igt_fixture()
 		drm_close_driver(fd);
-- 
2.52.0

