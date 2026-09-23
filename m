Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BC3C98307
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 12:00:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD4A10EFE9;
	Wed, 23 Sep 2026 12:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WdsWgR41";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A377910EFE9;
 Wed, 23 Sep 2026 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790164825; x=1821700825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rit0vFkavE1ncamWfEYe0E0vvFGdgJp8LaIOdOIqzxk=;
 b=WdsWgR41SHwRpDXlWWw/JBCKcqYvmReikzuwiITDN8zy7MtQ5z4sAVIE
 4ivApGrDqw7ID6QxZVdZUtz75fM1Vv2kUIWEn1LbuyI7YlmTF3V4g6ZU/
 J948llG/ATV6EgoTiMwbEt9NjITmJ5IxCAVdXElyMBj/KSg2dK0zFpDyV
 gLIh1K1BxgPGU3EvOIyZ+tHoE9HTZFwRYjZGn0Cfz6p1TuHiW9rWmsJoY
 1BcxZ878W6h/453BP3z+xWJLoQXDDeQMOtWSxcW8vMXrvbI8ITogadXCK
 68TbUPERCR0WlgtXCdzxWIg6MHEnd7yDkRJPdZ8oQUTFdXgDP0h6tYaEe g==;
X-CSE-ConnectionGUID: iRiqk7LURWqzJrW/vnV98Q==
X-CSE-MsgGUID: ZL7S6KILSCCa5vDfX1/AqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90965113"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="90965113"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 04:59:45 -0700
X-CSE-ConnectionGUID: PbMZ+91nSkaR8gUMWJkPiA==
X-CSE-MsgGUID: 2W2ppZB9R/WhMfww9qKYUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4665824"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa012.fm.intel.com with ESMTP; 23 Sep 2026 04:59:45 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH] drm/i915/psr: Track all joined pipes for frontbuffer tracking
Date: Wed, 23 Sep 2026 11:59:37 +0000
Message-ID: <20260923115941.746934-2-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923115941.746934-1-mika.kahola@intel.com>
References: <20260923115941.746934-1-mika.kahola@intel.com>
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

Assisted-by: Copilot:claude-opus-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 27 ++++++++++++++-----
 2 files changed, 21 insertions(+), 7 deletions(-)

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
index 872e253db178..76260ceb49cb 100644
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
@@ -1845,7 +1858,7 @@ void intel_psr_set_non_psr_pipes(struct intel_dp *intel_dp,
 	active_pipes = intel_calc_active_pipes(state, active_pipes);
 
 	crtc_state->active_non_psr_pipes = active_pipes &
-		~BIT(to_intel_crtc(crtc_state->uapi.crtc)->pipe);
+		~intel_crtc_joined_pipe_mask(crtc_state);
 }
 
 void intel_psr_compute_config(struct intel_dp *intel_dp,
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
