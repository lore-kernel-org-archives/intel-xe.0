Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907ACC61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 11:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2E610EC11;
	Wed, 26 Aug 2026 11:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="niainNAt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9739F10EC11
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 11:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787743625; x=1819279625;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aMRBJWqOLLK3NqD4nBPJXAQK3DdB5k+BENlWJ3a5XQ4=;
 b=niainNAtuUzsQL+ddGwK+1LwgPhFS1+TomxSRZvkDPS/Y7xoRwHFVRx+
 lyqgqJNO295wi5TY67TrXFGJj9QHRz0VUPfjzgPXYqIzQpSZUtR5hWQdb
 nMoAaB1RNFCwP2gDQSJgGnZ5I2FYfop7HTcPYoG+sz1V/izlZ6Yt9kLdM
 Wf1PLovJFbPuwMnoTwfro3PAuhR4eeTOkKRBD0idMCbiL8vN4CETD/gnv
 lAHt8ush5A95TOryhpWANcFD430/URVTKVOL3xLMOSStboIqeyVh8ZH/3
 SbUUpj79pYRkxqz760KeuT3eJu81SqlDFMgL978rgrALHd1BZke9P70q1 w==;
X-CSE-ConnectionGUID: soLt68SqRmmiMjWPjcT7Zg==
X-CSE-MsgGUID: zMx8G5qCTJygtxSHQB6hxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98556781"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="98556781"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 04:27:05 -0700
X-CSE-ConnectionGUID: cZqctsQ/RQGOvdKjXCCqhQ==
X-CSE-MsgGUID: uMeNgqLLSSSIqRSo3tPs3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="261418237"
Received: from unknown (HELO tilak-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.239.38])
 by fmviesa009.fm.intel.com with ESMTP; 26 Aug 2026 04:27:04 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe/ggtt: invalidate engine GGTT TLBs for multi-queue
 GTs
Date: Wed, 26 Aug 2026 16:55:33 +0530
Message-ID: <20260826112533.3289978-4-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260826112533.3289978-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260826112533.3289978-1-tilak.tirumalesh.tangudu@intel.com>
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

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index bd65100283e3..cc43089de34d 100644
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
@@ -600,6 +604,29 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
 }
 
+static void ggtt_invalidate_gt_engine_tlb(struct xe_gt *gt)
+{
+	int err;
+
+	if (!xe_gt_has_multi_queue(gt))
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

