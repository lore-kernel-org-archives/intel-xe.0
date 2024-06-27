Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA887C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 00:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A340F10E004;
	Thu, 27 Jun 2024 00:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DuClsRq2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0272410E004
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 00:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719448139; x=1750984139;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9Y2bVQw8NhMCcx7Walz2OwRtmjgZIFHsgdG24fCEi1A=;
 b=DuClsRq2KY9AXNm9NUtV6SMu25XQ/d6NYhJzSs/CqAmUbqH3I+nFPPcs
 f1s5jB4TL0mCAI0iobr9qCGw0GYypJa9f8cGrCI49/yMOeZaj5YvX7nUY
 9rnqM5PyCJU2ghkqcLHUb6Q5QuwV5qK1rciTDosrRZgPZLibFXuiRG2hR
 cHeduTGtreGHaM1bxxgTad2hm34om3vPW2XVuFa9+uWT8b3l/FFi21ahS
 EWyhQxYns04gxys5Vn7RKjq5sRA8wOF9/FQl/w9XK7YBXkAsNT9CJQJFr
 Q68MLY5G56bP7PkIVHnws8MWca9crA7ZiVnZXgFo8e/TqVLErW+TggemX Q==;
X-CSE-ConnectionGUID: oAFTf9R3QEWXrMIdzAJfQw==
X-CSE-MsgGUID: VrWY5JnqTiSUfs/IaxpnXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20322944"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="20322944"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 17:28:59 -0700
X-CSE-ConnectionGUID: ovJjxoYhSCS29z9/mBs6MQ==
X-CSE-MsgGUID: LZkdRu2CQEGOgCPxn91f0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="44162317"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa008.fm.intel.com with ESMTP; 26 Jun 2024 17:28:59 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH] drm/xe/bmg: Apply Wa_22019338487
Date: Wed, 26 Jun 2024 17:27:43 -0700
Message-Id: <20240627002743.1334133-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Extend this WA to BMG GT as well. In this case media GT is
not affected. The cap frequencies and max allowed ggtt writes
are different as well.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c       | 11 ++++++++---
 drivers/gpu/drm/xe/xe_guc_pc.c     | 11 ++++++++---
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 883cfc7f98a8..0cdbc1296e88 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -74,6 +74,9 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
 
 static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
 {
+	struct xe_gt *gt = XE_WA(ggtt->tile->primary_gt, 22019338487) ? ggtt->tile->primary_gt :
+			   ggtt->tile->media_gt;
+	u32 max_gtt_writes = XE_WA(ggtt->tile->primary_gt, 22019338487) ? 1100 : 63;
 	/*
 	 * Wa_22019338487: GMD_ID is a RO register, a dummy write forces gunit
 	 * to wait for completion of prior GTT writes before letting this through.
@@ -81,8 +84,8 @@ static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
 	 */
 	lockdep_assert_held(&ggtt->lock);
 
-	if ((++ggtt->access_count % 63) == 0) {
-		xe_mmio_write32(ggtt->tile->media_gt, GMD_ID, 0x0);
+	if ((++ggtt->access_count % max_gtt_writes) == 0) {
+		xe_mmio_write32(gt, GMD_ID, 0x0);
 		ggtt->access_count = 0;
 	}
 }
@@ -218,7 +221,9 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 		ggtt->size = GUC_GGTT_TOP;
 
 	if (GRAPHICS_VERx100(xe) >= 1270)
-		ggtt->pt_ops = ggtt->tile->media_gt && XE_WA(ggtt->tile->media_gt, 22019338487) ?
+		ggtt->pt_ops = (ggtt->tile->media_gt &&
+			       XE_WA(ggtt->tile->media_gt, 22019338487)) ||
+			       XE_WA(ggtt->tile->primary_gt, 22019338487) ?
 			       &xelpg_pt_wa_ops : &xelpg_pt_ops;
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d88f5e960fbd..16c4b3fadd45 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -45,6 +45,7 @@
 #define GT_FREQUENCY_SCALER	3
 
 #define LNL_MERT_FREQ_CAP	800
+#define BMG_MERT_FREQ_CAP	2133
 
 /**
  * DOC: GuC Power Conservation (PC)
@@ -703,10 +704,14 @@ static u32 pc_max_freq_cap(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 
-	if (XE_WA(gt, 22019338487))
-		return min(LNL_MERT_FREQ_CAP, pc->rp0_freq);
-	else
+	if (XE_WA(gt, 22019338487)) {
+		if (xe_gt_is_media_type(gt))
+			return min(LNL_MERT_FREQ_CAP, pc->rp0_freq);
+		else
+			return min(BMG_MERT_FREQ_CAP, pc->rp0_freq);
+	} else {
 		return pc->rp0_freq;
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index a6b897030fde..26066beb4f6f 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -28,3 +28,4 @@
 		GRAPHICS_VERSION(2004)
 13011645652	GRAPHICS_VERSION(2004)
 22019338487	MEDIA_VERSION(2000)
+		GRAPHICS_VERSION(2001)
-- 
2.38.1

