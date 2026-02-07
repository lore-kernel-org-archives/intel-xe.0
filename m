Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698B2EE6B6C
	for <intel-xe@archiver.kernel.org>; Sat,  7 Feb 2026 00:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2169110E1BB;
	Sat,  7 Feb 2026 00:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcmTQRbn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D2A10E1BB
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Feb 2026 00:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770423280; x=1801959280;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j6Twjb+R5DypLXwfE5YioYtQJZcHMu/1fn+2t2ewJYk=;
 b=gcmTQRbnX1GkEYWX+0+KhFLMc3C+RrQ04MsG5pWMZNjyHO/XTapHLTcB
 aX2c9SbNjvSL21jSZbwiq9gSRslshJLSq/NAPa7Dh51MALmPzLUg33tYX
 FXQgKb5RfC2fs4f4IBodHfLC5x+ZHNhUPy/YVUGYREu50Yq66CRHZUNTM
 QUl9XeTUJ1JCIR4hc6MMEhibJA0P6a6vDaOc4r9T39IBzoJ08KkN4Sita
 lQMxJZ58lCxJdmVRa9ldMT85+qNO4wNOPVzhwbFGUKNpEQjZycvyMrtSo
 DwsFDAK85matzHOFeYGhdyumvVZutdp48gdCsOmTcB9D0OA9jWe/3+VhE Q==;
X-CSE-ConnectionGUID: kjZKsaQbS6SkE+Zks62VlA==
X-CSE-MsgGUID: j9pouGFnQQCKs7pQqKzsmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="59202685"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="59202685"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 16:14:39 -0800
X-CSE-ConnectionGUID: DM8J+C8ASQO+sBtEK9a40w==
X-CSE-MsgGUID: FpMUeafNQViC0lAljQCDpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="210807413"
Received: from chu13-desk.fm.intel.com ([10.80.209.210])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 16:14:39 -0800
From: Austin Hu <austin.hu@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/color: Add 3D LUT to color pipeline since Lunar
 Lake.
Date: Fri,  6 Feb 2026 16:12:49 -0800
Message-Id: <20260207001250.2448612-1-austin.hu@intel.com>
X-Mailer: git-send-email 2.34.1
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

Verified on PTL, where IGT case kms_color_pipeline passes for PipeA
and PipeB.

Signed-off-by: Austin Hu <austin.hu@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color_pipeline.c | 5 ++---
 drivers/gpu/drm/i915/display/intel_display_device.c | 6 ++++++
 drivers/gpu/drm/i915/display/intel_display_device.h | 2 ++
 drivers/gpu/drm/i915/display/intel_display_regs.h   | 1 +
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index 04af552b3..d26b0f134 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -47,9 +47,8 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
 	drm_colorop_set_next_property(prev_op, &colorop->base);
 	prev_op = &colorop->base;
 
-	if (DISPLAY_VER(display) >= 35 &&
-	    intel_color_crtc_has_3dlut(display, pipe) &&
-	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
+	if ((DISPLAY_VER(display) >= 15) && HAS_3D_LUT(display) &&
+			intel_color_crtc_has_3dlut(display, pipe)) {
 		colorop = intel_colorop_create(INTEL_PLANE_CB_3DLUT);
 
 		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, plane, 17,
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 1170afaa8..765fd08df 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -1903,6 +1903,12 @@ static void __intel_display_device_info_runtime_init(struct intel_display *displ
 				if (display_runtime->num_scalers[pipe])
 					display_runtime->num_scalers[pipe] = 1;
 		}
+
+		if (REG_FIELD_GET(XE2LPD_DE_CAP_3DLUT_MASK, cap) ==
+		    XE2LPD_DE_CAP_3DLUT_REMOVED)
+			display_runtime->has_3d_lut = false;
+		else
+			display_runtime->has_3d_lut = true;
 	}
 
 	if (DISPLAY_VER(display) >= 30)
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index b559ef43d..1dc24a86b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -171,6 +171,7 @@ struct intel_display_platforms {
 #define HAS_DSC(__display)		(DISPLAY_RUNTIME_INFO(__display)->has_dsc)
 #define HAS_DSC_3ENGINES(__display)	(DISPLAY_VERx100(__display) == 1401 && HAS_DSC(__display))
 #define HAS_DSC_MST(__display)		(DISPLAY_VER(__display) >= 12 && HAS_DSC(__display))
+#define HAS_3D_LUT(__display)		(DISPLAY_RUNTIME_INFO(__display)->has_3d_lut)
 #define HAS_FBC(__display)		(DISPLAY_RUNTIME_INFO(__display)->fbc_mask != 0)
 #define HAS_FBC_DIRTY_RECT(__display)	(DISPLAY_VER(__display) >= 30)
 #define HAS_FPGA_DBG_UNCLAIMED(__display)	(DISPLAY_INFO(__display)->has_fpga_dbg)
@@ -277,6 +278,7 @@ struct intel_display_runtime_info {
 	bool has_hdcp;
 	bool has_dmc;
 	bool has_dsc;
+	bool has_3d_lut;
 	bool edp_typec_support;
 	bool has_dbuf_overlap_detection;
 };
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 9d71e26a4..016bd2846 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -1538,6 +1538,7 @@
 
 #define XE2LPD_DE_CAP			_MMIO(0x41100)
 #define   XE2LPD_DE_CAP_3DLUT_MASK	REG_GENMASK(31, 30)
+#define   XE2LPD_DE_CAP_3DLUT_REMOVED	1
 #define   XE2LPD_DE_CAP_DSC_MASK	REG_GENMASK(29, 28)
 #define   XE2LPD_DE_CAP_DSC_REMOVED	1
 #define   XE2LPD_DE_CAP_SCALER_MASK	REG_GENMASK(27, 26)
-- 
2.34.1

