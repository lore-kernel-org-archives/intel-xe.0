Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC5CC001DC
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 15:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB0C10E5D5;
	Thu, 20 Jul 2023 15:55:54 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA5C10E5CB
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 15:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689868552; x=1721404552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e1PCwMhdgkJ1gwL5AmQ8d7oHixZ/jaJ2nxyp6fuLM5Y=;
 b=iVGqtMKZdUignkFZTwoOSIorF4PI4J+HTeia3HrcBrLb7NrOxzED+PxH
 RrGbE4bCCGt+h5sPpp0OOGhUtpIFTCfTpvsBfWzN3LPz1NpDFW9/V4qpZ
 WSIjlLGxwSdB4IBrkOYj1XwMFu7tRIMOqqJ1xNMpC/ECqPtX2ctVusqKo
 3FFzN4TTjqtaDuWglDb5RWarIeECpXjwbKs6/Ilm8llBonbonNS0FvWiz
 f/7aqPyY4tAonfaJtyZlwuDw+w687elSZlC4e555riosY53DQMP6iflua
 H2iJgEeMMW2DjEllQUD0qRYVnk17sPbjtMJmbSfTtWSEnGGfke5MO5x8d A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="347088636"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="347088636"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 08:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="754105471"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="754105471"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 08:55:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 20 Jul 2023 08:55:41 -0700
Message-Id: <20230720155546.199766-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720155546.199766-1-matthew.brost@intel.com>
References: <20230720155546.199766-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 2/7] drm/xe: Avoid doing rebinds
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

If we dont change page sizes we can avoid doing rebinds rather just do a
partial unbind. The algorithm to determine its page size is greedy as we
assume all pages in the removed VMA are the largest page used in the
VMA.

v2: Don't exceed 100 lines
v3: struct xe_vma_op_unmap remove in different patch, remove XXX comment

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       |  1 +
 drivers/gpu/drm/xe/xe_vm.c       | 72 +++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm_types.h |  7 ++++
 3 files changed, 70 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a458224a88ca..60e0117bae63 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -668,6 +668,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		if (!is_null)
 			xe_res_next(curs, next - addr);
 		xe_walk->va_curs_start = next;
+		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
 		*action = ACTION_CONTINUE;
 
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 63c9e1c94515..77337a7b6e42 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2392,6 +2392,16 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	return vma;
 }
 
+static u64 xe_vma_max_pte_size(struct xe_vma *vma)
+{
+	if (vma->gpuva.flags & XE_VMA_PTE_1G)
+		return SZ_1G;
+	else if (vma->gpuva.flags & XE_VMA_PTE_2M)
+		return SZ_2M;
+
+	return SZ_4K;
+}
+
 /*
  * Parse operations list and create any resources needed for the operations
  * prior to fully committing to the operations. This setup can fail.
@@ -2468,6 +2478,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 				break;
 			}
 			case DRM_GPUVA_OP_REMAP:
+			{
+				struct xe_vma *old =
+					gpuva_to_vma(op->base.remap.unmap->va);
+
+				op->remap.start = xe_vma_start(old);
+				op->remap.range = xe_vma_size(old);
+
 				if (op->base.remap.prev) {
 					struct xe_vma *vma;
 					bool read_only =
@@ -2486,6 +2503,20 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 					}
 
 					op->remap.prev = vma;
+
+					/*
+					 * Userptr creates a new SG mapping so
+					 * we must also rebind.
+					 */
+					op->remap.skip_prev = !xe_vma_is_userptr(old) &&
+						IS_ALIGNED(xe_vma_end(vma),
+							   xe_vma_max_pte_size(old));
+					if (op->remap.skip_prev) {
+						op->remap.range -=
+							xe_vma_end(vma) -
+							xe_vma_start(old);
+						op->remap.start = xe_vma_end(vma);
+					}
 				}
 
 				if (op->base.remap.next) {
@@ -2507,14 +2538,21 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 					}
 
 					op->remap.next = vma;
-				}
 
-				/* XXX: Support no doing remaps */
-				op->remap.start =
-					xe_vma_start(gpuva_to_vma(op->base.remap.unmap->va));
-				op->remap.range =
-					xe_vma_size(gpuva_to_vma(op->base.remap.unmap->va));
+					/*
+					 * Userptr creates a new SG mapping so
+					 * we must also rebind.
+					 */
+					op->remap.skip_next = !xe_vma_is_userptr(old) &&
+						IS_ALIGNED(xe_vma_start(vma),
+							   xe_vma_max_pte_size(old));
+					if (op->remap.skip_next)
+						op->remap.range -=
+							xe_vma_end(old) -
+							xe_vma_start(vma);
+				}
 				break;
+			}
 			case DRM_GPUVA_OP_UNMAP:
 			case DRM_GPUVA_OP_PREFETCH:
 				/* Nothing to do */
@@ -2557,10 +2595,23 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 	case DRM_GPUVA_OP_REMAP:
 		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
 				 true);
-		if (op->remap.prev)
+
+		if (op->remap.prev) {
 			err |= xe_vm_insert_vma(vm, op->remap.prev);
-		if (op->remap.next)
+			if (!err && op->remap.skip_prev)
+				op->remap.prev = NULL;
+		}
+		if (op->remap.next) {
 			err |= xe_vm_insert_vma(vm, op->remap.next);
+			if (!err && op->remap.skip_next)
+				op->remap.next = NULL;
+		}
+
+		/* Adjust for partial unbind after removin VMA from VM */
+		if (!err) {
+			op->base.remap.unmap->va->va.addr = op->remap.start;
+			op->base.remap.unmap->va->va.range = op->remap.range;
+		}
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
@@ -2630,9 +2681,10 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 		bool next = !!op->remap.next;
 
 		if (!op->remap.unmap_done) {
-			vm->async_ops.munmap_rebind_inflight = true;
-			if (prev || next)
+			if (prev || next) {
+				vm->async_ops.munmap_rebind_inflight = true;
 				vma->gpuva.flags |= XE_VMA_FIRST_REBIND;
+			}
 			err = xe_vm_unbind(vm, vma, op->engine, op->syncs,
 					   op->num_syncs,
 					   !prev && !next ? op->fence : NULL,
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index ce26298d7a5f..ddf4c46494a4 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -30,6 +30,9 @@ struct xe_vm;
 #define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
 #define XE_VMA_FIRST_REBIND	(DRM_GPUVA_USERBITS << 3)
 #define XE_VMA_LAST_REBIND	(DRM_GPUVA_USERBITS << 4)
+#define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 5)
+#define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
+#define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
 
 struct xe_vma {
 	/** @gpuva: Base GPUVA object */
@@ -343,6 +346,10 @@ struct xe_vma_op_remap {
 	u64 start;
 	/** @range: range of the VMA unmap */
 	u64 range;
+	/** @skip_prev: skip prev rebind */
+	bool skip_prev;
+	/** @skip_next: skip next rebind */
+	bool skip_next;
 	/** @unmap_done: unmap operation in done */
 	bool unmap_done;
 };
-- 
2.34.1

