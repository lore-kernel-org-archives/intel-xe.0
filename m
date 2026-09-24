Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2792C98333
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 19:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455A710FC1E;
	Fri, 25 Sep 2026 19:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CLKQ73CZ";
	dkim-atps=neutral
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com
 [74.125.225.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A6610E649
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 16:50:01 +0000 (UTC)
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccead2aecso341925e9.0
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790268600; x=1790873400; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G2IDmw9bTisJaYAh4s7sCq1aRiBz5dcPpXhx059abuQ=;
 b=CLKQ73CZiweMFfKrW9BooR36QwT4AI9J9tSTDodBtoIR2ECiTvkNpc4vm6CIctHhuD
 rQhzm7wJRxEcOFKyP4NPATl9U+RfWlQiGstjBA6XgrePoBsqngMLax6JlO3b83sTww1O
 3chmoNsuiFvJcuvA57hyudCGxMH55yzovaaIkz/Sz3BDrrcyiEquavxhmmcpOqfei47b
 HmauFCj6xHIe4AadGEh4cf6yXwUKVlKBFW7Z+yS0FcbUy9IN1MUysficNyQfI0fb6uRS
 2sII8eKILBKC/JiZaowRoWqrS4/iaL40pnC1wiTPGl0lhO05FnEq0RdwdnxDjuXI+cgL
 uUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790268600; x=1790873400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=G2IDmw9bTisJaYAh4s7sCq1aRiBz5dcPpXhx059abuQ=;
 b=KO+/3mjUb4orEiz2klGrSBIgk8Z9PblhP0lA3siwDBKUCj6NTu7HUM03ImDKw+xoIi
 GKJUTBPGyKi7pLspIM1o9S6eJTGGjM53jsY0cytPqc2f11hWP7Z3OIIRY3B7LhDKbbGj
 b3R6fjR1Rb9DvYPr9Ph2q4khqU+DLYSd8kehoJeeRO3WD+SHEMvYM7IbdzAWpxwbKyit
 b4LuKp/5QyYOnERSI0FLhImjv7iu/xa2K4lCme2oM6KzmNjztA2jGi+mbHRpNr4f3DDJ
 6d3mfi/JvkfmN7HVWcpxI9gUGbOAFaBHh2EKl/A9kdCdgXHSuTRLIrZXi6J18bAT0ukB
 Apvw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzmEw17UA6DE5M5sa96+UG+GBjCJATFEF52VyWrQBQWYcpcZMnHgBCBptgvNHW4HCTa9o70OqgKjg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++kRUWE/ujH4VcpzWWHt0zhM7uFBwNPh5djI/bNth3AUENJObItA
 J1wAtXqsmRTCclbRvwgXZwUSv1zxqCVusgvRgKlazEif1jMKH+NsWZoC
X-Gm-Gg: AYBFou2yp2WUlj/qayATmuY/7J6liw5+S/efCQ1PxnU2e6KjKfwM0ZTh6lpwOaZ2tf8
 umC4onH/RBWy5KkuMbwsnW4fi9bs8hVx77ecZ2/HaaLtPh8R1aGzOvzLfoicbBd8HxSeMF27odC
 0tLkKsycUqADvZ7xhC2dm7C6Rgr0O+5rBrF90CZiq2kJLG+th7VGO0U5ltyCjo1whFq4U+10aYG
 Feb126YvdMeSQ6oL2G5OhJOyRNzbZZ/uAMDZ2czFf7xVeXnxndUn65INCoraxU9sWCP8z2wL8xK
 57/gTlrbfNvsOqdtC+8Vh9IvNLGgAGxnjIaN1iYHC/oUx4Rrri2Jk0DEI4VHZLFsT6t9e0qqjXr
 LCf4FpX0zCT070n2VmxosUDOe7lxmNgNvJOKULfXwVTALC44E4dBbWGJKdit3lkxk4vPlc0FerT
 717Uij9+PbHbCad0CbcAAMQNAfGTpShPQ2JHlh/nrcSFxx904tq803lX72wbRGmESTKKiDPXoIK
 peXsoHV
X-Received: by 2002:a05:600c:4e86:b0:49c:ffe3:2b3f with SMTP id
 5b1f17b1804b1-49fe66c8e13mr51367875e9.3.1790268599645; 
 Thu, 24 Sep 2026 09:49:59 -0700 (PDT)
Received: from fedora ([2a02:587:200f:d100:bf67:f785:caad:e278])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fee6ced69sm1219015e9.0.2026.09.24.09.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 09:49:59 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mail@taterr.org
Subject: [PATCH v2] drm/i915/display: Replace bw_constrained with
 max_link_bpp_x16
Date: Thu, 24 Sep 2026 19:49:53 +0300
Message-ID: <20260924164953.28066-1-mail@taterr.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919161927.98829-1-mail@taterr.org>
References: <20260919161927.98829-1-mail@taterr.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Sep 2026 19:10:48 +0000
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

In intel_crt.c (VGA displays) and intel_lvds.c (old laptop displays),

both files were using a legacy boolean flag crtc_state->bw_constrained

to guess if the display link was bandwidth limited.

To fix this, replaced the bw_constrained boolean checks with direct

comparisons against the max_link_bpp_x16 fixed-point API.

Signed-off-by: George Karagounis <mail@taterr.org>
---
v2: Remove the dead bw_constrained flag definition and writer entirely,
    as pointed out by the sashiko bot reviewer
 drivers/gpu/drm/i915/display/intel_crt.c           | 5 ++---
 drivers/gpu/drm/i915/display/intel_display.c       | 1 -
 drivers/gpu/drm/i915/display/intel_display_types.h | 1 -
 drivers/gpu/drm/i915/display/intel_lvds.c          | 6 +++---
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index 5b8968197fbc..3da9547f2c6e 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -459,10 +459,9 @@ static int hsw_crt_compute_config(struct intel_atomic_state *state,
 
 	/* LPT FDI RX only supports 8bpc. */
 	if (HAS_PCH_LPT(display)) {
-		/* TODO: Check crtc_state->max_link_bpp_x16 instead of bw_constrained */
-		if (crtc_state->bw_constrained && crtc_state->pipe_bpp < 24) {
+		if (crtc_state->max_link_bpp_x16 < fxp_q4_from_int(24)) {
 			drm_dbg_kms(display->drm,
-				    "LPT only supports 24bpp\n");
+				   "LPT only supports 24bpp\n");
 			return -EINVAL;
 		}
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9dfd095f325f..fa6b11c4df47 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4767,7 +4767,6 @@ intel_modeset_pipe_config(struct intel_atomic_state *state,
 			    "[CRTC:%d:%s] Link bpp limited to " FXP_Q4_FMT "\n",
 			    crtc->base.base.id, crtc->base.name,
 			    FXP_Q4_ARGS(crtc_state->max_link_bpp_x16));
-		crtc_state->bw_constrained = true;
 	}
 
 	base_bpp = crtc_state->pipe_bpp;
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 43d53a98dae7..2166c84596c6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1146,7 +1146,6 @@ struct intel_crtc_state {
 	 * required. This is set in the 2nd loop of calling encoder's
 	 * ->compute_config if the first pick doesn't work out.
 	 */
-	bool bw_constrained;
 
 	/* Settings for the intel dpll used on pretty much everything but
 	 * haswell. */
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index 872753478cf2..6bbd13ab5da7 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -443,10 +443,10 @@ static int intel_lvds_compute_config(struct intel_atomic_state *state,
 	else
 		lvds_bpp = 6*3;
 
-	/* TODO: Check crtc_state->max_link_bpp_x16 instead of bw_constrained */
-	if (lvds_bpp != crtc_state->pipe_bpp && !crtc_state->bw_constrained) {
+	if (lvds_bpp != crtc_state->pipe_bpp &&
+	    crtc_state->max_link_bpp_x16 >= fxp_q4_from_int(lvds_bpp)) {
 		drm_dbg_kms(display->drm,
-			    "forcing display bpp (was %d) to LVDS (%d)\n",
+			   "forcing display bpp (was %d) to LVDS (%d)\n",
 			    crtc_state->pipe_bpp, lvds_bpp);
 		crtc_state->pipe_bpp = lvds_bpp;
 	}
-- 
2.55.0

