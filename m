Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABAAC64ED6
	for <intel-xe@archiver.kernel.org>; Mon, 27 Feb 2023 22:27:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7D010E1EA;
	Mon, 27 Feb 2023 22:27:46 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93D210E1EA
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Feb 2023 22:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677536862; x=1709072862;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dr/pONNSu77rrryGlreO7wcbf05XWOCWHR63LnanSEg=;
 b=MAMFzl5tbeEi6f9kE62OvptomJfKt6O1SVWJ1E1Q9QHuD5wQzZymkgWF
 sOmKkTgqcMugkF5aWM7OznFI4bTpVxBkFZJetPPb9IkL1x9TY4yL6AOCX
 8wF4GIi5wOsju+NYS+XSJN2RklY/yaXtemyyLzyMaq/DTY4XacBh+vi5Z
 E6m8aaqsLECzNpj1qZV/c0ETY90Nyr8FNai0E1vYlp3UC8bxrKAZerdlF
 iUZckKLQZZNdErq+JCxE3xyc6LIQXSKc98H3MDoaq/V9ZOQ6rvYjfpmWQ
 7MoNqAR4+EGsHRXdxlWIJaF8fsIJ8Jck+svfvb4Ul9FOsXH35Nq4Afl90 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="336267851"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="336267851"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 14:27:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="1002968489"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="1002968489"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 14:27:42 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Feb 2023 14:27:36 -0800
Message-Id: <20230227222736.351680-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Separate engine fuse handling into
 dedicated functions
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The single function to handle fuse registers for all types of engines is
becoming a bit long and hard to follow (and we haven't even added the
compute engines yet).  Let's split it into dedicated functions for each
engine class.

Compute engine fusing is still not implemented; there appears to be some
ambiguity in the bspec now, so we'll need to confirm the per-platform
behavior with the hardware team first.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index ae541b5e50f3..e1264ec9bf67 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -384,29 +384,29 @@ static void hw_engine_setup_logical_mapping(struct xe_gt *gt)
 	}
 }
 
-static void read_fuses(struct xe_gt *gt)
+static void read_media_fuses(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 media_fuse;
 	u16 vdbox_mask;
 	u16 vebox_mask;
-	u32 bcs_mask;
 	int i, j;
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
+	media_fuse = xe_mmio_read32(gt, GEN11_GT_VEBOX_VDBOX_DISABLE.reg);
+
 	/*
-	 * FIXME: Hack job, thinking we should have table of vfuncs for each
-	 * class which picks the correct vfunc based on IP version.
+	 * Pre-Xe_HP platforms had register bits representing absent engines,
+	 * whereas Xe_HP and beyond have bits representing present engines.
+	 * Invert the polarity on old platforms so that we can use common
+	 * handling below.
 	 */
-
-	media_fuse = xe_mmio_read32(gt, GEN11_GT_VEBOX_VDBOX_DISABLE.reg);
 	if (GRAPHICS_VERx100(xe) < 1250)
 		media_fuse = ~media_fuse;
 
-	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
-	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
-		      GEN11_GT_VEBOX_DISABLE_SHIFT;
+	vdbox_mask = REG_FIELD_GET(GEN11_GT_VDBOX_DISABLE_MASK, media_fuse);
+	vebox_mask = REG_FIELD_GET(GEN11_GT_VEBOX_DISABLE_MASK, media_fuse);
 
 	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
 		if (!(gt->info.engine_mask & BIT(i)))
@@ -427,11 +427,17 @@ static void read_fuses(struct xe_gt *gt)
 			drm_info(&xe->drm, "vecs%u fused off\n", j);
 		}
 	}
+}
+
+static void read_copy_fuses(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 bcs_mask;
 
 	bcs_mask = xe_mmio_read32(gt, GEN10_MIRROR_FUSE3.reg);
 	bcs_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK, bcs_mask);
 
-	for (i = XE_HW_ENGINE_BCS1, j = 0; i <= XE_HW_ENGINE_BCS8; ++i, ++j) {
+	for (int i = XE_HW_ENGINE_BCS1, j = 0; i <= XE_HW_ENGINE_BCS8; ++i, ++j) {
 		if (!(gt->info.engine_mask & BIT(i)))
 			continue;
 
@@ -441,14 +447,15 @@ static void read_fuses(struct xe_gt *gt)
 		}
 	}
 
-	/* TODO: compute engines */
 }
 
 int xe_hw_engines_init_early(struct xe_gt *gt)
 {
 	int i;
 
-	read_fuses(gt);
+	read_media_fuses(gt);
+	read_copy_fuses(gt);
+	/* TODO: compute engines */
 
 	for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
 		hw_engine_init_early(gt, &gt->hw_engines[i], i);
-- 
2.39.2

