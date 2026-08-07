Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC19C5AC81
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 12:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F0610F4A7;
	Fri,  7 Aug 2026 12:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O1QxT6xs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8DB10F4A1;
 Fri,  7 Aug 2026 12:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786104945; x=1817640945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9HPA/5mtrUbd+3/u56ihUd38xukLuMdaBaQfQh5xIyE=;
 b=O1QxT6xsnNPUs0QGinK7EwRw9X5Xxx3Khq80uutk0QxSIGbl9roB0g+W
 wIpcPaIIrjdVjiPzpw/4SGWpfe/X6wofG1/Egrl7GZWwVABk/gi/jVU3/
 pg1x46LVjvcnvTtVjVoKExpjQZfo3ouzilZ+DXm0J/Z2n94HtsNygLHR0
 jbl0wR4hyAj50uLd5491xhByw3hqkUbaz3HEmYWIyX+0TQSMdJMEVCCEs
 n8UkWMK6CVDyM3rnLOckPBevT5hVsfgp1QHS/cOFDWt8UxSalUYTCxit5
 3Jbv9wtrutRrsfH2O1DgU9FoPaO3EO72C4KqymgbDC2QzkjVM9d0Ckwqv g==;
X-CSE-ConnectionGUID: VT7jDkm4Q3CBycWP7DESTA==
X-CSE-MsgGUID: UNWyE3KWQO+KiOOd9MQ67g==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86562842"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86562842"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:15:45 -0700
X-CSE-ConnectionGUID: Z0cuM+lnQFGK3c8MYLVeUQ==
X-CSE-MsgGUID: O+Zx2LbTR1WFeILtVrSCtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="260611608"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa006.jf.intel.com with ESMTP; 07 Aug 2026 05:15:44 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 1/3] drm/i915/display: Flush frontbuffer tracking on flipq
 completion
Date: Fri,  7 Aug 2026 12:15:38 +0000
Message-ID: <20260807121540.2032283-2-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807121540.2032283-1-mika.kahola@intel.com>
References: <20260807121540.2032283-1-mika.kahola@intel.com>
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

Flipq commits execute asynchronously via the pipe DMC, but we don't
notify frontbuffer tracking when they actually complete. A CRC grabbed
right after can therefore observe stale state (kms_cursor_crc's
cursor-alpha-opaque hits this).

Stash the fb_bits on the crtc when arming the commit, and flush
frontbuffer/FBC from a worker once intel_dsb_irq_handler() sees the
completion interrupt. Can't call these directly from there, it's
hardirq context and they may sleep.

Also flush (rather than drop) any pending completion when the crtc
gets disabled out from under it.

Assisted-by: Copilot:claude-sonnet-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c     |  3 +
 drivers/gpu/drm/i915/display/intel_display.c  |  3 +
 .../drm/i915/display/intel_display_types.h    |  9 +++
 drivers/gpu/drm/i915/display/intel_dsb.c      | 65 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dsb.h      |  2 +
 drivers/gpu/drm/i915/display/intel_fbc.c      | 21 ++++++
 drivers/gpu/drm/i915/display/intel_fbc.h      |  1 +
 7 files changed, 104 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 10ed9bdfee76..71559f86fa63 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -25,6 +25,7 @@
 #include "intel_display_trace.h"
 #include "intel_display_types.h"
 #include "intel_drrs.h"
+#include "intel_dsb.h"
 #include "intel_dsi.h"
 #include "intel_fifo_underrun.h"
 #include "intel_parent.h"
@@ -341,6 +342,8 @@ static int __intel_crtc_init(struct intel_display *display, enum pipe pipe)
 	crtc->pipe = pipe;
 	crtc->num_scalers = DISPLAY_RUNTIME_INFO(display)->num_scalers[pipe];
 
+	intel_dsb_crtc_init(crtc);
+
 	if (DISPLAY_VER(display) >= 9)
 		primary = skl_universal_plane_create(display, pipe, PLANE_1);
 	else
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 829d7a411dcc..5cdaa59f005e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6889,6 +6889,8 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 	if (new_crtc_state->use_flipq) {
 		intel_flipq_enable(new_crtc_state);
 
+		crtc->flipq_fb_bits = new_crtc_state->fb_bits;
+
 		intel_crtc_prepare_vblank_event(new_crtc_state, &crtc->flipq_event);
 
 		intel_flipq_add(crtc, INTEL_FLIPQ_PLANE_1, 0, INTEL_DSB_0,
@@ -6969,6 +6971,7 @@ static void intel_old_crtc_state_disables(struct intel_atomic_state *state,
 			intel_atomic_get_new_crtc_state(state, pipe_crtc);
 
 		pipe_crtc->active = false;
+		intel_dsb_crtc_disable(pipe_crtc);
 		intel_fbc_disable(pipe_crtc);
 
 		if (!new_pipe_crtc_state->hw.active)
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 20a07ea06b5e..c644ca0fe9b8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1522,6 +1522,15 @@ struct intel_crtc {
 	struct drm_pending_vblank_event *dsb_event;
 	/* armed event for flip queue based updates */
 	struct drm_pending_vblank_event *flipq_event;
+	/*
+	 * Frontbuffer bits for a pending flipq/DSB-driven visible update.
+	 */
+	unsigned int flipq_fb_bits;
+	/*
+	 * intel_dsb_irq_handler() runs in hardirq context, so the
+	 * frontbuffer/FBC flush for flipq_fb_bits is deferred to this worker.
+	 */
+	struct work_struct flipq_fb_bits_work;
 
 	/* Access to these should be protected by display->irq.lock. */
 	bool cpu_fifo_underrun_disabled;
diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index d9a270362a82..66f107493f93 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -17,6 +17,8 @@
 #include "intel_display_types.h"
 #include "intel_dsb.h"
 #include "intel_dsb_regs.h"
+#include "intel_fbc.h"
+#include "intel_frontbuffer.h"
 #include "intel_psr.h"
 #include "intel_vblank.h"
 #include "intel_vrr.h"
@@ -1106,6 +1108,59 @@ void intel_dsb_cleanup(struct intel_dsb *dsb)
 	kfree(dsb);
 }
 
+/*
+ * Frontbuffer/FBC bookkeeping for a completed flipq commit may sleep (takes
+ * mutexes), but intel_dsb_irq_handler() runs in hardirq context, so do it
+ * here instead, on display->wq.unordered.
+ */
+static void intel_dsb_flipq_fb_bits_work(struct work_struct *work)
+{
+	struct intel_crtc *crtc =
+		container_of(work, typeof(*crtc), flipq_fb_bits_work);
+	struct intel_display *display = to_intel_display(crtc);
+	unsigned int flipq_fb_bits;
+
+	spin_lock_irq(&display->drm->event_lock);
+	flipq_fb_bits = crtc->flipq_fb_bits;
+	crtc->flipq_fb_bits = 0;
+	spin_unlock_irq(&display->drm->event_lock);
+
+	if (!flipq_fb_bits)
+		return;
+
+	intel_frontbuffer_flip(display, flipq_fb_bits);
+	intel_fbc_flipq_post_update(display, crtc->pipe);
+}
+
+/**
+ * intel_dsb_crtc_init - Initialize the per-CRTC DSB/flipq worker state.
+ * @crtc: the CRTC
+ */
+void intel_dsb_crtc_init(struct intel_crtc *crtc)
+{
+	INIT_WORK(&crtc->flipq_fb_bits_work, intel_dsb_flipq_fb_bits_work);
+}
+
+/**
+ * intel_dsb_crtc_disable - Drop any stale pending flipq FBC completion.
+ * @crtc: the CRTC
+ *
+ * A flipq commit's completion (and hence its deferred frontbuffer/FBC
+ * flush) can still be outstanding when @crtc gets disabled, eg. across a
+ * modeset. Cancel and discard it so it can't run later against whatever
+ * @crtc is reconfigured to next.
+ */
+void intel_dsb_crtc_disable(struct intel_crtc *crtc)
+{
+	struct intel_display *display = to_intel_display(crtc);
+
+	cancel_work_sync(&crtc->flipq_fb_bits_work);
+
+	spin_lock_irq(&display->drm->event_lock);
+	crtc->flipq_fb_bits = 0;
+	spin_unlock_irq(&display->drm->event_lock);
+}
+
 void intel_dsb_irq_handler(struct intel_display *display,
 			   enum pipe pipe, enum intel_dsb_id dsb_id)
 {
@@ -1130,6 +1185,16 @@ void intel_dsb_irq_handler(struct intel_display *display,
 		}
 
 		spin_unlock(&display->drm->event_lock);
+
+		/*
+		 * Flipq-driven commits complete asynchronously via DSB/DMC.
+		 * Notify frontbuffer/FBC tracking only once the queued update
+		 * has actually completed. The unlocked peek is just to avoid
+		 * pointlessly queueing work; intel_dsb_flipq_fb_bits_work()
+		 * re-checks flipq_fb_bits under event_lock.
+		 */
+		if (READ_ONCE(crtc->flipq_fb_bits))
+			queue_work(display->wq.unordered, &crtc->flipq_fb_bits_work);
 	}
 
 	errors = tmp & dsb_error_int_status(display);
diff --git a/drivers/gpu/drm/i915/display/intel_dsb.h b/drivers/gpu/drm/i915/display/intel_dsb.h
index 3dcca9ed5371..86d4111c1850 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.h
+++ b/drivers/gpu/drm/i915/display/intel_dsb.h
@@ -73,5 +73,7 @@ void intel_dsb_wait(struct intel_dsb *dsb);
 
 void intel_dsb_irq_handler(struct intel_display *display,
 			   enum pipe pipe, enum intel_dsb_id dsb_id);
+void intel_dsb_crtc_init(struct intel_crtc *crtc);
+void intel_dsb_crtc_disable(struct intel_crtc *crtc);
 
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index f61b4a218d6e..05a26d991cd2 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1930,6 +1930,27 @@ void intel_fbc_post_update(struct intel_atomic_state *state,
 	}
 }
 
+/*
+ * Flipq commits complete asynchronously, well after intel_fbc_post_update()
+ * already ran against the not-yet-latched surface. Re-run the post-update
+ * step for @pipe's FBC once the queued commit has actually completed, so any
+ * flip nuke recompresses the surface that is really being scanned out.
+ */
+void intel_fbc_flipq_post_update(struct intel_display *display, enum pipe pipe)
+{
+	struct intel_fbc *fbc = intel_fbc_for_pipe(display, pipe);
+
+	if (!fbc)
+		return;
+
+	mutex_lock(&fbc->lock);
+
+	if (fbc->state.plane && fbc->state.plane->pipe == pipe)
+		__intel_fbc_post_update(fbc);
+
+	mutex_unlock(&fbc->lock);
+}
+
 static unsigned int intel_fbc_get_frontbuffer_bit(struct intel_fbc *fbc)
 {
 	if (fbc->state.plane)
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.h b/drivers/gpu/drm/i915/display/intel_fbc.h
index 6c96d690a2f5..ba7b93eb1424 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.h
+++ b/drivers/gpu/drm/i915/display/intel_fbc.h
@@ -34,6 +34,7 @@ bool intel_fbc_pre_update(struct intel_atomic_state *state,
 			  struct intel_crtc *crtc);
 void intel_fbc_post_update(struct intel_atomic_state *state,
 			   struct intel_crtc *crtc);
+void intel_fbc_flipq_post_update(struct intel_display *display, enum pipe pipe);
 void intel_fbc_init(struct intel_display *display);
 void intel_fbc_cleanup(struct intel_display *display);
 void intel_fbc_sanitize(struct intel_display *display);
-- 
2.43.0

