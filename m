Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDB4C83F10
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 15:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF7D10E187;
	Thu, 31 Aug 2023 15:00:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B42510E0C1
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693494041; x=1725030041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=blHF7wpsQPCLSjKmaKlj1C+kX6F9Rvj0E5bFAWRxYqQ=;
 b=KdOOEDO74A2Kbri180fAl6xBoYxRrvfbFNnWSIb0Nlqnq3MASagaJZkG
 Sgq/6Ii0YbO+DIFZgZsWQ+3cjNJwq+iNYxAcsZMWBOci0vcml6+txfYSI
 ntdjgs2Is1xXqzDrkJuq+8ypntr+5bqrM+WQfNgf/2G6q/EWb08hpVCUa
 lYSmNxq5is1SsV/kbHvyEZmOphYAogRxlvM4AU4CwmqsWaFYZS4b3MnsV
 JBmLFa5eZ7rcUA5RKOWXca1/Fz2pSrqo82H768t3ttAXmSVPJzjZvVz3y
 pRQ1KDqvE+HvF9qrRNa7QwLijCsvVerJ/nmtKVI1QNfR9KLV9HevOSVXY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462334570"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="462334570"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 08:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="809667097"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="809667097"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 08:00:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 31 Aug 2023 08:00:46 -0700
Message-Id: <20230831150048.1760018-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831150048.1760018-1-matthew.brost@intel.com>
References: <20230831150048.1760018-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/xe: Fixup unwind on VM ops errors
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remap ops have 3 parts: unmap, prev, and next. The commit step can fail
on any of these. Add a flag for each to these so the unwind is only done
the steps that have been committed.

v2: (Rodrigo) Use bit macros

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 24 +++++++++++++++++-------
 drivers/gpu/drm/xe/xe_vm_types.h | 10 +++++++---
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 15bff0783ec9..7d64da0b3b70 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2618,18 +2618,25 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
 		err |= xe_vm_insert_vma(vm, op->map.vma);
+		if (!err)
+			op->flags |= XE_VMA_OP_COMMITTED;
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
 				 true);
+		op->flags |= XE_VMA_OP_COMMITTED;
 
 		if (op->remap.prev) {
 			err |= xe_vm_insert_vma(vm, op->remap.prev);
+			if (!err)
+				op->flags |= XE_VMA_OP_PREV_COMMITTED;
 			if (!err && op->remap.skip_prev)
 				op->remap.prev = NULL;
 		}
 		if (op->remap.next) {
 			err |= xe_vm_insert_vma(vm, op->remap.next);
+			if (!err)
+				op->flags |= XE_VMA_OP_NEXT_COMMITTED;
 			if (!err && op->remap.skip_next)
 				op->remap.next = NULL;
 		}
@@ -2642,15 +2649,15 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
+		op->flags |= XE_VMA_OP_COMMITTED;
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
-		/* Nothing to do */
+		op->flags |= XE_VMA_OP_COMMITTED;
 		break;
 	default:
 		XE_WARN_ON("NOT POSSIBLE");
 	}
 
-	op->flags |= XE_VMA_OP_COMMITTED;
 	return err;
 }
 
@@ -2855,7 +2862,8 @@ static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op)
 }
 
 static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
-			     bool post_commit)
+			     bool post_commit, bool prev_post_commit,
+			     bool next_post_commit)
 {
 	lockdep_assert_held_write(&vm->lock);
 
@@ -2882,11 +2890,11 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 		struct xe_vma *vma = gpuva_to_vma(op->base.remap.unmap->va);
 
 		if (op->remap.prev) {
-			prep_vma_destroy(vm, op->remap.prev, post_commit);
+			prep_vma_destroy(vm, op->remap.prev, prev_post_commit);
 			xe_vma_destroy_unlocked(op->remap.prev);
 		}
 		if (op->remap.next) {
-			prep_vma_destroy(vm, op->remap.next, post_commit);
+			prep_vma_destroy(vm, op->remap.next, next_post_commit);
 			xe_vma_destroy_unlocked(op->remap.next);
 		}
 		down_read(&vm->userptr.notifier_lock);
@@ -3025,7 +3033,9 @@ static int vm_bind_ioctl_ops_commit(struct xe_vm *vm,
 
 unwind:
 	list_for_each_entry_reverse(op, ops_list, link)
-		xe_vma_op_unwind(vm, op, op->flags & XE_VMA_OP_COMMITTED);
+		xe_vma_op_unwind(vm, op, op->flags & XE_VMA_OP_COMMITTED,
+				 op->flags & XE_VMA_OP_PREV_COMMITTED,
+				 op->flags & XE_VMA_OP_NEXT_COMMITTED);
 	list_for_each_entry_safe(op, next, ops_list, link)
 		xe_vma_op_cleanup(vm, op);
 
@@ -3052,7 +3062,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 		drm_gpuva_for_each_op(__op, __ops) {
 			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
-			xe_vma_op_unwind(vm, op, false);
+			xe_vma_op_unwind(vm, op, false, false, false);
 		}
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 4bcb54ccd93a..286b015b201d 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -377,11 +377,15 @@ struct xe_vma_op_prefetch {
 /** enum xe_vma_op_flags - flags for VMA operation */
 enum xe_vma_op_flags {
 	/** @XE_VMA_OP_FIRST: first VMA operation for a set of syncs */
-	XE_VMA_OP_FIRST		= BIT(0),
+	XE_VMA_OP_FIRST			= BIT(0),
 	/** @XE_VMA_OP_LAST: last VMA operation for a set of syncs */
-	XE_VMA_OP_LAST		= BIT(1),
+	XE_VMA_OP_LAST			= BIT(1),
 	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
-	XE_VMA_OP_COMMITTED	= BIT(2),
+	XE_VMA_OP_COMMITTED		= BIT(2),
+	/** @XE_VMA_OP_PREV_COMMITTED: Previous VMA operation committed */
+	XE_VMA_OP_PREV_COMMITTED	= BIT(3),
+	/** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation committed */
+	XE_VMA_OP_NEXT_COMMITTED	= BIT(4),
 };
 
 /** struct xe_vma_op - VMA operation */
-- 
2.34.1

