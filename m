Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C076CE9A04C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 13:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3C810E6CE;
	Thu, 19 Feb 2026 13:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nCMeonqM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4FA10E0AC;
 Thu, 19 Feb 2026 13:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771506484; x=1803042484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oG8IDVvOXCZbhbLGPyel7P4Y5Xx0Y2fz4FVVVvp8D58=;
 b=nCMeonqMAhfZvINXmhtw/btQOUY/7mr+nicj4uanJ7gQmSTOOT55NP57
 +yhoT4s1RxPkRQwTAFHwydLJN32NWGqBNXHckoCoQZwywv2l+anwyOzkE
 i14DodHMs+lj1DjLlKByHvG2UQtNYK2ywdaVYBJYJSALmSWYBC+FGDVW+
 DSp4W66DXff08vjPtDKOKtxf3yugZgGPH8yd0V756eZVr2BYtYO5CS+85
 EqT/E7fyd5KlV5blpa9zPnhBmw7yMDGufdZHGtz7RvbVDqykJRF1KbBQf
 d/jdKW4Hg6AUF97IqT4u72L+s38/so1POTetU9wpWK1mAimIUCYyMQZJu Q==;
X-CSE-ConnectionGUID: 7uigBdg1S/y44d7Si6IUJA==
X-CSE-MsgGUID: fN9ISJK8SqqiD4gqXrw7tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72475497"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72475497"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 05:08:03 -0800
X-CSE-ConnectionGUID: 3liwWQRKQ2irxBxICy5Ugg==
X-CSE-MsgGUID: trry5lNsRDu+uJQ9sHQWyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="212458564"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.120])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 05:08:02 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 1/5] drm/i915/psr: Repeat Selective Update area alignment
Date: Thu, 19 Feb 2026 15:07:39 +0200
Message-ID: <20260219130743.1232188-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219130743.1232188-1-jouni.hogander@intel.com>
References: <20260219130743.1232188-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Currently we are aligning Selective Update area to cover cursor fully if
needed only once. It may happen that cursor is in Selective Update area
after pipe alignment and after that covering cursor plane only
partially. Fix this by looping alignment as long as alignment isn't needed
anymore.

Fixes: 1bff93b8bc27 ("drm/i915/psr: Extend SU area to cover cursor fully if needed")
Cc: <stable@vger.kernel.org> # v6.9+
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 32 ++++++++++++++++--------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 5bea2eda744b..331645a2c9f6 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2688,11 +2688,12 @@ static void clip_area_update(struct drm_rect *overlap_damage_area,
 		overlap_damage_area->y2 = damage_area->y2;
 }
 
-static void intel_psr2_sel_fetch_pipe_alignment(struct intel_crtc_state *crtc_state)
+static bool intel_psr2_sel_fetch_pipe_alignment(struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	const struct drm_dsc_config *vdsc_cfg = &crtc_state->dsc.config;
 	u16 y_alignment;
+	bool aligned = false;
 
 	/* ADLP aligns the SU region to vdsc slice height in case dsc is enabled */
 	if (crtc_state->dsc.compression_enable &&
@@ -2701,10 +2702,18 @@ static void intel_psr2_sel_fetch_pipe_alignment(struct intel_crtc_state *crtc_st
 	else
 		y_alignment = crtc_state->su_y_granularity;
 
-	crtc_state->psr2_su_area.y1 -= crtc_state->psr2_su_area.y1 % y_alignment;
-	if (crtc_state->psr2_su_area.y2 % y_alignment)
+	if (crtc_state->psr2_su_area.y1 % y_alignment) {
+		crtc_state->psr2_su_area.y1 -= crtc_state->psr2_su_area.y1 % y_alignment;
+		aligned = true;
+	}
+
+	if (crtc_state->psr2_su_area.y2 % y_alignment) {
 		crtc_state->psr2_su_area.y2 = ((crtc_state->psr2_su_area.y2 /
 						y_alignment) + 1) * y_alignment;
+		aligned = true;
+	}
+
+	return aligned;
 }
 
 /*
@@ -2945,15 +2954,16 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 	if (ret)
 		return ret;
 
-	/*
-	 * Adjust su area to cover cursor fully as necessary (early
-	 * transport). This needs to be done after
-	 * drm_atomic_add_affected_planes to ensure visible cursor is added into
-	 * affected planes even when cursor is not updated by itself.
-	 */
-	intel_psr2_sel_fetch_et_alignment(state, crtc, &cursor_in_su_area);
+	do {
+		/*
+		 * Adjust su area to cover cursor fully as necessary (early
+		 * transport). This needs to be done after
+		 * drm_atomic_add_affected_planes to ensure visible cursor is added into
+		 * affected planes even when cursor is not updated by itself.
+		 */
+		intel_psr2_sel_fetch_et_alignment(state, crtc, &cursor_in_su_area);
 
-	intel_psr2_sel_fetch_pipe_alignment(crtc_state);
+	} while (intel_psr2_sel_fetch_pipe_alignment(crtc_state));
 
 	/*
 	 * Now that we have the pipe damaged area check if it intersect with
-- 
2.43.0

