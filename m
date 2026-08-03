Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF783C55182
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 21:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFEC10E2CC;
	Mon,  3 Aug 2026 21:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bj7CstSP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A4610E095;
 Mon,  3 Aug 2026 21:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785793831; x=1817329831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HzaK7DOSVqzZw61WFb5Hq6mDpi5YizHNaf+HgYvriZ4=;
 b=bj7CstSPsQczcVpmJJ5mmwX35v3vkm9/jKFRWA48lAY8XBJhVlm/Veff
 7mgsNQsiVtVsx0bH9sk11GfFnx1Xm4l+fxB0u+2YV6r8ZMouMejy7Jazh
 9T376kkHRX+AppCRWSyIuZ0OUtC+17wVTxx2b0CCEkHlVArs7t6zgVIJC
 4mHzn5FSLoMkj78aWfJWOxAsZ0pobUozD1jEPZdggsWUNYUwn9p5GYr53
 jlzZuERCwy2tewHIXp0mYs1PbZre99dc9iVRPXeZWBOge0cuNmJaxpTb0
 oAxinvI2xaMDhIW8e97Si7lRhsflWpH9LmbtQUumOItFfv/Ma+iPKS5Zh A==;
X-CSE-ConnectionGUID: n6gb9IaCQpe5Bq3/Mz9Jiw==
X-CSE-MsgGUID: gjgsY+GDTbKLtrFI+M48fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97849145"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="97849145"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 14:50:31 -0700
X-CSE-ConnectionGUID: EwuJoKOhRaSBFDf84GMkbA==
X-CSE-MsgGUID: nNMjd0dpSrOuClCD3y7KAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="291272078"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 03 Aug 2026 14:50:29 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH v2 2/4] drm/i915/3dlut: disable 3D LUT for pre-GLK
Date: Mon,  3 Aug 2026 23:49:07 +0200
Message-ID: <20260803214909.3076716-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260803214909.3076716-1-michal.grzelak@intel.com>
References: <20260803214909.3076716-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

GLK+ hardware supports 3D LUT. Disable the feature for pre-GLK
platforms.

Add .has_3dlut field into struct intel_display_runtime_info. Use the
field to store whether 3D LUT is enabled. Initialize the field to 1 on
GLK+.

Add macro for checking 3D LUT's support. Use it while checking whether
CRTC has 3D LUT enabled.

v1->v2
- use either runtime info flag or display version check (Jani)
- don't initialize runtime info flag to 0 (Jani)

Bspec: 15585
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: <stable@vger.kernel.org>
Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c          | 3 +++
 drivers/gpu/drm/i915/display/intel_display_device.c | 5 +++++
 drivers/gpu/drm/i915/display/intel_display_device.h | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 87ced9f6ff40..ffdefb51a264 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4258,6 +4258,9 @@ intel_color_load_plane_luts(struct intel_dsb *dsb,
 bool
 intel_color_crtc_has_3dlut(struct intel_display *display, enum pipe pipe)
 {
+	if (!HAS_3DLUT(display))
+		return false;
+
 	if (DISPLAY_VER(display) >= 12)
 		return pipe == PIPE_A || pipe == PIPE_B;
 	else
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index f17fc2c68472..4c09f35644ba 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -864,6 +864,7 @@ static const struct platform_desc glk_desc = {
 		GLK_COLORS,
 
 		.__runtime_defaults.ip.ver = 10,
+		.__runtime_defaults.has_3dlut = 1,
 	},
 	STEP_INFO(glk_steppings),
 };
@@ -899,6 +900,7 @@ static const struct platform_desc glk_desc = {
 	ICL_COLORS, \
 	\
 	.__runtime_defaults.ip.ver = 11, \
+	.__runtime_defaults.has_3dlut = 1, \
 	.__runtime_defaults.has_dmc = 1, \
 	.__runtime_defaults.has_dsc = 1, \
 	.__runtime_defaults.has_hdcp = 1, \
@@ -990,6 +992,7 @@ static const struct platform_desc ehl_desc = {
 	ICL_COLORS, \
 	\
 	.__runtime_defaults.ip.ver = 12, \
+	.__runtime_defaults.has_3dlut = 1, \
 	.__runtime_defaults.has_dmc = 1, \
 	.__runtime_defaults.has_dsc = 1, \
 	.__runtime_defaults.has_hdcp = 1, \
@@ -1156,6 +1159,7 @@ static const struct platform_desc adl_s_desc = {
 	TGL_CURSOR_OFFSETS,							\
 										\
 	.__runtime_defaults.ip.ver = 13,					\
+	.__runtime_defaults.has_3dlut = 1,					\
 	.__runtime_defaults.has_dmc = 1,					\
 	.__runtime_defaults.has_dsc = 1,					\
 	.__runtime_defaults.fbc_mask = BIT(INTEL_FBC_A),			\
@@ -1335,6 +1339,7 @@ static const struct platform_desc dg2_desc = {
 		BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |				\
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D),				\
 	.__runtime_defaults.fbc_mask = BIT(INTEL_FBC_A) | BIT(INTEL_FBC_B),	\
+	.__runtime_defaults.has_3dlut = 1,					\
 	.__runtime_defaults.has_dmc = 1,					\
 	.__runtime_defaults.has_dsc = 1,					\
 	.__runtime_defaults.has_hdcp = 1,					\
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 7121e7cd9512..5300c6ab99e7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -147,6 +147,7 @@ struct intel_display_platforms {
 
 #define HAS_128B_Y_TILING(__display)	(!(__display)->platform.i915g && !(__display)->platform.i915gm)
 #define HAS_2PPC(__display)		(DISPLAY_VER(__display) >= 10)
+#define HAS_3DLUT(__display)		(DISPLAY_RUNTIME_INFO(__display)->has_3dlut)
 #define HAS_4TILE(__display)		((__display)->platform.dg2 || DISPLAY_VER(__display) >= 14)
 #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >= 5)
 #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >= 13)
@@ -304,6 +305,7 @@ struct intel_display_runtime_info {
 
 	u8 fbc_mask;
 
+	bool has_3dlut;
 	bool has_hdcp;
 	bool has_dmc;
 	bool has_dsc;
-- 
2.45.2

