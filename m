Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48187CD37AC
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054D510E6E4;
	Mon, 11 May 2026 12:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mS21uxbu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF61C10E6E9;
 Mon, 11 May 2026 12:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778501785; x=1810037785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=381zPiy+ozUJfTW656U74+nwPlV0OaMzq+UVvOW/nBs=;
 b=mS21uxbuT9mO/8kn0uvJwN/bpEtgQJVfRuLIYgYrHTsfcr+NtBFwAwop
 HA1f0nRaFTc6XtnJvxBVcZEMjkRWd8JXanijKSBIPR7JDOAkRQVEPNz8T
 PCfjgTFcYKhDaL7W2BS48me9vIVSujRyLj/1w3tj+UJ+6akfQjabAsLQC
 7znmhWhoW+9yCy5aKDqW4MOXGVdZgxZsx/gjn5WHeZTc7BGGx5ySuVykM
 5H3jBX1lIOFnZMQoWpu9KERjkbMtR/2BJ9FfUpqfLIW2TnoZdUFqDmmrm
 Pgy2zx91m/JgU1Qr/WFavEdVbr50m2HdWnQ/uyy/IOye4/nghtc+eqHV6 g==;
X-CSE-ConnectionGUID: fFhvJAhNRXKaoe9ZRbATVg==
X-CSE-MsgGUID: 00cj7B9zRpuozvnZI/lwmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79333222"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="79333222"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:16:25 -0700
X-CSE-ConnectionGUID: UDXPR6TaSNS/Rw/kjamhQw==
X-CSE-MsgGUID: mrJgdtEfTp2UieP4V8Memg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="242405006"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.183])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:16:22 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 2/2] drm/i915/psr: Use DC_OFF wake reference to block DC6 on
 vblank enable
Date: Mon, 11 May 2026 15:15:51 +0300
Message-ID: <20260511121551.2373824-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511121551.2373824-1-jouni.hogander@intel.com>
References: <20260511121551.2373824-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We are observing following warnings:

*ERROR* power well DC_off state mismatch (refcount 0/enabled 1)

gen9_dc_off_power_well_enabled is concidering target state DC_STATE_DISABLE
as DC_OFF power well being enabled. Fix this by using wakeref for the
purpose.

Fixes: aa451abcffb5 ("drm/i915/display: Prevent DC6 while vblank is enabled for Panel Replay")
Cc: <stable@vger.kernel.org> # v6.13+
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  2 ++
 drivers/gpu/drm/i915/display/intel_psr.c      | 24 +++++++------------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 26e59110e743..e2861476b215 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1789,6 +1789,8 @@ struct intel_psr {
 	u8 active_non_psr_pipes;
 
 	const char *no_psr_reason;
+
+	struct ref_tracker *vblank_wakeref;
 };
 
 struct intel_dp {
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 657b1614cd65..a8f02f928bd8 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -4141,14 +4141,20 @@ void intel_psr_notify_vblank_enable_disable(struct intel_display *display,
 					    bool enable)
 {
 	struct intel_encoder *encoder;
-	bool block_dc_states = false;
 
 	for_each_intel_encoder_with_psr(display->drm, encoder) {
 		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 
 		mutex_lock(&intel_dp->psr.lock);
-		if (CAN_PANEL_REPLAY(intel_dp))
-			block_dc_states = true;
+		if (CAN_PANEL_REPLAY(intel_dp)) {
+			if (enable)
+				intel_dp->psr.vblank_wakeref =
+					intel_display_power_get(display,
+								POWER_DOMAIN_DC_OFF);
+			else
+				intel_display_power_put(display, POWER_DOMAIN_DC_OFF,
+							intel_dp->psr.vblank_wakeref);
+		}
 
 		if (intel_dp->psr.enabled && !intel_dp->psr.panel_replay_enabled &&
 		    intel_dp->psr.pkg_c_latency_used)
@@ -4156,18 +4162,6 @@ void intel_psr_notify_vblank_enable_disable(struct intel_display *display,
 
 		mutex_unlock(&intel_dp->psr.lock);
 	}
-
-	/*
-	 * NOTE: intel_display_power_set_target_dc_state is used
-	 * only by PSR code for DC3CO handling. DC3CO target
-	 * state is currently disabled in * PSR code. If DC3CO
-	 * is taken into use we need take that into account here
-	 * as well.
-	 */
-	if (block_dc_states)
-		intel_display_power_set_target_dc_state(display, enable ?
-							DC_STATE_DISABLE :
-							DC_STATE_EN_UPTO_DC6);
 }
 
 static void
-- 
2.43.0

