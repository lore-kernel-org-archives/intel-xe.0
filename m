Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBBACD98CC
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5FE10E328;
	Tue,  9 Jun 2026 12:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IsnIvZAc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA9010E31E;
 Tue,  9 Jun 2026 12:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781006657; x=1812542657;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pZihytRrLCcF4K/8eCTBsTSxmob2aDSeeSuyoIX5axU=;
 b=IsnIvZAcxoROd1z3/RIEnBL9BWs5Lte17S1ZgXQ0wYm0mrDEaviKEUAz
 nw1WnIHV2CnKUMBnDEB7O7Fc6uw3cDHg0Ds3O6GulO9H3EG4JAkN6dinr
 /tgwGoPz2lJUTmwsA5JBc0GVxsHd8jINLQf+wxeMrUoGYGFogIqiBa/EV
 tLVLrIVUwhdDk3Ba2RIMLx2etYhmfnE5F+kBB6CtUW4pzGWk2CMBajLyT
 xZLD9nWDHpxGzosWIVwIfnofVv/V5ad6rgQv2gbxDNyWLbYQ9Af1AZYk7
 GSWKZYqxye1v0y0H0FE/8yWPnn6tNYQI/4NpjvVnqdYelqzEuhn7P2OId A==;
X-CSE-ConnectionGUID: bMWwaeXNQbOZIeseq83HEA==
X-CSE-MsgGUID: lTWCJKYNRBurSe2U2DrSrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99340428"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99340428"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:17 -0700
X-CSE-ConnectionGUID: yNdr21JwQYSVreBX9jSA9g==
X-CSE-MsgGUID: wadaeFdaQWim6wizlcpIMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="244988459"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:16 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v3 28/36] drm/i915/display: Store DC3CO eligibility in PSR state
Date: Tue,  9 Jun 2026 17:32:42 +0530
Message-ID: <20260609120250.867750-29-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
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

Store DC3CO eligibility in intel_dp->psr during
intel_psr_post_plane_update() so PSR configuration
can take DC3CO into account.

This will be used to control PSR2 parameters such as idle frames.

Changes in v2:
- Use intel_display_power_dc3co_allowed(display) instead
  of intel_dc3co_allowed(state)

Changes in v4:
- Update psr.dc3co_eligible before
  intel_psr_enable_locked() call (sashiko)

Changes in v5:
- rename eligible to allowed (Jani Nikula)

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 2 ++
 drivers/gpu/drm/i915/display/intel_psr.c           | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index f18b13f3e99e..30feed50a2d1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1776,6 +1776,8 @@ struct intel_psr {
 	ktime_t last_exit;
 	bool sink_not_reliable;
 	bool irq_aux_error;
+	/* DC3CO allowed used to control PSR configuration */
+	bool dc3co_allowed;
 	u16 su_w_granularity;
 	u16 su_y_granularity;
 	bool source_panel_replay_support;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 932aff386023..0f4263885416 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2330,6 +2330,7 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 	intel_dp->psr.psr2_sel_fetch_cff_enabled = false;
 	intel_dp->psr.active_non_psr_pipes = 0;
 	intel_dp->psr.pkg_c_latency_used = 0;
+	intel_dp->psr.dc3co_allowed = false;
 }
 
 /**
@@ -3120,10 +3121,13 @@ void intel_psr_post_plane_update(struct intel_atomic_state *state,
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct intel_encoder *encoder;
+	bool dc3co_allowed;
 
 	if (!crtc_state->has_psr)
 		return;
 
+	dc3co_allowed = intel_display_power_dc3co_allowed(display);
+
 	verify_panel_replay_dsc_state(crtc_state);
 
 	for_each_intel_encoder_mask_with_psr(state->base.dev, encoder,
@@ -3151,6 +3155,8 @@ void intel_psr_post_plane_update(struct intel_atomic_state *state,
 			keep_disabled = true;
 		}
 
+		intel_dp->psr.dc3co_allowed = dc3co_allowed;
+
 		if (!psr->enabled && !keep_disabled)
 			intel_psr_enable_locked(intel_dp, crtc_state);
 		else if (psr->enabled && !crtc_state->wm_level_disabled)
-- 
2.43.0

