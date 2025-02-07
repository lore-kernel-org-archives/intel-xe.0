Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35021C0219E
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 22:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F313910EBB9;
	Fri,  7 Feb 2025 22:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jVaMA5oq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6BE10EBB7;
 Fri,  7 Feb 2025 22:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738967534; x=1770503534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MIQrRcxB+ew8QmvEwYpgTGEPwI8zzZUnTHX6l+LOz08=;
 b=jVaMA5oqPuQOuygMp94n0dI61D/A7IGGNlCOwxF4WCYGAvJy1CjQShe+
 Bk2NAMpim0wTZn0B9VqtS21rFS+bd7iyBejphX36Zb90N6xP0CTLdx7B+
 HR+9oRStGjmUY8nfH4u8nBaYuQsiqP19UcwEHmZRTmVXQsf+2o3kcrKgT
 4V7P2zTJtGcte03xI4ihGO7yAQccSFfB/98A7Hs42hvVJK+3Sw53AxbaO
 PUjS+FIhec9SjmHukuyZluDARIMDJpX0HLHamRzjV4Oej9DQ7z3pOgGfA
 MUVJ5Bx4wqS7s+tXP6O7BewB89fkaxJhvRYOkfZ+5gKE/9fOnAeJumViy Q==;
X-CSE-ConnectionGUID: 2HaV+xfJSoGcBdT1jbEgYA==
X-CSE-MsgGUID: 7kUP14UwQt6ex4GL+vKDIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39313395"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="39313395"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:32:14 -0800
X-CSE-ConnectionGUID: tADcrjRyT06vE457A9vM8g==
X-CSE-MsgGUID: 614qshm7Qf+E3hxtCXEdKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="111857435"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Feb 2025 14:32:12 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 08 Feb 2025 00:32:11 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 4/8] drm/i915/dsb: Compute use_dsb earlier
Date: Sat,  8 Feb 2025 00:31:55 +0200
Message-ID: <20250207223159.14132-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250207223159.14132-1-ville.syrjala@linux.intel.com>
References: <20250207223159.14132-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Skip all the commit completion interrupt stuff on the
chained DSB when we don't take the full DSB path (ie. when
the plane/pipe programming is done via MMIO). The commit
completion will be done via the CPU side vblank interrupt.

Currently this is just a redundant interrupt, so not a big
deal. But in the future we'll be moving the TRANS_PUSH write
into the chained DSB as well, and that we definitely don't
want to do when it's also being done by the CPU from
intel_pipe_update_end().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c   |  6 ++++--
 drivers/gpu/drm/i915/display/intel_display.c | 15 +++++++++------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 8400a97f7e43..792cf7cef58a 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1987,8 +1987,10 @@ void intel_color_prepare_commit(struct intel_atomic_state *state,
 
 	display->funcs.color->load_luts(crtc_state);
 
-	intel_dsb_wait_vblank_delay(state, crtc_state->dsb_color_vblank);
-	intel_dsb_interrupt(crtc_state->dsb_color_vblank);
+	if (crtc_state->use_dsb) {
+		intel_dsb_wait_vblank_delay(state, crtc_state->dsb_color_vblank);
+		intel_dsb_interrupt(crtc_state->dsb_color_vblank);
+	}
 
 	intel_dsb_finish(crtc_state->dsb_color_vblank);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a50b0a008231..452b70ffe97c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7676,12 +7676,6 @@ static void intel_atomic_prepare_plane_clear_colors(struct intel_atomic_state *s
 
 static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
 				     struct intel_crtc *crtc)
-{
-	intel_color_prepare_commit(state, crtc);
-}
-
-static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
-				    struct intel_crtc *crtc)
 {
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
@@ -7704,6 +7698,15 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
 		!intel_crtc_needs_modeset(new_crtc_state) &&
 		!intel_crtc_needs_fastset(new_crtc_state);
 
+	intel_color_prepare_commit(state, crtc);
+}
+
+static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
+				    struct intel_crtc *crtc)
+{
+	struct intel_crtc_state *new_crtc_state =
+		intel_atomic_get_new_crtc_state(state, crtc);
+
 	if (!new_crtc_state->use_dsb && !new_crtc_state->dsb_color_vblank)
 		return;
 
-- 
2.45.3

