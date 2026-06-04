Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA692CD6E74
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 17:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7324711A1E3;
	Thu,  4 Jun 2026 17:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="UeuREe1j";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFF211A1E2
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 17:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780593305;
 bh=kskH3i5xtRb6zK7IaXr0CBZfgsF7zDXN8NpWebOyCgc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UeuREe1jQ3KPwRoaKcZQrrIJFIgudzvBcBNwhtuCdfjPukr8fyIYgo6XZjuo8cYOk
 q3T96rSyzvhWFnwtweRGvIbK3ye5YJAUWchJaa5SuStSdULnHzsw67lh2BnNmeFh8h
 GHVcftLHlhnXhIjZeOavSx4UJWjUEnBPJmTyFbcQkuZdMtaZfpoEPW2RTOlETOwWiW
 j1YVGlrtxXdxYnTkG7rrKEb72RYKgLS5pmuUToiS8swXTmv+XfnsXqs9froEpjY5+7
 cLCkfbNUD3nsZc7+Rf5KNjrWLsK8D4+i9abcyWjpbtUMaeLjemDjOmSE7EUwkyy7UC
 bQcPPmVBZKkTA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 08/24] drm/xe: Add helpers to access PT ops
Date: Thu,  4 Jun 2026 19:14:44 +0200
Message-ID: <20260604171502.84047-9-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604171502.84047-1-dev@lankhorst.se>
References: <20260604171502.84047-1-dev@lankhorst.se>
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

From: Matthew Brost <matthew.brost@intel.com>

Add helpers to access PT ops, making it easier to shuffle the location of
the ops structures without requiring widespread code changes.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-9-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_pt.c | 65 ++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 86b9b8e164fc6..d595ba234c355 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1928,13 +1928,37 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
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
@@ -1969,8 +1993,8 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 			   struct xe_vm_pgtable_update_ops *pt_update_ops,
 			   struct xe_vma *vma, bool invalidate_on_bind)
 {
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 	int err;
 
 	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
@@ -1999,7 +2023,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		xe_pt_update_ops_rfence_interval(pt_update_ops,
 						 xe_vma_start(vma),
 						 xe_vma_end(vma));
-		++pt_update_ops->current_op;
+		incr_current_op(pt_update_ops);
 		pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
 
 		/*
@@ -2042,8 +2066,8 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
 			      struct xe_vm_pgtable_update_ops *pt_update_ops,
 			      struct xe_vma *vma, struct xe_svm_range *range)
 {
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 	int err;
 
 	xe_tile_assert(tile, xe_vma_is_cpu_addr_mirror(vma));
@@ -2067,7 +2091,7 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		xe_pt_update_ops_rfence_interval(pt_update_ops,
 						 xe_svm_range_start(range),
 						 xe_svm_range_end(range));
-		++pt_update_ops->current_op;
+		incr_current_op(pt_update_ops);
 		pt_update_ops->needs_svm_lock = true;
 
 		pt_op->vma = vma;
@@ -2085,8 +2109,8 @@ static int unbind_op_prepare(struct xe_tile *tile,
 			     struct xe_vma *vma)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 	int err;
 
 	if (!((vma->tile_present | vma->tile_staged) & BIT(tile->id)))
@@ -2125,7 +2149,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 				pt_op->num_entries, false);
 	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_vma_start(vma),
 					 xe_vma_end(vma));
-	++pt_update_ops->current_op;
+	incr_current_op(pt_update_ops);
 	pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
 	pt_update_ops->needs_invalidation = true;
 
@@ -2165,8 +2189,8 @@ static int unbind_range_prepare(struct xe_vm *vm,
 				struct xe_vm_pgtable_update_ops *pt_update_ops,
 				struct xe_svm_range *range)
 {
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 
 	if (!(range->tile_present & BIT(tile->id)))
 		return 0;
@@ -2187,7 +2211,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
 				pt_op->num_entries, false);
 	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_svm_range_start(range),
 					 xe_svm_range_end(range));
-	++pt_update_ops->current_op;
+	incr_current_op(pt_update_ops);
 	pt_update_ops->needs_svm_lock = true;
 	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
 		xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
@@ -2335,7 +2359,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 			return err;
 	}
 
-	xe_tile_assert(tile, pt_update_ops->current_op <=
+	xe_tile_assert(tile, get_current_op(pt_update_ops) <=
 		       pt_update_ops->num_ops);
 
 #ifdef TEST_VM_OPS_ERROR
@@ -2568,7 +2592,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
-	if (!pt_update_ops->current_op) {
+	if (!get_current_op(pt_update_ops)) {
 		xe_tile_assert(tile, xe_vm_in_fault_mode(vm));
 
 		return dma_fence_get_stub();
@@ -2636,8 +2660,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	}
 
 	/* Point of no return - VM killed if failure after this */
-	for (i = 0; i < pt_update_ops->current_op; ++i) {
-		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
+	for (i = 0; i < get_current_op(pt_update_ops); ++i) {
+		struct xe_vm_pgtable_update_op *pt_op =
+			to_pt_op(pt_update_ops, i);
 
 		xe_pt_commit(pt_op->vma, pt_op->entries,
 			     pt_op->num_entries, &pt_update_ops->deferred);
@@ -2761,9 +2786,9 @@ void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
 		struct xe_vm_pgtable_update_op *pt_op =
-			&pt_update_ops->ops[i];
+			to_pt_op(pt_update_ops, i);
 
-		if (!pt_op->vma || i >= pt_update_ops->current_op)
+		if (!pt_op->vma || i >= get_current_op(pt_update_ops))
 			continue;
 
 		if (pt_op->bind)
-- 
2.53.0

