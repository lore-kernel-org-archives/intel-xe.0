Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D52C61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 08:21:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A088510E0CD;
	Thu, 27 Aug 2026 08:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RjqvGAX1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0AA10EEF2
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 08:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787818903; x=1819354903;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RGqBiwaZXiLR0SYGJ1rK6tTB94FxjHdwv6yTM7flYGw=;
 b=RjqvGAX1VI+FZAt47MUvmBL/Aif8Sx2XFSkm1aynQlvckVMeWqSnapez
 CpA2IDPMdUuEdyr9sSOzgpvbAhk2uIjyRPId/UwuTpWHJaUQpDikYbNgn
 nwhCAPbL/5YZ/pJQjtQAYFKeKOSYU5FNqDzUJ9uIiVY66hrmuulKi6OHl
 dXvVSwPmZV4UT0WfGDjwBhBLRxQj9uljEPtlA29j1/q2XUQpI0eLgR/Sv
 Xc0JKk10dPL4HJoywPBKcSeygjwUGQAVkn9kzSP8wNA8+RMWjyq2beKMx
 SJJrtU5ORiGnxAePzRiw6nWTQceYKkf+3DZODlSI4JRHtl2adBkdX5NHi Q==;
X-CSE-ConnectionGUID: zykcrslzRsSTd1ETfvAa3A==
X-CSE-MsgGUID: Rk+NYow4Qvy3pmzSwZZpfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99475716"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="99475716"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 01:21:42 -0700
X-CSE-ConnectionGUID: aCHqO6X5ROae041gjjZwPQ==
X-CSE-MsgGUID: 4bhLC3e7TveJxRr20bfRlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="264559692"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa007.fm.intel.com with ESMTP; 27 Aug 2026 01:21:41 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe/ggtt: invalidate engine GGTT TLBs for multi-queue
 GTs
Date: Thu, 27 Aug 2026 13:50:11 +0530
Message-ID: <20260827082011.3370672-4-tilak.tirumalesh.tangudu@intel.com>
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

Engines cache GGTT translations in their own TLBs, which the
xe_tlb_inval_ggtt() does not touch.
After a GGTT unmap the engines can still hit the stale translation and
read the old page.

Issue an INVAL_FULL (intra vf) invalidation on GGTT unmap, gated on the
GT having any multi-queue engine class.

v2:
- Use xe_gt_has_multi_queue() helper and address nits (Niranjana)
v3:
- Invalidate both the primary and media GTs, similar to
  xe_ggtt_invalidate() (Matt Brost)
v5:
- Guard NULL gt and explain the multi-queue-only engine flush
  (Niranjana)

Assisted-by: Claude:claude-opus-4-8
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 9b58f47986f6..63e8bf193605 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -451,6 +451,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
 
 static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
+static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt);
 
 static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 {
@@ -482,8 +483,11 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
 		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
 	drm_mm_remove_node(&node->base);
 	node->base.size = 0;
-	if (bound && node->invalidate_on_remove)
+	if (bound && node->invalidate_on_remove) {
 		xe_ggtt_invalidate(ggtt);
+		/* Drain engine TLBs so a recycled range can't hit a stale entry. */
+		xe_ggtt_invalidate_engine(ggtt);
+	}
 	mutex_unlock(&ggtt->lock);
 
 	ggtt_node_fini(node);
@@ -601,6 +605,34 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
 }
 
+static void ggtt_invalidate_gt_engine_tlb(struct xe_gt *gt)
+{
+	int err;
+
+	/*
+	 * Multi-queue GTs miss engine GGTT TLB invalidations (GuC
+	 * lite-restore skips the full context restore), so the engine
+	 * flush is needed there.
+	 */
+	if (!gt || !xe_gt_has_multi_queue(gt))
+		return;
+
+	err = xe_tlb_inval_ggtt_full(&gt->tlb_inval);
+	xe_gt_WARN(gt, err, "Failed to invalidate engine GGTT TLBs (%pe)",
+		   ERR_PTR(err));
+}
+
+/*
+ * Drain engine-side GGTT TLBs on teardown so a recycled range's next
+ * occupant can't hit a predecessor's cached translation.
+ */
+static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
+{
+	/* Each GT in a tile has its own engine TLBs to drain */
+	ggtt_invalidate_gt_engine_tlb(ggtt->tile->primary_gt);
+	ggtt_invalidate_gt_engine_tlb(ggtt->tile->media_gt);
+}
+
 /**
  * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change in usable address range.
  * @ggtt: the &xe_ggtt struct instance
-- 
2.46.0

