Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C81CA9ED2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2582810E564;
	Mon, 12 Oct 2026 12:41:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015AC10E564;
 Mon, 12 Oct 2026 12:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791808911; x=1823344911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1INcVm8MwO9pooixCOYlGY5XdFrGHIC4vMQllpanfgA=;
 b=Jbt2OsHRWEufmaMUnIHun/kw6aX0RaZBD9DyRHhvoYUg5YGpbxDb2P6J
 m1EhF4bGMy6xQYSoQrIye5n7G9pHW7G83ivFwOgMJGgB8Qe4Rsys+qir5
 onj1tRNRXyZYm/F1M2saqX+GB+lLsknHQ+c2Ai20CmjRXQbiUzvt70YiE
 MZIM20qEsfjjR4DcDMsvihDOUskAtXL1FfQvDPEnHTvKKRE2YSaUkNlX3
 GUygZ4DemUJjkpHrkLyEbMdc8THZjwh4v9s5ZWlAwZ2ptlWtFvgutTbGY
 TVtYwpP04gfG9gJnvIgzYRPCooerjOnGd97lcXklI6htyXeZ/k1ZVVjFJ w==;
X-CSE-ConnectionGUID: t0kI5BxFQa65iYF29RGuFg==
X-CSE-MsgGUID: Lg7LC0HrSqSH8dWmHigrlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="506202"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="506202"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 05:41:50 -0700
X-CSE-ConnectionGUID: cDY9tPDxSJKO7ZxTMeJSlw==
X-CSE-MsgGUID: iG1C0TSOT+m6xZ8OLr1HuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="808144"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa007.jf.intel.com with ESMTP; 12 Oct 2026 05:41:49 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 1/6] drm/i915/psr: Track all joined pipes for frontbuffer
 tracking
Date: Mon, 12 Oct 2026 12:41:40 +0000
Message-ID: <20261012124145.1960050-2-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012124145.1960050-1-mika.kahola@intel.com>
References: <20261012124145.1960050-1-mika.kahola@intel.com>
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

psr.pipe is the joiner primary only, so frontbuffer bits coming from a
secondary pipe get masked out and the update goes unnoticed. Add
psr.pipe_mask covering every joined pipe and use that instead.

No functional change, joiner is still rejected in compute_config().

v2: Split the active_non_psr_pipes change into its own patch (Jouni)

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 25 ++++++++++++++-----
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 79f30660c2b6..2e6e3661675c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1798,6 +1798,7 @@ struct intel_psr {
 	bool enabled;
 	int pause_counter;
 	enum pipe pipe;
+	u8 pipe_mask;
 	enum transcoder transcoder;
 	bool active;
 	struct work_struct work;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 872e253db178..0d4f71f14396 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -36,6 +36,7 @@
 #include "intel_cursor_regs.h"
 #include "intel_ddi.h"
 #include "intel_de.h"
+#include "intel_display.h"
 #include "intel_display_irq.h"
 #include "intel_display_regs.h"
 #include "intel_display_rpm.h"
@@ -1798,6 +1799,19 @@ static void psr2_dc3co_disable_work(struct work_struct *work)
 	mutex_unlock(&intel_dp->psr.lock);
 }
 
+/* Frontbuffer bits for every pipe driving this PSR/Panel Replay instance. */
+static unsigned int psr_frontbuffer_mask(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	unsigned int mask = 0;
+	enum pipe pipe;
+
+	for_each_pipe_masked(display, pipe, intel_dp->psr.pipe_mask)
+		mask |= INTEL_FRONTBUFFER_ALL_MASK(pipe);
+
+	return mask;
+}
+
 static void
 psr2_dc3co_flush_locked(struct intel_dp *intel_dp, unsigned int frontbuffer_bits)
 {
@@ -1813,8 +1827,7 @@ psr2_dc3co_flush_locked(struct intel_dp *intel_dp, unsigned int frontbuffer_bits
 	 * At every frontbuffer flush flip event modified delay of delayed work,
 	 * when delayed work schedules that means display has been idle.
 	 */
-	if (!(frontbuffer_bits &
-	    INTEL_FRONTBUFFER_ALL_MASK(intel_dp->psr.pipe)))
+	if (!(frontbuffer_bits & psr_frontbuffer_mask(intel_dp)))
 		return;
 
 	mod_delayed_work(display->wq.unordered, &intel_dp->psr.dc3co_work,
@@ -2175,6 +2188,7 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 	intel_dp->psr.panel_replay_enabled = crtc_state->has_panel_replay;
 	intel_dp->psr.busy_frontbuffer_bits = 0;
 	intel_dp->psr.pipe = to_intel_crtc(crtc_state->uapi.crtc)->pipe;
+	intel_dp->psr.pipe_mask = intel_crtc_joined_pipe_mask(crtc_state);
 	intel_dp->psr.transcoder = crtc_state->cpu_transcoder;
 	/* DC5/DC6 requires at least 6 idle frames */
 	val = usecs_to_jiffies(intel_get_frame_time_us(crtc_state) * 6);
@@ -2394,6 +2408,7 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 	intel_dp->psr.psr2_sel_fetch_cff_enabled = false;
 	intel_dp->psr.active_non_psr_pipes = 0;
 	intel_dp->psr.pkg_c_latency_used = 0;
+	intel_dp->psr.pipe_mask = 0;
 	cancel_delayed_work(&intel_dp->psr.dc3co_work);
 	intel_dp->psr.dc3co_allowed = false;
 }
@@ -3627,8 +3642,7 @@ void intel_psr_invalidate(struct intel_display *display,
 			continue;
 		}
 
-		pipe_frontbuffer_bits &=
-			INTEL_FRONTBUFFER_ALL_MASK(intel_dp->psr.pipe);
+		pipe_frontbuffer_bits &= psr_frontbuffer_mask(intel_dp);
 		intel_dp->psr.busy_frontbuffer_bits |= pipe_frontbuffer_bits;
 
 		if (pipe_frontbuffer_bits)
@@ -3708,8 +3722,7 @@ void intel_psr_flush(struct intel_display *display,
 			continue;
 		}
 
-		pipe_frontbuffer_bits &=
-			INTEL_FRONTBUFFER_ALL_MASK(intel_dp->psr.pipe);
+		pipe_frontbuffer_bits &= psr_frontbuffer_mask(intel_dp);
 		intel_dp->psr.busy_frontbuffer_bits &= ~pipe_frontbuffer_bits;
 
 		/*
-- 
2.43.0

