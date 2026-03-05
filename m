Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7543F3092C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 12:50:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E6410EB92;
	Thu,  5 Mar 2026 12:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0+e6wou";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC79B10EB92;
 Thu,  5 Mar 2026 12:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772715008; x=1804251008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C0xMftt6J5UyyDkeDGCTlSCl4RAxiSDM0aT6J/6m4ec=;
 b=c0+e6wou4dljhOuR9w9IoLAmTOCqgN+GtXxWtZj85mXTicBClFbu7ALV
 gGgkqg1Z5ZeGkoq/pH6biaqgHvFw2txFvUocC+ZnI9WMyHSKP02OevX2z
 cNYphnpAZ9/AX2TbLMS4Qgdbb7oe+AqEVUOY9UZQlRawgJbBd/SElskbs
 GViYHWHgecTR2WXeyMSZYwOWQLk031gCfB7E5WELJx+GABCrstHDjQXNe
 Y752L3/oO8IDHg4uyGH5ViLjV3pRswQ5evNzOUtGWPHOYHYiwf0zF0b06
 hHzlW773iXWLv32SdFpjrAWaPmFXAQghi1izGw6nN/AXZLfsKrVXqWSb9 A==;
X-CSE-ConnectionGUID: sGMeacvFS8mG+bJ5TfVjNQ==
X-CSE-MsgGUID: Xf2SxOesTiG1DQFy6JSNtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73706867"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73706867"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:50:07 -0800
X-CSE-ConnectionGUID: 6UtncMMqQLuri4dpMdU+MA==
X-CSE-MsgGUID: qpoRz3ytQIi7PkfthFmlXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="215483452"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2026 04:50:06 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v6 2/2] drm/i915/display: Disable Panel Replay for
 DP-tunneling without optimization
Date: Thu,  5 Mar 2026 17:50:11 +0530
Message-Id: <20260305122011.3297262-3-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260305122011.3297262-1-animesh.manna@intel.com>
References: <20260305122011.3297262-1-animesh.manna@intel.com>
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

As per DP specification,
    The DP Source device may optionally enable PR optimization
    with DP tunneling. The device shall query the Tunneling Bridge’s
    PR tunneling optimization capability by way of the
    Panel_Replay_Tunneling_Optimization_Support bit in the
    DP_TUNNELING_CAPABILITIES register (DPCD E000Dh[6]), and then enable PR
    only when the Tunneling Bridge is capable.

Therefore, do not enable Panel Replay for DP tunneling when optimization
support is not available.

Suggested-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 27ba96ede8e2..a7818a556076 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1802,6 +1802,13 @@ static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
 	crtc_state->link_off_after_as_sdp_when_pr_active = compute_link_off_after_as_sdp_when_pr_active(connector);
 	crtc_state->disable_as_sdp_when_pr_active = compute_disable_as_sdp_when_pr_active(connector);
 
+	if (intel_dp_tunnel_bw_alloc_is_enabled(intel_dp) &&
+	    !connector->dp.panel_replay_caps.optimization_support) {
+		drm_dbg_kms(display->drm,
+			    "Panel Replay is disabled as DP tunelling enabled without optimization\n");
+		return false;
+	}
+
 	if (!intel_dp_is_edp(intel_dp))
 		return true;
 
-- 
2.29.0

