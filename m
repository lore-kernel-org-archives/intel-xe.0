Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB6CCD4F3C
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 04:09:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B737310E58F;
	Mon, 18 May 2026 04:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kgzUS3lc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335BA10E2E0;
 Mon, 18 May 2026 04:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779077373; x=1810613373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HIS4vkCiFELVb77AwYohAwVrffB2TUB69rlyMofqxp4=;
 b=kgzUS3lcIP0YOe65LIjzlmaXIJ1b4JZYN239ozHq09WO6IYg5etssbDd
 s5fuqbrnENKKg96ffURCuzuIxjKtU+SNx0vXTyzm4D9SiTbZqmy6aoXX4
 y+TBzAAV/RmH6Vr4aNQnBB0AMwsqkvQ2RO77vWJoGsSCiT1hMIv2bkbUa
 Sb4IlJEkgYg1iAM+wav8jVdvskIB6CsJPAKw+qMrP8sG0Dvz/cCeqGudX
 Xlo2BBXTksHApuK9rJDXT3XIn265qdpehCrjZQNoTu8dWdOdUF7pNr3Lt
 nfyNaCh8Tvrn2y5hQn3A1+8eElYLnw6hho5THIowXpyizblHZbfDsSuRC Q==;
X-CSE-ConnectionGUID: Yo7/3dqsTvGnsGFiIxeavQ==
X-CSE-MsgGUID: em8XXTjFR0Kh2dAcV/IVZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="97495606"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="97495606"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 21:09:33 -0700
X-CSE-ConnectionGUID: QQPhQa1kTziQ4PTvj3u/6g==
X-CSE-MsgGUID: oNcgQUJJR7K5mfGy+VFVCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="277403510"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 21:09:31 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 02/11] drm/i915/dp: Add member to intel_dp to store AS SDP v2
 support
Date: Mon, 18 May 2026 09:24:52 +0530
Message-ID: <20260518035502.2909359-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260518035502.2909359-1-ankit.k.nautiyal@intel.com>
References: <20260518035502.2909359-1-ankit.k.nautiyal@intel.com>
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

eDP v1.5a advertises support for Adaptive Sync SDP and with that the
support for AS SDP v2 is mandatory.

DP v2.1 SCR advertises support for FAVT payload fields parsing in DPCD
0x2214 Bit 2. This indicates the support for Adaptive-Sync SDP version 2
(AS SDP v2), which allows the source to set the version in HB2[4:0] and the
payload length in HB3[5:0] of the AS SDP header.

DP v2.1 SCR also introduces ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR in the
Panel Replay Capability DPCD 0x00b1 (Bit 3). When this bit is set, the sink
does not support asynchronous video timing while in a Panel Replay Active
state and the source is required to keep transmitting Adaptive-Sync
SDPs. The spec mandates that such sinks shall support AS SDP v2.

Infer AS SDP v2 support from these capabilities and store it in
struct intel_dp for use by subsequent feature enablement changes.

v2:
 - Include parsing ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR bit to
   determine AS SDP v2 support. (Ville)
v3:
 - Use helper to determine asynch video timing support.
v4:
 - Add AS SDP v2 support for eDP as per v1.5a.
 - Add a check for Panel Replay support before checking for Async video
   timing support in PR
 - Add a TODO for Display ID and PCON considerations. (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index b7bcf8fefa3e..e9b95879c797 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1871,6 +1871,7 @@ struct intel_dp {
 	/* connector directly attached - won't be use for modeset in mst world */
 	struct intel_connector *attached_connector;
 	bool as_sdp_supported;
+	bool as_sdp_v2_supported;
 
 	struct drm_dp_tunnel *tunnel;
 	bool tunnel_suspended:1;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 1920d2f02666..92a650a728d8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6365,6 +6365,46 @@ intel_dp_unset_edid(struct intel_dp *intel_dp)
 					       false);
 }
 
+static bool
+intel_dp_sink_supports_as_sdp_v2(struct intel_dp *intel_dp)
+{
+	u8 rx_features;
+
+	/*
+	 * The DP spec does not explicitly provide the AS SDP v2 capability.
+	 * So based on the DP v2.1 SCR, we infer it from the following bits:
+	 *
+	 * DP_AS_SDP_FAVT_PAYLOAD_FIELDS_PARSING_SUPPORTED indicates support for
+	 * FAVT, which is explicitly defined to use AS SDP v2.
+	 *
+	 * DP_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR indicates that the sink
+	 * does not support asynchronous video timing while in PR Active,
+	 * requiring the source to keep transmitting Adaptive-Sync SDPs. The
+	 * spec mandates that such sinks shall support AS SDP v2.
+	 *
+	 * #TODO: Check the Adaptive-Sync DisplayID 2.1 block once DisplayID
+	 * parsing is available. This may help detect AS SDP v2 support for
+	 * native DP 2.1 sinks that do not expose FAVT or PR-based capability
+	 * bits.
+	 *
+	 * In the presence of PCONs, check PCON support from DPCD and sink
+	 * support from Display ID.
+	 */
+
+	if (drm_dp_dpcd_read_byte(&intel_dp->aux,
+				  DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1,
+				  &rx_features) == 1) {
+		if (rx_features & DP_AS_SDP_FAVT_PAYLOAD_FIELDS_PARSING_SUPPORTED)
+			return true;
+	}
+
+	if (intel_dp->psr.sink_panel_replay_support &&
+	    !intel_psr_pr_async_video_timing_supported(intel_dp))
+		return true;
+
+	return false;
+}
+
 static void
 intel_dp_detect_sdp_caps(struct intel_dp *intel_dp)
 {
@@ -6372,6 +6412,15 @@ intel_dp_detect_sdp_caps(struct intel_dp *intel_dp)
 
 	intel_dp->as_sdp_supported = HAS_AS_SDP(display) &&
 		drm_dp_as_sdp_supported(&intel_dp->aux, intel_dp->dpcd);
+
+	if (!intel_dp->as_sdp_supported)
+		return;
+
+	/* eDP Adaptive-Sync SDP always uses AS SDP v2 */
+	if (intel_dp_is_edp(intel_dp))
+		intel_dp->as_sdp_v2_supported =  true;
+	else
+		intel_dp->as_sdp_v2_supported = intel_dp_sink_supports_as_sdp_v2(intel_dp);
 }
 
 static bool intel_dp_needs_dpcd_probe(struct intel_dp *intel_dp, bool force_on_external)
-- 
2.45.2

