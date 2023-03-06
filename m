Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F11C678D4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 13:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F5710E0BB;
	Mon,  6 Mar 2023 13:18:10 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33AE10E0BB
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Mar 2023 13:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678108689; x=1709644689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rEHqymnCoY0zYM39SqjB5BV61f73Xv+nu0lAkbpZTFw=;
 b=C/5Q6vQ/iikXyv+zKK42pR82P4CioR5Y7sO9AL+ROiTGCs5dEAk2z7WX
 A4DHyrUnUQiwyC3Vf85b+NT1178Qx2p7JsM6h918R9i7ft1JaekyX5rJi
 YibU1cwYOp84a+deh1RvF6nXeB7UgYuz8XIbXr8xRq0R3P1dDYavwSiI/
 lIV8S7dUWCnrSPido7AuQ4cHu9C56BOxCCCv5zdiPGbgiqhxVFtuBJi3L
 ywRGIV1FN3LxKEwPyerC+yL4QYnWv4XcQDVaf98N8TMD4IhddqGB/Zq9T
 LPtADTR0ZDUnBsuW8FGJjI6e05Q6hndaVJ4gD6MaRQRr76SDxSXUku6hb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="337866695"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="337866695"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 05:18:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="653607203"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="653607203"
Received: from jsyrstad-mobl1.amr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.109])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 05:18:03 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Mar 2023 14:17:36 +0100
Message-Id: <20230306131738.197862-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306131738.197862-1-thomas.hellstrom@linux.intel.com>
References: <20230306131738.197862-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Add a page-table walker
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

Add a gpu page table walker similar in functionality to the cpu page-table
walker in mm/pagewalk.c. This is a candidate for being drm-generic if
there are other drivers that may find it useful so should, if
possible, be preserved in that way.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile     |   1 +
 drivers/gpu/drm/xe/xe_pt_walk.c | 160 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pt_walk.h | 161 ++++++++++++++++++++++++++++++++
 3 files changed, 322 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pt_walk.c
 create mode 100644 drivers/gpu/drm/xe/xe_pt_walk.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 18257cd7227d..49460a3ec12c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -75,6 +75,7 @@ xe-y += xe_bb.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
 	xe_pt.o \
+	xe_pt_walk.o \
 	xe_query.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
diff --git a/drivers/gpu/drm/xe/xe_pt_walk.c b/drivers/gpu/drm/xe/xe_pt_walk.c
new file mode 100644
index 000000000000..0def89af4372
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pt_walk.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+#include "xe_pt_walk.h"
+
+/**
+ * DOC: GPU page-table tree walking.
+ * The utilities in this file are similar to the CPU page-table walk
+ * utilities in mm/pagewalk.c. The main difference is that we distinguish
+ * the various levels of a page-table tree with an unsigned integer rather
+ * than by name. 0 is the lowest level, and page-tables with level 0 can
+ * not be directories pointing to lower levels, whereas all other levels
+ * can. The user of the utilities determines the highest level.
+ *
+ * Nomenclature:
+ * Each struct xe_ptw, regardless of level is referred to as a page table, and
+ * multiple page tables typically form a page table tree with page tables at
+ * intermediate levels being page directories pointing at page tables at lower
+ * levels. A shared page table for a given address range is a page-table which
+ * is neither fully within nor fully outside the address range and that can
+ * thus be shared by two or more address ranges.
+ *
+ * Please keep this code generic so that it can used as a drm-wide page-
+ * table walker should other drivers find use for it.
+ */
+static u64 xe_pt_addr_end(u64 addr, u64 end, unsigned int level,
+			  const struct xe_pt_walk *walk)
+{
+	u64 size = 1ull << walk->shifts[level];
+	u64 tmp = round_up(addr + 1, size);
+
+	return min_t(u64, tmp, end);
+}
+
+static bool xe_pt_next(pgoff_t *offset, u64 *addr, u64 next, u64 end,
+		       unsigned int level, const struct xe_pt_walk *walk)
+{
+	pgoff_t step = 1;
+
+	/* Shared pt walk skips to the last pagetable */
+	if (unlikely(walk->shared_pt_mode)) {
+		unsigned int shift = walk->shifts[level];
+		u64 skip_to = round_down(end, 1ull << shift);
+
+		if (skip_to > next) {
+			step += (skip_to - next) >> shift;
+			next = skip_to;
+		}
+	}
+
+	*addr = next;
+	*offset += step;
+
+	return next != end;
+}
+
+/**
+ * xe_pt_walk_range() - Walk a range of a gpu page table tree with callbacks
+ * for each page-table entry in all levels.
+ * @parent: The root page table for walk start.
+ * @level: The root page table level.
+ * @addr: Virtual address start.
+ * @end: Virtual address end + 1.
+ * @walk: Walk info.
+ *
+ * Similar to the CPU page-table walker, this is a helper to walk
+ * a gpu page table and call a provided callback function for each entry.
+ *
+ * Return: 0 on success, negative error code on error. The error is
+ * propagated from the callback and on error the walk is terminated.
+ */
+int xe_pt_walk_range(struct xe_ptw *parent, unsigned int level,
+		     u64 addr, u64 end, struct xe_pt_walk *walk)
+{
+	pgoff_t offset = xe_pt_offset(addr, level, walk);
+	struct xe_ptw **entries = parent->dir ? parent->dir->entries : NULL;
+	const struct xe_pt_walk_ops *ops = walk->ops;
+	enum page_walk_action action;
+	struct xe_ptw *child;
+	int err = 0;
+	u64 next;
+
+	do {
+		next = xe_pt_addr_end(addr, end, level, walk);
+		if (walk->shared_pt_mode && xe_pt_covers(addr, next, level,
+							 walk))
+			continue;
+again:
+		action = ACTION_SUBTREE;
+		child = entries ? entries[offset] : NULL;
+		err = ops->pt_entry(parent, offset, level, addr, next,
+				    &child, &action, walk);
+		if (err)
+			break;
+
+		/* Probably not needed yet for gpu pagetable walk. */
+		if (unlikely(action == ACTION_AGAIN))
+			goto again;
+
+		if (likely(!level || !child || action == ACTION_CONTINUE))
+			continue;
+
+		err = xe_pt_walk_range(child, level - 1, addr, next, walk);
+
+		if (!err && ops->pt_post_descend)
+			err = ops->pt_post_descend(parent, offset, level, addr,
+						   next, &child, &action, walk);
+		if (err)
+			break;
+
+	} while (xe_pt_next(&offset, &addr, next, end, level, walk));
+
+	return err;
+}
+
+/**
+ * xe_pt_walk_shared() - Walk shared page tables of a page-table tree.
+ * @parent: Root page table directory.
+ * @level: Level of the root.
+ * @addr: Start address.
+ * @end: Last address + 1.
+ * @walk: Walk info.
+ *
+ * This function is similar to xe_pt_walk_range() but it skips page tables
+ * that are private to the range. Since the root (or @parent) page table is
+ * typically also a shared page table this function is different in that it
+ * calls the pt_entry callback and the post_descend callback also for the
+ * root. The root can be detected in the callbacks by checking whether
+ * parent == *child.
+ * Walking only the shared page tables is common for unbind-type operations
+ * where the page-table entries for an address range are cleared or detached
+ * from the main page-table tree.
+ *
+ * Return: 0 on success, negative error code on error: If a callback
+ * returns an error, the walk will be terminated and the error returned by
+ * this function.
+ */
+int xe_pt_walk_shared(struct xe_ptw *parent, unsigned int level,
+		      u64 addr, u64 end, struct xe_pt_walk *walk)
+{
+	const struct xe_pt_walk_ops *ops = walk->ops;
+	enum page_walk_action action = ACTION_SUBTREE;
+	struct xe_ptw *child = parent;
+	int err;
+
+	walk->shared_pt_mode = true;
+	err = walk->ops->pt_entry(parent, 0, level + 1, addr, end,
+				  &child, &action, walk);
+
+	if (err || action != ACTION_SUBTREE)
+		return err;
+
+	err = xe_pt_walk_range(parent, level, addr, end, walk);
+	if (!err && ops->pt_post_descend) {
+		err = ops->pt_post_descend(parent, 0, level + 1, addr, end,
+					   &child, &action, walk);
+	}
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_pt_walk.h b/drivers/gpu/drm/xe/xe_pt_walk.h
new file mode 100644
index 000000000000..42c51fa601ec
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pt_walk.h
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+#ifndef __XE_PT_WALK__
+#define __XE_PT_WALK__
+
+#include <linux/pagewalk.h>
+#include <linux/types.h>
+
+struct xe_ptw_dir;
+
+/**
+ * struct xe_ptw - base class for driver pagetable subclassing.
+ * @dir: Pointer to an array of children if any.
+ *
+ * Drivers could subclass this, and if it's a page-directory, typically
+ * embed the xe_ptw_dir::entries array in the same allocation.
+ */
+struct xe_ptw {
+	struct xe_ptw_dir *dir;
+};
+
+/**
+ * struct xe_ptw_dir - page directory structure
+ * @entries: Array holding page directory children.
+ *
+ * It is the responsibility of the user to ensure @entries is
+ * correctly sized.
+ */
+struct xe_ptw_dir {
+	struct xe_ptw *entries[0];
+};
+
+/**
+ * struct xe_pt_walk - Embeddable struct for walk parameters
+ */
+struct xe_pt_walk {
+	/** @ops: The walk ops used for the pagewalk */
+	const struct xe_pt_walk_ops *ops;
+	/**
+	 * @shifts: Array of page-table entry shifts used for the
+	 * different levels, starting out with the leaf level 0
+	 * page-shift as the first entry. It's legal for this pointer to be
+	 * changed during the walk.
+	 */
+	const u64 *shifts;
+	/** @max_level: Highest populated level in @sizes */
+	unsigned int max_level;
+	/**
+	 * @shared_pt_mode: Whether to skip all entries that are private
+	 * to the address range and called only for entries that are
+	 * shared with other address ranges. Such entries are referred to
+	 * as shared pagetables.
+	 */
+	bool shared_pt_mode;
+};
+
+/**
+ * typedef xe_pt_entry_fn - gpu page-table-walk callback-function
+ * @parent: The parent page.table.
+ * @offset: The offset (number of entries) into the page table.
+ * @level: The level of @parent.
+ * @addr: The virtual address.
+ * @next: The virtual address for the next call, or end address.
+ * @child: Pointer to pointer to child page-table at this @offset. The
+ * function may modify the value pointed to if, for example, allocating a
+ * child page table.
+ * @action: The walk action to take upon return. See <linux/pagewalk.h>.
+ * @walk: The walk parameters.
+ */
+typedef int (*xe_pt_entry_fn)(struct xe_ptw *parent, pgoff_t offset,
+			      unsigned int level, u64 addr, u64 next,
+			      struct xe_ptw **child,
+			      enum page_walk_action *action,
+			      struct xe_pt_walk *walk);
+
+/**
+ * struct xe_pt_walk_ops - Walk callbacks.
+ */
+struct xe_pt_walk_ops {
+	/**
+	 * @pt_entry: Callback to be called for each page table entry prior
+	 * to descending to the next level. The returned value of the action
+	 * function parameter is honored.
+	 */
+	xe_pt_entry_fn pt_entry;
+	/**
+	 * @pt_post_descend: Callback to be called for each page table entry
+	 * after return from descending to the next level. The returned value
+	 * of the action function parameter is ignored.
+	 */
+	xe_pt_entry_fn pt_post_descend;
+};
+
+int xe_pt_walk_range(struct xe_ptw *parent, unsigned int level,
+		     u64 addr, u64 end, struct xe_pt_walk *walk);
+
+int xe_pt_walk_shared(struct xe_ptw *parent, unsigned int level,
+		      u64 addr, u64 end, struct xe_pt_walk *walk);
+
+/**
+ * xe_pt_covers - Whether the address range covers an entire entry in @level
+ * @addr: Start of the range.
+ * @end: End of range + 1.
+ * @level: Page table level.
+ * @walk: Page table walk info.
+ *
+ * This function is a helper to aid in determining whether a leaf page table
+ * entry can be inserted at this @level.
+ *
+ * Return: Whether the range provided covers exactly an entry at this level.
+ */
+static inline bool xe_pt_covers(u64 addr, u64 end, unsigned int level,
+				const struct xe_pt_walk *walk)
+{
+	u64 pt_size = 1ull << walk->shifts[level];
+
+	return end - addr == pt_size && IS_ALIGNED(addr, pt_size);
+}
+
+/**
+ * xe_pt_num_entries: Number of page-table entries of a given range at this
+ * level
+ * @addr: Start address.
+ * @end: End address.
+ * @level: Page table level.
+ * @walk: Walk info.
+ *
+ * Return: The number of page table entries at this level between @start and
+ * @end.
+ */
+static inline pgoff_t
+xe_pt_num_entries(u64 addr, u64 end, unsigned int level,
+		  const struct xe_pt_walk *walk)
+{
+	u64 pt_size = 1ull << walk->shifts[level];
+
+	return (round_up(end, pt_size) - round_down(addr, pt_size)) >>
+		walk->shifts[level];
+}
+
+/**
+ * xe_pt_offset: Offset of the page-table entry for a given address.
+ * @addr: The address.
+ * @level: Page table level.
+ * @walk: Walk info.
+ *
+ * Return: The page table entry offset for the given address in a
+ * page table with size indicated by @level.
+ */
+static inline pgoff_t
+xe_pt_offset(u64 addr, unsigned int level, const struct xe_pt_walk *walk)
+{
+	if (level < walk->max_level)
+		addr &= ((1ull << walk->shifts[level + 1]) - 1);
+
+	return addr >> walk->shifts[level];
+}
+
+#endif
-- 
2.39.2

