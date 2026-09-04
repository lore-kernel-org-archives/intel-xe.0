Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DC4C79FAA
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 18:37:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83E810E4CE;
	Tue,  8 Sep 2026 18:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="dnRHkwOV";
	dkim-atps=neutral
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5490510F3A4
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 00:43:13 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-90d7fa95a58so4987336d6.1
 for <intel-xe@lists.freedesktop.org>; Thu, 03 Sep 2026 17:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788482592;
 x=1789087392; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jL+S2VRP3JuTJmufzuBUjH1ceZNF6WpEtKrszEHKUZ8=;
 b=dnRHkwOVet5xU37J1Ef6yzvsOmz6qntvRLO5+Rv+vxVBHn9F+JOvsTORtjiN07MLKe
 JFNX8YojzdckrxKYun+TWZwUGeMA4MxI2n+YjxsuuadqtDE6EpoBJGDcxAYuRSVmkgyf
 skSFspgBuzR+bAHrPTy8ngkpvbDP1dqPLVG09OfM6bVR3QfCR1rb9kAWIUD6S2maT1+J
 ar0v27MvYg5OsUbcYrI3SP54U61gKwe1moJH/QUlXfrKtRWkEZ6fviejeH4nZwNUsyGe
 N+NDDw0SHoGUwZ7X6skO1+WO6kVvbIT0ZB7H+YcVe2lIqHB/6pzWuN+0EVWracWKNlnU
 ajTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788482592; x=1789087392;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jL+S2VRP3JuTJmufzuBUjH1ceZNF6WpEtKrszEHKUZ8=;
 b=rTxYazD3UyDSVZvYbgS4CB29+QHqbLS3SkuO2S81j7pg7z2KelXclIJedbrpFamnKg
 DCuBwluDFT4idj+UCGQCoeTxXRdUA/OT7j+DFzyFfdxcoCQ8ITgIxDbWfwQIeJp4qjGy
 oA2rlB7HctmFjnJ9j5mAcmJ+E4gZQgEIl7vCCH40R3EsZcIJu4egM+wi2QubmqtVCkDK
 Vy7xLEibzmTMlHJGLhSnuPP2AXhul1jcZRzv/zAGdJ5J6g4Lg0M7neT5URxF5GUZZQ5B
 tzOW0oN9LaqAXisZ99LPa69ipa5AQhHSdOocDrK6B+9PsbTF/2mLsF0JWOpiutLQNx40
 OiGg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwV+H61D8Iygn2XUbGn7GxKGAzY/EiLJVHObw0XESOotCnUsw2VzxNLL0YDPkTNc+FJJmRukdNfNQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nQuu3Kd7iGYlJzuPYMN6aje0gWXRH7cnYRRzZb4i3pWLxuQn/e
 0QInnzf7AM0pLZnzkAj3mVFySqiuDd3LpQXJTJyqQBCBxfdAfxfr99vFVpY1wDl30mD8UXInSx+
 +71PsYfg=
X-Gm-Gg: AYBFou0VqNwVtzVgo/StL3kZLKsH9wHrx0Sg+w/ZpjcGCekgsaEIAV1YB/StfbSOLYu
 2yHvUV7JzXjHYmqYDVctrSytpYZk3B7qwZSJJrMkXW+S6tJlpoHXC80JC2vJsfKXW0l6su+25cZ
 KKlFPae3SRJQsREJo/fcAlA1RB3a0vTnFya8/Ot2ui705wLSJ0Ntb0u5a6pdhhb9TO5V8SZpqrA
 IQGapclsU1pQR7OWdp82A49Y8R66qhWzUq9lpzj6KAMu2hJtL2liQFcw5m2AZayfxBXmsIwEC46
 M3jPUUPo5FlPHQFvqfC6VyXw5g4Bj1X1IooJOHDjDWHiXzeEzUW1zg/ffmMKDn55GerapEKkO2l
 TrgNSOjrsH+Epck0MRgx3973aD/tlrubmyQcQ/lGUUEdrxdC4QruxLVo7TtMzYE4SE9XDlpcgAm
 BRayrkKc0GGIHLwqRLPyRaQ6aqcESgU/0Cvs2xkB2iwb4PvBjSvURcdUYTIExj2E0N3Kle42Ptv
 FT07uMmxOqO2qjp2h5yuoqGglTXh+amIAF+sYGEgMTG81hyroyQYObu5posCbvSwjLMbt4LQaS7
 4xa3rT6mhpNty+I9tfGHSwaooRomSFNBaLdp4VfZuX9sdqYkWvpv8+n/TT8=
X-Received: by 2002:a05:6214:8506:10b0:910:343e:de91 with SMTP id
 6a1803df08f44-9103efb3396mr30145126d6.1.1788482592022; 
 Thu, 03 Sep 2026 17:43:12 -0700 (PDT)
Received: from jake-laptop ([74.244.125.34]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-910406bf8c3sm7418446d6.48.2026.09.03.17.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 17:43:11 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3] drm/i915/alpm: Add a quirk to keep the fast wake ahead of
 the IO buffer wake
Date: Thu,  3 Sep 2026 20:43:08 -0400
Message-ID: <20260904004308.185788-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903131724.49496-1-j@metarealtyinc.ca>
References: <20260903131724.49496-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Sep 2026 18:37:11 +0000
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

The LG panel (sink OUI 00:22:b9) in the Dell XPS 14 DA14260 and XPS 16
DA16260 (Panther Lake) fails every ALPM link wake when the extended fast
wake and the IO buffer wake are programmed to the same number of
scanlines, which the spec formulas produce for it (11/11 lines on
3200x2000@120, 4 x 2.7 Gbps, DSC). The sink sets the Link CRC error bit
in DP_PSR_ERROR_STATUS within ~25 ms of it being cleared, on every wake,
for as long as PSR2 is active.

Measured with DP_PSR_ERROR_STATUS polled every 200 ms and cleared after
each read, 15 s of PSR2 per configuration, number of polls that found
the bit set again:

  io/fast 11/11, guardband 60 (stock)          70 of 71
  io/fast 11/11, guardband 127 (full vblank)   70 of 70
  fast wake sync length 20 -> io/fast 12/12    68 of 69
  fast wake sync length 24 -> io/fast 13/13    69 of 70
  io/fast 11/12                                 0 of 71

A larger guardband or a longer fast wake sync pulse does not help, and
moving both wake times up together does not either. The fast wake has
to start strictly before the IO buffer wake on this panel.

Since the spec allows the IO buffer wake to be equal to or longer than
the fast wake, keep the formulas as they are and apply the relation as
a DPCD quirk for this panel on these two machines: one extra fast wake
line, or the IO buffer wake one line below the fast wake when already
at the maximum. Account for the larger of the two wake times in the
vblank and guardband checks, PSR and LOBF, which only looked at the IO
buffer wake on display 20+.

This does not by itself make PSR2 selective updates or Panel Replay
usable on these machines; with the wake clean the panel still never
receives a selective update. That is tracked separately.

v3: also account for the fast wake in the LOBF guardband and vblank
    checks (Sashiko review)
v2: quirk for the affected panel instead of a generic change (Jouni)

Link: https://lore.kernel.org/intel-gfx/20260902162150.58778-1-j@metarealtyinc.ca/
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7521
Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index f138376..04f61fd 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -15,6 +15,7 @@
 #include "intel_dp.h"
 #include "intel_dp_aux.h"
 #include "intel_psr.h"
+#include "intel_quirks.h"
 #include "intel_psr_regs.h"
 #include "intel_vrr.h"
 
@@ -238,8 +239,29 @@ bool intel_alpm_compute_params(struct intel_dp *intel_dp,
 		io_wake_lines = fast_wake_lines = max_wake_lines;
 
 	/* According to Bspec lower limit should be set as 7 lines. */
-	crtc_state->alpm_state.io_wake_lines = max(io_wake_lines, 7);
-	crtc_state->alpm_state.fast_wake_lines = max(fast_wake_lines, 7);
+	io_wake_lines = max(io_wake_lines, 7);
+	fast_wake_lines = max(fast_wake_lines, 7);
+
+	/*
+	 * The LG panel (sink OUI 00:22:b9) in the Dell XPS 14/16
+	 * DA14260/DA16260 reports a Link CRC error on every link wake when
+	 * the extended fast wake and the IO buffer wake are programmed to
+	 * the same number of lines, which the formulas above produce for it.
+	 * Neither a larger guardband nor a longer fast wake sync pulse
+	 * changes that; the fast wake has to start strictly before the IO
+	 * buffer wake. Apply that as a quirk for this panel only.
+	 */
+	if (DISPLAY_VER(display) >= 20 &&
+	    intel_has_dpcd_quirk(intel_dp, QUIRK_ALPM_FAST_WAKE_AHEAD) &&
+	    fast_wake_lines <= io_wake_lines) {
+		if (io_wake_lines < max_wake_lines)
+			fast_wake_lines = io_wake_lines + 1;
+		else
+			io_wake_lines = fast_wake_lines - 1;
+	}
+
+	crtc_state->alpm_state.io_wake_lines = io_wake_lines;
+	crtc_state->alpm_state.fast_wake_lines = fast_wake_lines;
 
 	return true;
 }
@@ -256,8 +278,9 @@ int intel_alpm_lobf_min_guardband(struct intel_crtc_state *crtc_state)
 	 * is applicable. Currently this information is not readily
 	 * available in crtc_state, so max will suffice for now.
 	 */
-	waketime_in_lines = max(crtc_state->alpm_state.io_wake_lines,
-				crtc_state->alpm_state.aux_less_wake_lines);
+	waketime_in_lines = max3(crtc_state->alpm_state.io_wake_lines,
+				 crtc_state->alpm_state.fast_wake_lines,
+				 crtc_state->alpm_state.aux_less_wake_lines);
 
 	if (!crtc_state->has_lobf)
 		return 0;
@@ -314,7 +337,8 @@ void intel_alpm_lobf_compute_config_late(struct intel_dp *intel_dp,
 	 */
 	first_sdp_position = adjusted_mode->crtc_vtotal - adjusted_mode->crtc_vsync_start;
 	if (intel_alpm_aux_less_wake_supported(intel_dp))
-		waketime_in_lines = crtc_state->alpm_state.io_wake_lines;
+		waketime_in_lines = max(crtc_state->alpm_state.io_wake_lines,
+					crtc_state->alpm_state.fast_wake_lines);
 	else
 		waketime_in_lines = crtc_state->alpm_state.aux_less_wake_lines;
 
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index c0933dd..ec80a2e 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1443,7 +1443,8 @@ static bool wake_lines_fit_into_vblank(struct intel_dp *intel_dp,
 		wake_lines = DISPLAY_VER(display) < 20 ?
 			psr2_block_count_lines(crtc_state->alpm_state.io_wake_lines,
 					       crtc_state->alpm_state.fast_wake_lines) :
-			crtc_state->alpm_state.io_wake_lines;
+			max(crtc_state->alpm_state.io_wake_lines,
+			    crtc_state->alpm_state.fast_wake_lines);
 
 	/*
 	 * Guardband has not been computed yet, so we conservatively check if the
@@ -4556,7 +4557,8 @@ void intel_psr_compute_config_late(struct intel_dp *intel_dp,
 		wake_lines = DISPLAY_VER(display) < 20 ?
 			     psr2_block_count_lines(crtc_state->alpm_state.io_wake_lines,
 						    crtc_state->alpm_state.fast_wake_lines) :
-			     crtc_state->alpm_state.io_wake_lines;
+			     max(crtc_state->alpm_state.io_wake_lines,
+				 crtc_state->alpm_state.fast_wake_lines);
 	else
 		wake_lines = 0;
 
@@ -4612,7 +4614,8 @@ int intel_psr_min_guardband(struct intel_crtc_state *crtc_state)
 		wake_lines = DISPLAY_VER(display) < 20 ?
 			     psr2_block_count_lines(crtc_state->alpm_state.io_wake_lines,
 						    crtc_state->alpm_state.fast_wake_lines) :
-			     crtc_state->alpm_state.io_wake_lines;
+			     max(crtc_state->alpm_state.io_wake_lines,
+				 crtc_state->alpm_state.fast_wake_lines);
 	else
 		return 0;
 
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 33245f4..a5d01ba 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -86,6 +86,14 @@ static void quirk_edp_limit_rate_hbr2(struct intel_display *display)
 	drm_info(display->drm, "Applying eDP Limit rate to HBR2 quirk\n");
 }
 
+static void quirk_alpm_fast_wake_ahead(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	intel_set_dpcd_quirk(intel_dp, QUIRK_ALPM_FAST_WAKE_AHEAD);
+	drm_info(display->drm, "Applying ALPM fast wake ahead of IO buffer wake quirk\n");
+}
+
 static void quirk_disable_edp_panel_replay(struct intel_dp *intel_dp)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
@@ -286,6 +294,21 @@ static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
 		.sink_oui = SINK_OUI(0x00, 0x22, 0xb9),
 		.hook = quirk_disable_edp_panel_replay,
 	},
+	/* Dell XPS 14 DA14260 and XPS 16 DA16260, LG panel: ALPM link wake */
+	{
+		.device = DEVICE_ID_ANY,
+		.subsystem_vendor = 0x1028,
+		.subsystem_device = 0x0db9,
+		.sink_oui = SINK_OUI(0x00, 0x22, 0xb9),
+		.hook = quirk_alpm_fast_wake_ahead,
+	},
+	{
+		.device = DEVICE_ID_ANY,
+		.subsystem_vendor = 0x1028,
+		.subsystem_device = 0x0dba,
+		.sink_oui = SINK_OUI(0x00, 0x22, 0xb9),
+		.hook = quirk_alpm_fast_wake_ahead,
+	},
 };
 
 void intel_init_quirks(struct intel_display *display)
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
index 970a4fe..8bbc2eb 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.h
+++ b/drivers/gpu/drm/i915/display/intel_quirks.h
@@ -23,6 +23,7 @@ enum intel_quirk_id {
 	QUIRK_EDP_LIMIT_RATE_HBR2,
 	QUIRK_DISABLE_EDP_PANEL_REPLAY,
 	QUIRK_DISABLE_PSR2,
+	QUIRK_ALPM_FAST_WAKE_AHEAD,
 };
 
 void intel_init_quirks(struct intel_display *display);
