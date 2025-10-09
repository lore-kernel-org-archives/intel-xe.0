Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2602CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 18:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EF810EAE0;
	Thu,  9 Oct 2025 18:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aG6Owf0E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C8910EAE0
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 18:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760035485; x=1791571485;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vVg5KHZa6fZngM1+t1onm7K0rn5+6WpeKh84B3/DKvg=;
 b=aG6Owf0EK2UFP2Khj/W6qeghIJBf3SyyPCLg7U9FxhgFVuF30YL8NzhN
 Qfo1UhWWb5nigAysncahInaT3eFS6svR4kzVTL5QqelYzInyNyeqv/15I
 hSTovhG0qE8qH5b/Ogqc7l1gK63MDzVV6kIXjJSMdBbFEq3RKjtsEHANc
 D1wqSvtJzhkVTA79yt2bhfwfbmsDVhcXndoAljfUo8fN41Aom0QttQKy2
 iS3hJSYQTMJEwoR7ErFB5kFrurbd9F77fmziiNcIqzYbMPw0XnC8TDUVJ
 0QD3u6Z2pA6WOy2SPXe0P2WdCECybiCp2jDAjLT4PiXW2SZ/9VJM0+Ume A==;
X-CSE-ConnectionGUID: syorb2NeQ5y7Dq9FcnBj5w==
X-CSE-MsgGUID: FQKFL61cStuj824WLa8lbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73359445"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="73359445"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 11:44:45 -0700
X-CSE-ConnectionGUID: erVU4fLhTFaRBIrpo57Qqw==
X-CSE-MsgGUID: b1L9vu8sQySdWJQ78/SZCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="185034816"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by orviesa004.jf.intel.com with ESMTP; 09 Oct 2025 11:44:44 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3] drm/xe: Enable media sampler power gating
Date: Thu,  9 Oct 2025 11:42:35 -0700
Message-Id: <20251009184235.1929975-1-vinay.belgaumkar@intel.com>
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

Where applicable, enable media sampler power gating. Also, add
it to the powergate_info debugfs.

v2: Remove the sampler powergate status since it is cleared quickly anyway.
v3: Use vcs mask (Rodrigo) and fix the version check for media

Fixes: 38e8c4184ea0 ("drm/xe: Enable Coarse Power Gating")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_gt_idle.c      | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 06cb6b02ec64..51f2a03847f9 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -342,6 +342,7 @@
 #define POWERGATE_ENABLE			XE_REG(0xa210)
 #define   RENDER_POWERGATE_ENABLE		REG_BIT(0)
 #define   MEDIA_POWERGATE_ENABLE		REG_BIT(1)
+#define   MEDIA_SAMPLERS_POWERGATE_ENABLE	REG_BIT(2)
 #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
 #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index f8950a52d0a4..0a112b8943b9 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -118,12 +118,16 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
 	vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
 
-	if (vcs_mask || vecs_mask)
+	if (vcs_mask || vecs_mask) {
 		gtidle->powergate_enable = MEDIA_POWERGATE_ENABLE;
+		if (MEDIA_VERx100(xe) >= 1100 && MEDIA_VERx100(xe) < 1270)
+			gtidle->powergate_enable |= MEDIA_SAMPLERS_POWERGATE_ENABLE;
+	}
 
 	if (xe_gt_is_main_type(gt))
 		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
 
+
 	if (xe->info.platform != XE_DG1) {
 		for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
 			if ((gt->info.engine_mask & BIT(i)))
@@ -245,7 +249,12 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 			if (gt->info.engine_mask & media_slices[n].engines)
 				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
 					   str_up_down(pg_status & media_slices[n].status_bit));
+
+		if (MEDIA_VERx100(xe) >= 1100 && MEDIA_VERx100(xe) < 1270)
+			drm_printf(p, "Media Samplers Power Gating Enabled: %s\n",
+				   str_yes_no(pg_enabled & MEDIA_SAMPLERS_POWERGATE_ENABLE));
 	}
+
 	return 0;
 }
 
-- 
2.38.1

