Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF111EA4FC2
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F1510E40B;
	Mon, 23 Feb 2026 14:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkvjvB9V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFE510E408;
 Mon, 23 Feb 2026 14:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855239; x=1803391239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oS6IeYpGO0r6aaQ8aNAC3ORri1O6IA7CxspLMU/AXMw=;
 b=EkvjvB9VuGku18dh57pb4bYiV3KrxUzTwoGoUXR8x2ePyjRdcrFWTGSB
 aZ4BDTtVmDibYryjQMbeoSBYsYmkiZB8BswhvEHOkMI7moFIPA3o/2uNu
 HPrtTbWiDDTTKNYGn5HPifVn+ZJDcMOu+arlNrLDM/FNoYfYYMy1P7WNu
 AdNYrfeRelscZ+6nM7xV2pF559ocY272OgqWKdnb8ypq8f/XYO0kdOfcA
 /IF5y1CtEbYrfcgxnfcZLmrGZ/jQxDB+37TPEiZN0gSj+2wr/x3Hb5pUJ
 FJlCw6KISBN7k7dvwTn3y2/MWKOReI5R98nCGK52QDsHIDn/Epz0fDx0L g==;
X-CSE-ConnectionGUID: RDAocY6US5G2KZZpM2UTAw==
X-CSE-MsgGUID: BcC6VXMXR5GwJ3y4UCbslA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72827084"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72827084"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:00:31 -0800
X-CSE-ConnectionGUID: lmTEVob6RTyeZI8VZGC92g==
X-CSE-MsgGUID: lWh3iOX9SsKgp3HQNgpWfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="212961291"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:00:29 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 14/14] drm/i915/dp: Account for AS_SDP guardband only when
 enabled
Date: Mon, 23 Feb 2026 19:14:31 +0530
Message-ID: <20260223134431.1639308-15-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260223134431.1639308-1-ankit.k.nautiyal@intel.com>
References: <20260223134431.1639308-1-ankit.k.nautiyal@intel.com>
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

Currently the intel_dp_sdp_min_guardband() accounts for AS_SDP for all
platforms that support adaptive sync SDP even for configurations where
it cannot be enabled. Instead account for adaptive sync SDP guardband
only when it is enabled.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ad2aceb526ff..70121f4d5a90 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7271,7 +7271,6 @@ int intel_dp_get_lines_for_sdp(const struct intel_crtc_state *crtc_state, u32 ty
 int intel_dp_sdp_min_guardband(const struct intel_crtc_state *crtc_state,
 			       bool assume_all_enabled)
 {
-	struct intel_display *display = to_intel_display(crtc_state);
 	int sdp_guardband = 0;
 
 	if (assume_all_enabled ||
@@ -7286,8 +7285,8 @@ int intel_dp_sdp_min_guardband(const struct intel_crtc_state *crtc_state,
 		sdp_guardband = max(sdp_guardband,
 				    intel_dp_get_lines_for_sdp(crtc_state, DP_SDP_PPS));
 
-	if ((assume_all_enabled && HAS_AS_SDP(display)) ||
-	    crtc_state->infoframes.enable & intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC))
+	if (crtc_state->infoframes.enable &
+	    intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC))
 		sdp_guardband = max(sdp_guardband,
 				    intel_dp_get_lines_for_sdp(crtc_state, DP_SDP_ADAPTIVE_SYNC));
 
-- 
2.45.2

