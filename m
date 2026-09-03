Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D492C624D4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACC910E400;
	Thu,  3 Sep 2026 15:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="BFnAGXD9";
	dkim-atps=neutral
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D6A10F5A7
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 13:17:28 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-90e828b309eso30054636d6.1
 for <intel-xe@lists.freedesktop.org>; Thu, 03 Sep 2026 06:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788441447;
 x=1789046247; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=r68ffFcVlibf/9mfeBSim/NKG8ngq90IYCMS5ZLrtnQ=;
 b=BFnAGXD96xQXKgmz+uKj/CexBInDn1V6Qm3f3ILYahCvq0vNEcHEUC76d1Pif88MTe
 u7dCkJ9t19y59XHErNxjgcRXNmI0zUva2gNYW7RAPrPqgt8xlWUeAda+ZrubmspvDRTv
 BaxdWkV6Bdbw6EdAfZnk+YcQozkAVq6hFAJfqAyEEOPbQTtoJoX8C8usuX638uBAJ6/g
 wAFfE9j9dv+Ui7g4xFZM3qgJk6xUp4e2YTy+C9aCDvPjbBbM4jZVhthH4sY7WYi09CpK
 0M9KyWGMJnRZKqlL9PifkNyx1AQ+qtFS+9+pMuOgXfPxnVLV+pP4aFYl5Y1dKR19cubB
 wUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788441447; x=1789046247;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=r68ffFcVlibf/9mfeBSim/NKG8ngq90IYCMS5ZLrtnQ=;
 b=CTJyKPu5IbSbQFH6AeKZir2SLGf6ZIWiZeZJBmM9tPXSJwAkifXUHGZHkxRgNCg45G
 oh90IT/FArN00rb/mrXyFhl3RxRQEJ08DWTV0Zd+pPu4SiIuqPucrjCLpjIRSfaq6jKp
 RpEzSluxGHh9zOkgvB7UxKAUu0H0tsjuwHR6p2G+WTnHIUQPhdWtdp4CrGvxv9pYQ4WR
 y9L6Qh/VVuHRaos2Xcq9Ytp9PaXdSGN+QK+8zHNbRxnw0Olz4sL4DZcCvjYtC2TwXNVq
 Pi5FvC6RVGjxKboNq+ksNtIMIDxdXxPs9juekp3Yvv8PnuBmNwRCBM8+nF3VZwuMrioY
 WrwA==
X-Forwarded-Encrypted: i=1;
 AKwUvBygerfF0QrJFMXFAB5PQ9ncut0jd8XLfD4jiksd2v7oGBXtNOcwdMWwlVlAei10i8anKEuH+AMzfA==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nEnfTo6zf36o65XRgnJeaayDsnk20qKPmfQf/FhcSGvPZ44AO6
 gN6bT7qbiwD9Ef7709wosQ3WXZ/XgCwzZ7Uoi6d5BCVtvHQCE7WSpj93QB48waTwcp3tINEIA5g
 W0NrIl/s=
X-Gm-Gg: AYBFou1zkvtgxusATR5Vqffgqfr2Q3aM9PALKYpJM8ZrAcOHXPBNt2erK5KdB7ks/l2
 zFXGfOF4svGaHfzKfBEMFvbRT/hQfdt0NkqknhWtgHJcahzBDjGbv3x1njK+2Gr/+n/ma0XszMw
 QAF7QRElKBprc3N4I4ychNvOshojy+R/YlrOIs7q3mR4NyB4jLCROp6Rpk5W3TjuoP/ICa3sdwC
 bc7azYdMHWG6GRF1pv82BkH6p/xTl2yb/vXFc4C5xM2h4f/PddnIPO03cV9QULkMZfGYlYgNLWI
 GnoO+9lN72MP0aFl3DD5zg9KuH2EWqZ8eY83v67CAK73djrXNLB3Pdr6iWWmkeyuAYWN80c/WRr
 5Q37QIbawteHBnKMiIr9+hzWI5Lw5hC48QpAVO5+CASyk6mY/6clf1Q17G7uATjQSJzLwBFaYlR
 63XhCusrOVrhgJBP7FB9pPqNiLGnurMilLtd2gCrpegeMAveoL2++ikDXonUCzTovwERAnFruwg
 6jGkf0fuCy41LzceUZ3Ly4QEmRjpYLTnVLOtwBMC5+Ya9EXlIkG4/aGYjbOq+uV40youZzeC3Mc
 OuSxe0XsWaPqCGvsch40hU/6u5/6o9bVKNmGk5XQVwI297EEyjGUp6vQl2Y=
X-Received: by 2002:a05:620a:4114:b0:939:57ca:7e0a with SMTP id
 af79cd13be357-93960cabe26mr1405938085a.7.1788441447065; 
 Thu, 03 Sep 2026 06:17:27 -0700 (PDT)
Received: from jake-laptop ([74.244.125.34]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9395f3dd7easm519351685a.45.2026.09.03.06.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 06:17:26 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2] drm/i915/alpm: Add a quirk to keep the fast wake ahead of
 the IO buffer wake
Date: Thu,  3 Sep 2026 09:17:24 -0400
Message-ID: <20260903131724.49496-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902162531.73598-1-j@metarealtyinc.ca>
References: <20260902162531.73598-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Sep 2026 15:59:47 +0000
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
vblank and guardband checks, which only looked at the IO buffer wake on
display 20+.

This does not by itself make PSR2 selective updates or Panel Replay
usable on these machines; with the wake clean the panel still never
receives a selective update. That is tracked separately.

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
index f138376..79cce5b 100644
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
