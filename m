Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB52C624D8
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 08:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F395510F07E;
	Wed,  2 Sep 2026 08:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/LQUUmp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5665610F079;
 Wed,  2 Sep 2026 08:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788337082; x=1819873082;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qWMFvd4N6Rv1iQWC3PnZsscdfr0AuI3PlCPdCqWskhc=;
 b=D/LQUUmpXd6hVM8MvCAL9YXxxMKe72PLWjkh0Aonf4XRb7pzQFw8oclD
 fqJLXNvsQbeYtg75258pWXUYNVP6DYpKayoYZjHrPLL4EOwDUYM84cZqj
 mLoN/XW86fkacD528kDDbMBE8IWYB+Egkubf+96Xu0f8LSqUmm73gSjC1
 nK0Sqld9aq384lxNVOucrSNPDxkA4xqxQCOuCsoGZtRfuqCxfydjBdX1N
 hm4t5ZAh16lPsQpxQvs14lYVR3TG0KUhwDsphoopER9rnvBwaOsZNHo89
 QiCNeoOZ4EtJi73y1ViSgfnr/jhN3U5U7RsrFlh/2kSTTViPzOlQWK3JL w==;
X-CSE-ConnectionGUID: SKvcySwoSoefj17UFt0c1Q==
X-CSE-MsgGUID: Q5IT+YXvRxO88mfKwduPeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100299823"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="100299823"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:18:02 -0700
X-CSE-ConnectionGUID: dmvlzEEJTKeUT2cUxLbkOg==
X-CSE-MsgGUID: mUbsZYqXS/Sl+lFT5+6uCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="263193688"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa009.fm.intel.com with ESMTP; 02 Sep 2026 01:18:01 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [CI 9/9] drm/i915/color: Add YUV buffer support on HDR planes
Date: Wed,  2 Sep 2026 13:24:17 +0530
Message-ID: <20260902075417.656673-10-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260902075417.656673-1-chaitanya.kumar.borah@intel.com>
References: <20260902075417.656673-1-chaitanya.kumar.borah@intel.com>
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

Add the INTEL_PLANE_CB_CSC_FF (fixed function CSC) color block as the
first stage for the HDR planes. This enables YUV-to-RGB color space
conversion on HDR planes via the color pipeline.

Also in icl_program_input_csc(), account for the color pipeline
programming, in addition to FB format.

v2:
 - Increase MAX_COLOROP to 5 (Sashiko)

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color_pipeline.c | 4 +++-
 drivers/gpu/drm/i915/display/skl_universal_plane.c  | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index 38cfd6ed585d..7fc31fe891a8 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -12,7 +12,7 @@
 #include "skl_universal_plane.h"
 
 #define MAX_COLOR_PIPELINES 1
-#define MAX_COLOROP 4
+#define MAX_COLOROP 5
 #define PLANE_DEGAMMA_SIZE 128
 #define PLANE_GAMMA_SIZE 32
 
@@ -31,6 +31,7 @@ static const struct drm_colorop_funcs intel_colorop_funcs = {
  * the pipeline totally unusable.
  */
 static const enum intel_color_block xe3plpd_primary_plane_pipeline[] = {
+	INTEL_PLANE_CB_CSC_FF,
 	INTEL_PLANE_CB_PRE_CSC_LUT,
 	INTEL_PLANE_CB_CSC,
 	INTEL_PLANE_CB_3DLUT,
@@ -38,6 +39,7 @@ static const enum intel_color_block xe3plpd_primary_plane_pipeline[] = {
 };
 
 static const enum intel_color_block hdr_plane_pipeline[] = {
+	INTEL_PLANE_CB_CSC_FF,
 	INTEL_PLANE_CB_PRE_CSC_LUT,
 	INTEL_PLANE_CB_CSC,
 	INTEL_PLANE_CB_POST_CSC_LUT,
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 0f604bdb4c62..2e5bf02b480f 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1626,7 +1626,8 @@ icl_plane_update_noarm(struct intel_dsb *dsb,
 	intel_de_write_dsb(display, dsb, PLANE_COLOR_CTL(pipe, plane_id),
 			   plane_color_ctl);
 
-	if (fb->format->is_yuv && icl_is_hdr_plane(display, plane_id))
+	if (icl_is_hdr_plane(display, plane_id) &&
+	    (fb->format->is_yuv || plane_state->hw.csc_ff_enable))
 		icl_program_input_csc(dsb, plane, plane_state);
 
 	skl_write_plane_wm(dsb, plane, crtc_state);
-- 
2.50.1

