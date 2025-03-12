Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D210AC28B2F
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 12:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855EC10E6F8;
	Wed, 12 Mar 2025 12:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YctQbzio";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE1210E13F;
 Wed, 12 Mar 2025 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kWVfsuDpw6uxgKagtN2pEi9Rh7jCHfnuGvo+PgFyszA=; b=YctQbzioHMRTZWoMlkxjCu1gAR
 W9h/YmewEvdFiSE4wVP+zCwhIwCTbvG0IXMxKCiS3WaSgsF0OgPDhcJ4xsXXbT3ngJEeN7riFFl7R
 JIONliKXAGdjvYc83BhxLZ6J4WP/KEf3YHgzQ4NVhIXhgq9J/3EDbCPSpH85H4lOjIBOCWUDzwnbe
 QVm+hINpzMqo7onWEv53er+V97lhhUJT2bnlmn91C0JrL6R83mwOBdSrGJGHWiWyHyn5O4BREBsvr
 Ksf6amfQku4UUdnygSRJ/rP/BNbuia8zYmpq90AuPlzc2Uksn6HgKTOouSszGgIShaqv/FXjK6zS8
 mXfCvElw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tsLQ2-007cWX-HE; Wed, 12 Mar 2025 13:42:48 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_sync_file: Exercise sync file access
 post queue destruction
Date: Wed, 12 Mar 2025 12:42:44 +0000
Message-ID: <20250312124245.83254-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

A new test to roughly simulate the VK CTS suite where
dEQP-VK.wsi.android.swapchain.render.* is hitting an use after free when a
sync file is accessed after the xe submission queue has been destroyed.

Abbreviated KASAN report:

 [IGT] xe_sync_file: starting subtest sync_file_race
 ==================================================================
 BUG: KASAN: slab-use-after-free in drm_sched_fence_get_timeline_name+0xa1/0xb0 [gpu_sched]
 Read of size 8 at addr ffff888126726020 by task xe_sync_file/2931
 ...
 Call Trace:
  <TASK>
  kasan_report+0xeb/0x130
  drm_sched_fence_get_timeline_name+0xa1/0xb0 [gpu_sched]
  sync_file_ioctl+0x3cb/0xb00
 ...
 Allocated by task 2931:
  __kmalloc_cache_noprof+0x1c2/0x410
  guc_exec_queue_init+0x1a8/0x1240 [xe]
  xe_exec_queue_create+0xe72/0x13b0 [xe]
  xe_exec_queue_create_ioctl+0x10d9/0x1770 [xe]
  drm_ioctl_kernel+0x179/0x300
  drm_ioctl+0x58f/0xcf0
  xe_drm_ioctl+0xe8/0x140 [xe]
 ...
 Freed by task 1689:
  kfree+0x106/0x3e0
  __guc_exec_queue_fini_async+0x144/0x2d0 [xe]
  process_one_work+0x610/0xdf0
  worker_thread+0x7c8/0x14b0

Without KASAN this of course turns into a plain null pointer dereference.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_sync_file.c | 139 +++++++++++++++++++++++++++++++++++++
 tests/meson.build          |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 tests/intel/xe_sync_file.c

diff --git a/tests/intel/xe_sync_file.c b/tests/intel/xe_sync_file.c
new file mode 100644
index 000000000000..3b8e93315be8
--- /dev/null
+++ b/tests/intel/xe_sync_file.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Google, Inc.
+ */
+
+/**
+ * TEST: Tests for sync file functionality
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
+ * Functionality: fences
+ */
+
+#include "igt.h"
+#include "sync_file.h"
+
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+static int sync_file_get_status(int sync_file)
+{
+	struct sync_fence_info fence = { };
+	struct sync_file_info info = {
+		.num_fences = 1,
+		.sync_fence_info = to_user_pointer(&fence),
+	};
+
+	do_ioctl(sync_file, SYNC_IOC_FILE_INFO, &info);
+	igt_assert_eq(info.num_fences, 1);
+
+	igt_debug("'%s'/'%s' = %d\n",
+		  fence.driver_name, fence.obj_name, fence.status);
+
+	return fence.status;
+}
+
+/**
+ * SUBTEST: sync_file_race
+ * Description: Check that we can safely query an exported sync file fd
+ * Test category: functionality test
+ */
+static void test_race(int xe, struct drm_xe_engine_class_instance *eci)
+{
+	uint32_t vm, bo, syncobj, bind_syncobj, *batch;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		},
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		},
+	};
+	const uint32_t bbend = MI_BATCH_BUFFER_END;
+	struct drm_xe_exec exec = {
+		.address = 0x100000,
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	int sync_fence;
+	size_t size;
+
+	vm = xe_vm_create(xe, 0, 0);
+
+	size = xe_bb_size(xe, sizeof(bbend));
+	bo = xe_bo_create(xe, vm, size, vram_if_possible(xe, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	batch = xe_bo_map(xe, bo, size);
+	*batch = bbend;
+
+	exec.exec_queue_id  = xe_exec_queue_create(xe, vm, eci, 0);
+
+	syncobj = syncobj_create(xe, 0);
+	bind_syncobj = syncobj_create(xe, 0);
+
+	sync[0].handle = bind_syncobj;
+	xe_vm_bind_async(xe, vm, 0, bo, 0, exec.address, size, sync, 1);
+
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[0].handle = bind_syncobj;
+	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].handle = syncobj;
+	xe_exec(xe, &exec);
+
+	/* Export a sync file fence. */
+	sync_fence = syncobj_handle_to_fd(xe, sync[1].handle,
+					  DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE);
+
+	igt_assert(syncobj_wait(xe, &syncobj, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(xe, &bind_syncobj, 1, INT64_MAX, 0, NULL));
+
+	igt_assert_eq(sync_file_get_status(sync_fence), 1);
+
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	syncobj_reset(xe, &sync[0].handle, 1);
+	xe_vm_unbind_async(xe, vm, 0, 0, exec.address, size, sync, 1);
+	igt_assert(syncobj_wait(xe, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(xe, syncobj);
+	xe_exec_queue_destroy(xe, exec.exec_queue_id);
+
+	munmap(batch, size);
+	gem_close(xe, bo);
+
+	syncobj_destroy(xe, bind_syncobj);
+	xe_vm_destroy(xe, vm);
+
+	/* Give any delayed freeing time to run. */
+	sleep(1);
+
+	/* This should still work and not crash the kernel. */
+	igt_assert_eq(sync_file_get_status(sync_fence), 1);
+
+	close(sync_fence);
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *eci;
+	int xe;
+
+	igt_fixture
+		xe = drm_open_driver(DRIVER_XE);
+
+	igt_subtest("sync_file_race") {
+		xe_for_each_engine(xe, eci) {
+			test_race(xe, eci);
+			break;
+		}
+	}
+
+	igt_fixture
+		drm_close_driver(xe);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 33dffad31723..95d94dfde28e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -318,6 +318,7 @@ intel_xe_progs = [
 	'xe_spin_batch',
 	'xe_sriov_auto_provisioning',
 	'xe_sriov_flr',
+	'xe_sync_file',
 	'xe_sysfs_defaults',
 	'xe_sysfs_preempt_timeout',
 	'xe_sysfs_scheduler',
-- 
2.48.0

