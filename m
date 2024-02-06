Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC08C48BC3
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBD5112F73;
	Tue,  6 Feb 2024 23:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7K9RH3W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDF4112F64
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707262614; x=1738798614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/EJyKkjk4GfXsgrQDv+HgYqCop46hPBqcTkC1HSgfg4=;
 b=K7K9RH3WTaO6QrbZIfEIVUzk90keUgo+mldIhYiiwIwdwYeosGhPOpmY
 LCHnbTIYkMEfs4pCGy/E2TP+gj+NTOzgSEy3sfcA94RAZSLk7Ho86Uqpi
 JxsYVDkmaZvGWf+hR4CmXuAJQ9bSLtW4WOC+0RzSaKtctLLf8MK5q8XCH
 5bvDgRc/GRXJS57AUFEBDg0A9/snmWt6sLwr04h+CsAQ/jhobiTwt3b7x
 4cL1q4frLYcjeDcmalAQZIP8Ruxg5ay1bXWLI2vin1NdC9AUN6q7T6Ylc
 I68ilpN8ULORYnvoMVAlA8oWBTXI2gJEoXUxEOQp/EI1DcrjmmnFye2AL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="776785"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="776785"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5793783"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 03/22] drm/xe: Move migrate to prefetch to op_lock funtion
Date: Tue,  6 Feb 2024 15:37:10 -0800
Message-Id: <20240206233729.3173206-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206233729.3173206-1-matthew.brost@intel.com>
References: <20240206233729.3173206-1-matthew.brost@intel.com>
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

Migrates need to be done under drm exec to make lockdep happy, move
the migrate done for prefetches under the op_lock function.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a33c1486ab64..0f552fd8d7e0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1936,20 +1936,10 @@ static const u32 region_to_mem_type[] = {
 
 static struct dma_fence *
 xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
-	       struct xe_exec_queue *q, u32 region,
-	       struct xe_sync_entry *syncs, u32 num_syncs,
-	       bool first_op, bool last_op)
+	       struct xe_exec_queue *q, struct xe_sync_entry *syncs,
+	       u32 num_syncs, bool first_op, bool last_op)
 {
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
-	int err;
-
-	xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
-
-	if (!xe_vma_has_no_bo(vma)) {
-		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
-		if (err)
-			return ERR_PTR(err);
-	}
 
 	if (vma->tile_mask != (vma->tile_present & ~vma->usm.tile_invalidated)) {
 		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs, num_syncs,
@@ -2467,8 +2457,7 @@ static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
 				     op->flags & XE_VMA_OP_LAST);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
-		fence = xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
-				       op->syncs, op->num_syncs,
+		fence = xe_vm_prefetch(vm, vma, op->q, op->syncs, op->num_syncs,
 				       op->flags & XE_VMA_OP_FIRST,
 				       op->flags & XE_VMA_OP_LAST);
 		break;
@@ -2694,8 +2683,17 @@ static int op_lock(struct drm_exec *exec, struct xe_vm *vm,
 		err = vma_lock(exec, gpuva_to_vma(op->base.unmap.va), false);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
-		err = vma_lock(exec, gpuva_to_vma(op->base.prefetch.va), true);
+	{
+		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+		u32 region = op->prefetch.region;
+
+		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
+
+		err = vma_lock(exec, vma, false);
+		if (!err && !xe_vma_has_no_bo(vma))
+			err = xe_bo_migrate(xe_vma_bo(vma), region);
 		break;
+	}
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
-- 
2.34.1

