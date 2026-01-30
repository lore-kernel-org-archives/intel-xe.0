Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8107D49C76
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 08:34:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8F410E93E;
	Fri, 30 Jan 2026 08:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zknwjl+F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A143C10E933;
 Fri, 30 Jan 2026 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769762060; x=1801298060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kFX8e0h2gwPEZghDHkeU1GUimUsQBpBfOHt8YJUb/wg=;
 b=Zknwjl+FsfQQUmGUcAhzUQzOQQYjF+q/aYTyyLNP36gGmfPfRBscZVf9
 ZIpHCHpq5ZNsaN3uNz8Aj96tXYmkaB6QoPG1NhdP5IdZFohCWhyMs5wSt
 9t4r+SfeS/pNThELBm+/O22bjbepwSXgeUsXz6uHtYNWaoUYb519Kk7dN
 ldXrj5giyGEA0ueriWOEavWZuRlsjgWDCZVLYENCIH6A6154WVwtfI5Ag
 lY1P8yweMUhe1pDyOjSJl+tnPui9kGLwUcsQm0xED1xUeqL+Sq3xTwiwd
 cRfs9hVokCjWMiQi7cCKx0i9E/JTPbt+PYSAH2KUDhv3VsOLy6T4WfS/z g==;
X-CSE-ConnectionGUID: 0aO9Veq0R96gkq0YRvXJ0w==
X-CSE-MsgGUID: 3UG2VcKmQ8SxbUfYbA8MJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74636645"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="74636645"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:34:14 -0800
X-CSE-ConnectionGUID: o7q9VRnmSZeT/zvP7HJWdA==
X-CSE-MsgGUID: DI5TxHxjSOO6+Qbcp6UdiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208910072"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:34:12 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, imre.deak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 07/17] drm/i915/dp_mst: Move the joiner dependent code together
Date: Fri, 30 Jan 2026 13:48:02 +0530
Message-ID: <20260130081812.32087-8-ankit.k.nautiyal@intel.com>
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

Move the calculation of num_joined_pipes and other constraints that
depend on it, into a single block in mst_stream_compute_config().

This groups all joiner-dependent logic together, preparing the code for a
future loop-based evaluation of multiple joiner configurations.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index ec6882af0631..fc9367cc42ec 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -619,16 +619,16 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 	if (adjusted_mode->flags & DRM_MODE_FLAG_DBLSCAN)
 		return -EINVAL;
 
+	pipe_config->sink_format = INTEL_OUTPUT_FORMAT_RGB;
+	pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
+	pipe_config->has_pch_encoder = false;
+
 	num_joined_pipes = intel_dp_num_joined_pipes(intel_dp, connector,
 						     adjusted_mode->crtc_hdisplay,
 						     adjusted_mode->crtc_clock);
 	if (num_joined_pipes > 1)
 		pipe_config->joiner_pipes = GENMASK(crtc->pipe + num_joined_pipes - 1, crtc->pipe);
 
-	pipe_config->sink_format = INTEL_OUTPUT_FORMAT_RGB;
-	pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
-	pipe_config->has_pch_encoder = false;
-
 	joiner_needs_dsc = intel_dp_joiner_needs_dsc(display, num_joined_pipes);
 
 	dsc_needed = joiner_needs_dsc || intel_dp->force_dsc_en ||
@@ -685,6 +685,10 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 						  pipe_config->dp_m_n.tu);
 	}
 
+	if (ret)
+		return ret;
+
+	ret = intel_dp_compute_min_hblank(pipe_config, conn_state);
 	if (ret)
 		return ret;
 
@@ -695,10 +699,6 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 		pipe_config->lane_lat_optim_mask =
 			bxt_dpio_phy_calc_lane_lat_optim_mask(pipe_config->lane_count);
 
-	ret = intel_dp_compute_min_hblank(pipe_config, conn_state);
-	if (ret)
-		return ret;
-
 	intel_vrr_compute_config(pipe_config, conn_state);
 
 	intel_dp_audio_compute_config(encoder, pipe_config, conn_state);
-- 
2.45.2

