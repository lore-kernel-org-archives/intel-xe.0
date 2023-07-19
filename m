Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BF0C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 21:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0D210E3FC;
	Wed, 19 Jul 2023 21:12:14 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D8610E3FC
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 21:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689801132; x=1721337132;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IvQUEs5NZedG8pjonRmd0sNhzybvTrjXJkGagEm/P20=;
 b=PBJB030E7R1S7bU5unNXAXEABczXYcnnKzErAmxC4sDGWjwQlmRj/yMS
 ACSIVSamViXDp17z5/zVflvTDqTXwCxJ2ja4TNs8CgD0URwrQDwFnUq/q
 lvnp6s9RGISL3oZgJuqXNsqVG8V/xlUzL19XzXNQ6I1laT+iIgkmE5Hgg
 oF47w3mUqpSrDKv/ErCF+7F0mXJd5Lq1OlMQx61GytQWPi06MSpkznr++
 1+EsnZre/dyM3j56uGnM6YkEscMjs7713x4Xjb2fc2fddb/jffG6EKBBk
 LTlveQZAInb/6bWeN2eXgLF0qyTG3XDbDIhNUj9WKFMlmL5IYP7f+4x8y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="369221245"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="369221245"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 14:10:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="674457453"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="674457453"
Received: from unknown (HELO lstrano-desk.jf.intel.com) ([10.24.89.184])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 14:10:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 19 Jul 2023 14:10:50 -0700
Message-Id: <20230719211051.84708-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Introduce a range-fence utility
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Add generic utility to track range conflicts signaled by a dma-fence.
Tracking implemented via an interval tree. An example use case being
tracking conflicts for pending (un)binds from multiple bind engines. By
being generic ths idea would this could moved to the DRM level and used
in multiple drivers for similar problems.

v2: Make interval tree functions static (CI)

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile         |   1 +
 drivers/gpu/drm/xe/xe_range_fence.c | 165 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_range_fence.h |  77 +++++++++++++
 3 files changed, 243 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_range_fence.c
 create mode 100644 drivers/gpu/drm/xe/xe_range_fence.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c37587ae20c2..4ea9e3150c20 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -91,6 +91,7 @@ xe-y += xe_bb.o \
 	xe_pt.o \
 	xe_pt_walk.o \
 	xe_query.o \
+	xe_range_fence.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
 	xe_rtp.o \
diff --git a/drivers/gpu/drm/xe/xe_range_fence.c b/drivers/gpu/drm/xe/xe_range_fence.c
new file mode 100644
index 000000000000..336903f0351e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_range_fence.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/dma-fence.h>
+#include <linux/interval_tree_generic.h>
+#include <linux/slab.h>
+
+#include "xe_macros.h"
+#include "xe_range_fence.h"
+
+#define XE_RANGE_TREE_START(_node)	((_node)->start)
+#define XE_RANGE_TREE_LAST(_node)	((_node)->last)
+
+INTERVAL_TREE_DEFINE(struct xe_range_fence, rb, u64, __subtree_last,
+		     XE_RANGE_TREE_START, XE_RANGE_TREE_LAST, static,
+		     xe_range_fence_tree);
+
+static void
+xe_range_fence_signal_notify(struct dma_fence *fence, struct dma_fence_cb *cb)
+{
+	struct xe_range_fence *rfence = container_of(cb, typeof(*rfence), cb);
+	struct xe_range_fence_tree *tree = rfence->tree;
+
+	llist_add(&rfence->link, &tree->list);
+}
+
+static bool __xe_range_fence_cleanup(struct xe_range_fence_tree *tree)
+{
+	struct llist_node *node = llist_del_all(&tree->list);
+	struct xe_range_fence *rfence, *next;
+
+	llist_for_each_entry_safe(rfence, next, node, link) {
+		xe_range_fence_tree_remove(rfence, &tree->root);
+		dma_fence_put(rfence->fence);
+		kfree(rfence);
+	}
+
+	return !!node;
+}
+
+/**
+ * xe_range_fence_cleanup() - Cleanup range fence tree
+ * @tree: range fence tree
+ */
+void xe_range_fence_cleanup(struct xe_range_fence_tree *tree)
+{
+	__xe_range_fence_cleanup(tree);
+}
+
+/**
+ * xe_range_fence_insert() - range fence insert
+ * @tree: range fence tree to insert intoi
+ * @rfence: range fence
+ * @ops: range fence ops
+ * @start: start address of range fence
+ * @last: last address of range fence
+ * @fence: dma fence which signals range fence can be removed + freed
+ *
+ * Return: 0 on success, non-zero on failure
+ */
+int xe_range_fence_insert(struct xe_range_fence_tree *tree,
+			  struct xe_range_fence *rfence,
+			  const struct xe_range_fence_ops *ops,
+			  u64 start, u64 last, struct dma_fence *fence)
+{
+	int err = 0;
+
+	__xe_range_fence_cleanup(tree);
+
+	if (dma_fence_is_signaled(fence))
+		goto free;
+
+	rfence->ops = ops;
+	rfence->start = start;
+	rfence->last = last;
+	rfence->tree = tree;
+	rfence->fence = dma_fence_get(fence);
+	err = dma_fence_add_callback(fence, &rfence->cb,
+				     xe_range_fence_signal_notify);
+	if (err == -ENOENT) {
+		dma_fence_put(fence);
+		err = 0;
+		goto free;
+	} else if (err == 0) {
+		xe_range_fence_tree_insert(rfence, &tree->root);
+		return 0;
+	}
+
+free:
+	if (ops->free)
+		ops->free(rfence);
+
+	return err;
+}
+
+static void xe_range_fence_tree_remove_all(struct xe_range_fence_tree *tree)
+{
+	struct xe_range_fence *rfence;
+	bool retry = true;
+
+	rfence = xe_range_fence_tree_iter_first(&tree->root, 0, U64_MAX);
+	while (rfence) {
+		/* Should be ok with the minimalistic callback */
+		if (dma_fence_remove_callback(rfence->fence, &rfence->cb))
+			llist_add(&rfence->link, &tree->list);
+		rfence = xe_range_fence_tree_iter_next(rfence, 0, U64_MAX);
+	}
+
+	while (retry)
+		retry = __xe_range_fence_cleanup(tree);
+}
+
+/**
+ * xe_range_fence_tree_init() - Init range fence tree
+ * @tree: range fence tree
+ */
+void xe_range_fence_tree_init(struct xe_range_fence_tree *tree)
+{
+	memset(tree, 0, sizeof(*tree));
+}
+
+/**
+ * xe_range_fence_tree_fini() - Fini range fence tree
+ * @tree: range fence tree
+ */
+void xe_range_fence_tree_fini(struct xe_range_fence_tree *tree)
+{
+	xe_range_fence_tree_remove_all(tree);
+	XE_WARN_ON(!RB_EMPTY_ROOT(&tree->root.rb_root));
+}
+
+/**
+ * xe_range_fence_tree_first() - range fence tree iterator first
+ * @tree: range fence tree
+ * @start: start address of range fence
+ * @last: last address of range fence
+ *
+ * Return: first range fence found in range or NULL
+ */
+struct xe_range_fence *
+xe_range_fence_tree_first(struct xe_range_fence_tree *tree, u64 start,
+			  u64 last)
+{
+	return xe_range_fence_tree_iter_first(&tree->root, start, last);
+}
+
+/**
+ * xe_range_fence_tree_next() - range fence tree iterator next
+ * @rfence: current range fence
+ * @start: start address of range fence
+ * @last: last address of range fence
+ *
+ * Return: next range fence found in range or NULL
+ */
+struct xe_range_fence *
+xe_range_fence_tree_next(struct xe_range_fence *rfence, u64 start, u64 last)
+{
+	return xe_range_fence_tree_iter_next(rfence, start, last);
+}
+
+const struct xe_range_fence_ops xe_range_fence_kfree_ops = {
+	.free = (void (*)(struct xe_range_fence *rfence)) kfree,
+};
diff --git a/drivers/gpu/drm/xe/xe_range_fence.h b/drivers/gpu/drm/xe/xe_range_fence.h
new file mode 100644
index 000000000000..e1497e82645f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_range_fence.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_RANGE_FENCE_H_
+#define _XE_RANGE_FENCE_H_
+
+#include <linux/dma-fence.h>
+#include <linux/rbtree.h>
+#include <linux/types.h>
+
+struct xe_range_fence_tree;
+struct xe_range_fence;
+
+/** struct xe_range_fence_ops - XE range fence ops */
+struct xe_range_fence_ops {
+	/** @free: free range fence op */
+	void (*free)(struct xe_range_fence *rfence);
+};
+
+/** struct xe_range_fence - XE range fence (address conflict tracking) */
+struct xe_range_fence {
+	/** @rb: RB tree node inserted into interval tree */
+	struct rb_node rb;
+	/** @start: start address of range fence is interval tree */
+	u64 start;
+	/** @last: last address (inclusive) of range fence is interval tree */
+	u64 last;
+	/** @__subtree_last: interval tree internal usage */
+	u64 __subtree_last;
+	/**
+	 * @fence: fence signals address in range fence no longer has conflict
+	 */
+	struct dma_fence *fence;
+	/** @tree: interval tree which range fence belongs to */
+	struct xe_range_fence_tree *tree;
+	/**
+	 * @cb: callback when fence signals to remove range fence free from interval tree
+	 */
+	struct dma_fence_cb cb;
+	/** @link: used to defer free of range fence to non-irq context */
+	struct llist_node link;
+	/** @ops: range fence ops */
+	const struct xe_range_fence_ops *ops;
+};
+
+/** struct xe_range_fence_tree - interval tree to store range fences */
+struct xe_range_fence_tree {
+	/** @root: interval tree root */
+	struct rb_root_cached root;
+	/** @list: list of pending range fences to be freed */
+	struct llist_head list;
+};
+
+extern const struct xe_range_fence_ops xe_range_fence_kfree_ops;
+
+struct xe_range_fence *
+xe_range_fence_tree_first(struct xe_range_fence_tree *tree, u64 start,
+			  u64 last);
+
+struct xe_range_fence *
+xe_range_fence_tree_next(struct xe_range_fence *rfence, u64 start, u64 last);
+
+void xe_range_fence_tree_cleanup(struct xe_range_fence_tree *tree);
+
+void xe_range_fence_tree_init(struct xe_range_fence_tree *tree);
+
+void xe_range_fence_tree_fini(struct xe_range_fence_tree *tree);
+
+int xe_range_fence_insert(struct xe_range_fence_tree *tree,
+			  struct xe_range_fence *rfence,
+			  const struct xe_range_fence_ops *ops,
+			  u64 start, u64 end,
+			  struct dma_fence *fence);
+
+#endif
-- 
2.34.1

