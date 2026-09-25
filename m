Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7522C9832F
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 04:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F5A10F860;
	Fri, 25 Sep 2026 04:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdB8KApc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13DB10E44C
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 04:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790312013; x=1821848013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l6b8Typ5nQvcPgkQH+I+sOK6BnCgiI1TOzy2sDLhz9o=;
 b=DdB8KApcs+IHx2UEejBrhJ2gtVvI8sdH6fM6InifgjbP7VgcMBPUsvXs
 CxNYXLW/53N9ummENdsvNvbAKolxm44KazSbOdnLVUl5AXazocNsy17al
 nKB2tcGiCqwL458P/FKmoQ3oEhDpb0iR3SpnXH5YJeIsBeCsrHPAfzw7n
 gmtnWCofEXWi3o1eXTq1PtBwgKWx86v1GmqXlrVTMkaCzpU25CgfzYPBe
 Cwi7IiTKe5lQdHdy8fiNpIIFjc5z7GJstOwvI0OMr6nH3Zc3mwbrY6AWw
 x8ElyHkiV+1ciCgVIC10wRzwjZ1FlDXf4mKitT13FUo2VaxO0t0gmseQq A==;
X-CSE-ConnectionGUID: ENT9PasWQxmYca18xUAplg==
X-CSE-MsgGUID: l8+wSuMOSkOmKnELiSnWJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90156221"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90156221"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:27 -0700
X-CSE-ConnectionGUID: nXHkqGueTBqHHVInyVrHUQ==
X-CSE-MsgGUID: NQVU0OHzQ2+wPm9YzMinlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="312155516"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v7 08/24] drm/xe: Add helpers to access PT ops
Date: Thu, 24 Sep 2026 21:53:04 -0700
Message-Id: <20260925045320.1325860-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925045320.1325860-1-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
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

Add helpers to access PT ops, making it easier to shuffle the location of
the ops structures without requiring widespread code changes.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 65 ++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 42a37e40a6c0..2cdfb577e941 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2088,13 +2088,37 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
 	}
 }
 
+static struct xe_vm_pgtable_update_op *
+to_pt_op(struct xe_vm_pgtable_update_ops *pt_update_ops, u32 op_idx)
+{
+	return &pt_update_ops->ops[op_idx];
+}
+
+static u32
+get_current_op(struct xe_vm_pgtable_update_ops *pt_update_ops)
+{
+	return pt_update_ops->current_op;
+}
+
+static struct xe_vm_pgtable_update_op *
+to_current_pt_op(struct xe_vm_pgtable_update_ops *pt_update_ops)
+{
+	return to_pt_op(pt_update_ops, get_current_op(pt_update_ops));
+}
+
+static void
+incr_current_op(struct xe_vm_pgtable_update_ops *pt_update_ops)
+{
+	++pt_update_ops->current_op;
+}
+
 static void
 xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
 				 u64 start, u64 end)
 {
 	u64 last;
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 	int i, level = 0;
 
 	for (i = 0; i < pt_op->num_entries; i++) {
@@ -2129,8 +2153,8 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 			   struct xe_vm_pgtable_update_ops *pt_update_ops,
 			   struct xe_vma *vma, bool invalidate_on_bind)
 {
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 	int err;
 
 	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
@@ -2159,7 +2183,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		xe_pt_update_ops_rfence_interval(pt_update_ops,
 						 xe_vma_start(vma),
 						 xe_vma_end(vma));
-		++pt_update_ops->current_op;
+		incr_current_op(pt_update_ops);
 		pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
 
 		/*
@@ -2202,8 +2226,8 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
 			      struct xe_vm_pgtable_update_ops *pt_update_ops,
 			      struct xe_vma *vma, struct xe_svm_range *range)
 {
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 	int err;
 
 	xe_tile_assert(tile, xe_vma_is_cpu_addr_mirror(vma));
@@ -2227,7 +2251,7 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		xe_pt_update_ops_rfence_interval(pt_update_ops,
 						 xe_svm_range_start(range),
 						 xe_svm_range_end(range));
-		++pt_update_ops->current_op;
+		incr_current_op(pt_update_ops);
 		pt_update_ops->needs_svm_lock = true;
 
 		pt_op->vma = vma;
@@ -2245,8 +2269,8 @@ static int unbind_op_prepare(struct xe_tile *tile,
 			     struct xe_vma *vma)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 	int err;
 
 	if (!((vma->tile_present | vma->tile_staged) & BIT(tile->id)))
@@ -2285,7 +2309,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 				pt_op->num_entries, false);
 	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_vma_start(vma),
 					 xe_vma_end(vma));
-	++pt_update_ops->current_op;
+	incr_current_op(pt_update_ops);
 	pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
 	pt_update_ops->needs_invalidation = true;
 
@@ -2325,8 +2349,8 @@ static int unbind_range_prepare(struct xe_vm *vm,
 				struct xe_vm_pgtable_update_ops *pt_update_ops,
 				struct xe_svm_range *range)
 {
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 
 	if (!(range->tile_present & BIT(tile->id)))
 		return 0;
@@ -2347,7 +2371,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
 				pt_op->num_entries, false);
 	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_svm_range_start(range),
 					 xe_svm_range_end(range));
-	++pt_update_ops->current_op;
+	incr_current_op(pt_update_ops);
 	pt_update_ops->needs_svm_lock = true;
 	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
 		xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
@@ -2504,7 +2528,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 			return err;
 	}
 
-	xe_tile_assert(tile, pt_update_ops->current_op <=
+	xe_tile_assert(tile, get_current_op(pt_update_ops) <=
 		       pt_update_ops->num_ops);
 
 #ifdef TEST_VM_OPS_ERROR
@@ -2737,7 +2761,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
-	if (!pt_update_ops->current_op) {
+	if (!get_current_op(pt_update_ops)) {
 		xe_tile_assert(tile, xe_vm_in_fault_mode(vm));
 
 		return dma_fence_get_stub();
@@ -2805,8 +2829,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	}
 
 	/* Point of no return - VM killed if failure after this */
-	for (i = 0; i < pt_update_ops->current_op; ++i) {
-		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
+	for (i = 0; i < get_current_op(pt_update_ops); ++i) {
+		struct xe_vm_pgtable_update_op *pt_op =
+			to_pt_op(pt_update_ops, i);
 
 		xe_pt_commit(pt_op->vma, pt_op->entries,
 			     pt_op->num_entries, &pt_update_ops->deferred);
@@ -2930,9 +2955,9 @@ void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
 		struct xe_vm_pgtable_update_op *pt_op =
-			&pt_update_ops->ops[i];
+			to_pt_op(pt_update_ops, i);
 
-		if (!pt_op->vma || i >= pt_update_ops->current_op)
+		if (!pt_op->vma || i >= get_current_op(pt_update_ops))
 			continue;
 
 		if (pt_op->bind)
-- 
2.34.1

