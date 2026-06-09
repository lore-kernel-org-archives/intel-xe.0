Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAFCCD8C92
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0C010E332;
	Tue,  9 Jun 2026 12:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+xepGip";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA83510E338;
 Tue,  9 Jun 2026 12:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781006666; x=1812542666;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=s7CDY3PEX0eokVtOf+DxyU4cKvulCDlL22MLcMOniRs=;
 b=G+xepGipAFGh5CZcbDAk2p8bwTh0T13GhGjx6gdnMQfSBjMtcZzfODV9
 lYBbgxIJHV4U2sXYP/PrIa2dB6c93qSgMJ6q86raslyFO3XrBOISu9mvf
 ICxcKR6S4+YCCICKbXSw5K/GaVYHUbkAdRBuXJdRGhFiFi3S1EA2N3lEo
 fcpBrIqa59DESL0Mk6iyu0XaE2hdx8XuUTz9mKzQZFBaws9aqG8Jky70v
 MInEEHcnGBidCS4C+SECIFqFF0S2t1wjAAY4WoKhDw90jnbB56Km8wgt1
 Xd2h0uOK3RnOZuI6Robty1we9UgPEgrXtVrXs0H15jp0Smb77R+HmLBe1 A==;
X-CSE-ConnectionGUID: k/aEZurNR/aF6RsOq7mqsg==
X-CSE-MsgGUID: VgB0g/AfSTykfe57FXlx3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99340451"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99340451"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:26 -0700
X-CSE-ConnectionGUID: FfawVHtEQiyRRxIPhWYARw==
X-CSE-MsgGUID: hvi81IQNThaX80r1H7m9uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="244988490"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:26 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v3 35/36] drm/i915/display: Guard CMTG function calls
Date: Tue,  9 Jun 2026 17:32:49 +0530
Message-ID: <20260609120250.867750-36-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
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

Check if DC3CO is allowed before calling CMTG
functions in intel_atomic_commit_tail() as CMTG is only used
by DC3CO DC state.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 24 ++++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 109efb36ef21..7ddd0ebb1bcb 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7569,20 +7569,20 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	/* FIXME probably need to sequence this properly */
 	intel_program_dpkgc_latency(state);
 
-	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state) {
-		bool modeset = intel_crtc_needs_modeset(new_crtc_state);
-		bool dc3co_to_dc6 = intel_display_power_get_and_reset_dc3co_to_dc6(display);
+	if (intel_display_power_dc3co_allowed(display)) {
 
-		/*
-		 * TODO: DC3co entry condition need to be checked before calling CMTG functions.
-		 */
-		if ((modeset || dc3co_to_dc6) &&
-		    new_crtc_state->hw.active && !crtc->cmtg.enabled) {
-			if (dc3co_to_dc6)
-				intel_cmtg_restore(new_crtc_state);
+		for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state) {
+			bool modeset = intel_crtc_needs_modeset(new_crtc_state);
+			bool dc3co_to_dc6 = intel_display_power_get_and_reset_dc3co_to_dc6(display);
+
+			if ((modeset || dc3co_to_dc6) &&
+			    new_crtc_state->hw.active && !crtc->cmtg.enabled) {
+				if (dc3co_to_dc6)
+					intel_cmtg_restore(new_crtc_state);
 
-			intel_cmtg_program(new_crtc_state);
-			intel_cmtg_enable_interrupt(new_crtc_state);
+				intel_cmtg_program(new_crtc_state);
+				intel_cmtg_enable_interrupt(new_crtc_state);
+			}
 		}
 	}
 
-- 
2.43.0

