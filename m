Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E446DC61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 08:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6CD10EEEF;
	Thu, 27 Aug 2026 08:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RnNPBGfa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E6210E61C
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787818899; x=1819354899;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=I25WwXRpTNaH2Twb/dbcI6aeAm6oWq3qmeZ/xoyMks4=;
 b=RnNPBGfaDtaVeRKwMqVhsbP+frDE0ssJmOZTcKkOUo6OrGas2giWHPTd
 20AARfHbr8JBnva0DMGOj0YVyPjZXD82KodTkrJCyM2otlDEO6isCG5NF
 pR/Y3E2O4ku7M5ZYOFOyPUCKlPg1tUYimsX5yLb38laWNQN3oghWf43Du
 vGBNkTk0dYx+u26IvjbZqOBZqSv+5RTQCwpWWjFQLHs2zWJO+0uXsPtOF
 f9gpnQvUElV2ob6p6jEAXp7dLKreWnj3nll0pdiDs3mubR6Jk64H/VCR8
 mq6ByGO1Nkh0TinWZlFBW2n91/PYtljsDCY6Jab4NdpoWz9ZBIzLB68oc g==;
X-CSE-ConnectionGUID: qxgwpf+lTnOGmsfVG91n6g==
X-CSE-MsgGUID: 27pJn9e7T+adNqmT7b+mRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99475710"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="99475710"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 01:21:39 -0700
X-CSE-ConnectionGUID: HwRDXWmoTkGeOya2cOqWHA==
X-CSE-MsgGUID: zQCVoJSdQGOG+eSM1nNXBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="264559595"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa007.fm.intel.com with ESMTP; 27 Aug 2026 01:21:37 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe/ggtt: fault on unmapped GGTT for multi-queue
 platforms
Date: Thu, 27 Aug 2026 13:50:09 +0530
Message-ID: <20260827082011.3370672-2-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260827082011.3370672-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260827082011.3370672-1-tilak.tirumalesh.tangudu@intel.com>
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Engines cache GGTT translations in their TLBs.
A full context restore on engine switch flushes these, so a stale
translation for an unmapped and recycled range does not survive.

During a secondary queue append, GuC does a lite-restore and skips the
full context restore, so engine TLB invalidations are missed. This was
observed while running multi-queue tests on another OS.

If unmapped GGTT points to scratch, such a stale access silently reads
scratch instead of faulting, masking the error. On multi-queue
platforms skip allocating the scratch page so unmapped GGTT holds
PTE=0 and faults consistently for the whole boot; other platforms keep
scratch and are unaffected.

v2:
- Add xe_gt_has_multi_queue() helper and address nits (Niranjana)
v3:
- Drop scratch entirely instead of toggling per-unmap (Matt Brost)
v5:
- Document the rationale (Matt Roper / Matt Brost)

Assisted-by: Claude:claude-opus-4-8
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 40 ++++++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_gt.h   | 13 ++++++++++++
 2 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ec23862477f..9b58f47986f6 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -20,6 +20,7 @@
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_map.h"
@@ -533,27 +534,36 @@ void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
 int xe_ggtt_init(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	unsigned int flags;
 	int err;
 
 	/*
-	 * So we don't need to worry about 64K GGTT layout when dealing with
-	 * scratch entries, rather keep the scratch page in system memory on
-	 * platforms where 64K pages are needed for VRAM.
+	 * Multi-queue misses engine GGTT TLB invalidations (GuC lite-restore
+	 * skips the full context restore), so skip scratch: a stale translation
+	 * to a freed range then faults instead of silently reading scratch.
 	 */
-	flags = 0;
-	if (ggtt->flags & XE_GGTT_FLAGS_64K)
-		flags |= XE_BO_FLAG_SYSTEM;
-	else
-		flags |= XE_BO_FLAG_VRAM_IF_DGFX(ggtt->tile);
+	if (!xe_gt_has_multi_queue(ggtt->tile->primary_gt)) {
+		unsigned int flags = 0;
+
+		/*
+		 * So we don't need to worry about 64K GGTT layout when dealing
+		 * with scratch entries, rather keep the scratch page in system
+		 * memory on platforms where 64K pages are needed for VRAM.
+		 */
+		if (ggtt->flags & XE_GGTT_FLAGS_64K)
+			flags |= XE_BO_FLAG_SYSTEM;
+		else
+			flags |= XE_BO_FLAG_VRAM_IF_DGFX(ggtt->tile);
 
-	ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile, XE_PAGE_SIZE, flags);
-	if (IS_ERR(ggtt->scratch)) {
-		err = PTR_ERR(ggtt->scratch);
-		goto err;
-	}
+		ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile,
+							     XE_PAGE_SIZE, flags);
+		if (IS_ERR(ggtt->scratch)) {
+			err = PTR_ERR(ggtt->scratch);
+			goto err;
+		}
 
-	xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0, xe_bo_size(ggtt->scratch));
+		xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0,
+			      xe_bo_size(ggtt->scratch));
+	}
 
 	xe_ggtt_initial_clear(ggtt);
 
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 65a4655b0994..92d934d50244 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -160,4 +160,17 @@ static inline bool xe_gt_supports_multi_queue(const struct xe_gt *gt,
 	return gt->info.multi_queue_engine_class_mask & BIT(class);
 }
 
+/**
+ * xe_gt_has_multi_queue() - Check if gt supports multi-queue on
+ * any engine class.
+ *
+ * @gt: the GT object (may be NULL)
+ *
+ * Return: true if any engine class on @gt supports multi queue, else false
+ */
+static inline bool xe_gt_has_multi_queue(const struct xe_gt *gt)
+{
+	return gt && gt->info.multi_queue_engine_class_mask;
+}
+
 #endif
-- 
2.46.0

