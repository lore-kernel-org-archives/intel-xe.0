Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70FBD3F06D
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 14:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6806610E6F2;
	Wed, 28 Jan 2026 14:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GD2JTFUe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B778B10E6F2;
 Wed, 28 Jan 2026 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769610173; x=1801146173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RCYa3nPHM+Ak7KCLlOJm8Kn82Kk8GQ2yZBUktI8LxwM=;
 b=GD2JTFUe+dlRqfxIl5GhD/80LkKSYeIVj+EFpNZWI2CfepdSDowPFKP2
 23nInBHxXyX+l3QWaZP1c8EF7NCCA/4nNZmrlJyZnKeTn4UpWLl5nKdy9
 u0e2wLeHev1jRcKJWtcku6Yo5vML9/Ypg7stTvmU0GSuK0hslhlP7i2I0
 biOui9eRLDV9fWqVcM0AHR3ryBkkhs04a1bH9yYOrj0NsJJHkZprewveQ
 QzCvFognr4ZkiNsokm17QShTKFGlfoop81AFxz+TxX+zRjZHB5GvYDMmL
 R4xii58OBMjVyyOpm8pYNvFlefG9dtJ1BkQPBt+jHDMfXTPyxY083kEjJ g==;
X-CSE-ConnectionGUID: BYC/T7DUTBSrnox+75/VDA==
X-CSE-MsgGUID: 0jvmIkTjTV+DEoW0q2B0MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="58400939"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="58400939"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 06:22:53 -0800
X-CSE-ConnectionGUID: O2rFT8rvQtGuletq7oAqPQ==
X-CSE-MsgGUID: a3h7mSMeQ0qE0viWNP4h1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="245881392"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 06:22:52 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, imre.deak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 12/16] drm/i915/dp: Refactor dsc_slice_count handling in
 intel_dp_mode_valid()
Date: Wed, 28 Jan 2026 19:36:32 +0530
Message-ID: <20260128140636.3527799-13-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260128140636.3527799-1-ankit.k.nautiyal@intel.com>
References: <20260128140636.3527799-1-ankit.k.nautiyal@intel.com>
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
---
 drivers/gpu/drm/i915/display/intel_dp.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 655688c8e6ef..0acb3b64cf27 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1473,7 +1473,6 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 	int target_clock = mode->clock;
 	int max_rate, mode_rate, max_lanes, max_link_clock;
 	u16 dsc_max_compressed_bpp = 0;
-	u8 dsc_slice_count = 0;
 	enum drm_mode_status status;
 	bool dsc = false;
 	int num_joined_pipes;
@@ -1523,6 +1522,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 	 * over candidate pipe counts and evaluate each combination.
 	 */
 	for (num_pipes = 0; num_pipes < I915_MAX_PIPES; num_pipes++) {
+		int dsc_slice_count = 0;
 
 		status = MODE_CLOCK_HIGH;
 
@@ -1547,6 +1547,11 @@ intel_dp_mode_valid(struct drm_connector *_connector,
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
@@ -1561,12 +1566,6 @@ intel_dp_mode_valid(struct drm_connector *_connector,
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

