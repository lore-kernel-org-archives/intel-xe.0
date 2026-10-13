Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAA8CC6B19
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 20:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3B910EA23;
	Tue, 13 Oct 2026 20:47:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6591210EA23;
 Tue, 13 Oct 2026 20:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791924468; x=1823460468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qar7yEwcZD3XdejP1OAGriEvHQ4qQBpgXzzDIuuuMx8=;
 b=fjcbvoPUfx4IcxwsSByOhlqq15oTQeeAvWSKNf2SN4kAImFcmQ13QpyO
 fuLkH1t2PmHx2uisE8wGkm6OYwD8AlcmTrt16Bo1g0kMNz9jND6Lf+WyN
 yvIcymnwI1lCQH0l2AF0zZEdR8Ip3j5H/nNAIa0ub/Ctm8KAbKRgZlAln
 ZbeQmk0m1IqdmK/71aU/oD0IHBs7JmlBubo4bmNG2z/evviEZKVriE/AE
 J+KqfNpmgAYo0DlNXnl9NZQNN5vZRgeykVUNGys4nlNa9BmNCuagsc0mc
 +wj1caJYzbuaVPhTzsglsGs17PAWphEZvZNFa/tyt1298jjjZtQvHXwUl w==;
X-CSE-ConnectionGUID: J2rlGmtoRWapuA9aYhqXZg==
X-CSE-MsgGUID: vJWutRf5SWuNg9myxjLqIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="539289"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="539289"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 13:47:48 -0700
X-CSE-ConnectionGUID: ZAHRktPGQCeFkyqDjbmFGQ==
X-CSE-MsgGUID: pciJiZo6Q9ObxyP/KX3WUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1189034"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 13:47:47 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH v4 2/5] drm/i915/3dlut: disable 3D LUT for pre-GLK
Date: Tue, 13 Oct 2026 22:47:01 +0200
Message-ID: <20261013204705.1574475-3-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261013204705.1574475-1-michal.grzelak@linux.intel.com>
References: <20261013204705.1574475-1-michal.grzelak@linux.intel.com>
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

Add .has_3dlut field into display runtime info. Use the field to store
whether 3D LUT is enabled. Initialize the field to 1 on GLK+.

Add macro for checking 3D LUT's support. Use it while checking whether
CRTC has 3D LUT enabled.

v1->v2
- use either runtime info flag or display version check (Jani)
- don't initialize runtime info flag to 0 (Jani)

Bspec: 15585
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c          | 3 +++
 drivers/gpu/drm/i915/display/intel_display_device.c | 5 +++++
 drivers/gpu/drm/i915/display/intel_display_device.h | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index f1df0f9ba762..95de75e1de98 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4304,6 +4304,9 @@ intel_color_load_plane_luts(struct intel_dsb *dsb,
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

