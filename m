Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E45C25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 20:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1182310E1FC;
	Wed, 22 May 2024 20:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdeiG3f5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7807510F0E0
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 20:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716410078; x=1747946078;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PSP59b+OS+uxrD/p3A14HJiHja+wUeZKr9alstF6a7c=;
 b=VdeiG3f58/kWE8CGrCjY6cclJRZyDQ9KqY8VZcBhKv34EiYHZ242QsGB
 hVV/L+LIVngTz9bOgD2X9vkimzRgpB4lf289TfClcGdUNQyuFTzokfvv0
 0p7ln3VY4QS0+0/YjV/ySwXJGqj/g5O6eqZMjN04TEPvM7Ef0CXdrjY3I
 pbW+xJ12WpT0rngsbYXaVgrhh+NGmYCJjjchUuwYlHAJrrth37BBV75Eh
 wOFYz7BkJ6N2IRg29RuGTvaOSNlzuP9PkGfXR16OA4pUcyGrjWFeOpwpq
 qkn4BQDNJJyY1k1iJP0Gp4liygimduKpZc3ffX/XTMiiL6+BJQuRAVJ3y w==;
X-CSE-ConnectionGUID: 14NY3T5lQYaC0UPPS337Ug==
X-CSE-MsgGUID: fUywRwkGSSyEMDXOcn6bYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12527647"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12527647"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 13:34:37 -0700
X-CSE-ConnectionGUID: Vtoj+uxKQ8+7ZNnV+iaClQ==
X-CSE-MsgGUID: PwuDFOIhQ8mjtwVVbFOqiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="56651369"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 13:34:36 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/xe: Nuke simple error capture
Date: Wed, 22 May 2024 13:34:31 -0700
Message-ID: <20240522203431.191594-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.45.1
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

This error capture prints into dmesg HW state when a gpu hang happens.
It was useful when we did not had devcoredump, now it is a incompleted
version of devcoredump that has potential to flood dmesg.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug   | 10 ------
 drivers/gpu/drm/xe/xe_guc_submit.c | 53 +-----------------------------
 drivers/gpu/drm/xe/xe_vm.c         | 49 ---------------------------
 drivers/gpu/drm/xe/xe_vm.h         |  2 --
 4 files changed, 1 insertion(+), 113 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index df02e5d17d26f..bc177368af6c3 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -61,16 +61,6 @@ config DRM_XE_DEBUG_MEM
 
 	  If in doubt, say "N".
 
-config DRM_XE_SIMPLE_ERROR_CAPTURE
-	bool "Enable simple error capture to dmesg on job timeout"
-	default n
-	help
-	  Choose this option when debugging an unexpected job timeout
-
-	  Recommended for driver developers only.
-
-	  If in doubt, say "N".
-
 config DRM_XE_KUNIT_TEST
         tristate "KUnit tests for the drm xe driver" if !KUNIT_ALL_TESTS
 	depends on DRM_XE && KUNIT && DEBUG_FS
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 23f73577facf6..f0a5215159003 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -815,55 +815,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
 }
 
-static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p);
-
-#if IS_ENABLED(CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE)
-static void simple_error_capture(struct xe_exec_queue *q)
-{
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
-	struct drm_printer p = drm_err_printer(&xe->drm, NULL);
-	struct xe_hw_engine *hwe;
-	enum xe_hw_engine_id id;
-	u32 adj_logical_mask = q->logical_mask;
-	u32 width_mask = (0x1 << q->width) - 1;
-	int i;
-	bool cookie;
-
-	if (q->vm && !q->vm->error_capture.capture_once) {
-		q->vm->error_capture.capture_once = true;
-		cookie = dma_fence_begin_signalling();
-		for (i = 0; q->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
-			if (adj_logical_mask & BIT(i)) {
-				adj_logical_mask |= width_mask << i;
-				i += q->width;
-			} else {
-				++i;
-			}
-		}
-
-		if (xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL))
-			xe_gt_info(guc_to_gt(guc),
-				   "failed to get forcewake for error capture");
-		xe_guc_ct_print(&guc->ct, &p, true);
-		guc_exec_queue_print(q, &p);
-		for_each_hw_engine(hwe, guc_to_gt(guc), id) {
-			if (hwe->class != q->hwe->class ||
-			    !(BIT(hwe->logical_instance) & adj_logical_mask))
-				continue;
-			xe_hw_engine_print(hwe, &p);
-		}
-		xe_analyze_vm(&p, q->vm, q->gt->info.id);
-		xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
-		dma_fence_end_signalling(cookie);
-	}
-}
-#else
-static void simple_error_capture(struct xe_exec_queue *q)
-{
-}
-#endif
-
 static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -995,10 +946,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
 		   "VM job timed out on non-killed execqueue\n");
 
-	if (!exec_queue_killed(q)) {
-		simple_error_capture(q);
+	if (!exec_queue_killed(q))
 		xe_devcoredump(job);
-	}
 
 	trace_xe_sched_job_timedout(job);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c5b1694b292fc..53f196cf447b4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3389,55 +3389,6 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	return 0;
 }
 
-int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
-{
-	struct drm_gpuva *gpuva;
-	bool is_vram;
-	uint64_t addr;
-
-	if (!down_read_trylock(&vm->lock)) {
-		drm_printf(p, " Failed to acquire VM lock to dump capture");
-		return 0;
-	}
-	if (vm->pt_root[gt_id]) {
-		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, XE_PAGE_SIZE);
-		is_vram = xe_bo_is_vram(vm->pt_root[gt_id]->bo);
-		drm_printf(p, " VM root: A:0x%llx %s\n", addr,
-			   is_vram ? "VRAM" : "SYS");
-	}
-
-	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
-		struct xe_vma *vma = gpuva_to_vma(gpuva);
-		bool is_userptr = xe_vma_is_userptr(vma);
-		bool is_null = xe_vma_is_null(vma);
-
-		if (is_null) {
-			addr = 0;
-		} else if (is_userptr) {
-			struct sg_table *sg = to_userptr_vma(vma)->userptr.sg;
-			struct xe_res_cursor cur;
-
-			if (sg) {
-				xe_res_first_sg(sg, 0, XE_PAGE_SIZE, &cur);
-				addr = xe_res_dma(&cur);
-			} else {
-				addr = 0;
-			}
-		} else {
-			addr = __xe_bo_addr(xe_vma_bo(vma), 0, XE_PAGE_SIZE);
-			is_vram = xe_bo_is_vram(xe_vma_bo(vma));
-		}
-		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
-			   xe_vma_start(vma), xe_vma_end(vma) - 1,
-			   xe_vma_size(vma),
-			   addr, is_null ? "NULL" : is_userptr ? "USR" :
-			   is_vram ? "VRAM" : "SYS");
-	}
-	up_read(&vm->lock);
-
-	return 0;
-}
-
 struct xe_vm_snapshot {
 	unsigned long num_snaps;
 	struct {
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 3ac9021f970e3..b481608b12f1b 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -243,8 +243,6 @@ int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
 
 bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
 
-int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
-
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
 
 int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
-- 
2.45.1

