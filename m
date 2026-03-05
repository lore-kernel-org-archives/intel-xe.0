Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93167EB7ED2
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 04:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2897410EAFD;
	Thu,  5 Mar 2026 04:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WkGS468I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CED610EAFC;
 Thu,  5 Mar 2026 04:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772684206; x=1804220206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WBepNwOyT2Ox4Ukne8FlHWSxMQm4c8tPV3fIFy+p/WA=;
 b=WkGS468IP44oYdHXXcZkBfH4nW4FzZCIxV18wo6DCwDgNfjNbL0B1X7r
 VvVwkZFdgbl4zBcJfxcin9DU2QHqSMnXstG9UPeYeXJsLfbsWbAvsibRn
 OJeBal5zj/61hPWr8FtK4icFC67E7jl6BmNxNpbqb84mYYn/Kdnfb7v0I
 1BSjI2Me97vbnMxJbSRrPv61cHkj3WkzpVcIWOJmN/OI+Hq3GsvGKrAQg
 87caHkleI+GjJV9ZSWESkbwmaR052haz+CScD2SnEH2vn1vOhuBIQOD9v
 Kb3XmQcKZE6WwH/xIWlfquaVOtxvCT2PQzKyTfKV8vxTKUgEUVcr5Tv1k w==;
X-CSE-ConnectionGUID: msOF10S9R/GvqnFIGmaCnw==
X-CSE-MsgGUID: ZtI8/nEWTsyiFlQgdr9O6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73674706"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="73674706"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 20:16:46 -0800
X-CSE-ConnectionGUID: HOaUv4JkQU26Y0hGV6+r0w==
X-CSE-MsgGUID: 1JSB79qiTBWBrohv1a5GTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="222705738"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 20:16:44 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 3/5] drm/i915/dp: Add helper for AS SDP TL and fix
 documentation
Date: Thu,  5 Mar 2026 09:31:16 +0530
Message-ID: <20260305040118.2576312-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260305040118.2576312-1-ankit.k.nautiyal@intel.com>
References: <20260305040118.2576312-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a helper, intel_dp_emp_as_sdp_tl(), to compute the EMP_AS_SDP_TL
value used when programming the double‑buffering point and transmission
line for VRR packets.
Also improve the documentation: the AS SDP transmission line corresponds
to the T1 position, which maps to the start of the Vsync pulse.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c  | 9 +++++++++
 drivers/gpu/drm/i915/display/intel_dp.h  | 1 +
 drivers/gpu/drm/i915/display/intel_vrr.c | 4 ++--
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 86390553800d..9204a813639a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7288,6 +7288,15 @@ bool intel_dp_joiner_candidate_valid(struct intel_connector *connector,
 	return true;
 }
 
+int intel_dp_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
+{
+	/*
+	 * EMP_AS_SDP_TL defines the T1 position : The default AS SDP position
+	 * that corresponds to the start of the Vsync pulse.
+	 */
+	return crtc_state->vrr.vsync_start;
+}
+
 void intel_dp_cmn_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 24df234a43d3..abb2fcdea352 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -237,6 +237,7 @@ bool intel_dp_joiner_candidate_valid(struct intel_connector *connector,
 	for ((__num_joined_pipes) = 1; (__num_joined_pipes) <= (I915_MAX_PIPES); (__num_joined_pipes)++) \
 		for_each_if(intel_dp_joiner_candidate_valid(__connector, (__mode)->hdisplay, __num_joined_pipes))
 
+int intel_dp_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
 void intel_dp_cmn_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 00ca76dbdd6c..2b4e4e55d008 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -642,12 +642,12 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 	 * double buffering point and transmission line for VRR packets for
 	 * HDMI2.1/DP/eDP/DP->HDMI2.1 PCON.
 	 * Since currently we support VRR only for DP/eDP, so this is programmed
-	 * to for Adaptive Sync SDP to Vsync start.
+	 * only for Adaptive Sync SDP.
 	 */
 	if (DISPLAY_VERx100(display) == 1401 || DISPLAY_VER(display) >= 20)
 		intel_de_write(display,
 			       EMP_AS_SDP_TL(display, cpu_transcoder),
-			       EMP_AS_SDP_DB_TL(crtc_state->vrr.vsync_start));
+			       EMP_AS_SDP_DB_TL(intel_dp_emp_as_sdp_tl(crtc_state)));
 }
 
 void
-- 
2.45.2

