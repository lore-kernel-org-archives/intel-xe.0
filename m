Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B97CD343F
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 04:09:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01DF10E596;
	Mon, 18 May 2026 04:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dh1rlbjG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9ED10E2DC;
 Mon, 18 May 2026 04:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779077371; x=1810613371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+9qitLJRAiMGVE3LpBDcg95Rgz3qmcGInO4o2aq3+hs=;
 b=Dh1rlbjG47BqeCo8/7+NLKWPK5KPokbG47zR4gfbA9lQk6YvnjQZdA+7
 A07EBn0YY1E5VG1IwdH8rxzKjyDkys8jEBlMTIAq2yTlununEE0kJdXkV
 BE2sRSJYNVExAyi7Jx35ykmJtGkKGvJSv1rQZMyT8D9yCMrBQ2bopTt0N
 skQeQZcddzOGPPxvTjowLfHxVGeC25X2YWbFNGoBFtuzfWk2lbU3FBTaK
 8ySUwfNCnL28uRpOm6EWh1mOQUZAVCe6BNMgLf5xS4UYxxDnXUaJfowpB
 8HjJT5BKyz6vPA1noIcaNWyirXNlTH+vUDF/0JjTufOP6r3ufchWmOHvH A==;
X-CSE-ConnectionGUID: EfJYltd4TOSX1uQDvzyPsw==
X-CSE-MsgGUID: EZ938jtpTZOggjdH9BY0ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="97495601"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="97495601"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 21:09:30 -0700
X-CSE-ConnectionGUID: LcTt4XkORoO4ungo3Zbzbw==
X-CSE-MsgGUID: idfEFJfiTXCOd+ryPNcE0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="277403502"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 21:09:28 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 01/11] drm/i915/psr: Add helper to get Async Video timing
 support in PR active
Date: Mon, 18 May 2026 09:24:51 +0530
Message-ID: <20260518035502.2909359-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260518035502.2909359-1-ankit.k.nautiyal@intel.com>
References: <20260518035502.2909359-1-ankit.k.nautiyal@intel.com>
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

Introduce a helper to check if Panel Replay has Async Video Timing support
during PR Active state.

v2: Confirm that Panel Replay is supported before checking for
    Async Video Timing Support during PR active. (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 11 +++++++++++
 drivers/gpu/drm/i915/display/intel_psr.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 892d209dce1b..431468103f51 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -4655,3 +4655,14 @@ bool intel_psr_use_trans_push(const struct intel_crtc_state *crtc_state)
 
 	return HAS_PSR_TRANS_PUSH_FRAME_CHANGE(display) && crtc_state->has_psr;
 }
+
+bool intel_psr_pr_async_video_timing_supported(struct intel_dp *intel_dp)
+{
+	struct intel_connector *connector = intel_dp->attached_connector;
+	u8 *dpcd = connector->dp.panel_replay_caps.dpcd;
+	u8 pr_support = dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)];
+	u8 pr_cap = dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)];
+
+	return (pr_support & DP_PANEL_REPLAY_SUPPORT) &&
+		!(pr_cap & DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index 394b641840b3..29723e63888f 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -86,5 +86,6 @@ void intel_psr_compute_config_late(struct intel_dp *intel_dp,
 				   struct intel_crtc_state *crtc_state);
 int intel_psr_min_guardband(struct intel_crtc_state *crtc_state);
 bool intel_psr_use_trans_push(const struct intel_crtc_state *crtc_state);
+bool intel_psr_pr_async_video_timing_supported(struct intel_dp *intel_dp);
 
 #endif /* __INTEL_PSR_H__ */
-- 
2.45.2

