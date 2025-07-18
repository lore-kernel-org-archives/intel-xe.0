Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C21C83F34
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 18:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BEB10E028;
	Fri, 18 Jul 2025 18:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HzAcrVFs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EC010E028
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 18:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752863320; x=1784399320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m36OhJpWmjhCZSI2/J40X7n8udpKmKBAgO4x0p8BvSU=;
 b=HzAcrVFs9Jfc/DgUa2jp5bRB71KuC503WnTDqxenHQfV2taWSbAND4xH
 y94BGGVx5E2uv2QGc2Vrk/w6Chxq+uv2dzXu0u6GLJy00jx42LhK+nD5R
 casCzXsZ8p2JBHnNBdeoig8l/Y/ej3AdpIJqhUkrHTOLBRCBh3Z7CbcTu
 8reCQIgCl3ScjE/71EyPN/GSeZHD2sMWZIRMCC/UAhWXaLSELgQNYDSnV
 Ht1Z+GssgHGxXf6WMmKuP+VVLoYFFjUspAsgKfJSQ3lUj3uh3Yc+prHzY
 ijInfKHT6bETPPxTBiYkZB8TXXHCNLNZgavntKY0aZhDS/QzPDoU1nZiv g==;
X-CSE-ConnectionGUID: KwPqoqYGQqSLXIVyuslEHg==
X-CSE-MsgGUID: o5HllHwASvigLV0rwbznfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="66611859"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="66611859"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 11:28:39 -0700
X-CSE-ConnectionGUID: SwZNGRK4RAG/n7zkfoj7Ew==
X-CSE-MsgGUID: x21TWV9NTpGXrx/NQtnluA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="163642390"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 11:28:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.mrozek@intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 matthew.auld@intel.com
Subject: [PATCH] drm/xe: Quick LRC indirect ring state WA
Date: Fri, 18 Jul 2025 11:30:21 -0700
Message-Id: <20250718183021.1284575-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Delay freeing of LRC BO memory until at least one other job completes on
the hardware engine. This doesn't work with virtual engines but is
sufficient for testing—it seems to fix running xe_vm in a loop on BMG.

For virtual engines, we probably need to make xe_lrc_zombie per hardware
instance, and have a virtual LRC move through the zombie list of each
instance in its logical mask. The LRC can then be finalized after
passing through the last instance.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |  1 +
 drivers/gpu/drm/xe/xe_gt.c         |  8 +++-
 drivers/gpu/drm/xe/xe_gt_types.h   |  3 ++
 drivers/gpu/drm/xe/xe_hw_engine.c  | 14 ++++++-
 drivers/gpu/drm/xe/xe_lrc.c        | 18 ++++++++-
 drivers/gpu/drm/xe/xe_lrc.h        |  1 +
 drivers/gpu/drm/xe/xe_lrc_types.h  |  4 ++
 drivers/gpu/drm/xe/xe_lrc_zombie.c | 59 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc_zombie.h | 26 +++++++++++++
 9 files changed, 130 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_lrc_zombie.c
 create mode 100644 drivers/gpu/drm/xe/xe_lrc_zombie.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f5f5775acdc0..448c49b9622e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -76,6 +76,7 @@ xe-y += xe_bb.o \
 	xe_hw_fence.o \
 	xe_irq.o \
 	xe_lrc.o \
+	xe_lrc_zombie.o \
 	xe_migrate.o \
 	xe_mmio.o \
 	xe_mocs.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 858b5398c01b..ddce758801d4 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -46,6 +46,7 @@
 #include "xe_irq.h"
 #include "xe_lmtt.h"
 #include "xe_lrc.h"
+#include "xe_lrc_zombie.h"
 #include "xe_map.h"
 #include "xe_migrate.h"
 #include "xe_mmio.h"
@@ -610,8 +611,11 @@ static void xe_gt_fini(void *arg)
 	struct xe_gt *gt = arg;
 	int i;
 
-	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
+	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
+		if (xe_gt_has_indirect_ring_state(gt))
+			xe_lrc_zombie_fini(&gt->lrc_zombie[i]);
+	}
 
 	xe_gt_disable_host_l2_vram(gt);
 }
@@ -626,6 +630,8 @@ int xe_gt_init(struct xe_gt *gt)
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
 		gt->ring_ops[i] = xe_ring_ops_get(gt, i);
 		xe_hw_fence_irq_init(&gt->fence_irq[i]);
+		if (xe_gt_has_indirect_ring_state(gt))
+			xe_lrc_zombie_init(&gt->lrc_zombie[i]);
 	}
 
 	err = devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, xe_gt_fini, gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 7def0959da35..30b5575e8164 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -14,6 +14,7 @@
 #include "xe_gt_stats_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
+#include "xe_lrc_zombie.h"
 #include "xe_oa_types.h"
 #include "xe_reg_sr_types.h"
 #include "xe_sa_types.h"
@@ -324,6 +325,8 @@ struct xe_gt {
 	/** @fence_irq: fence IRQs (1 per engine class) */
 	struct xe_hw_fence_irq fence_irq[XE_ENGINE_CLASS_MAX];
 
+	struct xe_lrc_zombie lrc_zombie[XE_ENGINE_CLASS_MAX];
+
 	/** @default_lrc: default LRC state */
 	void *default_lrc[XE_ENGINE_CLASS_MAX];
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 3439c8522d01..41d1fd59eb8d 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -33,6 +33,7 @@
 #include "xe_hw_fence.h"
 #include "xe_irq.h"
 #include "xe_lrc.h"
+#include "xe_lrc_zombie.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_reg_sr.h"
@@ -865,13 +866,24 @@ int xe_hw_engines_init(struct xe_gt *gt)
 
 void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 {
+	struct xe_gt *gt = hwe->gt;
+
 	wake_up_all(&gt_to_xe(hwe->gt)->ufence_wq);
 
 	if (hwe->irq_handler)
 		hwe->irq_handler(hwe, intr_vec);
 
-	if (intr_vec & GT_RENDER_USER_INTERRUPT)
+	if (intr_vec & GT_RENDER_USER_INTERRUPT) {
 		xe_hw_fence_irq_run(hwe->fence_irq);
+		/*
+		 * XXX: Engine class instance check is quick hack to avoid
+		 * kernel jobs triggering LRC frees.
+		 */
+		if (xe_gt_has_indirect_ring_state(gt) &&
+		    !(hwe->class == XE_ENGINE_CLASS_COPY &&
+		      hwe->logical_instance != 0))
+			xe_lrc_zombie_run(&gt->lrc_zombie[hwe->class]);
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 529c6a972a55..8a40be3e87d6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -22,6 +22,7 @@
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_hw_fence.h"
+#include "xe_lrc_zombie.h"
 #include "xe_map.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
@@ -913,6 +914,12 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
 }
 
+void xe_lrc_fini(struct xe_lrc *lrc)
+{
+	xe_lrc_finish(lrc);
+	kfree(lrc);
+}
+
 /*
  * wa_bb_setup_utilization() - Write commands to wa bb to assist
  * in calculating active context run ticks.
@@ -1045,6 +1052,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 	kref_init(&lrc->refcount);
 	lrc->gt = gt;
+	lrc->engine_class = hwe->class;
 	lrc->flags = 0;
 	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
 	if (xe_gt_has_indirect_ring_state(gt))
@@ -1234,8 +1242,14 @@ void xe_lrc_destroy(struct kref *ref)
 {
 	struct xe_lrc *lrc = container_of(ref, struct xe_lrc, refcount);
 
-	xe_lrc_finish(lrc);
-	kfree(lrc);
+	if (xe_lrc_has_indirect_ring_state(lrc)) {
+		struct xe_lrc_zombie *lrc_zombie =
+			&lrc->gt->lrc_zombie[lrc->engine_class];
+
+		xe_lrc_zombie_add(lrc_zombie, lrc);
+	} else {
+		xe_lrc_fini(lrc);
+	}
 }
 
 void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index eb6e8de8c939..a0c716dacd4b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -47,6 +47,7 @@ struct xe_lrc_snapshot {
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     u32 ring_size, u16 msix_vec, u32 flags);
 void xe_lrc_destroy(struct kref *ref);
+void xe_lrc_fini(struct xe_lrc *lrc);
 
 /**
  * xe_lrc_get - Get reference to the LRC
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index ae24cf6f8dd9..da48690def8c 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/kref.h>
 
+#include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
 
 struct xe_bo;
@@ -56,6 +57,9 @@ struct xe_lrc {
 
 	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
 	struct xe_bo *bb_per_ctx_bo;
+
+	struct list_head zombie_link;
+	int engine_class;
 };
 
 struct xe_lrc_snapshot;
diff --git a/drivers/gpu/drm/xe/xe_lrc_zombie.c b/drivers/gpu/drm/xe/xe_lrc_zombie.c
new file mode 100644
index 000000000000..55bf99f9be07
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_lrc_zombie.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_lrc.h"
+#include "xe_lrc_zombie.h"
+
+static void xe_lrc_zombie_work(struct work_struct *w)
+{
+	struct xe_lrc_zombie *zombie =
+		container_of(w, typeof(*zombie), work);
+	struct xe_lrc *lrc, *next;
+
+	/* XXX: Doesn't work with virtual engines, but enough to test out */
+
+	spin_lock(&zombie->lock);
+	list_for_each_entry_safe(lrc, next, &zombie->zombies, zombie_link) {
+		list_del(&lrc->zombie_link);
+		spin_unlock(&zombie->lock);
+
+		xe_lrc_fini(lrc);
+
+		spin_lock(&zombie->lock);
+	}
+	spin_unlock(&zombie->lock);
+
+	guard(spinlock)(&zombie->lock);
+	list_splice_tail_init(&zombie->pending_zombies, &zombie->zombies);
+}
+
+void xe_lrc_zombie_init(struct xe_lrc_zombie *zombie)
+{
+	INIT_WORK(&zombie->work, xe_lrc_zombie_work);
+	INIT_LIST_HEAD(&zombie->zombies);
+	INIT_LIST_HEAD(&zombie->pending_zombies);
+	spin_lock_init(&zombie->lock);
+}
+
+void xe_lrc_zombie_fini(struct xe_lrc_zombie *zombie)
+{
+	scoped_guard(spinlock, &zombie->lock)
+		list_splice_tail_init(&zombie->pending_zombies,
+				      &zombie->zombies);
+	xe_lrc_zombie_work(&zombie->work);
+}
+
+void xe_lrc_zombie_add(struct xe_lrc_zombie *zombie, struct xe_lrc *lrc)
+{
+	INIT_LIST_HEAD(&lrc->zombie_link);
+
+	guard(spinlock)(&zombie->lock);
+	list_add(&lrc->zombie_link, &zombie->pending_zombies);
+}
+
+void xe_lrc_zombie_run(struct xe_lrc_zombie *zombie)
+{
+	queue_work(system_unbound_wq, &zombie->work);
+}
diff --git a/drivers/gpu/drm/xe/xe_lrc_zombie.h b/drivers/gpu/drm/xe/xe_lrc_zombie.h
new file mode 100644
index 000000000000..78c35ae53a8f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_lrc_zombie.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_LRC_ZOMBIE_H_
+#define _XE_LRC_ZOMBIE_H_
+
+#include <linux/workqueue.h>
+
+struct xe_lrc_zombie {
+	spinlock_t lock;
+	struct list_head zombies;
+	struct list_head pending_zombies;
+	struct work_struct work;
+};
+
+void xe_lrc_zombie_init(struct xe_lrc_zombie *zombie);
+
+void xe_lrc_zombie_fini(struct xe_lrc_zombie *zombie);
+
+void xe_lrc_zombie_add(struct xe_lrc_zombie *zombie, struct xe_lrc *lrc);
+
+void xe_lrc_zombie_run(struct xe_lrc_zombie *zombie);
+
+#endif
-- 
2.34.1

