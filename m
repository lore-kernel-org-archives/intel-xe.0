Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C98C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 18:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DB510E975;
	Thu, 11 Jan 2024 18:26:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB1510E975
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 18:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704997572; x=1736533572;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ajIP0KVGmvwvhnykAmULpQPibeyYNndXp0Do+DRofu4=;
 b=feoe6fTyOneWrMwQGoLeJMRXnMAwrODQhJQ1w9/eDUFBpiOdRgSgxjhq
 EOtuRdqhg61UBYQSYL8AC/He9DXBfa70KhBxkcsj/s6sppxJ2KgSzGfZq
 if6IoQPMPStUpz9qYktkVHBYxiCVCF33pSZr9acKVWxugVpJ/rjjCK2zP
 0ebdX4buHu7px3mrxfjttvUxh5nYDe4MAqYNncIITV8HAzzPiD0k8dzDE
 6ZSFQ9kZo4jTN32iQ1QEKa8oqi6KRKoJoWVT+NMBa5LEe7aiXR0zfj5eT
 glk1zyi2b3Tjq4Cs2gD76PN/BfRtd8rAE4H5ydOWYENEONNoIdmz3TEqf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="389389916"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="389389916"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 10:26:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="24723815"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.150.229])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 10:26:10 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Allow to exclude part of GGTT from allocations
Date: Thu, 11 Jan 2024 19:25:59 +0100
Message-Id: <20240111182559.629-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Soon we will be required to exclude some of the GGTT addresses
from the allocations, since on some platforms running the SR-IOV VF
mode, we will be able to use only selected range of the GGTT space.

Add helper functions to manage such GGTT range exclusions, and
follow the naming from the similar concept used by GVT-g.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 71 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h |  3 ++
 2 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index c639dbf3bdd2..6fdf830678b3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -11,9 +11,12 @@
 #include <drm/i915_drm.h>
 
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_regs.h"
+#include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
@@ -312,6 +315,74 @@ void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
 	}
 }
 
+static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
+			      const struct drm_mm_node *node, const char *description)
+{
+	char buf[10];
+
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+		string_get_size(node->size, 1, STRING_UNITS_2, buf, sizeof(buf));
+		xe_gt_dbg(ggtt->tile->primary_gt, "GGTT %#llx-%#llx (%s) %s\n",
+			  node->start, node->start + node->size, buf, description);
+	}
+}
+
+/**
+ * xe_ggtt_balloon - prevent allocation of specified GGTT addresses
+ * @ggtt: the &xe_ggtt where we want to make reservation
+ * @start: the starting GGTT address of the reserved region
+ * @end: then end GGTT address of the reserved region
+ * @node: the &drm_mm_node to hold reserved GGTT node
+ *
+ * Use xe_ggtt_deballoon() to release a reserved GGTT node.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct drm_mm_node *node)
+{
+	int err;
+
+	xe_tile_assert(ggtt->tile, start < end);
+	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
+	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
+	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(node));
+
+	node->color = 0;
+	node->start = start;
+	node->size = end - start;
+
+	mutex_lock(&ggtt->lock);
+	err = drm_mm_reserve_node(&ggtt->mm, node);
+	mutex_unlock(&ggtt->lock);
+
+	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
+		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
+		       node->start, node->start + node->size, ERR_PTR(err)))
+		return err;
+
+	xe_ggtt_dump_node(ggtt, node, "balloon");
+	return 0;
+}
+
+/**
+ * xe_ggtt_deballoon - release a reserved GGTT region
+ * @ggtt: the &xe_ggtt where reserved node belongs
+ * @node: the &drm_mm_node with reserved GGTT region
+ *
+ * See xe_ggtt_balloon() for details.
+ */
+void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
+{
+	if (!drm_mm_node_allocated(node))
+		return;
+
+	xe_ggtt_dump_node(ggtt, node, "deballoon");
+
+	mutex_lock(&ggtt->lock);
+	drm_mm_remove_node(node);
+	mutex_unlock(&ggtt->lock);
+}
+
 int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 				       u32 size, u32 align, u32 mm_flags)
 {
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index a09c166dff70..42705e1338e1 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -16,6 +16,9 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
 
+int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct drm_mm_node *node);
+void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node);
+
 int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 				u32 size, u32 align);
 int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,

base-commit: 79184e72263e91528195db01783148435c7e4fad
-- 
2.25.1

