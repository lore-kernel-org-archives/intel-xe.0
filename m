Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24476CD98F1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 12:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A2410EAFF;
	Tue, 16 Jun 2026 12:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RIWFuyu6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6045910EAE6;
 Tue, 16 Jun 2026 12:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613928; x=1813149928;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7vdoJp9RDiC9R90sNMpdksaWxpmNTzb6rYXkrZCDthY=;
 b=RIWFuyu6o1gayYks1xjMzso9UXFPL4qpJMkfaghSkHPqYUhGqJp39h3Y
 5JL3ZjFPIhqvqkoeb+UWFc5WU5iS9YPQc3oGsIlqiADmq2MslesGMcSXQ
 XrzZTx/8llQZ1dl8KQe2XMWiUP9JtBdGhwFZMr21folOrC5y9rM1wJsg9
 U4zXGf4kngOYZpanzVjmzw31Eh0BJQW/U5oky7pBySLVqUpkORc0RwQyZ
 iorN0+G3XwWdvCcGfN/yh9jodZxbwFsWzguHJQB+OUhFhe3Wv+Dv74ijq
 3e0qa7XjuyUq0YGkcXt0BQVCk2GWdmQZkZfynsvoPu2Lw+Yn3RB6Psiah w==;
X-CSE-ConnectionGUID: 1mT1T5g+RsObOtcjlLjOcg==
X-CSE-MsgGUID: h4TWcV7pQM+HZNkpHYKOpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81513233"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81513233"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:28 -0700
X-CSE-ConnectionGUID: d8ct/+WYRD6sd4tuPaiNyA==
X-CSE-MsgGUID: ePuZzdQ3RSun1scVneYAAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244876261"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:27 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v4 08/39] drm/i915/display: Rename cpu_transcoder parameter to
 transcoder in LRR path
Date: Tue, 16 Jun 2026 18:13:44 +0530
Message-ID: <20260616124416.2442161-9-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
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

From: Animesh Manna <animesh.manna@intel.com>

intel_set_transcoder_timings_lrr() now takes the target transcoder as an
explicit argument rather than implicitly using crtc_state->cpu_transcoder,
so the parameter name 'cpu_transcoder' is misleading. Rename it to plain
'transcoder' to reflect that any transcoder may be programmed.

No functional change.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 049038742517..edb9acb1da5c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2778,13 +2778,13 @@ static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_sta
 }
 
 static void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc_state,
-					     enum transcoder cpu_transcoder)
+					     enum transcoder transcoder)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	u32 crtc_vdisplay, crtc_vtotal, crtc_vblank_start, crtc_vblank_end;
 
-	drm_WARN_ON(display->drm, transcoder_is_dsi(cpu_transcoder));
+	drm_WARN_ON(display->drm, transcoder_is_dsi(transcoder));
 
 	crtc_vdisplay = adjusted_mode->crtc_vdisplay;
 	crtc_vtotal = adjusted_mode->crtc_vtotal;
@@ -2799,7 +2799,7 @@ static void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc
 
 	if (DISPLAY_VER(display) >= 13) {
 		intel_de_write(display,
-			       TRANS_SET_CONTEXT_LATENCY(display, cpu_transcoder),
+			       TRANS_SET_CONTEXT_LATENCY(display, transcoder),
 			       crtc_state->set_context_latency);
 
 		/*
@@ -2816,7 +2816,7 @@ static void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc
 	 * The hardware actually ignores TRANS_VBLANK.VBLANK_END in DP mode.
 	 * But let's write it anyway to keep the state checker happy.
 	 */
-	intel_de_write(display, TRANS_VBLANK(display, cpu_transcoder),
+	intel_de_write(display, TRANS_VBLANK(display, transcoder),
 		       VBLANK_START(crtc_vblank_start - 1) |
 		       VBLANK_END(crtc_vblank_end - 1));
 
@@ -2826,7 +2826,7 @@ static void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc
 	 * using the VRR timing generator!). Thus updating TRANS_VSYNC
 	 * here seems fine even if it isn't double buffered.
 	 */
-	intel_de_write(display, TRANS_VSYNC(display, cpu_transcoder),
+	intel_de_write(display, TRANS_VSYNC(display, transcoder),
 		       VSYNC_START(adjusted_mode->crtc_vsync_start - 1) |
 		       VSYNC_END(adjusted_mode->crtc_vsync_end - 1));
 	/*
@@ -2842,7 +2842,7 @@ static void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc
 	 * The double buffer latch point for TRANS_VTOTAL
 	 * is the transcoder's undelayed vblank.
 	 */
-	intel_de_write(display, TRANS_VTOTAL(display, cpu_transcoder),
+	intel_de_write(display, TRANS_VTOTAL(display, transcoder),
 		       VACTIVE(crtc_vdisplay - 1) |
 		       VTOTAL(crtc_vtotal - 1));
 }
-- 
2.43.0

