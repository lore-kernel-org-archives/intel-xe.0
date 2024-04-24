Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF18C07E8E
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 17:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFC210FDE4;
	Wed, 24 Apr 2024 17:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dv3rw7aC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB1F10FCEB
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 17:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713979464; x=1745515464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7SUNmmW0+XHMFfbmxMCaZHSRNppSyTqLk1od2IuZmAE=;
 b=dv3rw7aCuZLpmbaGLXDqEzxHWxW9UdTyYC16thVB3ddI5Y+/qe+Am65B
 6PkHs2q/bQmR3MtEeVTXRMcVw38Ymmht0nAa4yJoPMmCibIq2R5F71H2N
 +iBcboF5rIX3vsYAr7IDtxcmLUfBjJmFDEvgPHjIF6Ku6c5BFISd5l6sw
 67J3SNpx5uYxbfF3L+GDNH+Npt+ordrT/IChylzpXFFe00Wc3KiL+yB5M
 gRlh8G6cWTnlw86TiBcHLJQojTqwIBNDt5ZHu3hZfE+cQ5pg8f4Fg2gRT
 8n+fuCe5hXxAEG+lCGcZ+k+35eCrBSEJOY1/V1ZcRU/Lkyajj/p9ry+q0 A==;
X-CSE-ConnectionGUID: LaWYgaMCRcSMh8ozm1BLYQ==
X-CSE-MsgGUID: lBBx/5miT66WYo8yOQhWhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="12561477"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="12561477"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 10:24:23 -0700
X-CSE-ConnectionGUID: CkGlmlTkSqGjcGujcQi/MA==
X-CSE-MsgGUID: h8wcu/WRTm+eQXrYCi+ptg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="24825488"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 10:24:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v2 03/13] drm/xe: Move migrate to prefetch to op_lock_and_prep
 function
Date: Wed, 24 Apr 2024 10:23:42 -0700
Message-Id: <20240424172352.1704851-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424172352.1704851-1-matthew.brost@intel.com>
References: <20240424172352.1704851-1-matthew.brost@intel.com>
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

All non-binding operations in VM bind IOCTL should be in the lock and
prepare step rather than the execution step. Move prefetch to conform to
this pattern.

v2:
 - Rebase
 - New function names (Oak)
 - Update stale comment (Oak)

Cc: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d889e9c422fe..c0d60f29667b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1921,20 +1921,10 @@ static const u32 region_to_mem_type[] = {
 
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
-	xe_assert(vm->xe, region < ARRAY_SIZE(region_to_mem_type));
-
-	if (!xe_vma_has_no_bo(vma)) {
-		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
-		if (err)
-			return ERR_PTR(err);
-	}
 
 	if (vma->tile_mask != (vma->tile_present & ~vma->tile_invalidated)) {
 		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs, num_syncs,
@@ -2474,8 +2464,7 @@ static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
 				     op->flags & XE_VMA_OP_LAST);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
-		fence = xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
-				       op->syncs, op->num_syncs,
+		fence = xe_vm_prefetch(vm, vma, op->q, op->syncs, op->num_syncs,
 				       op->flags & XE_VMA_OP_FIRST,
 				       op->flags & XE_VMA_OP_LAST);
 		break;
@@ -2706,9 +2695,20 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 					    false);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
+	{
+		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+		u32 region = op->prefetch.region;
+
+		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
+
 		err = vma_lock_and_validate(exec,
-					    gpuva_to_vma(op->base.prefetch.va), true);
+					    gpuva_to_vma(op->base.prefetch.va),
+					    false);
+		if (!err && !xe_vma_has_no_bo(vma))
+			err = xe_bo_migrate(xe_vma_bo(vma),
+					    region_to_mem_type[region]);
 		break;
+	}
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
-- 
2.34.1

