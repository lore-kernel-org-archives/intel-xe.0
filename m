Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2B5CD98E0
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5816D10E333;
	Tue,  9 Jun 2026 12:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bC7aWtW8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F30D10E32A;
 Tue,  9 Jun 2026 12:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781006661; x=1812542661;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=rFO150BR+tRDCP4Y5RhbhLAn9ivI+pubrU4nhHoZ+L8=;
 b=bC7aWtW82sYjCfMzz14Anl7w0aELc3Ac72Zw8GeLri9sBI9u6RI1dFQh
 TZsLjnTZcvDcLdJGQPijgXOs6HFDWAJRnMh0lu8t5QFMoCCd+1IcGDhd3
 +JNINXQ9pA3CBVoon2g1jPhHm8aDHu5rl1H74H3gY/5AeumrTS0a+UqMr
 k06f0JEN8yz7DlEDlgCSuXHbw6dGZFLFGFsjOgg4/JhDTU0x1mTANJ4Un
 5G/pNpi+T/hwhgolKJ0aqiwjyQ2dvC/0ZgeI1GVwMEiHCVGUfY74XAt2g
 7uEvJT6EqySL9NyH5bMl/cMFxNIs/fMnBsYd+aXVyCCKGfbiEGkrSagdK A==;
X-CSE-ConnectionGUID: e9Gsa3R0RVqDyE1qpv5bFw==
X-CSE-MsgGUID: +cvVZOcJR8C26cbSXofd+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99340436"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99340436"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:21 -0700
X-CSE-ConnectionGUID: OFrQnKoaRgumS1ppkqlMFA==
X-CSE-MsgGUID: p48kHT/cR1iYF0DQZVDCmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="244988467"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:20 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v3 31/36] drm/i915/display: PSR Add delayed work to exit DC3CO
Date: Tue,  9 Jun 2026 17:32:45 +0530
Message-ID: <20260609120250.867750-32-dibin.moolakadan.subrahmanian@intel.com>
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

For DC3CO, idle_frames is programmed to 0, so PSR does not
enter deep sleep. Add delayed work to schedule DC3CO exit
after an idle duration derived from frame time (minimum
equivalent of 6 frames).

The work is re-armed from the PSR flush path on relevant frontbuffer
activity. Once the display remains idle, DC3CO is disabled, idle frames
are reprogrammed to their normal value, and DC6 is enabled to allow
deeper power savings.

Changes in v2:
- Squash "PSR set idle frames while exit from DC3CO"
  into this patch (Uma Shankar)
- Add cancel_delayed_work() in intel_psr_disable_locked()
  before clearing dc3co_eligible (Uma Shankar)

Changes in v4:
- Re-arm cancelled DC3CO work in psr resume
- Schedule DC3CO work from intel_psr_post_plane_update(). This is to
  make sure DC3CO work scheduling will happen even without psr flush,
  which may be a valid scenario.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  2 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 62 ++++++++++++++++++-
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 30feed50a2d1..ebd00922bf3c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1778,6 +1778,8 @@ struct intel_psr {
 	bool irq_aux_error;
 	/* DC3CO allowed used to control PSR configuration */
 	bool dc3co_allowed;
+	/* DC3CO disable work */
+	struct delayed_work dc3co_work;
 	u16 su_w_granularity;
 	u16 su_y_granularity;
 	bool source_panel_replay_support;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 091da8341b0f..822bc1d6af53 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1774,6 +1774,51 @@ static bool intel_psr_needs_wa_18037818876(struct intel_dp *intel_dp,
 		!crtc_state->has_sel_update);
 }
 
+static void psr2_dc3co_disable_locked(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	if (intel_dp->psr.dc3co_allowed) {
+		intel_dp->psr.dc3co_allowed = false;
+		intel_display_power_set_target_dc_state(display, DC_STATE_EN_UPTO_DC6);
+		psr2_program_idle_frames(intel_dp, psr_compute_idle_frames(intel_dp));
+	}
+}
+
+static void psr2_dc3co_disable_work(struct work_struct *work)
+{
+	struct intel_dp *intel_dp =
+		container_of(work, typeof(*intel_dp), psr.dc3co_work.work);
+
+	mutex_lock(&intel_dp->psr.lock);
+	psr2_dc3co_disable_locked(intel_dp);
+	mutex_unlock(&intel_dp->psr.lock);
+}
+
+static void
+psr2_dc3co_flush_locked(struct intel_dp *intel_dp, unsigned int frontbuffer_bits,
+			enum fb_op_origin origin)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	if (!intel_dp->psr.dc3co_allowed)
+		return;
+
+	if (!intel_dp->psr.sel_update_enabled ||
+	    !intel_dp->psr.active)
+		return;
+	/*
+	 * At every frontbuffer flush flip event modified delay of delayed work,
+	 * when delayed work schedules that means display has been idle.
+	 */
+	if (!(frontbuffer_bits &
+	    INTEL_FRONTBUFFER_ALL_MASK(intel_dp->psr.pipe)))
+		return;
+
+	mod_delayed_work(display->wq.unordered, &intel_dp->psr.dc3co_work,
+			 intel_dp->psr.dc3co_exit_delay);
+}
+
 static
 void intel_psr_set_non_psr_pipes(struct intel_dp *intel_dp,
 				 struct intel_crtc_state *crtc_state)
@@ -2331,6 +2376,7 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 	intel_dp->psr.psr2_sel_fetch_cff_enabled = false;
 	intel_dp->psr.active_non_psr_pipes = 0;
 	intel_dp->psr.pkg_c_latency_used = 0;
+	cancel_delayed_work(&intel_dp->psr.dc3co_work);
 	intel_dp->psr.dc3co_allowed = false;
 }
 
@@ -2361,6 +2407,7 @@ void intel_psr_disable(struct intel_dp *intel_dp,
 
 	mutex_unlock(&intel_dp->psr.lock);
 	cancel_work_sync(&intel_dp->psr.work);
+	cancel_delayed_work_sync(&intel_dp->psr.dc3co_work);
 }
 
 /**
@@ -2391,6 +2438,7 @@ void intel_psr_pause(struct intel_dp *intel_dp)
 	mutex_unlock(&psr->lock);
 
 	cancel_work_sync(&psr->work);
+	cancel_delayed_work_sync(&psr->dc3co_work);
 }
 
 /**
@@ -2417,8 +2465,13 @@ void intel_psr_resume(struct intel_dp *intel_dp)
 		goto out;
 	}
 
-	if (--intel_dp->psr.pause_counter == 0)
+	if (--intel_dp->psr.pause_counter == 0) {
 		intel_psr_activate(intel_dp);
+		/* re-arm cancelled dc3co work from pause */
+		if (intel_dp->psr.dc3co_allowed)
+			mod_delayed_work(display->wq.unordered, &intel_dp->psr.dc3co_work,
+					 intel_dp->psr.dc3co_exit_delay);
+	}
 
 out:
 	mutex_unlock(&psr->lock);
@@ -3174,6 +3227,11 @@ void intel_psr_post_plane_update(struct intel_atomic_state *state,
 		 */
 		intel_dp->psr.busy_frontbuffer_bits = 0;
 
+		if (intel_dp->psr.dc3co_allowed) {
+			mod_delayed_work(display->wq.unordered, &intel_dp->psr.dc3co_work,
+					 intel_dp->psr.dc3co_exit_delay);
+		}
+
 		mutex_unlock(&psr->lock);
 	}
 }
@@ -3632,6 +3690,7 @@ void intel_psr_flush(struct intel_display *display,
 		if (origin == ORIGIN_FLIP ||
 		    (origin == ORIGIN_CURSOR_UPDATE &&
 		     !intel_dp->psr.psr2_sel_fetch_enabled)) {
+			psr2_dc3co_flush_locked(intel_dp, frontbuffer_bits, origin);
 			goto unlock;
 		}
 
@@ -3690,6 +3749,7 @@ void intel_psr_init(struct intel_dp *intel_dp)
 		intel_dp->psr.link_standby = connector->panel.vbt.psr.full_link;
 
 	INIT_WORK(&intel_dp->psr.work, intel_psr_work);
+	INIT_DELAYED_WORK(&intel_dp->psr.dc3co_work, psr2_dc3co_disable_work);
 	mutex_init(&intel_dp->psr.lock);
 }
 
-- 
2.43.0

