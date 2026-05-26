Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39EDCD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 19:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659C010E54F;
	Tue, 26 May 2026 19:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esaaoogO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC15510E50D;
 Tue, 26 May 2026 19:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779823148; x=1811359148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qr8QjVNpzVoczjDKqq0APi/F2LF7s8GkkF9XqtuCS/8=;
 b=esaaoogOPDOqGz1XIUahh1roMxzJ+9b+OnXNM7cVsw6y4MCwopFFifqL
 3hY7O1HpZ9W40hlyV0ndvlAiZ25jKl/LUukFwBppcZz0Y8ahMTkbkUfZD
 8q2MT1ZFi328AkhELIS2V/ambqKwrxWdAnoOQR+YFHmpVfM7q6FINeOHm
 ++Sc2lyQt7NVsMAp45N3yMs4mG2pIhAO6YTX7GbURCyxnwGdJuawdTecE
 6LSQPstE9yjStO1B8jvm/ReFnes/4sZeKuodD5Em7bUxk+1ifbyoOh9U4
 C5UTJQ0VhCoNQevfyP/3qL4obq+n5bz2w1IuYtz+QrtnqdplLHg3mEBA7 Q==;
X-CSE-ConnectionGUID: t4wsv3l5SUSu8F8ntsfNhA==
X-CSE-MsgGUID: lmCbFEMVTdWlUCUO6iHvaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="83226296"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="83226296"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:19:07 -0700
X-CSE-ConnectionGUID: fTiS9Yh/Se6vgHaiXuoKsA==
X-CSE-MsgGUID: VGD3zxYkQUuxbdgQNgxu9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="237841888"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:19:06 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com,
	uma.shankar@intel.com
Subject: [PATCH v4 08/13] drm/i915/display: Store DC3CO eligibility in PSR
 state
Date: Wed, 27 May 2026 00:48:21 +0530
Message-ID: <20260526191826.3786009-9-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526191826.3786009-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260526191826.3786009-1-dibin.moolakadan.subrahmanian@intel.com>
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

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 2 ++
 drivers/gpu/drm/i915/display/intel_psr.c           | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 1cfc585530dc..c21f5d1e2003 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1770,6 +1770,8 @@ struct intel_psr {
 	ktime_t last_exit;
 	bool sink_not_reliable;
 	bool irq_aux_error;
+	/* DC3CO eligibility used to control PSR configuration */
+	bool dc3co_eligible;
 	u16 su_w_granularity;
 	u16 su_y_granularity;
 	bool source_panel_replay_support;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 730ca7af7873..d4b294beecef 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2300,6 +2300,7 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 	intel_dp->psr.psr2_sel_fetch_cff_enabled = false;
 	intel_dp->psr.active_non_psr_pipes = 0;
 	intel_dp->psr.pkg_c_latency_used = 0;
+	intel_dp->psr.dc3co_eligible = false;
 }
 
 /**
@@ -3090,10 +3091,14 @@ void intel_psr_post_plane_update(struct intel_atomic_state *state,
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct intel_encoder *encoder;
+	bool dc3co_eligible;
 
 	if (!crtc_state->has_psr)
 		return;
 
+	dc3co_eligible = intel_display_power_dc3co_allowed(display) &&
+			      intel_display_power_dc3co_supported(display);
+
 	verify_panel_replay_dsc_state(crtc_state);
 
 	for_each_intel_encoder_mask_with_psr(state->base.dev, encoder,
@@ -3121,6 +3126,8 @@ void intel_psr_post_plane_update(struct intel_atomic_state *state,
 			keep_disabled = true;
 		}
 
+		intel_dp->psr.dc3co_eligible = dc3co_eligible;
+
 		if (!psr->enabled && !keep_disabled)
 			intel_psr_enable_locked(intel_dp, crtc_state);
 		else if (psr->enabled && !crtc_state->wm_level_disabled)
-- 
2.43.0

