Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36B3D49C82
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 08:34:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0ABB10E940;
	Fri, 30 Jan 2026 08:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bi6tiEJY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452A610E939;
 Fri, 30 Jan 2026 08:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769762061; x=1801298061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZTt31oq92qFW/ON0QczPqdgyFYFBF3XvK4W/728+Upo=;
 b=bi6tiEJYnOMsIfLXp+d+79PmEfxdQjQyb8lX26UtiXh20/NcLcAsLlkC
 1C0WFbzbpvv36WzaEuA3wYJmNsFJXI/tYXtI18CovYe+UeNGHJNHle+Lh
 CxFLYb43+TveUjtIE6ljCEmQAeDNooE3L9O/PcJAFmFiFcd3QkFRBEEun
 8NwTKgxfjhuVtJASkMw2kDIvmNUu9sQL4gBiijef7HID9tWfhfHT+nksi
 9DMbTOla3cAJOqrxbJ8NahNfUPejsPjp+lObRUmB5NdQ4GHW0YZaLz3We
 /uKcDi2o3NFQkBbt21SDBtWFWT2LZZxyS7m4sDuOR0V/s5DsWnoPLDfZm w==;
X-CSE-ConnectionGUID: nOUwXArJQ+6VUgOVRQqdag==
X-CSE-MsgGUID: aX34uvUURAeK0n3r9mXYrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74636652"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="74636652"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:34:20 -0800
X-CSE-ConnectionGUID: XTGVrhqLSUabjDRJ9g+vqA==
X-CSE-MsgGUID: MTP3as1uQfasTN2aIj/UIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208910102"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:34:18 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, imre.deak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 10/17] drm/i915/dp_mst: Rework pipe joiner logic in
 compute_config
Date: Fri, 30 Jan 2026 13:48:05 +0530
Message-ID: <20260130081812.32087-11-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260130081812.32087-1-ankit.k.nautiyal@intel.com>
References: <20260130081812.32087-1-ankit.k.nautiyal@intel.com>
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

Similar to the DP SST, refactor mst_stream_compute_config() to iterate
over joiner candidates and select the minimal joiner configuration that
satisfies the mode requirements. This prepares the logic for future changes
that will consider DSC slice overhead.

v2:
 - Move the check for dotclock in the new helper and check for both DSC and
   non-DSC case. In case the check fails for non-DSC, fallback to DSC
   configuration. (Imre)
 - Propagate the return value from the core helper:
   mst_stream_compute_link_for_joined_pipes(). (Imre)
v3:
 - Use num_joined_pipes instead of num_pipes. (Imre)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 43 +++++++++++++++------
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index aa328d99d9f2..dac89dc54f1d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -602,12 +602,16 @@ static int mst_stream_compute_link_for_joined_pipes(struct intel_encoder *encode
 {
 	struct intel_display *display = to_intel_display(encoder);
 	struct intel_dp *intel_dp = to_primary_dp(encoder);
+	const struct drm_display_mode *adjusted_mode =
+		&pipe_config->hw.adjusted_mode;
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
+	int max_dotclk = display->cdclk.max_dotclk_freq;
 	struct link_config_limits limits;
 	bool dsc_needed, joiner_needs_dsc;
 	int ret = 0;
 
+	max_dotclk *= num_joined_pipes;
 	joiner_needs_dsc = intel_dp_joiner_needs_dsc(display, num_joined_pipes);
 
 	dsc_needed = joiner_needs_dsc || intel_dp->force_dsc_en ||
@@ -621,7 +625,7 @@ static int mst_stream_compute_link_for_joined_pipes(struct intel_encoder *encode
 		if (ret == -EDEADLK)
 			return ret;
 
-		if (ret)
+		if (ret || adjusted_mode->clock > max_dotclk)
 			dsc_needed = true;
 	}
 
@@ -664,6 +668,9 @@ static int mst_stream_compute_link_for_joined_pipes(struct intel_encoder *encode
 						  pipe_config->dp_m_n.tu);
 		if (ret)
 			return ret;
+
+		if (adjusted_mode->clock > max_dotclk)
+			return -EINVAL;
 	}
 
 	if (ret)
@@ -689,7 +696,7 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 	const struct drm_display_mode *adjusted_mode =
 		&pipe_config->hw.adjusted_mode;
 	int num_joined_pipes;
-	int ret = 0;
+	int ret = -EINVAL;
 
 	if (pipe_config->fec_enable &&
 	    !intel_dp_supports_fec(intel_dp, connector, pipe_config))
@@ -702,16 +709,30 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 	pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
 	pipe_config->has_pch_encoder = false;
 
-	num_joined_pipes = intel_dp_num_joined_pipes(intel_dp, connector,
-						     adjusted_mode->crtc_hdisplay,
-						     adjusted_mode->crtc_clock);
-	if (num_joined_pipes > 1)
-		pipe_config->joiner_pipes = GENMASK(crtc->pipe + num_joined_pipes - 1, crtc->pipe);
+	for (num_joined_pipes = 1; num_joined_pipes <= I915_MAX_PIPES; num_joined_pipes++) {
+		if (connector->force_joined_pipes &&
+		    num_joined_pipes != connector->force_joined_pipes)
+			continue;
+
+		if (!intel_dp_can_join(display, num_joined_pipes))
+			continue;
+
+		if (adjusted_mode->hdisplay >
+		    num_joined_pipes * intel_dp_max_hdisplay_per_pipe(display))
+			continue;
+
+		if (num_joined_pipes > 1)
+			pipe_config->joiner_pipes = GENMASK(crtc->pipe + num_joined_pipes - 1,
+							    crtc->pipe);
+
+		ret = mst_stream_compute_link_for_joined_pipes(encoder,
+							       pipe_config,
+							       conn_state,
+							       num_joined_pipes);
+		if (!ret)
+			break;
+	}
 
-	ret = mst_stream_compute_link_for_joined_pipes(encoder,
-						       pipe_config,
-						       conn_state,
-						       num_joined_pipes);
 	if (ret)
 		return ret;
 
-- 
2.45.2

