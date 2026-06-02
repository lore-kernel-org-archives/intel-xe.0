Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03F9C5DF71
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 04:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422D010EB9A;
	Tue,  2 Jun 2026 04:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qe39/xOV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D9210EB9A
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jun 2026 04:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780374774; x=1811910774;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GYNAbn9CaYfuwUmHbc2+/5ofPATQTextpE/Bo189ZA8=;
 b=Qe39/xOVQVMY+OJ63eTDSHBgQ5NZsPfLpZrCnuoJu1WvULT8+B8eX5IQ
 sDEkJbcy9UL7+gKWFHn9elnjIfCtvijVjUevOb4xHkSSNeYVcKiQKsR6q
 0mkvZAX9KbeNvlzYqaxaXoKJAQW+pxtjqh1Emq3CID3NkgDKI3IwEwGo6
 X5K+qzj0EkRmA9yP4BBMlY3YN3sQiyKXeZueZWhOxRn3qXKLl0QzDZIrs
 gHtV9T5vQwYwcWpti/xp8KFhMyehmr0zdATY83Glt3vxO+jTpIfQUOWGr
 wPNpETwjgCla4wBSlYF4/p/sygCfAMN/c7hcXfyqIF9A5uNlKvOgVeLfJ w==;
X-CSE-ConnectionGUID: 2FMwFWZ/TSOybFrqgXVz7A==
X-CSE-MsgGUID: ZfU6onR6QV+LSDzJsBq55A==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="103815325"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="103815325"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 21:32:53 -0700
X-CSE-ConnectionGUID: 6YRiAnseTb+cSqnmwqP+xA==
X-CSE-MsgGUID: KIvxc0vgQ1yjHZx85LwYcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="274054929"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa002.jf.intel.com with ESMTP; 01 Jun 2026 21:32:52 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 vinay.belgaumkar@intel.com, tejas.upadhyay@intel.com,
 balasubramani.vivekanandan@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
Date: Tue,  2 Jun 2026 10:02:31 +0530
Message-ID: <20260602043231.3119355-1-tilak.tirumalesh.tangudu@intel.com>
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
Apply wa_14025941587 to Graphics Versions 20.01 to 35.11
and Media Versions 13.01 to 35.03

v2: Use xe_rtp_match_not_sriov_vf, move to local variable
    Remove warn and other knits            - Matt R

v3: Add verbose comment - Tejas

v4: Restore IDLE_DLY register on engine reset.
    Add it to GUC save-restore list. -Vivek

v5: Extend WA to Media Versions 13.01 to 35.03 - Vinay

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c  | 26 +++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 ++
 3 files changed, 26 insertions(+), 4 deletions(-)

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
index f8a185103b80..5d5041168fa8 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -65,3 +65,5 @@
 
 14025883347	MEDIA_VERSION_RANGE(1301, 3503)
 		GRAPHICS_VERSION_RANGE(2004, 3005)
+14025941587    GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
+	       MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
-- 
2.46.0

