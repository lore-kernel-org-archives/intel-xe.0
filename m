Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A63BCD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 06:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B8810ED7F;
	Mon,  8 Jun 2026 06:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EqVmwB1Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B8D10ED77;
 Mon,  8 Jun 2026 06:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780900253; x=1812436253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vIV/7NLaM9L42UgtUQSBG2+IZ7yiv7K7Ijrux5kQKsE=;
 b=EqVmwB1QY+kskaGNA2qO6ufevOq2JHzvoLonTg8dgGhK/kwayjk7A3Kl
 QauanKrierM7YJ/WcGQVXz5pkTSfTeWQvwmPaKarq76k3k8izOwVtVjJI
 /rqjdzkLY87xOtcYeK1FEp/akLIGAyjugsi3wdQPBaFGIrak4cb5Irnow
 uFJSm1AQDAa4Mv/276ze+4lTt1+YXU80R/yYcfg3gBkPSHycR2bSs+5I/
 /qzqwQcyYqX8SMN7eBa8cb1YS4/io3nLNb7eLPHJLDcprfwJmbxpO2eC2
 bxIuqpzoUqevkjgU4CB+zeYi/pIxpAagTrVDtByIjJI9nApWSNwkfEDRn w==;
X-CSE-ConnectionGUID: X+39hnrYSmWW95BIlIwl1A==
X-CSE-MsgGUID: Gwa3iUFZTzy00WQUPq0pUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85482744"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85482744"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 23:30:42 -0700
X-CSE-ConnectionGUID: lLD4fbA4SGmGnTsG/7GgNg==
X-CSE-MsgGUID: ASAPUWoKQyCWPoMElBT5bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269158711"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa002.fm.intel.com with ESMTP; 07 Jun 2026 23:30:41 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 6/6] drm/i915/cursor: Allow joiner cursor fast path update
Date: Mon,  8 Jun 2026 11:56:29 +0530
Message-Id: <20260608062629.820477-7-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260608062629.820477-1-nemesa.garg@intel.com>
References: <20260608062629.820477-1-nemesa.garg@intel.com>
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

The legacy cursor path forced all joiner updates to the
slow path by checking joiner_pipes.
Drop the condition so that joiner cursor updates can use
the fast path.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index cb1fcae8a445..b9acdb2d8ea7 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -909,13 +909,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	 * PSR2 selective fetch also requires the slow path as
 	 * PSR2 plane and transcoder registers can only be updated during
 	 * vblank.
-	 *
-	 * FIXME joiner fastpath would be good
 	 */
 	if (!crtc_state->hw.active ||
 	    intel_crtc_needs_modeset(crtc_state) ||
-	    intel_crtc_needs_fastset(crtc_state) ||
-	    crtc_state->joiner_pipes)
+	    intel_crtc_needs_fastset(crtc_state))
 		goto slow;
 
 	/*
@@ -1113,14 +1110,13 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	 */
 	for (int i = 0; i < num_pipes; i++) {
 		struct intel_plane_state *old_pipe = old_pipe_states[i];
-		struct intel_crtc *owner_crtc = pipe_crtcs[i];
 
 		if (old_pipe->ggtt_vma != new_pipe_states[i]->ggtt_vma) {
 			drm_vblank_work_init(&old_pipe->unpin_work,
-					     &owner_crtc->base,
+					     &crtc->base,
 					     intel_cursor_unpin_work);
 			drm_vblank_work_schedule(&old_pipe->unpin_work,
-						 drm_crtc_accurate_vblank_count(&owner_crtc->base) + 1,
+						 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
 						 false);
 			old_pipe_states[i] = NULL;
 		} else {
-- 
2.25.1

