Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3C1FED2D7
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 05:30:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D94910E969;
	Thu, 12 Mar 2026 05:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgIdCoer";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04D910E965;
 Thu, 12 Mar 2026 05:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773293440; x=1804829440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kQ9l7DHaob2QuCc9fdJa/m5lIzv4Pz1SHUXWI4IK9rw=;
 b=bgIdCoerL9ugpOKkD1BUmp64vS9TvzD6Jj0ueZp6U86IalPn+8Tk4NEg
 HcpZIgy7PiIwBJMZkBBTyC/KHigCT13V/xts+1mCJsw/A0vfkTr4PbJ23
 BjGMoBfAKH0InVgDmZRZrgxXC9gtuIsJDMJ6QQSjg8Lrbg6Z+gc9imdmm
 paCxdHMrDJJJ6pPagpBDMzGHecw93RsDWNWmGqhxMeIes3WbFEN+jxvYU
 bzIQplRj6noxg7CDFc+SmD0EZ0Q7FDOiRzt9/vP0m2qyEtKRjc6SEblU1
 EtIDL2Wsg5HTSeCjCl9E+V2mQs2L5z5L7o1E7y76G1xoOG/xfvbAhp8bY Q==;
X-CSE-ConnectionGUID: 1jNjbjhKQpGi/9sRV1OlpQ==
X-CSE-MsgGUID: 4pgwcDWWSvWAxFBGC0QKJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74253905"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74253905"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 22:30:40 -0700
X-CSE-ConnectionGUID: +afvBEy/S4KLdhfTf8VA5Q==
X-CSE-MsgGUID: Z2pKqjZlQeWpT9UWV9ld3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="258611074"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa001.jf.intel.com with ESMTP; 11 Mar 2026 22:30:37 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jouni.hogander@intel.com, imre.deak@intel.com, jani.nikula@intel.com,
 arun.r.murthy@intel.com, Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v7 3/3] drm/i915/display: Disable Panel Replay for
 DP-tunneling without optimization
Date: Thu, 12 Mar 2026 10:30:35 +0530
Message-Id: <20260312050035.3493690-4-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260312050035.3493690-1-animesh.manna@intel.com>
References: <20260312050035.3493690-1-animesh.manna@intel.com>
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
index 632527ede29f..3ec407a801b1 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1796,6 +1796,13 @@ static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
 	crtc_state->link_off_after_as_sdp_when_pr_active = compute_link_off_after_as_sdp_when_pr_active(connector);
 	crtc_state->disable_as_sdp_when_pr_active = compute_disable_as_sdp_when_pr_active(connector);
 
+	if (intel_dp_tunnel_bw_alloc_is_enabled(intel_dp) &&
+	    !intel_dp_tunnel_pr_optimization_supported(intel_dp)) {
+		drm_dbg_kms(display->drm,
+			    "Panel Replay is disabled as DP tunelling enabled without optimization\n");
+		return false;
+	}
+
 	if (!intel_dp_is_edp(intel_dp))
 		return true;
 
-- 
2.29.0

