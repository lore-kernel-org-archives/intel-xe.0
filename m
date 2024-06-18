Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A97C27C79
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 00:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB57410E012;
	Tue, 18 Jun 2024 00:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvR3O4Gw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4390510E16B
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 00:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718670604; x=1750206604;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+r+AM1JKvLMA5tUqcbiyGvBdz3J9PlUl5iPZEex3yHc=;
 b=LvR3O4GwqAGtA6I3XhEvvWiYnCo/IlHMC7alB2gwPSL7OJU9/7OkWyzy
 Api/Geu/ypaJiudNI/Gj5vnKUHQ+fgHIVgu4SP3lXwxw4EBzkOu0Dc6w8
 w0xTk6l1dURskoZQPTl0OdSeXA3xv046qGd+Dys+4ScDFfHTFnTeZA8lN
 TGJg1iMKuC1rSX2Edyx3FvvtyCywpVOiOladKbes+4mRfcL/SUbwUbxK+
 kASrdWapWmGP5RG+nbqrsLKDOdvjV+vy6qlNXAc/jIYG6DUmCj02HGsYk
 9EHDpXo2RtHb5CO1Hm6SIrvdnSqyvAZdch7ObeLZaffqCAnXIeus0qk0P Q==;
X-CSE-ConnectionGUID: T6Qyqrr0R2KGEMrp4S6mUQ==
X-CSE-MsgGUID: rI5Q8rbVQfmsITzIwoXzjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26921049"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="26921049"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 17:30:04 -0700
X-CSE-ConnectionGUID: mYFeH4xCRf2l5xr+9dEZTQ==
X-CSE-MsgGUID: W37PAtgPQp2iV1VtxCWGEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="46311774"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 17:30:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Simplify locking in new_vma
Date: Mon, 17 Jun 2024 17:30:39 -0700
Message-Id: <20240618003039.3238961-1-matthew.brost@intel.com>
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

Cc: Fei Yang <fei.yang@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 41 +++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ffda487653d8..3913374b3668 100644
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
 
 	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
 		if (q->compute.pfence) {
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

