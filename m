Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B48AEB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 21:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A8810E39D;
	Wed, 28 Jun 2023 21:42:00 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D426810E3AC
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 21:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687988498; x=1719524498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J0HGZpCWuVfTBIv9wZYKQEt+lHqzIEhmMPX8FmfX+zI=;
 b=RGvwFplGAsMmFaol6qYNYcSyqqRG7qAcrgkpvwrzjNNAiW5MDEtdtMnh
 T6RLD0wn3DeRHQ2zL7EkZsv8f6ohUOW5DyHgiFKZjKujiqL4Bpss9lrfW
 IkFMWMgF9NMNYOIE7kOCP4/mZpgO35CMmGbcFbgKI86khtrU5T5+UmsRh
 Fe1PIOw8rSElKCGFlP2PMCcSx6gvbGCrYJYZqzSpOf5EkHZoawhoyIQVs
 XvCfsQclHCLcmAZUG8QmnIuloDBAi0faEX2xuF/zzuSgBb40IKpSZ/NIb
 XcCGkLGHrIyoUEL8lY2VFmMu+CmsuNiyKMVIOkQOpwy1amzpAUWuwsk/w w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="351760097"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="351760097"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 14:41:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="711183702"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="711183702"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 14:41:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 28 Jun 2023 14:41:27 -0700
Message-Id: <20230628214127.870717-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230628214127.870717-1-matthew.brost@intel.com>
References: <20230628214127.870717-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 9/9] drm/xe: Avoid doing rebinds
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       |  1 +
 drivers/gpu/drm/xe/xe_vm.c       | 71 +++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_vm_types.h | 17 ++++----
 3 files changed, 64 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 00855681c0d5..a8d96cbd53e3 100644
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
index aff21065ab99..71683d1a23c6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2384,6 +2384,16 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
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
  * prior to fully commiting to the operations. This setup can fail.
@@ -2460,6 +2470,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
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
@@ -2478,6 +2495,20 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 					}
 
 					op->remap.prev = vma;
+
+					/*
+					 * XXX: Not sure why userptr doesn't
+					 * work but really shouldn't be a use
+					 * case.
+					 */
+					op->remap.skip_prev = !xe_vma_is_userptr(old) &&
+						IS_ALIGNED(xe_vma_end(vma), xe_vma_max_pte_size(old));
+					if (op->remap.skip_prev) {
+						op->remap.range -=
+							xe_vma_end(vma) -
+							xe_vma_start(old);
+						op->remap.start = xe_vma_end(vma);
+					}
 				}
 
 				if (op->base.remap.next) {
@@ -2499,20 +2530,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 					}
 
 					op->remap.next = vma;
+					op->remap.skip_next = !xe_vma_is_userptr(old) &&
+						IS_ALIGNED(xe_vma_start(vma), xe_vma_max_pte_size(old));
+					if (op->remap.skip_next)
+						op->remap.range -=
+							xe_vma_end(old) -
+							xe_vma_start(vma);
 				}
-
-				/* XXX: Support no doing remaps */
-				op->remap.start =
-					xe_vma_start(gpuva_to_vma(op->base.remap.unmap->va));
-				op->remap.range =
-					xe_vma_size(gpuva_to_vma(op->base.remap.unmap->va));
 				break;
+			}
 			case DRM_GPUVA_OP_UNMAP:
-				op->unmap.start =
-					xe_vma_start(gpuva_to_vma(op->base.unmap.va));
-				op->unmap.range =
-					xe_vma_size(gpuva_to_vma(op->base.unmap.va));
-				break;
 			case DRM_GPUVA_OP_PREFETCH:
 				/* Nothing to do */
 				break;
@@ -2554,10 +2581,23 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
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
@@ -2627,9 +2667,10 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
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
index cad806bafbfc..b517b711929c 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -29,6 +29,9 @@ struct xe_vm;
 #define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
 #define XE_VMA_FIRST_REBIND	(DRM_GPUVA_USERBITS << 3)
 #define XE_VMA_LAST_REBIND	(DRM_GPUVA_USERBITS << 4)
+#define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 5)
+#define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
+#define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
 
 struct xe_vma {
 	/** @gpuva: Base GPUVA object */
@@ -323,14 +326,6 @@ struct xe_vma_op_map {
 	bool is_null;
 };
 
-/** struct xe_vma_op_unmap - VMA unmap operation */
-struct xe_vma_op_unmap {
-	/** @start: start of the VMA unmap */
-	u64 start;
-	/** @range: range of the VMA unmap */
-	u64 range;
-};
-
 /** struct xe_vma_op_remap - VMA remap operation */
 struct xe_vma_op_remap {
 	/** @prev: VMA preceding part of a split mapping */
@@ -341,6 +336,10 @@ struct xe_vma_op_remap {
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
@@ -398,8 +397,6 @@ struct xe_vma_op {
 	union {
 		/** @map: VMA map operation specific data */
 		struct xe_vma_op_map map;
-		/** @unmap: VMA unmap operation specific data */
-		struct xe_vma_op_unmap unmap;
 		/** @remap: VMA remap operation specific data */
 		struct xe_vma_op_remap remap;
 		/** @prefetch: VMA prefetch operation specific data */
-- 
2.34.1

