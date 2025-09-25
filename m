Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF11CCA476
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8922B10E9EB;
	Thu, 25 Sep 2025 23:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dmw2oD/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C3110E32D
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844007; x=1790380007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pk/EolynvRLPXg4yxKlkUbxmvtdKOYCyqoSsLOjSGF8=;
 b=Dmw2oD/sA+4vL17s1S7oAQK9rpC9pose6JyxRRNOlnfbPVV8Ox8DvcqP
 pRxq+BdB5cDohc3UB40uos6/dFASE1PdwyL30Q4YLz7k2uuMyEOLUFYEi
 4j9ZpRRDGUosoqp0PitTNhqkwNFi7Y2trrOL16H4PGD2Q05ilok39nsct
 uODB7jr8HPT9zKwcc2R6rFld4oX8nLgGDI3DeBYPC8rCme0md2sxyN+DL
 p0T6LWuFqlAyGmKIkSHDsJcFXhlJQsY0NlUzYOEz7PmEAeNZVxhdZCG2W
 v3AMmqXPkDgTWFaX72sTDyvnqHgsdy24M6wLuMSE7MQs1PAmAOCUyp1aw g==;
X-CSE-ConnectionGUID: 3BZxXurtTIGVFeown3ZKdg==
X-CSE-MsgGUID: 5aLoFMfnSEqYYM+zqGuLaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817673"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817673"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: y47Hf440QWWibS69su6S2w==
X-CSE-MsgGUID: SAEcT7p2TDiMvevwHUMs4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181852977"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 11/22] drm/xe: Check for primary GT before looking up
 Wa_22019338487
Date: Thu, 25 Sep 2025 16:46:39 -0700
Message-ID: <20250925234628.2112163-35-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925234628.2112163-24-matthew.d.roper@intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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

If the primary GT is disabled via configfs, we need to make sure that we
don't search for this workaround on a NULL xe_gt pointer.  Since we can
only disable the primary GT on igpu platforms, the media GT is the one
we'd want to check anyway for this workaround.

The ternary operators in ggtt_update_access_counter() were getting a bit
long/complicated, so rewrite them with regular if/else statements.
While we're at it, throw in a couple extra assertions to make sure that
we're truly picking the expected GT according to igpu/dgpu type.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 7fdd0a97a628..0ed9ffc3278d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -107,10 +107,23 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
 static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
 {
 	struct xe_tile *tile = ggtt->tile;
-	struct xe_gt *affected_gt = XE_GT_WA(tile->primary_gt, 22019338487) ?
-		tile->primary_gt : tile->media_gt;
-	struct xe_mmio *mmio = &affected_gt->mmio;
-	u32 max_gtt_writes = XE_GT_WA(ggtt->tile->primary_gt, 22019338487) ? 1100 : 63;
+	struct xe_gt *affected_gt;
+	u32 max_gtt_writes;
+
+	if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 22019338487)) {
+		affected_gt = tile->primary_gt;
+		max_gtt_writes = 1100;
+
+		/* Only expected to apply to primary GT on dgpu platforms */
+		xe_tile_assert(tile, IS_DGFX(tile_to_xe(tile)));
+	} else {
+		affected_gt = tile->media_gt;
+		max_gtt_writes = 63;
+
+		/* Only expected to apply to media GT on igpu platforms */
+		xe_tile_assert(tile, !IS_DGFX(tile_to_xe(tile)));
+	}
+
 	/*
 	 * Wa_22019338487: GMD_ID is a RO register, a dummy write forces gunit
 	 * to wait for completion of prior GTT writes before letting this through.
@@ -119,7 +132,7 @@ static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
 	lockdep_assert_held(&ggtt->lock);
 
 	if ((++ggtt->access_count % max_gtt_writes) == 0) {
-		xe_mmio_write32(mmio, GMD_ID, 0x0);
+		xe_mmio_write32(&affected_gt->mmio, GMD_ID, 0x0);
 		ggtt->access_count = 0;
 	}
 }
@@ -286,7 +299,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (GRAPHICS_VERx100(xe) >= 1270)
 		ggtt->pt_ops = (ggtt->tile->media_gt &&
 			       XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
-			       XE_GT_WA(ggtt->tile->primary_gt, 22019338487) ?
+			       (ggtt->tile->primary_gt &&
+				XE_GT_WA(ggtt->tile->primary_gt, 22019338487)) ?
 			       &xelpg_pt_wa_ops : &xelpg_pt_ops;
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
-- 
2.51.0

