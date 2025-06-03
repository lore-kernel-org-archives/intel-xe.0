Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316AAC5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 17:38:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B05F10E6AA;
	Tue,  3 Jun 2025 17:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O39SiWWY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125F010E6AA
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 17:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748972321; x=1780508321;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4pmMo0MBQOtXLYd81e8UWspQmtVhQsochmBbur1t9jw=;
 b=O39SiWWY4Wp7GBblwXoFZSKIKVOZ9GI/YGfEbylNGHqNeRgX7cOw2z6g
 LBryejqHia4uqZ8LBLneLzf/5oBSGrZebebUrSYxNWEQ2+rRQkHrJSbQB
 3nrq9Y0/zcTQjUGpTNByAsz1srEaNZriwak4LoukW/n1G6tVX4vVkCJy5
 AvBjv/FLvGYwRctnvO2Bj3VSFj4n9KeUZ1C7CilDjbbCLDsqeTZbomVpY
 7nxK2nubI5FV5wrJQormAU0DkLn+wRtJf1ftBpFNVDGvv6gePmb1azI6E
 K7tsYLF5inCtuVIMuZAdjxjR/H9Mv/0E74mqul3Tf9Buz74w+EkxPLa3L Q==;
X-CSE-ConnectionGUID: H3Jgx3QdSgWc9+mWCJMAgQ==
X-CSE-MsgGUID: H0fFxegMTMu+46A8h7xYsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51126561"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="51126561"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 10:38:40 -0700
X-CSE-ConnectionGUID: ywPI8UxLS0CumpqqOlYwlg==
X-CSE-MsgGUID: EnlD7kQpSlmoArXZn+PeDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="148771174"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 10:38:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH] drm/xe: Don't use drm exec locking in SVM pagefaults
Date: Tue,  3 Jun 2025 10:40:12 -0700
Message-Id: <20250603174012.2195759-1-matthew.brost@intel.com>
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

Only the VM dma-resv lock is needed in SVM pagefaults so
xe_vm_lock/unlock can be used instead of drm exec. Micro optimization
but should save some CPU cycles in a critical path.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index f27fb9b588de..952b75a4264d 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -858,7 +858,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
 	struct xe_svm_range *range;
-	struct drm_exec exec;
 	struct dma_fence *fence;
 	struct xe_tile *tile = gt_to_tile(gt);
 	int migrate_try_count = ctx.devmem_only ? 3 : 1;
@@ -933,30 +932,21 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	range_debug(range, "PAGE FAULT - BIND");
 
 retry_bind:
-	drm_exec_init(&exec, 0, 0);
-	drm_exec_until_all_locked(&exec) {
-		err = drm_exec_lock_obj(&exec, vm->gpuvm.r_obj);
-		drm_exec_retry_on_contention(&exec);
-		if (err) {
-			drm_exec_fini(&exec);
-			goto err_out;
-		}
-
-		fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
-		if (IS_ERR(fence)) {
-			drm_exec_fini(&exec);
-			err = PTR_ERR(fence);
-			if (err == -EAGAIN) {
-				ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
-				range_debug(range, "PAGE FAULT - RETRY BIND");
-				goto retry;
-			}
-			if (xe_vm_validate_should_retry(&exec, err, &end))
-				goto retry_bind;
-			goto err_out;
+	xe_vm_lock(vm, false);
+	fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
+	if (IS_ERR(fence)) {
+		xe_vm_unlock(vm);
+		err = PTR_ERR(fence);
+		if (err == -EAGAIN) {
+			ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
+			range_debug(range, "PAGE FAULT - RETRY BIND");
+			goto retry;
 		}
+		if (xe_vm_validate_should_retry(NULL, err, &end))
+			goto retry_bind;
+		goto err_out;
 	}
-	drm_exec_fini(&exec);
+	xe_vm_unlock(vm);
 
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
-- 
2.34.1

