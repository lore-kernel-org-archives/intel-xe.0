Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812D7C64EC4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 00:55:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382DB10E165;
	Thu,  9 Mar 2023 00:55:42 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A292410E161
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 00:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678323340; x=1709859340;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DIwKDln6UpUea3+8AP3YS4EUqHegKKXHgT6IDY2/xKQ=;
 b=YEfvW6cQO+5sHbxMahr6/FJuJrxf2tG32KEP759zpjmZG0aPgHlisowX
 YANYUoclXsd77REaByEnIkJG42Be+ynD0tMjFfDgBiDFLn5depKU/D7lT
 DZ6k9Sm5qGU5e8BR27wYbtIPUGqf6VI0B0azzA6/eM1cPg+8YcMVPI6S0
 b0LEXUJInjHovRz8tM7Q/aEgC0GXWm7+51wGgutagtYfiKdTwIBMjHyY7
 l5lT9YPDM+iDus/E0JG/7vsVlf9qBYJw6f1eWbMDbJRe5AP683gvYcbsW
 SHgVbWkQflEBe/jmp9I3GumjMgWc/HpQbdLPsNqht0Dq664qh1a+0naVV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="315977852"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="315977852"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 16:55:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="851325637"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="851325637"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 16:55:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  8 Mar 2023 16:55:29 -0800
Message-Id: <20230309005530.3140173-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Separate engine fuse handling
 into dedicated functions
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The single function to handle fuse registers for all types of engines is
becoming a bit long and hard to follow (and we haven't even added the
compute engines yet).  Let's split it into dedicated functions for each
engine class.

v2:
 - Add note about BCS0 always being present.  (Bala)
 - Add forcewake assertion to read_copy_fuses.  (Bala)

Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 37 +++++++++++++++++++------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b035e2fa6744..abfd35491b47 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -369,29 +369,29 @@ static void hw_engine_setup_logical_mapping(struct xe_gt *gt)
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
@@ -412,28 +412,37 @@ static void read_fuses(struct xe_gt *gt)
 			drm_info(&xe->drm, "vecs%u fused off\n", j);
 		}
 	}
+}
+
+static void read_copy_fuses(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 bcs_mask;
+
+	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
 	bcs_mask = xe_mmio_read32(gt, GEN10_MIRROR_FUSE3.reg);
 	bcs_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK, bcs_mask);
 
-	for (i = XE_HW_ENGINE_BCS1, j = 0; i <= XE_HW_ENGINE_BCS8; ++i, ++j) {
+	/* BCS0 is always present; only BCS1-BCS8 may be fused off */
+	for (int i = XE_HW_ENGINE_BCS1, j = 0; i <= XE_HW_ENGINE_BCS8; ++i, ++j) {
 		if (!(gt->info.engine_mask & BIT(i)))
 			continue;
 
-		if (!(BIT(j/2) & bcs_mask)) {
+		if (!(BIT(j / 2) & bcs_mask)) {
 			gt->info.engine_mask &= ~BIT(i);
 			drm_info(&xe->drm, "bcs%u fused off\n", j);
 		}
 	}
-
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

