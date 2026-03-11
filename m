Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247F01062874
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 11:51:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF90910E8AE;
	Wed, 11 Mar 2026 11:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bi81MSkX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC7710E8AC;
 Wed, 11 Mar 2026 11:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773229910; x=1804765910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BlS4gAPYORbesb/YCH/syAFE8bEGTIot/mt0b6OhHQc=;
 b=bi81MSkX+srej/r0rH0dHgzzs0hnUQU2JP1MnLxkCGi5kunleUh7LFsT
 TqiO6wc7Wclwv5ZE+lTDOMTnnrDDa5DDakvbdCybx3CzHn+7E6l6i/kKC
 yN9xL0B+kuKieZ2QPMtSVHXHyAw2EZ1UAzEiiblRrNNIVQ2w3TD2s6qib
 7TygPLBZbYrmX5MX+X93fH814SLyZhwPIAT1ERlfruFi4rWdNyQpaYFRq
 1tKAnCYf/lzszHG4eOckHKma0LwbBWjevxtEYDuujaygGbWo98s6zhLUn
 sr2MLTR6A7OZEvY/kBEAjYtOo5UcqlyhXmYe4zY25D0baLNhUPJOJIL1p g==;
X-CSE-ConnectionGUID: ngHxZFoER7qt9PCWxhUJNQ==
X-CSE-MsgGUID: NmdltFqCRoyBvoVTn2gEEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74204983"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74204983"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:51:50 -0700
X-CSE-ConnectionGUID: WOIKaHTyRF607h+NYreT7g==
X-CSE-MsgGUID: TRIkhtj9SyGzwctjQSdXSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224602354"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:51:47 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 08/19] drm/i915/dp: Add a helper to decide if AS SDP can be
 used
Date: Wed, 11 Mar 2026 17:06:00 +0530
Message-ID: <20260311113611.3393194-9-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260311113611.3393194-1-ankit.k.nautiyal@intel.com>
References: <20260311113611.3393194-1-ankit.k.nautiyal@intel.com>
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

Add a helper that determines whether AS SDP can be used for the
current DP configuration. For now this is true only when the sink
supports AS SDP and VRR is enabled, but more conditions may be added
later.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 10927bc836d6..41908f68ffba 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3124,6 +3124,15 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
 	vsc->content_type = DP_CONTENT_TYPE_NOT_DEFINED;
 }
 
+static bool intel_dp_can_use_as_sdp(struct intel_dp *intel_dp,
+				    struct intel_crtc_state *crtc_state)
+{
+	if (!intel_dp->as_sdp_supported)
+		return false;
+
+	return crtc_state->vrr.enable;
+}
+
 static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 				    struct intel_crtc_state *crtc_state)
 {
@@ -3131,7 +3140,7 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 
-	if (!crtc_state->vrr.enable || !intel_dp->as_sdp_supported)
+	if (!intel_dp_can_use_as_sdp(intel_dp, crtc_state))
 		return;
 
 	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);
-- 
2.45.2

