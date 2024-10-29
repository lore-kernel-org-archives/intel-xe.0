Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02658D3A692
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 19:33:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02D410E6F2;
	Tue, 29 Oct 2024 19:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDZgTAB+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502B310E6F1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 19:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730230402; x=1761766402;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0hEMNtEMhQneWRCMgOyo3MGK+wrgqGPTrCtEYWanKn8=;
 b=RDZgTAB+XdtsyBLOigOb7sJl7nNAtHd5Eh9zFNyistcVoGM287J/2/OM
 V87+zT5bmZhmNVD7d0zew7u39Iwmoac4gnz9w8cChrUxHv72F2sTSE2OV
 FYsTFc9mowdMR5bRKJB9cwZ6jhAx3OlqSmzQa253+dZHLeAS2nDAEzzlo
 vk/lIwBQesrz+rjOl1jGRt4K+5nh9blAOf8gUMgXQQX0qWBHTUhlGxiO5
 WWCeJ3XQpkERWva/MPX6wsnWU4y/jLbS3m7mtcxhEGnuxPzejeCLuUWFQ
 sbsmd+dqjEG5hnjouFIEZPLXo5ukXjD2Hy1xxVd8OhhMuOKU+WYFqOleL A==;
X-CSE-ConnectionGUID: 0aqZ/HUEQnKqNofAKHVujw==
X-CSE-MsgGUID: o0fvdDzMRF+3LULnbw93qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="41262048"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="41262048"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 12:33:22 -0700
X-CSE-ConnectionGUID: 2X+L1vbqRFGy0jK6FSkXxg==
X-CSE-MsgGUID: oZLDz89GQnS7wlxifRkDWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="112872091"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 12:33:22 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Move Wa 1607983814 to oob
Date: Tue, 29 Oct 2024 12:32:58 -0700
Message-ID: <20241029193258.749882-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

needs_wa_1607983814() predates wa_oob, so it was not being printed
in /sys/kernel/debug/dri/0/*/workarounds. Port it to OOB rules.
This makes the WA show up in debugfs. For TGL:

	OOB Workarounds
		22012773006
		1409600907
		1607983814

Eventually the RTP infra may add support for writing registers in a
loop, which would allow to keep track of the registers as well. But for
now, just listing it as OOB workaround is already an improvement.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c    | 11 ++---------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index a196c4fb90fc9..00945caf49ff4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -232,11 +232,6 @@ static size_t guc_ads_size(struct xe_guc_ads *ads)
 		guc_ads_private_data_size(ads);
 }
 
-static bool needs_wa_1607983814(struct xe_device *xe)
-{
-	return GRAPHICS_VERx100(xe) < 1250;
-}
-
 static size_t calculate_regset_size(struct xe_gt *gt)
 {
 	struct xe_reg_sr_entry *sr_entry;
@@ -251,7 +246,7 @@ static size_t calculate_regset_size(struct xe_gt *gt)
 
 	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
 
-	if (needs_wa_1607983814(gt_to_xe(gt)))
+	if (XE_WA(gt, 1607983814))
 		count += LNCFCMOCS_REG_COUNT;
 
 	return count * sizeof(struct guc_mmio_reg);
@@ -710,7 +705,6 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 					  struct iosys_map *regset_map,
 					  struct xe_hw_engine *hwe)
 {
-	struct xe_device *xe = ads_to_xe(ads);
 	struct xe_hw_engine *hwe_rcs_reset_domain =
 		xe_gt_any_hw_engine_by_reset_domain(hwe->gt, XE_ENGINE_CLASS_RENDER);
 	struct xe_reg_sr_entry *entry;
@@ -746,8 +740,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
 					  count++);
 
-	/* Wa_1607983814 */
-	if (needs_wa_1607983814(xe) && hwe->class == XE_ENGINE_CLASS_RENDER) {
+	if (XE_WA(hwe->gt, 1607983814) && hwe->class == XE_ENGINE_CLASS_RENDER) {
 		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
 			guc_mmio_regset_write_one(ads, regset_map,
 						  XELP_LNCFCMOCS(i), count++);
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index bcd04464b85e8..d4ddfcdbe9370 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -41,3 +41,4 @@
 no_media_l3	MEDIA_VERSION(3000)
 14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
+1607983814	GRAPHICS_VERSION_RANGE(1200, 1210)
-- 
2.47.0

