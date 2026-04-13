Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4567EE93814
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 04:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E925A10E307;
	Mon, 13 Apr 2026 04:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lqwcjlch";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B612310E310;
 Mon, 13 Apr 2026 04:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776053346; x=1807589346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KZagNRKlYvYUDq9AjrEP2JGoHUlfRi8r+TbxjJz5aZ0=;
 b=Lqwcjlchp1XQy6DgHrlCNvEg62uf/Y0+qLBlJTerlUaJnX+xIJQ3LL/N
 S68WjQ++O9re57z9i4+px6nRYL9WeU7Mz7Ru5WdNOhRqvamy2o0vrIE8K
 6FcyA+13ppZpn3Xf24z1ZhQYj7C4qMUJTTLxa+2GO50UFNeWPfhhP46Tt
 g16OoTig22y6uAiICvqmEUvUKVAjbiCypQ3yc7EtkkHFpjpYgqmpckMLy
 FfGKfi8uiW27sqDpCTsYz5VHQH6SLN2XV1xt+HvtMwYvsDe+FdYtybJF8
 aujUg1eTR+iJ+zCMviHod7vTUwgo3i3jMwG96bOxBHUPWjYX/F146TgQo Q==;
X-CSE-ConnectionGUID: sJ5DanuOSxmr1KjvsDV1qw==
X-CSE-MsgGUID: JwKqUUIzSsCa5rxaJ8i8Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="80568792"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="80568792"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:09:06 -0700
X-CSE-ConnectionGUID: hrbrnGGcTHOEoNZInMfVkw==
X-CSE-MsgGUID: kYNU14CeSv+IycRpNNycAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="229546649"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:09:04 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 11/12] drm/i915/dp: Enable Common SDP Transmission line
Date: Mon, 13 Apr 2026 09:23:48 +0530
Message-ID: <20260413035349.1730312-12-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260413035349.1730312-1-ankit.k.nautiyal@intel.com>
References: <20260413035349.1730312-1-ankit.k.nautiyal@intel.com>
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

Enable programming of the common SDP transmission line on platforms that
support it. Compute and program the common base transmission line and
per-SDP stagger values from the crtc state during modeset, and disable the
feature on pipe disable.

Currently, the stagger values are set as per the default policy of the
Hardware. This can be optimized later if we come up with a specific driver
policy to sequence the SDPs better.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c |  3 +
 drivers/gpu/drm/i915/display/intel_dp.c  | 88 ++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 344eef812e6b..b47a85932fc1 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2726,6 +2726,8 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	/* 6.o Configure and enable FEC if needed */
 	intel_ddi_enable_fec(encoder, crtc_state);
 
+	intel_dp_cmn_sdp_transmission_line_enable(crtc_state);
+
 	/* 7.a 128b/132b SST. */
 	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
 		/* VCPID 1, start slot 0 for 128b/132b, tu slots */
@@ -3113,6 +3115,7 @@ static void intel_ddi_buf_disable(struct intel_encoder *encoder,
 			     DP_TP_CTL_ENABLE, 0);
 	}
 
+	intel_dp_cmn_sdp_transmission_line_disable(crtc_state);
 	intel_ddi_disable_fec(encoder, crtc_state);
 
 	if (DISPLAY_VER(display) < 14)
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b1168c147bc7..830e2a439deb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7317,6 +7317,57 @@ void intel_dp_mst_resume(struct intel_display *display)
 	}
 }
 
+static int intel_dp_sdp_stagger_to_tl(struct intel_crtc_state *crtc_state,
+				      int stagger)
+{
+	return crtc_state->dp_sdp_tl.cmn + stagger;
+}
+
+static
+void intel_dp_cmn_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	bool as_sdp;
+
+	if (!HAS_CMN_SDP_TL(display))
+		return;
+
+	as_sdp = crtc_state->infoframes.enable &
+		 intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);
+	/*
+	 * When AS SDP is enabled :
+	 *  - The common SDP Transmission Line matches the EMP SDP Transmission Line.
+	 *
+	 * When AS SDP is disabled:
+	 *  - Bspec mentions the positions as lines of delayed vblank.
+	 *  - Guardband = 1st line of delayed vblank
+	 *  - Common SDP Transmission line is set to 2nd line of delayed vblank.
+	 */
+
+	if (as_sdp)
+		crtc_state->dp_sdp_tl.cmn = crtc_state->dp_sdp_tl.as;
+	else
+		crtc_state->dp_sdp_tl.cmn = crtc_state->vrr.guardband - 1;
+
+	/*
+	 * Currently we are programming the default stagger values, but these
+	 * can be optimized if required, based on number of SDPs enabled.
+	 *
+	 * Default values of the Transmission lines for SDPs other than AS SDP:
+	 * VSC : CMN SDP Transmission line
+	 * GMP : CMN SDP Transmission line
+	 * PPS : CMN SDP Transmission line + 1
+	 * VSC_EXT: CMN SDP Transmission line + 2
+	 */
+	crtc_state->dp_sdp_tl.vsc = crtc_state->dp_sdp_tl.cmn;
+	crtc_state->dp_sdp_tl.gmp =
+		intel_dp_sdp_stagger_to_tl(crtc_state, GMP_STAGGER_DEFAULT);
+	crtc_state->dp_sdp_tl.pps =
+		intel_dp_sdp_stagger_to_tl(crtc_state, PPS_STAGGER_DEFAULT);
+	crtc_state->dp_sdp_tl.vsc_ext =
+		intel_dp_sdp_stagger_to_tl(crtc_state, VSC_EXT_STAGGER_DEFAULT);
+}
+
 static
 int intel_dp_sdp_compute_as_tl(const struct intel_crtc_state *crtc_state)
 {
@@ -7343,6 +7394,7 @@ static
 void intel_dp_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state)
 {
 	crtc_state->dp_sdp_tl.as = intel_dp_sdp_compute_as_tl(crtc_state);
+	intel_dp_cmn_sdp_tl_compute_config_late(crtc_state);
 }
 
 static
@@ -7457,9 +7509,45 @@ static int intel_dp_sdp_tl_to_stagger(const struct intel_crtc_state *crtc_state,
 	return sdp_tl - crtc_state->dp_sdp_tl.cmn;
 }
 
+static
+void intel_dp_cmn_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	u16 vsc_ext_stagger, pps_stagger, gmp_stagger;
+	u32 val;
+
+	if (!HAS_CMN_SDP_TL(display))
+		return;
+
+	val = intel_de_read(display, CMN_SDP_TL(display, cpu_transcoder));
+
+	if (!(val & TRANSMISSION_LINE_ENABLE))
+		return;
+
+	crtc_state->dp_sdp_tl.cmn = REG_FIELD_GET(BASE_TRANSMISSION_LINE_MASK, val);
+
+	/* SDP VSC uses same transmission line as CMN base transmission line */
+	crtc_state->dp_sdp_tl.vsc = crtc_state->dp_sdp_tl.cmn;
+
+	val = intel_de_read(display, CMN_SDP_TL_STGR_CTL(display, cpu_transcoder));
+
+	vsc_ext_stagger = REG_FIELD_GET(VSC_EXT_STAGGER_MASK, val);
+	pps_stagger = REG_FIELD_GET(PPS_STAGGER_MASK, val);
+	gmp_stagger = REG_FIELD_GET(GMP_STAGGER_MASK, val);
+
+	crtc_state->dp_sdp_tl.vsc_ext =
+		intel_dp_sdp_stagger_to_tl(crtc_state, vsc_ext_stagger);
+	crtc_state->dp_sdp_tl.pps =
+		intel_dp_sdp_stagger_to_tl(crtc_state, pps_stagger);
+	crtc_state->dp_sdp_tl.gmp =
+		intel_dp_sdp_stagger_to_tl(crtc_state, gmp_stagger);
+}
+
 void intel_dp_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_state)
 {
 	crtc_state->dp_sdp_tl.as = intel_vrr_read_emp_as_sdp_tl(crtc_state);
+	intel_dp_cmn_sdp_transmission_line_get_config(crtc_state);
 }
 
 void intel_dp_cmn_sdp_transmission_line_enable(const struct intel_crtc_state *crtc_state)
-- 
2.45.2

