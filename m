Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CBFC2BA18
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 00:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750DD10E531;
	Tue, 18 Jun 2024 00:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMvwao5Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B51B10E531
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 00:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718671104; x=1750207104;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XnX3LTBcoXNA8jNJFzqpw4Sk4LoeSCgvH4BTAcA5AVg=;
 b=HMvwao5YEAd51uvYtQCUuT7DRiI8fO/lJ21GKdnuFf3/InWX+gGH6YXq
 by8GNzaEmzynItDqC8ftUKbWK63Dsok5+z61ydvCOoeMfR5rJEpT8IjSm
 C6uA8vdO1QOrObWBh+FY1/Sb7j2JU2YR3tBXjiAwdwZNhb2xCH07gWkW5
 Nm8/y28VeXSSqlr9yA8GAPV3+U4a2TS20NwKYpalpxEUPmzOKkOAppWrI
 CLGusJclF751YJDZWPdKb0lkSozhdbAq7pnPb5ZCLHru7YNJbz7k5lHCK
 us+N/1MKBA4UhiZj1eI9iWJW1Z3Ge/hW8uj0hzl+mShVfE1oPReCwe/rg g==;
X-CSE-ConnectionGUID: azBq2u2cTEOf6HeqnLXXpw==
X-CSE-MsgGUID: COM37vfqRZm/ocWtMQg4bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="18437295"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="18437295"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 17:38:23 -0700
X-CSE-ConnectionGUID: 0TFbbOdKTFmdiavNacikWA==
X-CSE-MsgGUID: 30UD/oK1T/OHFIORWjfYvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="45738918"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 17:38:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe: Simplify locking in new_vma
Date: Mon, 17 Jun 2024 17:38:59 -0700
Message-Id: <20240618003859.3239239-1-matthew.brost@intel.com>
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

Rather than acquiring and dropping the VM / BO dma-resv around
xe_vma_create and do the same thing upon adding preempt fences or an
error, hold these locks through the entire new_vma() function.

v2:
 - Rebase (CI)

Cc: Fei Yang <fei.yang@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 41 +++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 61d4d95a5377..5b166fa03684 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -180,16 +180,14 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
 	struct xe_exec_queue *q;
 	int err;
 
+	xe_bo_assert_held(bo);
+
 	if (!vm->preempt.num_exec_queues)
 		return 0;
 
-	err = xe_bo_lock(bo, true);
-	if (err)
-		return err;
-
 	err = dma_resv_reserve_fences(bo->ttm.base.resv, vm->preempt.num_exec_queues);
 	if (err)
-		goto out_unlock;
+		return err;
 
 	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link)
 		if (q->lr.pfence) {
@@ -198,9 +196,7 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
 					   DMA_RESV_USAGE_BOOKKEEP);
 		}
 
-out_unlock:
-	xe_bo_unlock(bo);
-	return err;
+	return 0;
 }
 
 static void resume_and_reinstall_preempt_fences(struct xe_vm *vm,
@@ -2140,7 +2136,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct drm_exec exec;
 	struct xe_vma *vma;
-	int err;
+	int err = 0;
 
 	lockdep_assert_held_write(&vm->lock);
 
@@ -2165,23 +2161,22 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
 			    op->va.range - 1, pat_index, flags);
-	if (bo)
-		drm_exec_fini(&exec);
+	if (IS_ERR(vma))
+		goto err_unlock;
 
-	if (xe_vma_is_userptr(vma)) {
+	if (xe_vma_is_userptr(vma))
 		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
-		if (err) {
-			prep_vma_destroy(vm, vma, false);
-			xe_vma_destroy_unlocked(vma);
-			return ERR_PTR(err);
-		}
-	} else if (!xe_vma_has_no_bo(vma) && !bo->vm) {
+	else if (!xe_vma_has_no_bo(vma) && !bo->vm)
 		err = add_preempt_fences(vm, bo);
-		if (err) {
-			prep_vma_destroy(vm, vma, false);
-			xe_vma_destroy_unlocked(vma);
-			return ERR_PTR(err);
-		}
+
+err_unlock:
+	if (bo)
+		drm_exec_fini(&exec);
+
+	if (err) {
+		prep_vma_destroy(vm, vma, false);
+		xe_vma_destroy_unlocked(vma);
+		vma = ERR_PTR(err);
 	}
 
 	return vma;
-- 
2.34.1

