Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329B61048937
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 01:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC7810EC65;
	Sat, 28 Feb 2026 01:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fKiSrxOH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF05610E1DA
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 01:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772242509; x=1803778509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eHGgOS5y5wzEt9SHyuG2G1wTuVuBMDooYI8Q7HFwqI8=;
 b=fKiSrxOHfwe9ShBT1gUBuMzGICc+efl9V09eUMT+tiprUFGSc6df2p1N
 cMzwy3dsL8Y7OapvVSkQsUm8vrdgqdhRRTUKOD0ZdYJSYIiJAvX6IfiTD
 jfvwRyWjNnted2XxQG13BD2IRxXt2201diaMKibSQPFfPzdbyxmpYVkfS
 jkVsTkvfVE95lbUeMf2x6VNuFBmzkHIMB4Cx45IahBrmvWbo7ztVGQfVG
 DjWTxprh68oc3ZZWgNKssWtE4c/+q66zv7NpqMBL3DJ3mld80GskKZ9zj
 Fgxj1d9r8XLFOEfX02y0H41wyhMfvjMYm4J5ZPeo7FT4BuqmjbO1iUtrc g==;
X-CSE-ConnectionGUID: ILvxOvRFT1yXHoFjn/3WlQ==
X-CSE-MsgGUID: NkDQ3hXKRRmg1wcTX6fXXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83966347"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="83966347"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:07 -0800
X-CSE-ConnectionGUID: 9h2hcRc8RquLN+dp0DG+aA==
X-CSE-MsgGUID: OBs/xyUbRgCF6TqYxjqeNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="213854858"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 08/25] drm/xe: Add helpers to access PT ops
Date: Fri, 27 Feb 2026 17:34:44 -0800
Message-Id: <20260228013501.106680-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228013501.106680-1-matthew.brost@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_pt.c | 65 ++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 83dacc91b7b3..1f24eff75185 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1881,13 +1881,37 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
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
@@ -1922,8 +1946,8 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 			   struct xe_vm_pgtable_update_ops *pt_update_ops,
 			   struct xe_vma *vma, bool invalidate_on_bind)
 {
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 	int err;
 
 	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
@@ -1952,7 +1976,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		xe_pt_update_ops_rfence_interval(pt_update_ops,
 						 xe_vma_start(vma),
 						 xe_vma_end(vma));
-		++pt_update_ops->current_op;
+		incr_current_op(pt_update_ops);
 		pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
 
 		/*
@@ -1989,8 +2013,8 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
 			      struct xe_vm_pgtable_update_ops *pt_update_ops,
 			      struct xe_vma *vma, struct xe_svm_range *range)
 {
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 	int err;
 
 	xe_tile_assert(tile, xe_vma_is_cpu_addr_mirror(vma));
@@ -2014,7 +2038,7 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		xe_pt_update_ops_rfence_interval(pt_update_ops,
 						 xe_svm_range_start(range),
 						 xe_svm_range_end(range));
-		++pt_update_ops->current_op;
+		incr_current_op(pt_update_ops);
 		pt_update_ops->needs_svm_lock = true;
 
 		pt_op->vma = vma;
@@ -2032,8 +2056,8 @@ static int unbind_op_prepare(struct xe_tile *tile,
 			     struct xe_vma *vma)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 	int err;
 
 	if (!((vma->tile_present | vma->tile_staged) & BIT(tile->id)))
@@ -2072,7 +2096,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 				pt_op->num_entries, false);
 	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_vma_start(vma),
 					 xe_vma_end(vma));
-	++pt_update_ops->current_op;
+	incr_current_op(pt_update_ops);
 	pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
 	pt_update_ops->needs_invalidation = true;
 
@@ -2112,8 +2136,8 @@ static int unbind_range_prepare(struct xe_vm *vm,
 				struct xe_vm_pgtable_update_ops *pt_update_ops,
 				struct xe_svm_range *range)
 {
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_current_pt_op(pt_update_ops);
 
 	if (!(range->tile_present & BIT(tile->id)))
 		return 0;
@@ -2134,7 +2158,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
 				pt_op->num_entries, false);
 	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_svm_range_start(range),
 					 xe_svm_range_end(range));
-	++pt_update_ops->current_op;
+	incr_current_op(pt_update_ops);
 	pt_update_ops->needs_svm_lock = true;
 	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
 		xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
@@ -2282,7 +2306,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 			return err;
 	}
 
-	xe_tile_assert(tile, pt_update_ops->current_op <=
+	xe_tile_assert(tile, get_current_op(pt_update_ops) <=
 		       pt_update_ops->num_ops);
 
 #ifdef TEST_VM_OPS_ERROR
@@ -2515,7 +2539,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
-	if (!pt_update_ops->current_op) {
+	if (!get_current_op(pt_update_ops)) {
 		xe_tile_assert(tile, xe_vm_in_fault_mode(vm));
 
 		return dma_fence_get_stub();
@@ -2583,8 +2607,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	}
 
 	/* Point of no return - VM killed if failure after this */
-	for (i = 0; i < pt_update_ops->current_op; ++i) {
-		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
+	for (i = 0; i < get_current_op(pt_update_ops); ++i) {
+		struct xe_vm_pgtable_update_op *pt_op =
+			to_pt_op(pt_update_ops, i);
 
 		xe_pt_commit(pt_op->vma, pt_op->entries,
 			     pt_op->num_entries, &pt_update_ops->deferred);
@@ -2708,9 +2733,9 @@ void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
 
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

