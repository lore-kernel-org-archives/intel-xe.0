Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122C7CA0FE5
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 14:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AAF10E7F3;
	Fri,  1 Sep 2023 14:26:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC91310E7F1
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 14:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693578413; x=1725114413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VCJbzt0Is6SW5m13qnlqMTSjNKrFmnCjXXADcSDryFU=;
 b=WVgrJD+JswYj2jc+08L/O1pQIQa7746u4Hvc3pii6d4MPJb6Idvpmorv
 X+3hMpicgS++IoxJQL8VskLNOaO7fSKHRXFoOKl0IlhhnRYVzwXmcJfvI
 TfkIU+FQ1I1bLTXmgjTFXnuvtZmbl/i6O83q41JENN1K6eH/UGCPg13/g
 drQEeDhOpdey9Aw4u0B0g5cnzwRy12L0I81xc99EsD5GZlgzIc1WOt/M3
 uEiz88gkIuI1N+TmQNLv4b97t53N8ba1opdjutdar7tQuAxaGNI+jEPSy
 ABkji0TrLfsRWmxNkd9rKUmEsps4/SSVFy997BWFoZf+qcTUX0qlnHM4D A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366456607"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="366456607"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 07:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070766852"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="1070766852"
Received: from nabdull7-mobl1.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.112])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 07:26:52 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Sep 2023 16:26:28 +0200
Message-ID: <20230901142629.4125-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901142629.4125-1-thomas.hellstrom@linux.intel.com>
References: <20230901142629.4125-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 5/6] drm/xe: Convert pagefaulting code to use
 drm_exec
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

Replace the calls into ttm_eu_reserve_buffers with the drm_exec helpers.
Also reuse some code.

v4:
- Kerneldoc xe_vm_prepare_vma().

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 106 ++++++++++++---------------
 drivers/gpu/drm/xe/xe_vm.c           |  27 +++++++
 drivers/gpu/drm/xe/xe_vm.h           |   3 +
 3 files changed, 76 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 73fc9389a663..e6197ec6f72f 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -8,6 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/circ_buf.h>
 
+#include <drm/drm_exec.h>
 #include <drm/drm_managed.h>
 #include <drm/ttm/ttm_execbuf_util.h>
 
@@ -84,11 +85,6 @@ static bool vma_matches(struct xe_vma *vma, u64 page_addr)
 	return true;
 }
 
-static bool only_needs_bo_lock(struct xe_bo *bo)
-{
-	return bo && bo->vm;
-}
-
 static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
 {
 	struct xe_vma *vma = NULL;
@@ -103,17 +99,44 @@ static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
 	return vma;
 }
 
+static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
+		       unsigned int num_shared, bool atomic, unsigned int id)
+{
+	struct xe_bo *bo = xe_vma_bo(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
+	int err;
+
+	err = xe_vm_prepare_vma(exec, vma, num_shared);
+	if (err)
+		return err;
+
+	if (atomic) {
+		if (xe_vma_is_userptr(vma)) {
+			err = -EACCES;
+			return err;
+		}
+
+		/* Migrate to VRAM, move should invalidate the VMA first */
+		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id);
+		if (err)
+			return err;
+	} else if (bo) {
+		/* Create backing store if needed */
+		err = xe_bo_validate(bo, vm, true);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_tile *tile = gt_to_tile(gt);
+	struct drm_exec exec;
 	struct xe_vm *vm;
 	struct xe_vma *vma = NULL;
-	struct xe_bo *bo;
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
-	struct ttm_validate_buffer tv_bo, tv_vm;
-	struct ww_acquire_ctx ww;
 	struct dma_fence *fence;
 	bool write_locked;
 	int ret = 0;
@@ -170,35 +193,10 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	}
 
 	/* Lock VM and BOs dma-resv */
-	bo = xe_vma_bo(vma);
-	if (!only_needs_bo_lock(bo)) {
-		tv_vm.num_shared = xe->info.tile_count;
-		tv_vm.bo = xe_vm_ttm_bo(vm);
-		list_add(&tv_vm.head, &objs);
-	}
-	if (bo) {
-		tv_bo.bo = &bo->ttm;
-		tv_bo.num_shared = xe->info.tile_count;
-		list_add(&tv_bo.head, &objs);
-	}
-
-	ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
-	if (ret)
-		goto unlock_vm;
-
-	if (atomic) {
-		if (xe_vma_is_userptr(vma)) {
-			ret = -EACCES;
-			goto unlock_dma_resv;
-		}
-
-		/* Migrate to VRAM, move should invalidate the VMA first */
-		ret = xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
-		if (ret)
-			goto unlock_dma_resv;
-	} else if (bo) {
-		/* Create backing store if needed */
-		ret = xe_bo_validate(bo, vm, true);
+	drm_exec_init(&exec, 0);
+	drm_exec_until_all_locked(&exec) {
+		ret = xe_pf_begin(&exec, vma, xe->info.tile_count, atomic, tile->id);
+		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			goto unlock_dma_resv;
 	}
@@ -225,7 +223,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	vma->usm.tile_invalidated &= ~BIT(gt_to_tile(gt)->id);
 
 unlock_dma_resv:
-	ttm_eu_backoff_reservation(&ww, &objs);
+	drm_exec_fini(&exec);
 unlock_vm:
 	if (!ret)
 		vm->usm.last_fault_vma = vma;
@@ -490,13 +488,9 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_tile *tile = gt_to_tile(gt);
+	struct drm_exec exec;
 	struct xe_vm *vm;
 	struct xe_vma *vma;
-	struct xe_bo *bo;
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
-	struct ttm_validate_buffer tv_bo, tv_vm;
-	struct ww_acquire_ctx ww;
 	int ret = 0;
 
 	/* We only support ACC_TRIGGER at the moment */
@@ -528,23 +522,15 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 		goto unlock_vm;
 
 	/* Lock VM and BOs dma-resv */
-	bo = xe_vma_bo(vma);
-	if (!only_needs_bo_lock(bo)) {
-		tv_vm.num_shared = xe->info.tile_count;
-		tv_vm.bo = xe_vm_ttm_bo(vm);
-		list_add(&tv_vm.head, &objs);
+	drm_exec_init(&exec, 0);
+	drm_exec_until_all_locked(&exec) {
+		ret = xe_pf_begin(&exec, vma, xe->info.tile_count, true, tile->id);
+		drm_exec_retry_on_contention(&exec);
+		if (ret)
+			break;
 	}
-	tv_bo.bo = &bo->ttm;
-	tv_bo.num_shared = xe->info.tile_count;
-	list_add(&tv_bo.head, &objs);
-	ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
-	if (ret)
-		goto unlock_vm;
-
-	/* Migrate to VRAM, move should invalidate the VMA first */
-	ret = xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
 
-	ttm_eu_backoff_reservation(&ww, &objs);
+	drm_exec_fini(&exec);
 unlock_vm:
 	up_read(&vm->lock);
 	xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 19cacbe43ec6..d6179a46157a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1090,6 +1090,33 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 	}
 }
 
+/**
+ * xe_vm_prepare_vma() - drm_exec utility to lock a vma
+ * @exec: The drm_exec object we're currently locking for.
+ * @vma: The vma for witch we want to lock the vm resv and any attached
+ * object's resv.
+ * @num_shared: The number of dma-fence slots to pre-allocate in the
+ * objects' reservation objects.
+ *
+ * Return: 0 on success, negative error code on error. In particular
+ * may return -EDEADLK on WW transaction contention and -EINTR if
+ * an interruptible wait is terminated by a signal.
+ */
+int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
+		      unsigned int num_shared)
+{
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_bo *bo = xe_vma_bo(vma);
+	int err;
+
+	XE_WARN_ON(!vm);
+	err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base, num_shared);
+	if (!err && bo && !bo->vm)
+		err = drm_exec_prepare_obj(exec, &bo->ttm.base, num_shared);
+
+	return err;
+}
+
 static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 {
 	struct ttm_validate_buffer tv[2];
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 4a1dd11f71c5..5608e4e33169 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -222,6 +222,9 @@ void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
 
 int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
 
+int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
+		      unsigned int num_shared);
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
 #define vm_dbg drm_dbg
 #else
-- 
2.41.0

