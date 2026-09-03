Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D837C624DE
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DD310E4BC;
	Thu,  3 Sep 2026 23:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="idok9LiI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390BA10ECCE
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788479930; x=1820015930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aBTXORUA2AAi8P0R4psharQmYRTuS83PdC2frY5eAZE=;
 b=idok9LiIDj4FOP7t8l/zTHHaXZBRfDXXg6bJ/SIJH0DRDhevCHJBtqdI
 9bbvJhCUUCVua1cXj+YbK9Xue6Ik6yjMUaTD+utdP3Cg1CDFFwodt0bCQ
 X9y2zvFpKaN36C+aZIHzT7OC0SWAlgf6TTr6Ii4oYi1H9cl7lMejpQ+oV
 i3V1FYJa4OzDShUC7w3BZtLkoBfkN4W7tmAnY6u8hpCOOU6jJVP8tXVQU
 k1UFKVKhrDsaALp++kRowBN/GWMu4RBIcLLBgbtq7FO7N3rCTa6J8YLQ1
 CQWQkH76GkrNx0aT+B29U/mSZuAj3i+mCmaGg4R9oDNzDpJnVRIdobM8f w==;
X-CSE-ConnectionGUID: pEblzZBIQ3y19pN29RLDlA==
X-CSE-MsgGUID: hEyi9xkmSyGVhqHeH9YRvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99637808"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99637808"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:49 -0700
X-CSE-ConnectionGUID: 1n0kaep6SwWAJlqqSrId7Q==
X-CSE-MsgGUID: vWyXKs3KQ7CePvYv8oMopA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="274029047"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 08/25] drm/xe: Add helpers to access PT ops
Date: Thu,  3 Sep 2026 16:58:25 -0700
Message-Id: <20260903235842.3401722-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903235842.3401722-1-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
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
Link: https://patch.msgid.link/20260228013501.106680-9-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_pt.c | 65 ++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 3170df1f3fbf..e560f167fdf1 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2078,13 +2078,37 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
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
@@ -2119,8 +2143,8 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 			   struct xe_vm_pgtable_update_ops *pt_update_ops,
 			   struct xe_vma *vma, bool invalidate_on_bind)
 {
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 	int err;
 
 	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
@@ -2149,7 +2173,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		xe_pt_update_ops_rfence_interval(pt_update_ops,
 						 xe_vma_start(vma),
 						 xe_vma_end(vma));
-		++pt_update_ops->current_op;
+		incr_current_op(pt_update_ops);
 		pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
 
 		/*
@@ -2192,8 +2216,8 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
 			      struct xe_vm_pgtable_update_ops *pt_update_ops,
 			      struct xe_vma *vma, struct xe_svm_range *range)
 {
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 	int err;
 
 	xe_tile_assert(tile, xe_vma_is_cpu_addr_mirror(vma));
@@ -2217,7 +2241,7 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		xe_pt_update_ops_rfence_interval(pt_update_ops,
 						 xe_svm_range_start(range),
 						 xe_svm_range_end(range));
-		++pt_update_ops->current_op;
+		incr_current_op(pt_update_ops);
 		pt_update_ops->needs_svm_lock = true;
 
 		pt_op->vma = vma;
@@ -2235,8 +2259,8 @@ static int unbind_op_prepare(struct xe_tile *tile,
 			     struct xe_vma *vma)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 	int err;
 
 	if (!((vma->tile_present | vma->tile_staged) & BIT(tile->id)))
@@ -2275,7 +2299,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 				pt_op->num_entries, false);
 	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_vma_start(vma),
 					 xe_vma_end(vma));
-	++pt_update_ops->current_op;
+	incr_current_op(pt_update_ops);
 	pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
 	pt_update_ops->needs_invalidation = true;
 
@@ -2315,8 +2339,8 @@ static int unbind_range_prepare(struct xe_vm *vm,
 				struct xe_vm_pgtable_update_ops *pt_update_ops,
 				struct xe_svm_range *range)
 {
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 
 	if (!(range->tile_present & BIT(tile->id)))
 		return 0;
@@ -2337,7 +2361,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
 				pt_op->num_entries, false);
 	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_svm_range_start(range),
 					 xe_svm_range_end(range));
-	++pt_update_ops->current_op;
+	incr_current_op(pt_update_ops);
 	pt_update_ops->needs_svm_lock = true;
 	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
 		xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
@@ -2494,7 +2518,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 			return err;
 	}
 
-	xe_tile_assert(tile, pt_update_ops->current_op <=
+	xe_tile_assert(tile, get_current_op(pt_update_ops) <=
 		       pt_update_ops->num_ops);
 
 #ifdef TEST_VM_OPS_ERROR
@@ -2727,7 +2751,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
-	if (!pt_update_ops->current_op) {
+	if (!get_current_op(pt_update_ops)) {
 		xe_tile_assert(tile, xe_vm_in_fault_mode(vm));
 
 		return dma_fence_get_stub();
@@ -2795,8 +2819,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	}
 
 	/* Point of no return - VM killed if failure after this */
-	for (i = 0; i < pt_update_ops->current_op; ++i) {
-		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
+	for (i = 0; i < get_current_op(pt_update_ops); ++i) {
+		struct xe_vm_pgtable_update_op *pt_op =
+			to_pt_op(pt_update_ops, i);
 
 		xe_pt_commit(pt_op->vma, pt_op->entries,
 			     pt_op->num_entries, &pt_update_ops->deferred);
@@ -2920,9 +2945,9 @@ void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
 
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

