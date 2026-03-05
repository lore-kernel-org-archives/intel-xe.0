Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01251EFCE5A
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 04:16:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B696A10EB01;
	Thu,  5 Mar 2026 04:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Akyy6ZJ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDE010EB00;
 Thu,  5 Mar 2026 04:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772684210; x=1804220210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hOaZUh33N2Lh3Xvgkf5xtmh25Nh6BmpcqXuZWcAA3jQ=;
 b=Akyy6ZJ6nz/r1tGIFNGe5h0rvGvM/DbSctqtuYj5dnbzXGfxhEgio4BJ
 gX/dbA2l0we2yTEoPqSnLIMNfiUF14uzUKz8YibdFIG0jw98A0VfE/rSt
 6RJMw+uYKM3o43rcF0YvtCPOEOoazcmfLND1MGh/N7gne7r9KsSZ2MT8s
 +Z5OyUOWduyWB2azbmrvd5UnAtLTi76nr6jxxkCj9kVirOGNnv8SHQP1j
 Nw5vGyhYIuMbkus3+k2URRZ9bQIPm0MUkBSPFXFsuEMC2KUG3pj6TUC4a
 YqreZ8Brt1Tk8NJVz9XBU0SHxBSw3C0gRQncnIYJqN8HYv13eU58z6tlQ Q==;
X-CSE-ConnectionGUID: ajGwaEBpRC+piD9D59GA0g==
X-CSE-MsgGUID: p/W4nYYDSGWGs5COgMCRtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73674712"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="73674712"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 20:16:50 -0800
X-CSE-ConnectionGUID: W6jL2t1aSxS/cEGmhTEOUw==
X-CSE-MsgGUID: Ph7LGTc2Rlm8GmVmKNG6BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="222705745"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 20:16:48 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 5/5] drm/i915/dp: Enable Common SDP Transmission line
Date: Thu,  5 Mar 2026 09:31:18 +0530
Message-ID: <20260305040118.2576312-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260305040118.2576312-1-ankit.k.nautiyal@intel.com>
References: <20260305040118.2576312-1-ankit.k.nautiyal@intel.com>
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

Enable the Common SDP Transmission line for the SDP packets.
We get the clear picture about the SDPs and guardband only in
intel_dp_sdp_compute_config_late() therefore we must configure the
crtc_state members related to Common SDP Transmission line at this
point.

Currently, the stagger values are set as per the default policy of the
Hardware. This can be optimized later if we come up with a specific
driver policy to sequence the SDPs better.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c |  3 ++
 drivers/gpu/drm/i915/display/intel_dp.c  | 64 ++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index bdbd89600bee..e1e95f18f0ed 100644
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
index 59a8fa5e5ba9..87d73d0239bc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7189,6 +7189,68 @@ void intel_dp_mst_resume(struct intel_display *display)
 	}
 }
 
+static
+void intel_dp_cmn_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	bool as_sdp, gmp_sdp, pps_sdp, vsc_sdp, vsc_ext_sdp;
+
+	if (!HAS_CMN_SDP_TL(display))
+		return;
+
+	as_sdp = crtc_state->infoframes.enable &
+		 intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);
+
+	gmp_sdp = crtc_state->infoframes.enable &
+		  intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA);
+
+	pps_sdp = crtc_state->infoframes.enable &
+		  intel_hdmi_infoframe_enable(DP_SDP_PPS);
+
+	vsc_sdp = crtc_state->infoframes.enable &
+		  intel_hdmi_infoframe_enable(DP_SDP_VSC);
+
+	vsc_ext_sdp = crtc_state->infoframes.enable &
+		      (intel_hdmi_infoframe_enable(DP_SDP_VSC_EXT_VESA) |
+		       intel_hdmi_infoframe_enable(DP_SDP_VSC_EXT_CEA));
+
+	if (!gmp_sdp && !pps_sdp && !vsc_sdp && !vsc_ext_sdp)
+		return;
+
+	crtc_state->cmn_sdp_tl.enable = true;
+
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
+		crtc_state->cmn_sdp_tl.transmission_line =
+			intel_dp_emp_as_sdp_tl(crtc_state);
+	else
+		crtc_state->cmn_sdp_tl.transmission_line =
+			crtc_state->vrr.guardband - 1;
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
+	crtc_state->cmn_sdp_tl.gmp_stagger = GMP_STAGGER_DEFAULT;
+	crtc_state->cmn_sdp_tl.pps_stagger = PPS_STAGGER_DEFAULT;
+	crtc_state->cmn_sdp_tl.vsc_ext_stagger = VSC_EXT_STAGGER_DEFAULT;
+}
+
 static
 int intel_dp_sdp_compute_config_late(struct intel_crtc_state *crtc_state)
 {
@@ -7202,6 +7264,8 @@ int intel_dp_sdp_compute_config_late(struct intel_crtc_state *crtc_state)
 		return -EINVAL;
 	}
 
+	intel_dp_cmn_sdp_tl_compute_config_late(crtc_state);
+
 	return 0;
 }
 
-- 
2.45.2

