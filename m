Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F745EB7ED8
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 04:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D767610EAFF;
	Thu,  5 Mar 2026 04:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcoEIJZE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A092210EB00;
 Thu,  5 Mar 2026 04:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772684208; x=1804220208;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pi52QWUodKZMPcNyVB05hqSbOLqDTlSt3+FhpIVgDbg=;
 b=LcoEIJZE6mbVnuA5BgT6A5fNIAI3UQim9dWgffzyLiqUuglZqRLErTma
 QlQOJUPiKUu1Mo0G08K2rsja8gk3aGf2AvK5ZyF8Wigl+v34mvAyEOTw+
 geWHLQ+v6WQ6OxtwvJxcwpGBBHnjKTB5zWkc9WfSSqIFlbg8NF560nXoC
 CgIJ0kzHkWdaOjPrAP9FzqEScuSiBRJHxQF96zfQCaMK5erj4hK7GlKwd
 MUKkAzyQu4RIXFMO0dM1xDaRYbMPVYp4zUAgf15aubhpb52jtoQ5hfTu6
 e4z6kvUnSGRWddOLtoe9NU+ff8y/z4wx1ZwJ6OrCi/vZXgYwFkLt3TdTU g==;
X-CSE-ConnectionGUID: HbIDnkqcSNuFkb78f+RaPg==
X-CSE-MsgGUID: NF04GChnScqXQ3txrSLZ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73674708"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="73674708"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 20:16:48 -0800
X-CSE-ConnectionGUID: +HFauHGrRbS9VLCwvXhyXg==
X-CSE-MsgGUID: IKrPf4H7T7GvvCffTLCSrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="222705742"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 20:16:46 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 4/5] drm/i915/dp: Introduce helpers to enable/disable CMN SDP
 Transmission line
Date: Thu,  5 Mar 2026 09:31:17 +0530
Message-ID: <20260305040118.2576312-5-ankit.k.nautiyal@intel.com>
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

Introduce helpers to program or disable CMN_SDP_TL and stagger registers
using the state stored in crtc_state.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 29 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9204a813639a..59a8fa5e5ba9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7317,3 +7317,32 @@ void intel_dp_cmn_sdp_transmission_line_get_config(struct intel_crtc_state *crtc
 	crtc_state->cmn_sdp_tl.pps_stagger = REG_FIELD_GET(PPS_STAGGER_MASK, val);
 	crtc_state->cmn_sdp_tl.gmp_stagger = REG_FIELD_GET(GMP_STAGGER_MASK, val);
 }
+
+void intel_dp_cmn_sdp_transmission_line_enable(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+
+	if (!crtc_state->cmn_sdp_tl.enable)
+		return;
+
+	intel_de_write(display, CMN_SDP_TL_STGR_CTL(display, cpu_transcoder),
+		       GMP_STAGGER(crtc_state->cmn_sdp_tl.gmp_stagger) |
+		       PPS_STAGGER(crtc_state->cmn_sdp_tl.pps_stagger) |
+		       VSC_EXT_STAGGER(crtc_state->cmn_sdp_tl.vsc_ext_stagger));
+
+	intel_de_write(display, CMN_SDP_TL(display, cpu_transcoder),
+		       TRANSMISSION_LINE_ENABLE |
+		       BASE_TRANSMISSION_LINE(crtc_state->cmn_sdp_tl.transmission_line));
+}
+
+void intel_dp_cmn_sdp_transmission_line_disable(const struct intel_crtc_state *old_crtc_state)
+{
+	struct intel_display *display = to_intel_display(old_crtc_state);
+	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
+
+	if (!old_crtc_state->cmn_sdp_tl.enable)
+		return;
+
+	intel_de_write(display, CMN_SDP_TL(display, cpu_transcoder), 0);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index abb2fcdea352..ace7d142182f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -239,5 +239,7 @@ bool intel_dp_joiner_candidate_valid(struct intel_connector *connector,
 
 int intel_dp_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
 void intel_dp_cmn_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_state);
+void intel_dp_cmn_sdp_transmission_line_enable(const struct intel_crtc_state *crtc_state);
+void intel_dp_cmn_sdp_transmission_line_disable(const struct intel_crtc_state *old_crtc_state);
 
 #endif /* __INTEL_DP_H__ */
-- 
2.45.2

