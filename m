Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EBCC5321C
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jul 2026 22:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D75810E746;
	Mon, 27 Jul 2026 22:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqBb1aki";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BAF10E4E2;
 Mon, 27 Jul 2026 22:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785190931; x=1816726931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LxMY7LFUnMVQ/nr+gTLq8Pwmd9tIFEapGda9MYP1U1k=;
 b=XqBb1aki2Sdm/uPGa2Al/e/+ZC5Kg512ttW+c8nM1UobpAqJWO3+OrNm
 ZMWapx5I8T+axxkTRI3woyJdvApwkd65w1Zv+QG6ukLR3f38uI5vcCie4
 pOOegyOLnJ2KWhoPusU3KVOFZGrAxwaCw7ykjadMJJHnip7BAXN32Pg+l
 7kfS7XvgmNJm6C2vdSocD6VQfDzLSS/y1OzPrwDHMBHwSqMnBFy2AUqHg
 TINevoCUPUsnFFcoWC0sqx/GSuZbo3Qahby2Q2GYJ1moYuPwmsaMn2Ayg
 oidq/kFFzRDxM78PfpHFsVl0CgoGhSSJHyKP0xE5mFj52W1MGdL5CbBLM A==;
X-CSE-ConnectionGUID: E+QrbpHyRmGtZ1h/4Oiv8w==
X-CSE-MsgGUID: yyScWATmQFigMY1pBbO6Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85781810"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="85781810"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 15:22:11 -0700
X-CSE-ConnectionGUID: B7KTGTF2RxiZIREVfLTs9Q==
X-CSE-MsgGUID: WUvBjukkSKKh0JPbprQmFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="256167321"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa007.fm.intel.com with ESMTP; 27 Jul 2026 15:22:09 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Chaitanya Borah Kumar <chaitanya.borah.kumar@intel.com>
Subject: [PATCH v1 2/2] drm/i915/xe2lpd+: disable 3D LUT if unsupported
Date: Tue, 28 Jul 2026 00:21:25 +0200
Message-ID: <20260727222125.2459634-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260727222125.2459634-1-michal.grzelak@intel.com>
References: <20260727222125.2459634-1-michal.grzelak@intel.com>
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

XE2LPD_DE_CAP_3DLUT_MASK is defined but never used. Check with it if
3DLUT is enabled.

Check DE_CAP register if 3D LUT is disabled. Store the info in a new
field of struct intel_display_runtime_info.

Add macros for checking both 3D LUT hardware and 3D LUT capability.

Initialize has_3dlut to 1 on each platform since LNL.

Log value of has_3dlut in intel_display_device_info_print().

Bspec: 71161
Cc: Chaitanya Borah Kumar <chaitanya.borah.kumar@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c          | 3 +++
 drivers/gpu/drm/i915/display/intel_display_device.c | 8 ++++++++
 drivers/gpu/drm/i915/display/intel_display_device.h | 4 ++++
 drivers/gpu/drm/i915/display/intel_display_regs.h   | 1 +
 4 files changed, 16 insertions(+)

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
index f17fc2c68472..45c791531f85 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -1335,6 +1335,7 @@ static const struct platform_desc dg2_desc = {
 		BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |				\
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D),				\
 	.__runtime_defaults.fbc_mask = BIT(INTEL_FBC_A) | BIT(INTEL_FBC_B),	\
+	.__runtime_defaults.has_3dlut = 1,					\
 	.__runtime_defaults.has_dmc = 1,					\
 	.__runtime_defaults.has_dsc = 1,					\
 	.__runtime_defaults.has_hdcp = 1,					\
@@ -1345,6 +1346,7 @@ static const struct platform_desc dg2_desc = {
 
 static const struct intel_display_device_info xe_lpdp_display = {
 	XE_LPDP_FEATURES,
+	.__runtime_defaults.has_3dlut = 0,
 };
 
 static const struct intel_display_device_info xe2_lpd_display = {
@@ -1385,6 +1387,7 @@ static const struct intel_display_device_info xe2_hpd_display = {
 	XE_LPDP_FEATURES,
 	.__runtime_defaults.port_mask = BIT(PORT_A) |
 		BIT(PORT_TC1) | BIT(PORT_TC2) | BIT(PORT_TC3) | BIT(PORT_TC4),
+	.__runtime_defaults.has_3dlut = 0,
 };
 
 static const u16 mtl_u_ids[] = {
@@ -1935,6 +1938,10 @@ static void __intel_display_device_info_runtime_init(struct intel_display *displ
 	if (DISPLAY_VER(display) >= 20) {
 		u32 cap = intel_de_read(display, XE2LPD_DE_CAP);
 
+		if (REG_FIELD_GET(XE2LPD_DE_CAP_3DLUT_MASK, cap) ==
+		    XE2LPD_DE_CAP_3DLUT_REMOVED)
+			display_runtime->has_3dlut = 0;
+
 		if (REG_FIELD_GET(XE2LPD_DE_CAP_DSC_MASK, cap) ==
 		    XE2LPD_DE_CAP_DSC_REMOVED)
 			display_runtime->has_dsc = 0;
@@ -1996,6 +2003,7 @@ void intel_display_device_info_print(const struct intel_display_device_info *inf
 	DEV_INFO_DISPLAY_FOR_EACH_FLAG(PRINT_FLAG);
 #undef PRINT_FLAG
 
+	drm_printf(p, "has_3dlut: %s\n", str_yes_no(runtime->has_3dlut));
 	drm_printf(p, "has_hdcp: %s\n", str_yes_no(runtime->has_hdcp));
 	drm_printf(p, "has_dmc: %s\n", str_yes_no(runtime->has_dmc));
 	drm_printf(p, "has_dsc: %s\n", str_yes_no(runtime->has_dsc));
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 7121e7cd9512..34ee7993be33 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -147,6 +147,9 @@ struct intel_display_platforms {
 
 #define HAS_128B_Y_TILING(__display)	(!(__display)->platform.i915g && !(__display)->platform.i915gm)
 #define HAS_2PPC(__display)		(DISPLAY_VER(__display) >= 10)
+#define HAS_3DLUT_HW(__display)		(DISPLAY_VER(__display) >= 10)
+#define HAS_3DLUT_CAP(__display)	(IS_DISPLAY_VER(__display, 10, 20) || DISPLAY_RUNTIME_INFO(__display)->has_3dlut)
+#define HAS_3DLUT(__display)		(HAS_3DLUT_HW(__display) && HAS_3DLUT_CAP(__display))
 #define HAS_4TILE(__display)		((__display)->platform.dg2 || DISPLAY_VER(__display) >= 14)
 #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >= 5)
 #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >= 13)
@@ -304,6 +307,7 @@ struct intel_display_runtime_info {
 
 	u8 fbc_mask;
 
+	bool has_3dlut;
 	bool has_hdcp;
 	bool has_dmc;
 	bool has_dsc;
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 0677ca2dde00..7b2332e2fae2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -1773,6 +1773,7 @@
 
 #define XE2LPD_DE_CAP			_MMIO(0x41100)
 #define   XE2LPD_DE_CAP_3DLUT_MASK	REG_GENMASK(31, 30)
+#define   XE2LPD_DE_CAP_3DLUT_REMOVED	1
 #define   XE2LPD_DE_CAP_DSC_MASK	REG_GENMASK(29, 28)
 #define   XE2LPD_DE_CAP_DSC_REMOVED	1
 #define   XE2LPD_DE_CAP_SCALER_MASK	REG_GENMASK(27, 26)
-- 
2.45.2

