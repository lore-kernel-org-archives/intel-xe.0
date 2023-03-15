Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC09BC6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 23:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8506310E013;
	Wed, 15 Mar 2023 23:19:26 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F77E10E06B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 23:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678922362; x=1710458362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J0h+3f3YNBaLhU5EK1jQpqK+nFF/ZK3/Kwwy60g5u+E=;
 b=XmOPDLRMiLpdzWz/oG7OtliIfNJv8/nbOjal9nwYcLkusqrj3sacT10X
 VEQxVCSxYbF7mAE60m5wqHTTPMMegQzwAIooF+vInwAvhlLnvl6aN8z0o
 86omKoiBlSf7KmnfQOP6MmPI7SzCg/wKIV9ZgV8unsLcxAO4RMoA0P0gH
 svwXcyC3bj5wmME1gqhx83KPyT0XermLzQ4rXxPzeqyBp2rao1jScF+ty
 HWZQzNZsBSzZwnHVFTCDRSWgjHDM/QXscsZxvgDiQx7X1xaJjLb4fDj6e
 PvUJDmHWCzhiouxG/IStf3WIEWQFq0eUgmLA3eG/2wc4eMmhFstQK08/G g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="317491024"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="317491024"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 16:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="790018463"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="790018463"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 16:19:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 15 Mar 2023 16:19:20 -0700
Message-Id: <20230315231920.4095284-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315231920.4095284-1-matthew.brost@intel.com>
References: <20230315231920.4095284-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/6] drm/xe: Avoid doing rebinds
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
Cc: paulo.r.zanoni@intel.com, lionel.g.landwerlin@intel.com, dakr@redhat.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If we dont change page sizes we can avoid doing rebinds rather just do a
partial unbind. The algorithm to determine is page size is greedy as we
assume all pages in the removed VMA are the largest page used in the
VMA.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 15 +++++++
 drivers/gpu/drm/xe/xe_vm.c       | 69 +++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_vm_types.h | 17 ++++----
 3 files changed, 76 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index b6e2fdb5f06c..a773a222d12f 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -412,6 +412,8 @@ struct xe_pt_stage_bind_walk {
 	/* Input parameters for the walk */
 	/** @vm: The vm we're building for. */
 	struct xe_vm *vm;
+	/** @vma: The vma we are binding for. */
+	struct xe_vma *vma;
 	/** @gt: The gt we're building for. */
 	struct xe_gt *gt;
 	/** @cache: Desired cache level for the ptes */
@@ -690,6 +692,18 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
 		xe_walk->va_curs_start = next;
 		*action = ACTION_CONTINUE;
 
+		switch (level) {
+		case 0:
+			xe_walk->vma->gpuva.flags |= XE_VMA_PTE_4K;
+			break;
+		case 1:
+			xe_walk->vma->gpuva.flags |= XE_VMA_PTE_2M;
+			break;
+		case 2:
+			xe_walk->vma->gpuva.flags |= XE_VMA_PTE_1G;
+			break;
+		}
+
 		return ret;
 	}
 
@@ -776,6 +790,7 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 			.max_level = XE_PT_HIGHEST_LEVEL,
 		},
 		.vm = xe_vma_vm(vma),
+		.vma = vma,
 		.gt = gt,
 		.curs = &curs,
 		.va_curs_start = xe_vma_start(vma),
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 49bd9729c2c8..a7c807155973 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2256,6 +2256,16 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
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
  * prior to fully commiting to the operations. This setp can fail.
@@ -2332,6 +2342,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
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
@@ -2350,6 +2367,20 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
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
@@ -2371,20 +2402,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
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
@@ -2422,10 +2449,21 @@ static void xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va));
-		if (op->remap.prev)
+
+		/* Adjust for partial unbind after VMA from VM */
+		op->base.remap.unmap->va->va.addr = op->remap.start;
+		op->base.remap.unmap->va->va.range = op->remap.range;
+
+		if (op->remap.prev) {
 			xe_vm_insert_vma(vm, op->remap.prev);
-		if (op->remap.next)
+			if (op->remap.skip_prev)
+				op->remap.prev = NULL;
+		}
+		if (op->remap.next) {
 			xe_vm_insert_vma(vm, op->remap.next);
+			if (op->remap.skip_next)
+				op->remap.next = NULL;
+		}
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va));
@@ -2490,9 +2528,10 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
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
index 1d17dae726c9..ed5e66dcce3b 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -30,6 +30,9 @@ struct xe_vm;
 #define XE_VMA_FIRST_REBIND	(DRM_GPUVA_USERBITS << 3)
 #define XE_VMA_LAST_REBIND	(DRM_GPUVA_USERBITS << 4)
 #define XE_VMA_NULL		(DRM_GPUVA_USERBITS << 5)
+#define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 6)
+#define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 7)
+#define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 8)
 
 struct xe_vma {
 	/** @gpuva: Base GPUVA object */
@@ -312,14 +315,6 @@ struct xe_vma_op_map {
 	bool null;
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
@@ -330,6 +325,10 @@ struct xe_vma_op_remap {
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
@@ -385,8 +384,6 @@ struct xe_vma_op {
 	union {
 		/** @map: VMA map operation specific data */
 		struct xe_vma_op_map map;
-		/** @unmap: VMA unmap operation specific data */
-		struct xe_vma_op_unmap unmap;
 		/** @map: VMA remap operation specific data */
 		struct xe_vma_op_remap remap;
 		/** @map: VMA prefetch operation specific data */
-- 
2.34.1

