Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B3AC61DB2
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 04:35:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CD810E3C1;
	Fri, 13 Jun 2025 04:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KyWmcN0j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99E610E3C1
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 04:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749789317; x=1781325317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dGHk9EXLsWpGGJ/tvmZsjzHiDgnJy9whQn2DnyKb62o=;
 b=KyWmcN0j2KaWixmMU8FKFFCxVxLABimDO+PTYYDH1yJG2DIj8BJA0VfE
 quI1EtOTGJf08zFDcQw5T2leQHyQwbF0heAU+VAVdSFMiOCjb7UTD+YHE
 IBnKY5/vMDriXdKRwHOsqn3R69iViutH6m12b6i5bpajzOlPhib9V8Czq
 84vDv0CXhsLYITr/787b9DG+rLuPCr4CYdyAXhvWyXmI/2fm07r6w+uDI
 qlrxzJ1oB1wam4GJ9H2S9N9NlPVWP7NhRiZtSDcsdnw2WzNOroEL7scdX
 fJWCo0sqxOyuYVdfq2VdkpsUW4pbihave75ah9kZNJ8SY7bpHVgv2hNvR w==;
X-CSE-ConnectionGUID: 8Wli+G/aTXm0EhtrEjXs8g==
X-CSE-MsgGUID: qABMIrjyS5GjYSBIRm2+fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63348883"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="63348883"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 21:35:13 -0700
X-CSE-ConnectionGUID: J+O1w7TYRSCxPKAeciCl+w==
X-CSE-MsgGUID: xg5RU3D4RICMhNqboaq8PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="153009669"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 21:35:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH] drm/xe: Opportunistically skip TLB invalidaion on unbind
Date: Thu, 12 Jun 2025 21:36:45 -0700
Message-Id: <20250613043645.255351-1-matthew.brost@intel.com>
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

If a range or VMA is invalidated and scratched page is disabled, there
is no reason to issue a TLB invalidation on unbind, skip TLB
innvalidation is this condition is true. This is an opportunistic check
as it is done without the notifier lock, thus it possible for the range
or VMA to be invalidated after this check is performed.

This should improve performance of the SVM garbage collector, for
example, xe_exec_system_allocator --r many-stride-new-prefetch, went
~20s to ~9.5s on a BMG.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c  | 18 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_svm.c |  5 ++++-
 drivers/gpu/drm/xe/xe_vm.c  |  5 ++++-
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f39d5cc9f411..09c3ccc81cca 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1988,7 +1988,14 @@ static int unbind_op_prepare(struct xe_tile *tile,
 					 xe_vma_end(vma));
 	++pt_update_ops->current_op;
 	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
-	pt_update_ops->needs_invalidation = true;
+
+	/*
+	 * Opportunistically supressing invalidation, READ_ONCE pairs with
+	 * WRITE_ONCE in MMU notifier or BO move
+	 */
+	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(xe_vma_vm(vma)) ||
+		((vma->tile_present & BIT(tile->id)) &
+		 ~READ_ONCE(vma->tile_invalidated));
 
 	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op->num_entries);
 
@@ -2023,7 +2030,14 @@ static int unbind_range_prepare(struct xe_vm *vm,
 					 range->base.itree.last + 1);
 	++pt_update_ops->current_op;
 	pt_update_ops->needs_svm_lock = true;
-	pt_update_ops->needs_invalidation = true;
+
+	/*
+	 * Opportunistically supressing invalidation, READ_ONCE pairs with
+	 * WRITE_ONCE in SVM MMU notifier
+	 */
+	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
+		((range->tile_present & BIT(tile->id)) &
+		 ~READ_ONCE(range->tile_invalidated));
 
 	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
 				    pt_op->num_entries);
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 13abc6049041..5e5bf47293ad 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -141,7 +141,10 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 	for_each_tile(tile, xe, id)
 		if (xe_pt_zap_ptes_range(tile, vm, range)) {
 			tile_mask |= BIT(id);
-			/* Pairs with READ_ONCE in xe_svm_range_is_valid */
+			/*
+			 * Pairs with READ_ONCE in xe_svm_range_is_valid or PT
+			 * code to suppress invalidation on unbind
+			 */
 			WRITE_ONCE(range->tile_invalidated,
 				   range->tile_invalidated | BIT(id));
 		}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d18807b92b18..b296ac37347b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3924,7 +3924,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	for (id = 0; id < fence_id; ++id)
 		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
 
-	/* WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
+	/*
+	 * WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c or PT code to
+	 * suppress invalidation on unbind
+	 */
 	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
 
 	return ret;
-- 
2.34.1

