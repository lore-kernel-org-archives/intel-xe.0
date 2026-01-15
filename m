Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F4BC79FBC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 14:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9523B10E8A7;
	Fri, 16 Jan 2026 14:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="hNI+rfR9";
	dkim-atps=neutral
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com
 [74.125.82.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5661410E7B3
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 16:55:52 +0000 (UTC)
Received: by mail-dy1-f201.google.com with SMTP id
 5a478bee46e88-2b21d136010so1845739eec.1
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 08:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768496152; x=1769100952;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xeM6MhqRoztX+QVwbHyCtTF8HcsgARRYNT7dHb7OJSU=;
 b=hNI+rfR9eDdyW71RCnnGdLHHYrR2dav996Gjh+V8wja/7S7gvCyfl0FzqgbQQSt6bp
 /ZNDfEbpIIxC6Bco2NxbV92WYdbD6klcSNTgThQBFleXhBlRbVFTSwaGbj8+0xQTZ6Bm
 Dk9enLwxcay6dCPSjBpGzjxe3cm+Q86G/71MufmHhyAEpFx/MOJZwz5xS5+o/RK+BqVs
 1+zNXX7RBINRCNiz60OiZXvWLqqHUlDhFf7rgz8GhYdsvk+9HbZmofALd1PWvLXTeIoR
 /ZVqbremi1B00Vz+kJ4F0iFuckfLho/lgTM4Q+Y79X0Z46HTG7eFUSciJ3m/9aQIZazu
 esVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768496152; x=1769100952;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xeM6MhqRoztX+QVwbHyCtTF8HcsgARRYNT7dHb7OJSU=;
 b=MkAxTS/xjchfCPok43LqND9uZFryOnI5J8F0E6C9lLTjZ5sQE7qXH0L0gtQS47V1if
 7FckYruejQyNwB3f2O/xSw2Up907Va4E/52Gv+QFuoT7DPPxQxuhAsnOKFDvVWtWN3b3
 V6np5ROEHAsnOg0SrAvWPl+5SK2rDU0YSXlhwWI6EFrl1rPZQ+hc4AQ3IndtWO5SHSLX
 l5aLkybRYamVmw/I03ngbI39w82nk+EvXtJJ7btj6gk/r7rRSk/vLqRUKNWbeH4YGLP3
 u+nqMBIgfppUOGMFm7MET4QuPzuICF2i7qWC4/UVm0KthkUIDWftKlsKc9swL7JzkGmu
 NGVA==
X-Gm-Message-State: AOJu0Yws7CM0A4VZeIxE0MYsBzYHEHF2w4Vw3qpUx5gduRICpIoN3Mfl
 A9GEfsHes4xQmoL7cc8zXS4i234uDW2yxNwd0K+I/MNlb42usiQ1ERiL14V7rTIGbHjRof+0thb
 fFv6SJWjPm5De3kFLXZy8SLgfX1fEdgtiurzGzXGqPdKFVSrqptdpSBUh4Nr+pxtR1+GodSXdfz
 9RVPBgkUgRMHa3oJOMgWuCUhix5UeGi4pd948wteoU0jL/Uld/AwOfJf7VfQ==
X-Received: from dybia4.prod.google.com ([2002:a05:7301:304:b0:2b0:4b2e:997d])
 (user=jdsultan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:cc0a:b0:2b0:56fd:4b67 with SMTP id
 5a478bee46e88-2b6b3f074e7mr66346eec.12.1768496151000; 
 Thu, 15 Jan 2026 08:55:51 -0800 (PST)
Date: Thu, 15 Jan 2026 08:54:52 -0800
In-Reply-To: <20260115-upstream-prep-v1-0-001d5b38fc11@google.com>
Mime-Version: 1.0
References: <20260115-upstream-prep-v1-0-001d5b38fc11@google.com>
X-Developer-Key: i=jdsultan@google.com; a=ed25519;
 pk=RhTSABMOTIhvVE7NYiZwn1iDGYYNbaN092nvaEF2dxo=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768496136; l=5509;
 i=jdsultan@google.com; s=20260115; h=from:subject:message-id;
 bh=DxVxtzShM4yd9JxY33QBuQuMjSWo2fZpdehdKMkg1Y0=;
 b=8DsiY/w/wdICec/1adJwDtgBE3t0i558DsxaI0vcqoTEHTFCe4lFduPWcxUn6xEH3R0arf+Wr
 aGGCg68b3gkAXl1px57t4UMt2zMKvOx4FWfF8PmZ+PEsvl2pn/ypmVj
X-Mailer: b4 0.14.2
Message-ID: <20260115-upstream-prep-v1-6-001d5b38fc11@google.com>
Subject: [PATCH RFC 06/10] drm/i915/display: Fix vblank timestamps and update
 logic for fastboot
From: Juasheem Sultan <jdsultan@google.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Sean Paul <seanpaul@google.com>, Manasi Navare <navaremanasi@google.com>, 
 Drew Davenport <ddavenport@google.com>, Juasheem Sultan <jdsultan@google.com>
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Fri, 16 Jan 2026 14:02:59 +0000
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

When inheriting the display state from BIOS (fastboot/seamless boot),
the DRM core's vblank timestamping constants (`linedur_ns`, `framedur_ns`)
may not be correctly initialized, leading to warnings or incorrect
timestamp values in pageflip events.

Additionally, the standard `intel_pipe_update_start/end` sequences perform
operations (vblank evasion, PSR locking, tracepoints) that are unnecessary
or harmful when we are merely synchronizing the software state to the
already-active hardware.

This patch addresses these issues:

1.  **Manual Timestamp Calculation**: Re-implements `intel_calc_timestamping_constants`
    to force-update `vblank->hwmode` and duration variables from the
    adjusted mode, ensuring valid timestamps even without a full modeset.

2.  **Inherited State Bypass**: In `intel_pipe_update_start` and
    `intel_pipe_update_end`, skip the standard hardware-touching logic
    if the CRTC state is marked as `inherited`.

3.  **Vblank Event Handling**: Within the `intel_pipe_update_end` bypass
    path, explicitly send any pending vblank events. This is critical to
    signal completion to userspace (e.g., SurfaceFlinger) without waiting
    for hardware vblanks that the driver isn't tracking yet.

4.  **Assertion Fixes**: Skip `assert_vblank_disabled` in `intel_crtc_vblank_on`
    for inherited states, as the vblank interrupt might already be running
    or the hardware state is effectively active.

Signed-off-by: Juasheem Sultan <jdsultan@google.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 59 +++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index a187db6df2d36ec7dbbba56fe7aa4e9f9b92751c..a218f10c3b2c4ae6d85e115b0bb48b14e79347eb 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -20,6 +20,7 @@
 #include "intel_color.h"
 #include "intel_crtc.h"
 #include "intel_cursor.h"
+#include "intel_display.h"
 #include "intel_display_debugfs.h"
 #include "intel_display_irq.h"
 #include "intel_display_trace.h"
@@ -120,15 +121,45 @@ u32 intel_crtc_max_vblank_count(const struct intel_crtc_state *crtc_state)
 		return 0; /* Gen2 doesn't have a hardware frame counter */
 }
 
+static void intel_calc_timestamping_constants(struct drm_crtc *crtc,
+					      const struct drm_display_mode *mode)
+{
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+	int linedur_ns = 0, framedur_ns = 0;
+	int dotclock = mode->crtc_clock;
+
+	if (dotclock > 0) {
+		int frame_size = mode->crtc_htotal * mode->crtc_vtotal;
+
+		linedur_ns  = div_u64((u64) mode->crtc_htotal * 1000000, dotclock);
+		framedur_ns = div_u64((u64) frame_size * 1000000, dotclock);
+	}
+
+	vblank->linedur_ns  = linedur_ns;
+	vblank->framedur_ns = framedur_ns;
+
+	if (drm_drv_uses_atomic_modeset(crtc->dev)) {
+		drm_mode_copy(&vblank->hwmode, mode);
+		drm_dbg_kms(crtc->dev, "[FB-FIX] Updated vblank->hwmode: clock=%d\n", mode->crtc_clock);
+	}
+}
+
 void intel_crtc_vblank_on(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 
 	crtc->vblank_psr_notify = intel_psr_needs_vblank_notification(crtc_state);
 
-	assert_vblank_disabled(&crtc->base);
-	drm_crtc_set_max_vblank_count(&crtc->base,
-				      intel_crtc_max_vblank_count(crtc_state));
+	if (crtc_state->inherited) {
+	} else {
+		assert_vblank_disabled(&crtc->base);
+		drm_crtc_set_max_vblank_count(&crtc->base,
+					      intel_crtc_max_vblank_count(crtc_state));
+	}
+
+	/* [FB-FIX] Force calculation of constants to ensure framedur_ns is set */
+	intel_calc_timestamping_constants(&crtc->base, &crtc_state->hw.adjusted_mode);
+
 	drm_crtc_vblank_on(&crtc->base);
 
 	/*
@@ -524,6 +555,13 @@ void intel_pipe_update_start(struct intel_atomic_state *state,
 	struct intel_vblank_evade_ctx evade;
 	int scanline;
 
+	/* [FB-FIX] Ensure timestamping constants are set for all updates */
+	intel_calc_timestamping_constants(&crtc->base, &new_crtc_state->hw.adjusted_mode);
+
+	if (new_crtc_state->inherited || old_crtc_state->inherited) {
+		return;
+	}
+
 	drm_WARN_ON(display->drm, new_crtc_state->use_dsb);
 
 	intel_psr_lock(new_crtc_state);
@@ -658,12 +696,27 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
 	struct intel_display *display = to_intel_display(state);
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
+	const struct intel_crtc_state *old_crtc_state =
+		intel_atomic_get_old_crtc_state(state, crtc);
 	enum pipe pipe = crtc->pipe;
 	int scanline_end = intel_get_crtc_scanline(crtc);
 	u32 end_vbl_count = intel_crtc_get_vblank_counter(crtc);
 	ktime_t end_vbl_time = ktime_get();
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 
+	if (new_crtc_state->inherited || old_crtc_state->inherited) {
+		unsigned long irqflags;
+
+		if (new_crtc_state->uapi.event) {
+			spin_lock_irqsave(&dev_priv->drm.event_lock, irqflags);
+			drm_crtc_send_vblank_event(&crtc->base, new_crtc_state->uapi.event);
+			spin_unlock_irqrestore(&dev_priv->drm.event_lock, irqflags);
+			new_crtc_state->uapi.event = NULL;
+		}
+
+		return;
+	}
+
 	drm_WARN_ON(display->drm, new_crtc_state->use_dsb);
 
 	if (new_crtc_state->do_async_flip)

-- 
2.52.0.457.g6b5491de43-goog

