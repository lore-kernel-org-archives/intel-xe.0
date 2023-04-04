Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DA1C77B70
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 01:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C2A10E54C;
	Tue,  4 Apr 2023 01:42:35 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C8D10E2B7
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 01:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680572551; x=1712108551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PxjKOGhoVFmaCZXTXmvDMhShocH1bGIEdut3GQAQQKc=;
 b=hrQm4RlNYzJjau0D5c3C62pFtRUtqNdhkia8CUUVq50lLqIPFPt/EPFi
 2yp/WRGltS2TvYOdtjMvbspod0QBCWqQjz9t89uS7/S8WtSHMlRTRL/BF
 EqmIM+F60wAfJo0cmjsiq6/OlasH10KpfhlBQcX8FIU9iuNwQ6B6J5o+P
 5mUH/1plYiC2Yhti+25c1nZR4glnS1gW86R7fsQQpviq9SqdvAdTsq8K2
 F/JWcJWSVWSAIefBKAi6z6GFimMNpfuBtDBzOg9pdJ0QegpvI1zJ1Xcew
 KIWJWfvgfycT2zox0apsBe7LwAGob74h48bTYTyXkz39W5SSqmNngqbJ8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322456425"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="322456425"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 18:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="755470836"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="755470836"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 18:42:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  3 Apr 2023 18:42:26 -0700
Message-Id: <20230404014228.3738347-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404014228.3738347-1-matthew.brost@intel.com>
References: <20230404014228.3738347-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 6/8] drm/xe: Avoid doing rebinds
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
partial unbind. The algorithm to determine is page size is greedy as we
assume all pages in the removed VMA are the largest page used in the
VMA.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       |  4 ++
 drivers/gpu/drm/xe/xe_vm.c       | 69 +++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_vm_types.h | 17 ++++----
 3 files changed, 65 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 4da248484267..43e5a1054411 100644
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
@@ -688,6 +690,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
 		if (!null)
 			xe_res_next(curs, next - addr);
 		xe_walk->va_curs_start = next;
+		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
 		*action = ACTION_CONTINUE;
 
 		return ret;
@@ -776,6 +779,7 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 			.max_level = XE_PT_HIGHEST_LEVEL,
 		},
 		.vm = xe_vma_vm(vma),
+		.vma = vma,
 		.gt = gt,
 		.curs = &curs,
 		.va_curs_start = xe_vma_start(vma),
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5d74a8aa9e8d..c1e1b443cd2d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2273,6 +2273,16 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
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
@@ -2349,6 +2359,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
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
@@ -2367,6 +2384,20 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
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
@@ -2388,20 +2419,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
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
@@ -2440,10 +2467,21 @@ static void xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 	case DRM_GPUVA_OP_REMAP:
 		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
 				 true);
-		if (op->remap.prev)
+
+		/* Adjust for partial unbind after removin VMA from VM */
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
 		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
@@ -2508,9 +2546,10 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
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
index 357f887b22ea..21c46b71b7d8 100644
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
@@ -317,14 +320,6 @@ struct xe_vma_op_map {
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
@@ -335,6 +330,10 @@ struct xe_vma_op_remap {
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
@@ -390,8 +389,6 @@ struct xe_vma_op {
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

