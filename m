Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24C2C79FAD
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B33A10E9E0;
	Tue,  8 Sep 2026 06:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JBklxRC4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D9210E9E0;
 Tue,  8 Sep 2026 06:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788849562; x=1820385562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vAeJfMH/JHU47dsXFam+05nQyP+Vbnpmdm9kZZftskk=;
 b=JBklxRC4sXcPVxFjNg/7LaWo+JjzmBlaFzkSO/x+rPfNgMopvkdiODF1
 LZKKDJ2hruxd/0CCTO71E075azAM/q+YzL5687sLlro4+5XnliW3r8Ozx
 23WmBb4NIqA/rNYoZl1KjLzLq+gTkco47l58kLiHIsvjDQqiw9DXQwI4a
 0rUt5/3GSjBnzC5sC9E275/5O7/JB6/ODxMQAmNOZEX08BK/LwfQyWtR1
 xLULKrYTLuYXsTq+TWCrMctFvp4f/YGYluVY7ppIHvbIKwWHh7W+i06jm
 CrURK6oc0Xdqi3UW6hO1JOg9G2tS2AInSVdZ9pefxHEyYUZLdvwIP1eJm w==;
X-CSE-ConnectionGUID: 59xveo/7TmCQoaMzVZAYGg==
X-CSE-MsgGUID: dhKK5SROQISTVrf8gyOamQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93061807"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="93061807"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:22 -0700
X-CSE-ConnectionGUID: 9g5W4/0DSNigT9eJ4+iyxg==
X-CSE-MsgGUID: 2E27f9glSOm/fkQDgGYNeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264702484"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:20 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v5 11/12] drm/i915/dip: Enable Common SDP Transmission line
Date: Tue,  8 Sep 2026 11:52:22 +0530
Message-ID: <20260908062224.2897987-12-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
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
 drivers/gpu/drm/i915/display/intel_dip.c | 90 ++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index dacb4b7588a0..3cdb06e81130 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2737,6 +2737,8 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	/* 6.o Configure and enable FEC if needed */
 	intel_ddi_enable_fec(encoder, crtc_state);
 
+	intel_dip_cmn_sdp_transmission_line_enable(crtc_state);
+
 	/* 7.a 128b/132b SST. */
 	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
 		/* VCPID 1, start slot 0 for 128b/132b, tu slots */
@@ -3124,6 +3126,7 @@ static void intel_ddi_buf_disable(struct intel_encoder *encoder,
 			     DP_TP_CTL_ENABLE, 0);
 	}
 
+	intel_dip_cmn_sdp_transmission_line_disable(crtc_state);
 	intel_ddi_disable_fec(encoder, crtc_state);
 
 	if (DISPLAY_VER(display) < 14)
diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i915/display/intel_dip.c
index 0c80d6305fec..007c8fb87ecd 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.c
+++ b/drivers/gpu/drm/i915/display/intel_dip.c
@@ -10,6 +10,7 @@
 #include "intel_dip.h"
 #include "intel_dip_regs.h"
 #include "intel_display_types.h"
+#include "intel_hdmi.h"
 
 static int intel_dip_get_as_sdp_transmission_line(const struct intel_crtc_state *crtc_state)
 {
@@ -54,14 +55,103 @@ void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
 		       EMP_AS_SDP_DB_TL(crtc_state->dip.emp_as_sdp_tl));
 }
 
+static int intel_dip_sdp_stagger_to_tl(struct intel_crtc_state *crtc_state,
+				       int stagger)
+{
+	return crtc_state->dip.cmn_sdp_tl + stagger;
+}
+
+static
+void intel_dip_cmn_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	bool as_sdp;
+
+	if (!HAS_COMMON_SDP_TL(display))
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
+		crtc_state->dip.cmn_sdp_tl = crtc_state->dip.emp_as_sdp_tl;
+	else
+		crtc_state->dip.cmn_sdp_tl = crtc_state->vrr.guardband - 1;
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
+	crtc_state->dip.vsc_sdp_tl = crtc_state->dip.cmn_sdp_tl;
+	crtc_state->dip.gmp_sdp_tl =
+		intel_dip_sdp_stagger_to_tl(crtc_state, GMP_STAGGER_DEFAULT);
+	crtc_state->dip.pps_sdp_tl =
+		intel_dip_sdp_stagger_to_tl(crtc_state, PPS_STAGGER_DEFAULT);
+	crtc_state->dip.vsc_ext_sdp_tl =
+		intel_dip_sdp_stagger_to_tl(crtc_state, VSC_EXT_STAGGER_DEFAULT);
+}
+
 void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state)
 {
 	crtc_state->dip.emp_as_sdp_tl = intel_dip_get_as_sdp_transmission_line(crtc_state);
+
+	intel_dip_cmn_sdp_tl_compute_config_late(crtc_state);
+}
+
+static
+void intel_dip_cmn_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	u16 vsc_ext_stagger, pps_stagger, gmp_stagger;
+	u32 val;
+
+	if (!HAS_COMMON_SDP_TL(display))
+		return;
+
+	val = intel_de_read(display, CMN_SDP_TL(display, cpu_transcoder));
+
+	if (!(val & TRANSMISSION_LINE_ENABLE))
+		return;
+
+	crtc_state->dip.cmn_sdp_tl = REG_FIELD_GET(BASE_TRANSMISSION_LINE_MASK, val);
+
+	/* SDP VSC uses same transmission line as CMN base transmission line */
+	crtc_state->dip.vsc_sdp_tl = crtc_state->dip.cmn_sdp_tl;
+
+	val = intel_de_read(display, CMN_SDP_TL_STGR_CTL(display, cpu_transcoder));
+
+	vsc_ext_stagger = REG_FIELD_GET(VSC_EXT_STAGGER_MASK, val);
+	pps_stagger = REG_FIELD_GET(PPS_STAGGER_MASK, val);
+	gmp_stagger = REG_FIELD_GET(GMP_STAGGER_MASK, val);
+
+	crtc_state->dip.vsc_ext_sdp_tl =
+		intel_dip_sdp_stagger_to_tl(crtc_state, vsc_ext_stagger);
+	crtc_state->dip.pps_sdp_tl =
+		intel_dip_sdp_stagger_to_tl(crtc_state, pps_stagger);
+	crtc_state->dip.gmp_sdp_tl =
+		intel_dip_sdp_stagger_to_tl(crtc_state, gmp_stagger);
 }
 
 void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_state)
 {
 	crtc_state->dip.emp_as_sdp_tl = intel_dip_read_emp_as_sdp_tl(crtc_state);
+	intel_dip_cmn_sdp_transmission_line_get_config(crtc_state);
 }
 
 static int intel_dip_sdp_tl_to_stagger(const struct intel_crtc_state *crtc_state,
-- 
2.50.1

