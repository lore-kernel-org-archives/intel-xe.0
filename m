Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF1BCA0EDC
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 03:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9249A10E134;
	Fri, 15 Aug 2025 03:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H139yR60";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5833010E134
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 03:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755227381; x=1786763381;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4NPPrq8TSasWbQ8ACvrN5HkxOnNuQ69jt09qX4NseJk=;
 b=H139yR60cSiHA5kmUYxhkBpCELK06Jqy5Zisn1YVE3tdy6G2TaLRn6da
 3/Ws5TyNKZlFmpSceh3f4qgOUZ+u7wAQolBGqAsfhIdSund10ts7Mr/Tp
 xvF5keSW1GepKk1mTY4EwzzTrX7yR2LY3dYg9/efAjlPKYa9oalc3rm3S
 YShRoT+ISTHpM6sIiXwI3nyHb9tkNga22+AZliAYVZtsleXfxrKstdqr0
 io4+DgghHYbZwsyg60vBrFC0VWVL7WOWiVzgyYHANx2kXnvPqq/0d8qmA
 TSEYQ+8R8C7hjjwkY+IWQSu5rGQ6aSQ1aZwqQg81s/7fpQKdDwOlkrwXg A==;
X-CSE-ConnectionGUID: fgyzxDo6RG+0IWe5xJoHkA==
X-CSE-MsgGUID: HH+j+eoxSHuIAWl8QLoZpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="67823253"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="67823253"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 20:09:40 -0700
X-CSE-ConnectionGUID: 24zFGMEsQNeZth2ltlWRhw==
X-CSE-MsgGUID: ELx0GUr5Qce4/OfBTh66UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="172144054"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 20:09:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, tomasz.lis@intel.com, stuart.summers@intel.com
Subject: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block section
Date: Thu, 14 Aug 2025 20:09:36 -0700
Message-Id: <20250815030936.2387322-1-matthew.brost@intel.com>
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

The non-block will become invalid and hang until the test exhausts all
memory when LR jobs are tracked in the DRM scheduler.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 113 -----------------------------
 1 file changed, 113 deletions(-)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index b904dc76b4..316f7322c1 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -320,116 +320,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		close(map_fd);
 }
 
-/**
- * SUBTEST: non-blocking
- * Description: Fill the ring and check we get expected errors.
- * Test category: functionality test
- */
-#define VM_DATA		0
-#define SPIN_DATA	1
-#define EXEC_DATA	2
-#define DATA_COUNT	3
-static void non_block(int fd, int expect)
-{
-	uint64_t addr = 0x1a0000;
-	struct drm_xe_sync sync[1] = {
-		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
-		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
-		  .timeline_value = USER_FENCE_VALUE},
-	};
-	struct drm_xe_exec exec = {
-		.num_batch_buffer = 1,
-		.num_syncs = 1,
-		.syncs = to_user_pointer(&sync),
-	};
-	struct {
-		struct xe_spin spin;
-		uint32_t batch[16];
-		uint64_t vm_sync;
-		uint32_t data;
-		uint64_t exec_sync;
-	} *data = NULL;
-	struct xe_spin_opts spin_opts = { .preempt = false };
-	struct drm_xe_engine *engine;
-	uint64_t batch_offset = (char *)&data[EXEC_DATA].batch - (char *)data;
-	uint64_t batch_addr = addr + batch_offset;
-	uint64_t sdi_offset = (char *)&data[EXEC_DATA].data - (char *)data;
-	uint64_t sdi_addr = addr + sdi_offset;
-	size_t bo_size;
-	uint32_t vm;
-	uint32_t exec_queue;
-	int value = 0x123456;
-	uint32_t bo = 0;
-	int b, err;
-
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
-	bo_size = sizeof(*data) * DATA_COUNT;
-	bo_size = xe_bb_size(fd, bo_size);
-
-	engine = xe_engine(fd, 1);
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id),
-			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-
-	data = xe_bo_map(fd, bo, bo_size);
-	memset(data, 0, bo_size);
-	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
-
-	sync[0].addr = to_user_pointer(&data[VM_DATA].vm_sync);
-	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0,
-			       addr, bo_size, sync, 1);
-	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
-	data[VM_DATA].vm_sync = 0;
-
-	spin_opts.addr = addr + (char *)&data[SPIN_DATA].spin - (char *)data;
-	xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
-	sync[0].addr = addr + (char *)&data[SPIN_DATA].exec_sync - (char *)data;
-	exec.exec_queue_id = exec_queue;
-	exec.address = spin_opts.addr;
-	xe_exec(fd, &exec);
-	xe_spin_wait_started(&data[SPIN_DATA].spin);
-
-	b = 0;
-	data[EXEC_DATA].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
-	data[EXEC_DATA].batch[b++] = sdi_addr;
-	data[EXEC_DATA].batch[b++] = sdi_addr >> 32;
-	data[EXEC_DATA].batch[b++] = value;
-	data[EXEC_DATA].batch[b++] = MI_BATCH_BUFFER_END;
-	igt_assert(b <= ARRAY_SIZE(data[EXEC_DATA].batch));
-
-	sync[0].addr = addr + (char *)&data[EXEC_DATA].exec_sync - (char *)data;
-	exec.num_syncs = 0;
-	exec.exec_queue_id = exec_queue;
-	exec.address = batch_addr;
-
-	while (1) {
-
-		err = ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
-
-		if (err == -1 && errno == EWOULDBLOCK)
-			break;
-
-		igt_assert_eq(err, 0);
-	}
-	igt_assert_eq(errno, expect);
-
-	xe_spin_end(&data[SPIN_DATA].spin);
-	xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
-	usleep(50000);
-
-	exec.num_syncs = 1;
-	xe_exec(fd, &exec);
-	xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
-
-	sync[0].addr = to_user_pointer(&data[VM_DATA].vm_sync);
-	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
-	munmap(data, bo_size);
-	gem_close(fd, bo);
-
-	xe_exec_queue_destroy(fd, exec_queue);
-	xe_vm_destroy(fd, vm);
-}
-
 #define LR_SPINNER_TIME 30
 /**
  * SUBTEST: lr-mode-workload
@@ -570,9 +460,6 @@ igt_main
 					  s->flags);
 	}
 
-	igt_subtest("non-blocking")
-		non_block(fd, EWOULDBLOCK);
-
 	igt_subtest("lr-mode-workload")
 		lr_mode_workload(fd);
 
-- 
2.34.1

