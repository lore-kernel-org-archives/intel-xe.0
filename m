Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF246CCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B724410E153;
	Mon, 13 Oct 2025 20:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rq2TUJ2a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9DA10E503
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386202; x=1791922202;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tZcPhTJuFf6cwxmDpz0z5qBxjeYtfVKwJ8DBX4UGLAg=;
 b=Rq2TUJ2a7RRXAEs8+Hu7TSmqSrpJwaeyMuqs6XgQb7gKNzZO8bW78M6H
 23cvgNO+JDZrmcWOiYRhY4OtK4vLqflMUx1QDQepm5H2sZo6sF5o5YhF6
 atsBTGe76pV1SA84WP1e9Gpz8IGItJDI4mi7dWl6fn5HxfyNJ6yqbVS5Q
 j4CBFa9l8V6fyv7uTfOc0dOUoa/wvhstDGfuG9D66t1P3RWjLmSLKcZU7
 So7b9psqlDcYMny8J82SFVYpblVWjryvo7wa27GcBorrOt/Aq3kMVxSZK
 pjeyk4obCDObpwZ8QAzSNStiGmPPao24lmVwYzklevKuanMaESRDVOOL7 g==;
X-CSE-ConnectionGUID: mmr3RMFVRLecRleFrXryjQ==
X-CSE-MsgGUID: 95bSj3UyQPiL1020ExKIXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800542"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800542"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:02 -0700
X-CSE-ConnectionGUID: N3dtZpgzRBS87jY5HMtagA==
X-CSE-MsgGUID: 9CVE7U9jQ1u0LetsDSbu3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707569"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 12/23] drm/xe: Check for primary GT before looking up
 Wa_22019338487
Date: Mon, 13 Oct 2025 13:09:55 -0700
Message-ID: <20251013200944.2499947-37-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013200944.2499947-25-matthew.d.roper@intel.com>
References: <20251013200944.2499947-25-matthew.d.roper@intel.com>
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
disable the primary GT only on igpu platforms, the media GT is the one
we'd want to check anyway for this workaround.

The ternary operators in ggtt_update_access_counter() were getting a bit
long/complicated, so rewrite them with regular if/else statements.
While we're at it, throw in a couple extra assertions to make sure that
we're truly picking the expected GT according to igpu/dgpu type.

v2:
 - Adjust indentation/wrapping; it's easier to read this with longer,
   unwrapped lines.  (Lucas)
 - Tweak wording of commit message to remove ambiguity.  (Gustavo)

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index aca7ae5489b9..40680f0c49a1 100644
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
@@ -291,10 +304,10 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 		ggtt->size = GUC_GGTT_TOP;
 
 	if (GRAPHICS_VERx100(xe) >= 1270)
-		ggtt->pt_ops = (ggtt->tile->media_gt &&
-			       XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
-			       XE_GT_WA(ggtt->tile->primary_gt, 22019338487) ?
-			       &xelpg_pt_wa_ops : &xelpg_pt_ops;
+		ggtt->pt_ops =
+			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
+			(ggtt->tile->primary_gt && XE_GT_WA(ggtt->tile->primary_gt, 22019338487)) ?
+			&xelpg_pt_wa_ops : &xelpg_pt_ops;
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
-- 
2.51.0

