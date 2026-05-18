Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1815BCD343F
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 05:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB9B10E5A4;
	Mon, 18 May 2026 05:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkQn+XQy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EDA10E5A1;
 Mon, 18 May 2026 05:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779082004; x=1810618004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+9qitLJRAiMGVE3LpBDcg95Rgz3qmcGInO4o2aq3+hs=;
 b=RkQn+XQypAeUmvBlsXRX98vxdApdx/1d/zGukIkkk/+KFPCfOAw59jZK
 jb/V2phddZxQOCQf30Es6XaugAdEZ+4qC1noayS2Yrq8kRTJG7XfPV8AL
 4qBrr/yESYxskBV26AOES16wPqe/W0WyXMxNRaHeSJJQNAgQgc7bVRtCw
 ZJftEvta3i5kTLJUtLPFnThWQblolXEPP1OIKg72lVaSFOB61/VBztLjB
 F5ioRvCK5czq2zWyLV6to+UAI8JxUqzQo5kuDDNwIFl63MOE+i1WUFsdF
 1PoNsJEGuFQyVX9yD0Ac8qLd4n1dBDBk8XOGihOTZJBYWSynb1lMFa9Kg Q==;
X-CSE-ConnectionGUID: tZPUX4gySxmrS939nmwqeg==
X-CSE-MsgGUID: Nw0K3jhCQB6MNCdWXBcxpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79064898"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="79064898"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 22:26:44 -0700
X-CSE-ConnectionGUID: GunjJWKTRriJ4VXBEu266Q==
X-CSE-MsgGUID: jxF1iYz0TACfYWu6mw7r5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="243606154"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 22:26:43 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 01/12] drm/i915/psr: Add helper to get Async Video timing
 support in PR active
Date: Mon, 18 May 2026 10:42:04 +0530
Message-ID: <20260518051216.2936634-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260518051216.2936634-1-ankit.k.nautiyal@intel.com>
References: <20260518051216.2936634-1-ankit.k.nautiyal@intel.com>
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

