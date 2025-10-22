Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5B3CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 23:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F9110E1B9;
	Wed, 22 Oct 2025 23:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pyq46te7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED88A10E1B9
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 23:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761174087; x=1792710087;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H74fvKxVDx62wXoXtHvp58vfarIz/FjysELrrA4SYSY=;
 b=Pyq46te7SbDfs21RnsddB+P1m6IfS6frf6xzdV+7t495cD714tajs7Xm
 k5ZvszthJF3BAnW2suWHScoCiPAjzquuBbLUon00JvRga0+3N2vO8Hp9O
 kNDMhlgQFD75f7WQlrQtAkAGv/n2SvnV9+gPHIuaDVOAvvMdEKi9E9UsI
 uMBFTHbR4uwkoOewZ+qyw4jJ3SaDxpIsfyc6fOLMASU3cOvMKILjnPpaJ
 Ul5jwmFy7W8SOxjjC+SJX731FrJBW9DHbn5GBueCMA+XRwqqF+VwXWkT2
 DW9CbheWu3RatwRE/GZtNxeQ53HD5GnPBQEpOjN8lII7EAukk/rQhEVSM A==;
X-CSE-ConnectionGUID: AlkQwzfdTuyafs3beYWigQ==
X-CSE-MsgGUID: uT6+na7HR7GwxoeXTvUyqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62545042"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="62545042"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 16:01:26 -0700
X-CSE-ConnectionGUID: 9gFxYLEER6eUE1EpQfHDjw==
X-CSE-MsgGUID: T8EyUNuDTIaj+UNbXlFYNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="207657884"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 16:01:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Use SVM range helpers in PT layer
Date: Wed, 22 Oct 2025 16:01:22 -0700
Message-Id: <20251022230122.922382-1-matthew.brost@intel.com>
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

We have helpers SVM range start, end, and size. Use them in the PT
layer rather than directly looking at the struct.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d22fd1ccc0ba..7c5bca78c8bf 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -715,7 +715,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		.vm = vm,
 		.tile = tile,
 		.curs = &curs,
-		.va_curs_start = range ? range->base.itree.start :
+		.va_curs_start = range ? xe_svm_range_start(range) :
 			xe_vma_start(vma),
 		.vma = vma,
 		.wupd.entries = entries,
@@ -734,7 +734,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		}
 		if (xe_svm_range_has_dma_mapping(range)) {
 			xe_res_first_dma(range->base.pages.dma_addr, 0,
-					 range->base.itree.last + 1 - range->base.itree.start,
+					 xe_svm_range_size(range),
 					 &curs);
 			xe_svm_range_debug(range, "BIND PREPARE - MIXED");
 		} else {
@@ -778,8 +778,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 
 walk_pt:
 	ret = xe_pt_walk_range(&pt->base, pt->level,
-			       range ? range->base.itree.start : xe_vma_start(vma),
-			       range ? range->base.itree.last + 1 : xe_vma_end(vma),
+			       range ? xe_svm_range_start(range) : xe_vma_start(vma),
+			       range ? xe_svm_range_end(range) : xe_vma_end(vma),
 			       &xe_walk.base);
 
 	*num_entries = xe_walk.wupd.num_used_entries;
@@ -975,8 +975,8 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
 
-	(void)xe_pt_walk_shared(&pt->base, pt->level, range->base.itree.start,
-				range->base.itree.last + 1, &xe_walk.base);
+	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_svm_range_start(range),
+				xe_svm_range_end(range), &xe_walk.base);
 
 	return xe_walk.needs_invalidate;
 }
@@ -1661,8 +1661,8 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
 				       struct xe_svm_range *range,
 				       struct xe_vm_pgtable_update *entries)
 {
-	u64 start = range ? range->base.itree.start : xe_vma_start(vma);
-	u64 end = range ? range->base.itree.last + 1 : xe_vma_end(vma);
+	u64 start = range ? xe_svm_range_start(range) : xe_vma_start(vma);
+	u64 end = range ? xe_svm_range_end(range) : xe_vma_end(vma);
 	struct xe_pt_stage_unbind_walk xe_walk = {
 		.base = {
 			.ops = &xe_pt_stage_unbind_ops,
@@ -1872,7 +1872,7 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
 
 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
 	       "Preparing bind, with range [%lx...%lx)\n",
-	       range->base.itree.start, range->base.itree.last);
+	       xe_svm_range_start(range), xe_svm_range_end(range) - 1);
 
 	pt_op->vma = NULL;
 	pt_op->bind = true;
@@ -1887,8 +1887,8 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
 					pt_op->num_entries, true);
 
 		xe_pt_update_ops_rfence_interval(pt_update_ops,
-						 range->base.itree.start,
-						 range->base.itree.last + 1);
+						 xe_svm_range_start(range),
+						 xe_svm_range_end(range));
 		++pt_update_ops->current_op;
 		pt_update_ops->needs_svm_lock = true;
 
@@ -1983,7 +1983,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
 
 	vm_dbg(&vm->xe->drm,
 	       "Preparing unbind, with range [%lx...%lx)\n",
-	       range->base.itree.start, range->base.itree.last);
+	       xe_svm_range_start(range), xe_svm_range_end(range) - 1);
 
 	pt_op->vma = XE_INVALID_VMA;
 	pt_op->bind = false;
@@ -1994,8 +1994,8 @@ static int unbind_range_prepare(struct xe_vm *vm,
 
 	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
 				pt_op->num_entries, false);
-	xe_pt_update_ops_rfence_interval(pt_update_ops, range->base.itree.start,
-					 range->base.itree.last + 1);
+	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_svm_range_start(range),
+					 xe_svm_range_end(range));
 	++pt_update_ops->current_op;
 	pt_update_ops->needs_svm_lock = true;
 	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
-- 
2.34.1

