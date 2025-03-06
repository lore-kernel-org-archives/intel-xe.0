Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD8DC282EC
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 13:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0601110E99C;
	Thu,  6 Mar 2025 13:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHsmS0Cx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E9C10E998;
 Thu,  6 Mar 2025 13:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741267425; x=1772803425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nhP02N/m0zthQJh66owGWX0HweL1uI3ABYo/+PSneY4=;
 b=CHsmS0Cx0Ou6wpeI7Y3W6HtRrdAbr6RgdntAW1k5BvuCOSrV8FOq/KBe
 H/HXL8crP/erhEzYnj/CGqT5Goajb9XhvOfQyWZjy/zzo8OTGNZKVjWb/
 XLrkovUtWUK5l9a5KEW9hu4xLBJR9GIXkh3StA5iYWmKuPv1XudPXhfEQ
 NDEErPgu2KkXkR8plsaEJPWsCyI9YN+7cU9RVw1odC95eLat9YJJCF2IG
 NDJsyejZF/1ySLYxeqL07nMhO/+IZb/YMaFQKj34qj0Wo99rou1qL7axz
 twLrJl0IOyRC/l/1O0zic13UBgGDwGLuuR3k5w6e/TwEqUFMwc/dcFhld A==;
X-CSE-ConnectionGUID: Aoy+0AOrRnalLsYtv2RCpA==
X-CSE-MsgGUID: jQE1DI6tQhyzIuKyxuZnBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41524694"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="41524694"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 05:23:44 -0800
X-CSE-ConnectionGUID: yDcl1fHWQwCxP6RD5owypw==
X-CSE-MsgGUID: HpfnAxRYQFGQvx6syiSQtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="142243209"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 05:23:42 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com
Subject: [PATCH 19/21] drm/i915/vrr: Allow fixed_rr with pipe joiner
Date: Thu,  6 Mar 2025 18:40:58 +0530
Message-ID: <20250306131100.3989503-20-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250306131100.3989503-1-ankit.k.nautiyal@intel.com>
References: <20250306131100.3989503-1-ankit.k.nautiyal@intel.com>
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

VRR with joiner is currently disabled as it still needs some work to
correctly sequence the primary and secondary transcoders. However, we can
still use VRR Timing generator in fixed refresh rate for joiner and since
it just need to program vrr timings once and does not involve changing
timings on the fly. We still need to skip the VRR and LRR for joiner.

To achieve this set vrr.in_range to 0 for joiner case, so that we do not
try VRR and LRR for the joiner case.

v2: Avoid checks for secondary pipes, where not required. (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 58cc86c32239..3329d60afa45 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -353,19 +353,23 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	if (!HAS_VRR(display))
 		return;
 
-	/*
-	 * FIXME all joined pipes share the same transcoder.
-	 * Need to account for that during VRR toggle/push/etc.
-	 */
-	if (crtc_state->joiner_pipes)
-		return;
-
 	if (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE)
 		return;
 
 	crtc_state->vrr.in_range =
 		intel_vrr_is_in_range(connector, drm_mode_vrefresh(adjusted_mode));
 
+	/*
+	 * Allow fixed refresh rate with VRR Timing Generator.
+	 * For now set the vrr.in_range to 0, to allow fixed_rr but skip actual
+	 * VRR and LRR.
+	 * #TODO For actual VRR with joiner, we need to figure out how to
+	 * correctly sequence transcoder level stuff vs. pipe level stuff
+	 * in the commit.
+	 */
+	if (crtc_state->joiner_pipes)
+		crtc_state->vrr.in_range = 0;
+
 	vmin = intel_vrr_compute_vmin(crtc_state);
 
 	if (crtc_state->vrr.in_range) {
@@ -488,6 +492,9 @@ void intel_vrr_send_push(struct intel_dsb *dsb,
 	if (!crtc_state->vrr.enable)
 		return;
 
+	if (intel_crtc_is_joiner_secondary(crtc_state))
+		return;
+
 	if (dsb)
 		intel_dsb_nonpost_start(dsb);
 
-- 
2.45.2

