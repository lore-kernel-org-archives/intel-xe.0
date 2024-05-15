Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87F1C25B78
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 00:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F0210E27E;
	Wed, 15 May 2024 00:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+7ic1/L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE9A10E1BD
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 00:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715733573; x=1747269573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xJ1YwJHA4aUCdusj2Pi2iWcmEUavv37AjTpqhTtVzn0=;
 b=g+7ic1/L1jz43JKagm00uUloH4xATpSVPD8E6gHNjU926YSbgtVgnYuP
 Vsyxt+vQ0U51zPUN54y25mKyXsTOZMSFT8kIwWdPEMyVinoiOdWgMieM3
 jwYpXeBAOBaDhQB+QsunHV93q5zDG/HMuzWCwdaeFmbrbynBcwkakjU9/
 Sx648/ShSOlneyw+frNxeM4xlUfRbeBA4jDx0SUO+vdqEMg/7J+rTLSni
 9crRm9BSd8wUz7YKeza+WDsAqr86hBZOgR0uoDjviYulLKOyCcP5tblUx
 9MHxU5XLLU/esr6ACougFjbczC9HIfXymOASNE7gS2m7aqltVY+ldNZ5H w==;
X-CSE-ConnectionGUID: i4i0canDSw2sdWr1v3taPQ==
X-CSE-MsgGUID: eM5/f4YEQcWvDF7+qEzR9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="14700166"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="14700166"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 17:39:32 -0700
X-CSE-ConnectionGUID: afwjYSXUThmOczbkBAeuPQ==
X-CSE-MsgGUID: kuq5hO9zSCitduge8bQKVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="30982697"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 17:39:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>, Oak Zeng <oak.zeng@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 2/6] drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
Date: Tue, 14 May 2024 17:40:06 -0700
Message-Id: <20240515004010.100091-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515004010.100091-1-matthew.brost@intel.com>
References: <20240515004010.100091-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Each xe_vma_op resolves to 0-3 pt_ops. Add storage for the pt_ops to
xe_vma_ops which is dynamically allocated based the number and types of
xe_vma_op in the xe_vma_ops list. Allocation only implemented in this
patch.

This will help with converting xe_vma_ops (multiple xe_vma_op) in a
atomic update unit.

Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt_types.h | 12 ++++++
 drivers/gpu/drm/xe/xe_vm.c       | 66 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++
 3 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index cee70cb0f014..2093150f461e 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -74,4 +74,16 @@ struct xe_vm_pgtable_update {
 	u32 flags;
 };
 
+/** struct xe_vm_pgtable_update_op - Page table update operation */
+struct xe_vm_pgtable_update_op {
+	/** @entries: entries to update for this operation */
+	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
+	/** @num_entries: number of entries for this update operation */
+	u32 num_entries;
+	/** @bind: is a bind */
+	bool bind;
+	/** @rebind: is a rebind */
+	bool rebind;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c5b1694b292f..17b43b567bf3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -712,6 +712,42 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
+static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
+{
+	int i;
+
+	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i) {
+		if (!vops->pt_update_ops[i].num_ops)
+			continue;
+
+		vops->pt_update_ops[i].ops =
+			kmalloc_array(vops->pt_update_ops[i].num_ops,
+				      sizeof(*vops->pt_update_ops[i].ops),
+				      GFP_KERNEL);
+		if (!vops->pt_update_ops[i].ops)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void xe_vma_ops_fini(struct xe_vma_ops *vops)
+{
+	int i;
+
+	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
+		kfree(vops->pt_update_ops[i].ops);
+}
+
+static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask)
+{
+	int i;
+
+	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
+		if (BIT(i) & tile_mask)
+			++vops->pt_update_ops[i].num_ops;
+}
+
 static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
 				  u8 tile_mask)
 {
@@ -739,6 +775,7 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
 
 	xe_vm_populate_rebind(op, vma, tile_mask);
 	list_add_tail(&op->link, &vops->list);
+	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
 
 	return 0;
 }
@@ -779,6 +816,10 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 			goto free_ops;
 	}
 
+	err = xe_vma_ops_alloc(&vops);
+	if (err)
+		goto free_ops;
+
 	fence = ops_execute(vm, &vops);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
@@ -793,6 +834,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 		list_del(&op->link);
 		kfree(op);
 	}
+	xe_vma_ops_fini(&vops);
 
 	return err;
 }
@@ -814,12 +856,20 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	if (err)
 		return ERR_PTR(err);
 
+	err = xe_vma_ops_alloc(&vops);
+	if (err) {
+		fence = ERR_PTR(err);
+		goto free_ops;
+	}
+
 	fence = ops_execute(vm, &vops);
 
+free_ops:
 	list_for_each_entry_safe(op, next_op, &vops.list, link) {
 		list_del(&op->link);
 		kfree(op);
 	}
+	xe_vma_ops_fini(&vops);
 
 	return fence;
 }
@@ -2276,7 +2326,6 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 	return err;
 }
 
-
 static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				   struct drm_gpuva_ops *ops,
 				   struct xe_sync_entry *syncs, u32 num_syncs,
@@ -2328,6 +2377,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				return PTR_ERR(vma);
 
 			op->map.vma = vma;
+			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
+				xe_vma_ops_incr_pt_update_ops(vops,
+							      op->tile_mask);
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP:
@@ -2372,6 +2424,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 					vm_dbg(&xe->drm, "REMAP:SKIP_PREV: addr=0x%016llx, range=0x%016llx",
 					       (ULL)op->remap.start,
 					       (ULL)op->remap.range);
+				} else {
+					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 				}
 			}
 
@@ -2408,13 +2462,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 					vm_dbg(&xe->drm, "REMAP:SKIP_NEXT: addr=0x%016llx, range=0x%016llx",
 					       (ULL)op->remap.start,
 					       (ULL)op->remap.range);
+				} else {
+					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 				}
 			}
+			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
 		}
 		case DRM_GPUVA_OP_UNMAP:
 		case DRM_GPUVA_OP_PREFETCH:
-			/* Nothing to do */
+			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
 		default:
 			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
@@ -3261,11 +3318,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto unwind_ops;
 	}
 
+	err = xe_vma_ops_alloc(&vops);
+	if (err)
+		goto unwind_ops;
+
 	err = vm_bind_ioctl_ops_execute(vm, &vops);
 
 unwind_ops:
 	if (err && err != -ENODATA)
 		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
+	xe_vma_ops_fini(&vops);
 	for (i = args->num_binds - 1; i >= 0; --i)
 		if (ops[i])
 			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index ce1a63a5e3e7..211c88801182 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -21,6 +21,7 @@ struct xe_bo;
 struct xe_sync_entry;
 struct xe_user_fence;
 struct xe_vm;
+struct xe_vm_pgtable_update_op;
 
 #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
 #define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
@@ -368,6 +369,13 @@ struct xe_vma_ops {
 	struct xe_sync_entry *syncs;
 	/** @num_syncs: number of syncs */
 	u32 num_syncs;
+	/** @pt_update_ops: page table update operations */
+	struct {
+		/** @ops: operations */
+		struct xe_vm_pgtable_update_op *ops;
+		/** @num_ops: number of operations */
+		u32 num_ops;
+	} pt_update_ops[XE_MAX_TILES_PER_DEVICE];
 };
 
 #endif
-- 
2.34.1

