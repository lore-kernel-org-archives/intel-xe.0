Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBE0C3600E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 22:27:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A8C10E0B5;
	Wed, 26 Mar 2025 22:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EUKbtkQp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A9A10E0B5
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 22:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743028048; x=1774564048;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bMY5GM/Jxyi+zPHMJlwBhaSO3WMAQ5BaAcdn5b0hWas=;
 b=EUKbtkQp6tg5ssK1n4TuGZm0I1HHg2jysTAsZY5ICM8zZ8lmUBpNdYhC
 rkABrEApHUzUk2auPbMPL7g7jtkKqJBDUDn5zD+a7YOcd8Tq1/KnkiWDR
 JNoFIx5kTPT4L5642+rkkCpxkJn9iIqKIBT5j8NaQZhpyNtMT2HW3Gc0I
 rOS+Y+U7+hQQJ7Ssh5wHAw0mPOC9OjTGWlzfjYFHR1Jyevekn8VQDEBGA
 lqj7FQn5DZrOO+7c66B4BNf69yLVQJV5FcoyUvyjwvdbgt/B3ZdsNXqpF
 mGmS2MiWOCcuepHskg2vsvGX29wIH1y+C/ubp9rJJ44kXCzSlrKmY1sI5 w==;
X-CSE-ConnectionGUID: Og0H9fV+QtGZIVWzvnXhDA==
X-CSE-MsgGUID: hGspVoeYQJ+KBV6DCSjGag==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44232304"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="44232304"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 15:27:28 -0700
X-CSE-ConnectionGUID: hj9IiZD+QKWuVWO75ejL9Q==
X-CSE-MsgGUID: Vw+xgQjRSuGXWH8WhMLnDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="148128592"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 15:27:27 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Ensure fixed_slice_mode gets set after ccs_mode change
Date: Wed, 26 Mar 2025 15:27:20 -0700
Message-ID: <20250326222720.26913-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

The RCU_MODE_FIXED_SLICE_CCS_MODE setting is not getting invoked
in the gt reset path after the ccs_mode setting by the user.
Move it to xe_hw_engine_enable_ring() which ensures it gets set
in the gt reset path.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 8c05fd30b7df..d476e5c67bb1 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -333,6 +333,16 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 		xe_mmio_write32(&hwe->gt->mmio, RCU_MODE,
 				_MASKED_BIT_ENABLE(RCU_MODE_CCS_ENABLE));
 
+	/*
+	 * Xe3p no longer supports load balance mode, so "fixed cslice" mode
+	 * is automatic and no RCU_MODE programming is required.
+	 * Enable "fixed cslice" mode for Xe2 platforms.
+	 */
+	if (xe_gt_ccs_mode_enabled(hwe->gt) &&
+	    xe_rtp_match_first_render_or_compute(hwe->gt, hwe))
+		xe_mmio_write32(&hwe->gt->mmio, RCU_MODE,
+				_MASKED_BIT_ENABLE(RCU_MODE_FIXED_SLICE_CCS_MODE));
+
 	xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
 	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
 				  xe_bo_ggtt_addr(hwe->hwsp));
@@ -345,13 +355,6 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 	xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
 }
 
-static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
-						 const struct xe_hw_engine *hwe)
-{
-	return xe_gt_ccs_mode_enabled(gt) &&
-	       xe_rtp_match_first_render_or_compute(gt, hwe);
-}
-
 static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_gt *gt,
 				      const struct xe_hw_engine *hwe)
 {
@@ -389,12 +392,6 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 				 blit_cctl_val,
 				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
-		/* Use Fixed slice CCS mode */
-		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
-		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
-		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
-					   RCU_MODE_FIXED_SLICE_CCS_MODE))
-		},
 		/* Disable WMTP if HW doesn't support it */
 		{ XE_RTP_NAME("DISABLE_WMTP_ON_UNSUPPORTED_HW"),
 		  XE_RTP_RULES(FUNC(xe_rtp_cfeg_wmtp_disabled)),
-- 
2.43.0

