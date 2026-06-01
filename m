Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10627CD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 16:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FE71135D5;
	Mon,  1 Jun 2026 16:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q83BVrBy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3271135D5
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780332219; x=1811868219;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zLjtL2aNUX3kBmRyz63JfplOwSXTdctiBx7yehh+/xc=;
 b=Q83BVrByEephMtLyRfA9DGzagoXlzgeW4G6880G3YSIkrXdRGXf/rYZm
 Ck0kO5wBP9tOOkmIxqsM3redzx7Tv0X0rjf0tmNc47a7dq8+xbrCtDiQ8
 9lC9gJWpCijaw4rpHuJQKDtTWv2wiCm9w9jp7fFQm0oswf+gHwp/To0n5
 B54zGmY+3aN0TAXAiq9NN58wloW/JngDzlKCBPvvuxAtAWM/gnugzgDEW
 VlPe+6Dr4BsCRgpsxsYjBbu4AkJO6fbMxSEIfaRw4mdfYEu0avQNkChg2
 +AQuGZb5iu93K+n2P3HQHpolc9C8L5pmxNU/ln9/cpXy0lRd2FQzfMCBQ Q==;
X-CSE-ConnectionGUID: twtSlBIYSI20TVNpRwQu9A==
X-CSE-MsgGUID: CZYzNNmWRsavFvj18g3Aug==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92209905"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="92209905"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 09:43:39 -0700
X-CSE-ConnectionGUID: yS3c9oYbRM6knMdv4/BEgg==
X-CSE-MsgGUID: QNG2WdgBTm6UDdjYtTA1zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="239212658"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa006.fm.intel.com with ESMTP; 01 Jun 2026 09:43:36 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 vinay.belgaumkar@intel.com, tejas.upadhyay@intel.com,
 balasubramani.vivekanandan@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Add wa_14025941587 for xe3 and xe3p platforms
Date: Mon,  1 Jun 2026 22:13:16 +0530
Message-ID: <20260601164316.2870984-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
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

Avoid IDLEDLY timer programming lessthan 5 micro secs.
Apply wa_14025941587 to Graphics Versions 30.00 to 35.11

v2: Use xe_rtp_match_not_sriov_vf, move to local variable
    Remove warn and other knits            - Matt R

v3: Add verbose comment - Tejas

v4: Restore IDLE_DLY register on engine reset.
    Add it to GUC save-restore list. -Vivek

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c  | 26 +++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +-
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index c98454545a85..2080e0e650eb 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -768,7 +768,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		}
 	}
 
-	if (XE_GT_WA(hwe->gt, 16023105232))
+	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
 		guc_mmio_regset_write_one(ads, regset_map,
 					  RING_IDLEDLY(hwe->mmio_base),
 					  count++);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 8c66ff6f3d3c..dd8eec098bdf 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -584,8 +584,12 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
 	u32 maxcnt_units_ns = 640;
 	bool inhibit_switch = 0;
+	bool wa_applied = false;
+
+	if ((!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) ||
+	    XE_GT_WA(gt, 14025941587)) {
+		u32 mincnt_idledly_ns = 5000;
 
-	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
 		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
 		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
 
@@ -595,8 +599,24 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
 		maxcnt *= maxcnt_units_ns;
 
-		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
-			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
+		/* Wa_14025941587: applied prior to Wa_16023105232,
+		 * as the latter has higher priority, although conflict
+		 * is not expected.
+		 */
+		if (XE_GT_WA(gt, 14025941587) &&
+		    idledly < mincnt_idledly_ns) {
+			idledly = mincnt_idledly_ns;
+			wa_applied = true;
+		}
+
+		if (XE_GT_WA(gt, 16023105232) &&
+		    (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch))) {
+			idledly = (maxcnt - 1);
+			wa_applied = true;
+		}
+
+		if (wa_applied) {
+			idledly = DIV_ROUND_CLOSEST((idledly * 1000),
 						    idledly_units_ps);
 			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
 		}
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index f8a185103b80..2d531b8a946f 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -62,6 +62,6 @@
 15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
 16026007364    MEDIA_VERSION(3000)
 14020316580    MEDIA_VERSION(1301)
-
 14025883347	MEDIA_VERSION_RANGE(1301, 3503)
 		GRAPHICS_VERSION_RANGE(2004, 3005)
+14025941587    GRAPHICS_VERSION_RANGE(3000, 3511), FUNC(xe_rtp_match_not_sriov_vf)
-- 
2.46.0

