Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5869C36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 13:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D807210E423;
	Mon, 24 Mar 2025 13:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBO5KypP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BF310E370;
 Mon, 24 Mar 2025 13:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742823881; x=1774359881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hVJIFQdLHIiP6ZhdCug458wLcrbsZhSrjy2QAINTdjU=;
 b=oBO5KypPPF9p27cmNr6Ux5uY7qKy4mRR+r/99rbjnfLiAr2wbxsXudHZ
 g90z7vofenBuW4QcpFuWk6STUVg3RR3yXQu9wbOphpByArWjnq1ZMV1FY
 aoUGyowlVEXikVUGrIlk3PeLQA0UvrfGHZhgNJ2CSLA422JlHRWh3vWQn
 40pD8TtfGLx1OhT42lNKLyus+GmJj86fyjbAJhydLJHk90zDdzrw2iRfF
 Qa7j1vwuK/rsG0FIjfHZmepEhePzaynWII8M0zJA9AkWVe8rqmNAdSpW6
 6SSj1TvM2JWLDpyULmyg7QHNLrGNndhdH2lOs5quLOvuf4o8WtgX3GeqC A==;
X-CSE-ConnectionGUID: N8ysYAT7R7yOQHfLpwoKlg==
X-CSE-MsgGUID: xPh4WoE/SVyA7aMQoTQupg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43955698"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="43955698"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:44:41 -0700
X-CSE-ConnectionGUID: 1fUJkFRyTYaokAVOFPHQDw==
X-CSE-MsgGUID: nMrRmptTQcGcSayE0zkV5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124040496"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:44:40 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com
Subject: [PATCH 02/16] drm/i915/dp_mst: Use VRR Timing generator for DP MST
 for fixed_rr
Date: Mon, 24 Mar 2025 19:02:34 +0530
Message-ID: <20250324133248.4071909-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250324133248.4071909-1-ankit.k.nautiyal@intel.com>
References: <20250324133248.4071909-1-ankit.k.nautiyal@intel.com>
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

Currently the variable timings are supported only for DP and eDP and not
for DP MST. Call intel_vrr_compute_config() for MST which will configure
fixed refresh rate timings irrespective of whether VRR is supported or
not. Since vrr_capable still doesn't have support for DP MST this will be
just treated as non VRR case and vrr.vmin/vmax/flipline will be all set
to adjusted_mode->crtc_vtotal.

This will help to move away from the legacy timing generator and
always use VRR timing generator by default.

With this change, we need to exclude MST in intel_vrr_is_capable for
now, to avoid having LRR with MST.

v2: Exclude MST in intel_vrr_is_capable() for now. (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 3 +++
 drivers/gpu/drm/i915/display/intel_vrr.c    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 02f95108c637..bd47cf127b4c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -52,6 +52,7 @@
 #include "intel_pfit.h"
 #include "intel_psr.h"
 #include "intel_vdsc.h"
+#include "intel_vrr.h"
 #include "skl_scaler.h"
 
 /*
@@ -710,6 +711,8 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 		pipe_config->lane_lat_optim_mask =
 			bxt_dpio_phy_calc_lane_lat_optim_mask(pipe_config->lane_count);
 
+	intel_vrr_compute_config(pipe_config, conn_state);
+
 	intel_dp_audio_compute_config(encoder, pipe_config, conn_state);
 
 	intel_ddi_compute_min_voltage_level(pipe_config);
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 6bdcdfed4b9b..c682c487eb25 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -32,6 +32,8 @@ bool intel_vrr_is_capable(struct intel_connector *connector)
 			return false;
 		fallthrough;
 	case DRM_MODE_CONNECTOR_DisplayPort:
+		if (connector->mst.dp)
+			return false;
 		intel_dp = intel_attached_dp(connector);
 
 		if (!drm_dp_sink_can_do_video_without_timing_msa(intel_dp->dpcd))
-- 
2.45.2

