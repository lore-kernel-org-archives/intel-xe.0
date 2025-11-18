Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341AACCD19A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 09:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E892D10E472;
	Tue, 18 Nov 2025 09:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+2u50Rs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDC110E46A
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 09:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456767; x=1794992767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cfAbHih3r57yeGhneQtkKjjotNgh6uJlLwzmgEW/Bjo=;
 b=N+2u50RsAR6bvsNs+c3tsPXFehVppwUt0CWhDXbbu7KvMc0ly/z1oKlY
 4D99yOF7TZenjvQu4YQgboQeweK0PLaPd7N9qBbXoW0g3fMRH6+n+3pAb
 8SEgnDGIrFKp5vQ+SVUqnfE8hDPAvKnZTbHp1QiLwGAW5i5tOpcDVGEtv
 ImZvALHH4d2oKA0JyXhLB6GogHeEiMwUSDIf6WXg8f6TbxoRjq9RFd13N
 lkykRjvN64Bghx1U3LEGuoB/SHPJ15AA+dfQoAgooAW9Hv+kS1SWrXHMr
 K9cHcjTtpENvxPfNC8CeEzHN0JoDLWfAx1cX4ZFs7+Z6HS7tADLf24ybq A==;
X-CSE-ConnectionGUID: Zu4eRo3MQeih89XG7B7XBg==
X-CSE-MsgGUID: IP+BV4H1Qhqrb0X9ksyA7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="83097779"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="83097779"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:06:07 -0800
X-CSE-ConnectionGUID: O0xwNtKWTuKRMNUstVhqng==
X-CSE-MsgGUID: N7m/SrsYSM2xY4n5gd4vBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190500864"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa009.jf.intel.com with ESMTP; 18 Nov 2025 01:06:05 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 06/11] drm/xe: Create page reclaim list on unbind
Date: Tue, 18 Nov 2025 17:05:47 +0800
Message-ID: <20251118090552.246243-7-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118090552.246243-1-brian3.nguyen@intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Page reclaim list (PRL) is preparation work for the page reclaim feature.
The PRL is firstly owned by pt_update_ops and all other page reclaim
operations will point back to this PRL. PRL generates its entries during
the unbind page walker, updating the PRL.

This PRL is restricted to a 4K page, so 512 page entries at most.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h |   1 +
 drivers/gpu/drm/xe/xe_page_reclaim.c  |  52 ++++++++++++
 drivers/gpu/drm/xe/xe_page_reclaim.h  |  49 ++++++++++++
 drivers/gpu/drm/xe/xe_pt.c            | 109 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pt_types.h      |   5 ++
 6 files changed, 217 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.c
 create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e4b273b025d2..048e6c93271c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -95,6 +95,7 @@ xe-y += xe_bb.o \
 	xe_oa.o \
 	xe_observation.o \
 	xe_pagefault.o \
+	xe_page_reclaim.o \
 	xe_pat.o \
 	xe_pci.o \
 	xe_pcode.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
index 4389e5a76f89..4d83461e538b 100644
--- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
@@ -9,6 +9,7 @@
 #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
 #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
 
+#define XE_PTE_ADDR_MASK	GENMASK_ULL(51, 12)
 #define GGTT_PTE_VFID		GENMASK_ULL(11, 2)
 
 #define GUC_GGTT_TOP		0xFEE00000
diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
new file mode 100644
index 000000000000..a0d15efff58c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/kref.h>
+#include <linux/mm.h>
+#include <linux/slab.h>
+
+#include "xe_page_reclaim.h"
+
+#include "regs/xe_gt_regs.h"
+#include "xe_assert.h"
+#include "xe_macros.h"
+
+/**
+ * xe_page_reclaim_list_invalidate() - Mark a PRL as invalid
+ * @prl: Page reclaim list to reset
+ *
+ * Clears the entries pointer and marks the list as invalid so
+ * future use know PRL is unusable. It is expected that the entries
+ * have already been released.
+ */
+void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl)
+{
+	prl->entries = NULL;
+	prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST;
+}
+
+/**
+ * xe_page_reclaim_list_alloc_entries() - Allocate page reclaim list entries
+ * @prl: Page reclaim list to allocate entries for
+ *
+ * Allocate one 4K page for the PRL entries, otherwise assign prl->entries to NULL.
+ */
+int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl)
+{
+	struct page *page;
+
+	XE_WARN_ON(prl->entries != NULL);
+	if (prl->entries)
+		return 0;
+
+	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+	if (page) {
+		prl->entries = page_address(page);
+		prl->num_entries = 0;
+	}
+
+	return page ? 0 : -ENOMEM;
+}
diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
new file mode 100644
index 000000000000..d066d7d97f79
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_PAGE_RECLAIM_H_
+#define _XE_PAGE_RECLAIM_H_
+
+#include <linux/kref.h>
+#include <linux/mm.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#define XE_PAGE_RECLAIM_MAX_ENTRIES	512
+#define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
+
+struct xe_guc_page_reclaim_entry {
+	u32 valid:1;
+	u32 reclamation_size:6;
+	u32 reserved:5;
+	u32 address_lo:20;
+	u32 address_hi:20;
+	u32 reserved1:12;
+} __packed;
+
+struct xe_page_reclaim_list {
+	/** @entries: array of page reclaim entries, page allocated */
+	struct xe_guc_page_reclaim_entry *entries;
+	/** @num_entries: number of entries */
+	int num_entries;
+#define XE_PAGE_RECLAIM_INVALID_LIST	-1
+};
+
+void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl);
+int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl);
+static inline void xe_page_reclaim_entries_get(struct xe_guc_page_reclaim_entry *entries)
+{
+	if (entries)
+		get_page(virt_to_page(entries));
+}
+
+static inline void xe_page_reclaim_entries_put(struct xe_guc_page_reclaim_entry *entries)
+{
+	if (entries)
+		put_page(virt_to_page(entries));
+}
+
+#endif	/* _XE_PAGE_RECLAIM_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 884127b4d97d..532a047676d4 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -12,6 +12,7 @@
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_migrate.h"
+#include "xe_page_reclaim.h"
 #include "xe_pt_types.h"
 #include "xe_pt_walk.h"
 #include "xe_res_cursor.h"
@@ -1538,6 +1539,9 @@ struct xe_pt_stage_unbind_walk {
 	/* Output */
 	/* @wupd: Structure to track the page-table updates we're building */
 	struct xe_walk_update wupd;
+
+	/** @prl: Backing pointer to page reclaim list in pt_update_ops */
+	struct xe_page_reclaim_list *prl;
 };
 
 /*
@@ -1572,6 +1576,69 @@ static bool xe_pt_check_kill(u64 addr, u64 next, unsigned int level,
 	return false;
 }
 
+/* Huge 2MB leaf lives directly in a level-1 table and has no children */
+static bool is_large_pte(struct xe_pt *pte)
+{
+	return pte->level == 1 && !pte->base.children;
+}
+
+/* page_size = 2^(reclamation_size + 12) */
+#define COMPUTE_RECLAIM_ADDRESS_MASK(page_size)				\
+({									\
+	BUILD_BUG_ON(!__builtin_constant_p(page_size));			\
+	ilog2(page_size) - 12;						\
+})
+
+static void generate_reclaim_entry(struct xe_tile *tile,
+				   struct xe_page_reclaim_list *prl,
+				   u64 pte,
+				   struct xe_pt *xe_child)
+{
+	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
+	u64 phys_addr = pte & XE_PTE_ADDR_MASK;
+	const u64 field_mask = GENMASK_ULL(19, 0);
+	u32 reclamation_size;
+	const uint max_entries = XE_PAGE_RECLAIM_MAX_ENTRIES;
+	int num_entries = prl->num_entries;
+
+	xe_tile_assert(tile, xe_child->level <= MAX_HUGEPTE_LEVEL);
+	xe_tile_assert(tile, reclaim_entries);
+
+	if (num_entries == XE_PAGE_RECLAIM_INVALID_LIST)
+		return;
+
+	/* Overflow: mark as invalid through num_entries */
+	if (num_entries >= max_entries) {
+		prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST;
+		return;
+	}
+
+	/**
+	 * reclamation_size indicates the size of the page to be
+	 * invalidated and flushed from non-coherent cache.
+	 * Page size is computed as 2^(reclamation_size+12) bytes.
+	 * Only valid for these specific levels.
+	 */
+
+	if (xe_child->level == 0 && !(pte & XE_PTE_PS64))
+		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /* reclamation_size = 0 */
+	else if (xe_child->level == 0)
+		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 1 */
+	else if (is_large_pte(xe_child))
+		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 2 */
+	else
+		return;
+
+	reclaim_entries[num_entries].valid = 1;
+	reclaim_entries[num_entries].reclamation_size =
+		reclamation_size;
+	reclaim_entries[num_entries].address_lo =
+		FIELD_GET(field_mask, phys_addr);
+	reclaim_entries[num_entries].address_hi =
+		FIELD_GET(field_mask, phys_addr >> 20);
+	prl->num_entries++;
+}
+
 static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 				    unsigned int level, u64 addr, u64 next,
 				    struct xe_ptw **child,
@@ -1579,10 +1646,27 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 				    struct xe_pt_walk *walk)
 {
 	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
+	struct xe_pt_stage_unbind_walk *xe_walk =
+		container_of(walk, typeof(*xe_walk), base);
+	struct xe_device *xe = tile_to_xe(xe_walk->tile);
 
 	XE_WARN_ON(!*child);
 	XE_WARN_ON(!level);
 
+	/* 4K and 64K Pages are level 0, large pte needs additional handling. */
+	if (xe_walk->prl && (xe_child->level == 0 || is_large_pte(xe_child))) {
+		struct iosys_map *leaf_map = &xe_child->bo->vmap;
+		pgoff_t first = xe_pt_offset(addr, 0, walk);
+		pgoff_t count = xe_pt_num_entries(addr, next, 0, walk);
+
+		for (pgoff_t i = 0; i < count; i++) {
+			u64 pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
+
+			generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
+					       pte, xe_child);
+		}
+	}
+
 	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
 
 	return 0;
@@ -1654,6 +1738,8 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
 {
 	u64 start = range ? xe_svm_range_start(range) : xe_vma_start(vma);
 	u64 end = range ? xe_svm_range_end(range) : xe_vma_end(vma);
+	struct xe_vm_pgtable_update_op *pt_update_op =
+		container_of(entries, struct xe_vm_pgtable_update_op, entries[0]);
 	struct xe_pt_stage_unbind_walk xe_walk = {
 		.base = {
 			.ops = &xe_pt_stage_unbind_ops,
@@ -1665,6 +1751,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
 		.modified_start = start,
 		.modified_end = end,
 		.wupd.entries = entries,
+		.prl = pt_update_op->prl,
 	};
 	struct xe_pt *pt = vm->pt_root[tile->id];
 
@@ -1897,6 +1984,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 			     struct xe_vm_pgtable_update_ops *pt_update_ops,
 			     struct xe_vma *vma)
 {
+	struct xe_device *xe = tile_to_xe(tile);
 	u32 current_op = pt_update_ops->current_op;
 	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
 	int err;
@@ -1914,6 +2002,13 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	pt_op->vma = vma;
 	pt_op->bind = false;
 	pt_op->rebind = false;
+	/* Maintain one PRL located in pt_update_ops that all others in unbind op reference */
+	if (xe->info.has_page_reclaim_hw_assist && !pt_update_ops->prl.entries) {
+		err = xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
+		if (err < 0)
+			xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
+	}
+	pt_op->prl = (pt_update_ops->prl.entries) ? &pt_update_ops->prl : NULL;
 
 	err = vma_reserve_fences(tile_to_xe(tile), vma);
 	if (err)
@@ -1921,6 +2016,13 @@ static int unbind_op_prepare(struct xe_tile *tile,
 
 	pt_op->num_entries = xe_pt_stage_unbind(tile, xe_vma_vm(vma),
 						vma, NULL, pt_op->entries);
+	/* Free PRL if list declared as invalid */
+	if (pt_update_ops->prl.entries &&
+	    pt_update_ops->prl.num_entries == XE_PAGE_RECLAIM_INVALID_LIST) {
+		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
+		pt_op->prl = NULL;
+		pt_update_ops->prl.entries = NULL;
+	}
 
 	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
 				pt_op->num_entries, false);
@@ -1979,6 +2081,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
 	pt_op->vma = XE_INVALID_VMA;
 	pt_op->bind = false;
 	pt_op->rebind = false;
+	pt_op->prl = NULL;
 
 	pt_op->num_entries = xe_pt_stage_unbind(tile, vm, NULL, range,
 						pt_op->entries);
@@ -2096,6 +2199,7 @@ xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
 	init_llist_head(&pt_update_ops->deferred);
 	pt_update_ops->start = ~0x0ull;
 	pt_update_ops->last = 0x0ull;
+	xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
 }
 
 /**
@@ -2518,6 +2622,11 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
 		&vops->pt_update_ops[tile->id];
 	int i;
 
+	if (pt_update_ops->prl.entries) {
+		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
+		xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
+	}
+
 	lockdep_assert_held(&vops->vm->lock);
 	xe_vm_assert_held(vops->vm);
 
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 881f01e14db8..26e5295f118e 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 
+#include "xe_page_reclaim.h"
 #include "xe_pt_walk.h"
 
 struct xe_bo;
@@ -85,6 +86,8 @@ struct xe_vm_pgtable_update_op {
 	bool bind;
 	/** @rebind: is a rebind */
 	bool rebind;
+	/** @prl: Backing pointer to page reclaim list of pt_update_ops */
+	struct xe_page_reclaim_list *prl;
 };
 
 /** struct xe_vm_pgtable_update_ops: page table update operations */
@@ -119,6 +122,8 @@ struct xe_vm_pgtable_update_ops {
 	 * slots are idle.
 	 */
 	bool wait_vm_kernel;
+	/** @prl: embedded page reclaim list */
+	struct xe_page_reclaim_list prl;
 };
 
 #endif
-- 
2.51.2

