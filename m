Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7859DC04E83
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BB410E4B8;
	Tue,  7 Nov 2023 05:26:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C895110E4B1
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334756; x=1730870756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=If8YHr1UbEwJDjS24GQxOfMbtoKjwtvI8pv5mZ1x8NA=;
 b=S0UASKdLYhuSDIBUqBPtxnQqN9R8JDkg1PShNEHRro+mqrNyVocruC3C
 hw8bLFW+6nJnovDIgX4uOLfEeDyy1+lU3Cu+Clvtni+9JsS/IsyMAoIor
 H8df/FcSL4jW28+qRf3YxnDnG3EAvaYwHAx/BqI2zhM1W2doGY57jN6YR
 7M1CuiKErMUgD86S/lGojPBwTsIbuKURcXYkNYMsorytfitKM7RTbHoVL
 NEUrwL1TFQBKerZ8JydTBw+Q0s1SgIXilN4PyFe4n+mdxT0rsBGKTTeSV
 jlgS11SrzibZgkhqP32eyZmhj/8ozNCpH/4nzf61/9hA/k9EmRAPtkM8K A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769517"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769517"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689833"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689833"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:42 -0800
Message-Id: <20231107052603.124361-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 06/27] drm/xe: Move migrate to prefetch to
 op_lock funtion
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
 drivers/gpu/drm/xe/xe_vm.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 73202e1909e5..7c1491cdd0c3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2041,20 +2041,10 @@ static const u32 region_to_mem_type[] = {
 
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
@@ -2070,7 +2060,7 @@ xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 				xe_sync_entry_signal(&syncs[i], NULL, fence);
 		}
 
-		return fence;
+		return dma_fence_get(fence);
 	}
 }
 
@@ -2590,8 +2580,7 @@ static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
 				     op->flags & XE_VMA_OP_LAST);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
-		fence = xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
-				       op->syncs, op->num_syncs,
+		fence = xe_vm_prefetch(vm, vma, op->q, op->syncs, op->num_syncs,
 				       op->flags & XE_VMA_OP_FIRST,
 				       op->flags & XE_VMA_OP_LAST);
 		break;
@@ -2813,8 +2802,17 @@ static int op_lock(struct drm_exec *exec, struct xe_vm *vm,
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

