Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96853D73E80
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 17:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B77E10E8C7;
	Thu, 29 Jan 2026 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lV10GqHb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4927810E8C1;
 Thu, 29 Jan 2026 17:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769707694; x=1801243694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e5AnoGw6QrlEbE35Sqdov+y8HrtWnKPOXofa8xSkhX0=;
 b=lV10GqHbFP/XTEm+RNIAcvCHxfslPkugqrxOixG2MTGDF8V0oCDiZtWv
 PGfpORAVurehO3Dsnke8AsIJ1e1bo2I+HNag2c3tLusfUmEmO/zZWTRJ8
 iOQCH5Z8GFnYzXGvJy4LsUw5klB+N9YSf1w2xfdYM1mjQ1daO438SRGry
 6DYqbeZKBe+PjSC9X+vgh0ViexNtZc2grhnFuP8Ay9FAv+P4NKACkJNOG
 9nafLoheE3I4M6WCV4nbZEKFe7KwjFeGEOFfGc5NT6PbkPOPQJbrEvF2O
 6DLaHMnD+6dKYYC0g8iuV2MUZQRhspq2FRFVl3919j45d0YpNLDwa7UqI w==;
X-CSE-ConnectionGUID: rLYbwjeFRACtroY0fNCLsg==
X-CSE-MsgGUID: SmNdnyd4SKqkEwDY1exUFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70926922"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70926922"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:28:14 -0800
X-CSE-ConnectionGUID: nx4AdnxPRdKkiK6yzd2gAg==
X-CSE-MsgGUID: twq+u6swSGKKNOldQFy62w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="239361082"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:28:12 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, imre.deak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 13/16] drm/i915/dp: Refactor dsc_slice_count handling in
 intel_dp_mode_valid()
Date: Thu, 29 Jan 2026 22:41:51 +0530
Message-ID: <20260129171154.3898077-14-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260129171154.3898077-1-ankit.k.nautiyal@intel.com>
References: <20260129171154.3898077-1-ankit.k.nautiyal@intel.com>
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

Make dsc_slice_count closer to the block where it is used and promote it
from u8 to int. This aligns it with upcoming DSC bubble pixel-rate
adjustments, where the slice count participates in wider arithmetic.

Currently, for non-eDP (DP/DP_MST) cases  the slice count is computed only
inside intel_dp_dsc_mode_valid() and is not used by the caller. Once DSC
bubble handling is added, dp_mode_valid() will need access to its own local
slice count for non-eDP cases as well.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d31e92cc0104..69a87c5933b1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1436,7 +1436,6 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 	int target_clock = mode->clock;
 	int max_rate, mode_rate, max_lanes, max_link_clock;
 	u16 dsc_max_compressed_bpp = 0;
-	u8 dsc_slice_count = 0;
 	enum drm_mode_status status;
 	bool dsc = false;
 	int num_joined_pipes;
@@ -1486,6 +1485,8 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 	 * over candidate pipe counts and evaluate each combination.
 	 */
 	for (num_pipes = 1; num_pipes <= I915_MAX_PIPES; num_pipes++) {
+		int dsc_slice_count = 0;
+
 		status = MODE_CLOCK_HIGH;
 
 		if (connector->force_joined_pipes &&
@@ -1507,6 +1508,11 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 		if (intel_dp_has_dsc(connector)) {
 			int pipe_bpp;
 
+			dsc_slice_count = intel_dp_dsc_get_slice_count(connector,
+								       target_clock,
+								       mode->hdisplay,
+								       num_joined_pipes);
+
 			/*
 			 * TBD pass the connector BPC,
 			 * for now U8_MAX so that max BPC on that platform would be picked
@@ -1521,12 +1527,6 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 				dsc_max_compressed_bpp =
 					drm_edp_dsc_sink_output_bpp(connector->dp.dsc_dpcd) >> 4;
 
-				dsc_slice_count =
-					intel_dp_dsc_get_slice_count(connector,
-								     target_clock,
-								     mode->hdisplay,
-								     num_joined_pipes);
-
 				dsc = dsc_max_compressed_bpp && dsc_slice_count;
 			} else if (drm_dp_sink_supports_fec(connector->dp.fec_capability)) {
 				unsigned long bw_overhead_flags = 0;
-- 
2.45.2

