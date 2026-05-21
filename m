Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B32CD5BB7
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 12:53:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2804210F5EB;
	Fri, 22 May 2026 12:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=poorly.run header.i=@poorly.run header.b="OK6KrhN4";
	dkim-atps=neutral
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3038510F3D1
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 18:01:47 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-7bd9f61458eso47976817b3.0
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 11:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google; t=1779386506; x=1779991306; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0j0TPpzgwk8K8QWPmCr8MZO43/oD20R506hhkUYcHEM=;
 b=OK6KrhN4Z0FUSpUTSVvrgxIoDf7qt/vSis4pzlEbXvXB4MJ7tOLAbFTmlbivEgt7kM
 Mz3ksPFnySsKojD2JwKrppvlSu7NXYWSDFJU1ueR+QbzBXpmVm4zoUCyfek3u0CP1+9s
 mYbaYZUAegkVjCzsXyDiUTHu2pMOyURscgLYYH1VIAm2zc1Yu7C3dHyl/ABT3zwYdsgI
 It0Ev3uaYA7YqbXseuytqianpRFnMKZfB3XWO48CaoaJk96rTYwgdPbrMPXbzMuF+sdH
 SkI1Ew2sRPBqo7z7UrNeZmOv6mTezfLEYhMYIMEUDvVLtKiiUYIAqb1X3X8T+OkqXHY8
 3u/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779386506; x=1779991306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0j0TPpzgwk8K8QWPmCr8MZO43/oD20R506hhkUYcHEM=;
 b=sWg20wuFGb2CnTOfvQXWmO8DflM49MxDe2lmTdNUU/g3d7LO3mBJ4sQUemBOLJoVXY
 NwlPBLyQf0UE3XlmS+JKlZalJYbkaZWz9vBR94XU2ocoqkLBUczyME39Bx1D68kMDAZN
 usv82+xBQYvV6gZddiuU64BD+nYtmcvVY0TErfr8wqxdxEOfsiiQ6nVnl+qesfAGGJrB
 vw3U6lbI+Nv8t+VqNIS/ozBQEdFu6/LQ+qgZfAVBLQLm9N25kgubKWIpf/Lab/tZo+GQ
 aMqRmUbw3s3fhJ/fWlOOkD7qkEdchBF6ZiXs7iolw9G10Kx6ipU5Z42nOy86y/zpRB93
 EGZw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9TyTUuO6hxkqJG2DuASmRbnJuKuU9q4M+mXdKX2Y4dTDq8hmZ1Wm8Z3jczMEz+ar9eZZk1OmfZ6g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwX85BIv9gSJSzsrgaXrLIvlX2T2swR0Bc4pgSdQP9+9tzDA8v
 v3pkQuMaoELsdt01T6h9cmESIXwCTjpEK+MGp52FJ6hXELz6HJFGP8dJOo7WWmHL9bk=
X-Gm-Gg: Acq92OHLd6yTvrjEqX8Gyr1jhYDGx3Om/lTa21njiNtfw9zwpYUdl8hh7G4ZwKK8dTA
 f3fM7xGVd0gDbfrQom56BazqxcNw67UEuA8LblELOdBcUvbot5a8mvdL88oN7yOlUfraFXD7f6s
 n0IBCjialmCiP5DBd1Jvvt/IHUKo5T1Cp4T9513ukTVZ2YRW9PyyennCwloP3PsaFiISjZXwfgs
 3awjApoRg7ZPYSrFVBrgX0ef4hlERssyZHLmSEhYd7SngJc8DOg4UIok0eU4t+RwK4rywR1RiS9
 NT53u55SmIUTpfIs97IZuAhcx0RNFWmdcmeLHxij6j7iOifx7o8QmKGLkbFhX2D34xy46PkkfyZ
 Jh/tkpQUi6JyXcRRh06XQ/XfS7rHln8Yr8qigMy2g5qNeCIb2OF6a+6+s0YUDiXmYMyp5FjwA41
 sddC0a82d3oQbnxGbT6BmalhZAQhguPYM9xOjtCbaMhmi9ySnB7Z3+7hq6e8myfy+h2g==
X-Received: by 2002:a05:690c:22c2:b0:7b9:edca:bac6 with SMTP id
 00721157ae682-7d3342da421mr5592967b3.15.1779386505668; 
 Thu, 21 May 2026 11:01:45 -0700 (PDT)
Received: from localhost (182.221.85.34.bc.googleusercontent.com.
 [34.85.221.182]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7d2ca76a7b1sm5987237b3.23.2026.05.21.11.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 11:01:45 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: intel-gfx@lists.freedesktop.org
Cc: Sean Paul <seanpaul@google.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/color: Fix plane color pipeline programming bugs
Date: Thu, 21 May 2026 14:00:45 -0400
Message-ID: <20260521180143.2143262-1-sean@poorly.run>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 May 2026 12:53:27 +0000
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

From: Sean Paul <seanpaul@google.com>

Fix two bugs in the plane-level color pipeline programming:
1. Fix a step discontinuity in the Post-CSC Gamma LUT when SDR dimming
   is active by clamping Segment 2 to the last user-provided LUT entry
   value instead of hardcoding it to 1.0 (1 << 24).
2. Fix a typo in the loop condition in xelpd_program_plane_pre_csc_lut
   for Segment 2 degamma programming, changing 'while (i++ > 130)' to
   'while (i++ < 130)'. Also clamp Segment 2 to the last user-provided
   LUT entry value instead of hardcoding it to 1.0 (1 << 24) to fix
   a step discontinuity similar to the Post-CSC fix.

Signed-off-by: Sean Paul <seanpaul@google.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 2d318e922671..9b807b024ec3 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3953,6 +3953,7 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 	enum plane_id plane = to_intel_plane(state->plane)->id;
 	const struct drm_color_lut32 *pre_csc_lut = plane_state->hw.degamma_lut->data;
 	u32 i, lut_size;
+	u32 lut_val = 1 << 24;
 
 	if (icl_is_hdr_plane(display, plane)) {
 		lut_size = 128;
@@ -3963,7 +3964,7 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 
 		if (pre_csc_lut) {
 			for (i = 0; i < lut_size; i++) {
-				u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
+				lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
 
 				intel_de_write_dsb(display, dsb,
 						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
@@ -3975,8 +3976,8 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 			do {
 				intel_de_write_dsb(display, dsb,
 						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   (1 << 24));
-			} while (i++ > 130);
+						   lut_val);
+			} while (i++ < 130);
 		} else {
 			for (i = 0; i < lut_size; i++) {
 				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
@@ -4023,11 +4024,11 @@ xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
 						   lut_val);
 			}
 
-			/* Segment 2 */
+			/* Segment 2 - clamp to the last LUT value to prevent step discontinuity */
 			do {
 				intel_de_write_dsb(display, dsb,
 						   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   (1 << 24));
+						   lut_val);
 			} while (i++ < 34);
 		} else {
 			/*TODO: Add for segment 0 */
-- 
Sean Paul, Software Engineer, Google / Chromium OS

