Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B835C44538
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 04:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E7510EC31;
	Wed, 22 Jul 2026 04:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdo00nt4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACD610EC26;
 Wed, 22 Jul 2026 04:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784695785; x=1816231785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+939XoJoBxOz1lsgApLCqlxXV09Mfqx/sNmqdUh9TkQ=;
 b=bdo00nt4RYTQ5MunEYuoNBodCmfaMmSL39gxkWLO2lnfGyMj2JD1niRc
 QNEX3YJwRVt3+ZANQXJ/qossRTPzllUMCvXXSbeio9aKVfcoyZpwbgJvW
 ITyHdoGLaxZ2IvDXq1CW2L86jEyBYvE2llvPOPPJLS+h2jucHpZQkxnhl
 /MmQyNprHEs4kPjFAY7g5ogv/AwmbfCXvKUBU64FvHioNFJkW/Iciuubs
 /6LL63IUImpIGVRCUHMEHkp8Cj9gcZuNnD6vbjoE3zL1PllDMolvZ2OVv
 c2AZrPN1hyMUhiAG9hKNIVfYjed4IZ4IBzlA/34V3/knRi6WOWigiQRXr g==;
X-CSE-ConnectionGUID: +KJoTP3DS72II5ZuE8VrOQ==
X-CSE-MsgGUID: lDcUWiWBQ7eU6WKFF37OfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="84298484"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="84298484"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 21:49:44 -0700
X-CSE-ConnectionGUID: NfyskKTWQnWd3XdqS5rqyw==
X-CSE-MsgGUID: 0zt3DV1gQ86J1ywNUoVuWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="253603222"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa006.fm.intel.com with ESMTP; 21 Jul 2026 21:49:43 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v6 2/9] drm/i915/vrr: Restrict CMRR enable condition to
 VRR-TG-default platforms
Date: Wed, 22 Jul 2026 10:09:14 +0530
Message-ID: <20260722043923.3241977-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
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

CMRR is reported as supported from DISPLAY_VER >= 20 (HAS_CMRR), but it
is built on top of the VRR timing generator running as the default
timing generator, for now this only happens from DISPLAY_VER >= 30.
Gate the CMRR enable condition (and its readout) on both,
so CMRR is only ever enabled on platforms where the VRR timing
generator is the default.

This is a preparation patch for the upcoming CMRR enable sequence: CMRR
remains disabled for now (the "avoid CMRR" short-circuit above is kept),
and this only refines the condition so that when the enable sequence
lands, CMRR is correctly restricted to VRR-TG-default platforms. This is
in line with the comment above, which keeps CMRR disabled until VRR with
fixed timings is working.

No functional change.

--v2:
- Create a separate function to check if CMRR possible

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 51e4f3309b8b..14f8ac07c911 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -187,15 +187,21 @@ int intel_vrr_vmax_vblank_start(const struct intel_crtc_state *crtc_state)
 	return intel_vrr_vmax_vtotal(crtc_state) - crtc_state->vrr.guardband;
 }
 
+static bool intel_vrr_cmrr_possible(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	return (HAS_CMRR(display) && intel_vrr_always_use_vrr_tg(display));
+}
+
 static bool
 is_cmrr_frac_required(struct intel_crtc_state *crtc_state)
 {
-	struct intel_display *display = to_intel_display(crtc_state);
 	int calculated_refresh_k, actual_refresh_k, pixel_clock_per_line;
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 
 	/* Avoid CMRR for now till we have VRR with fixed timings working */
-	if (!HAS_CMRR(display) || true)
+	if (!intel_vrr_cmrr_possible(crtc_state) || true)
 		return false;
 
 	actual_refresh_k =
@@ -1066,7 +1072,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 	trans_vrr_ctl = intel_de_read(display,
 				      TRANS_VRR_CTL(display, cpu_transcoder));
 
-	if (HAS_CMRR(display))
+	if (intel_vrr_cmrr_possible(crtc_state))
 		crtc_state->cmrr.enable = (trans_vrr_ctl & VRR_CTL_CMRR_ENABLE);
 
 	if (crtc_state->cmrr.enable) {
-- 
2.48.1

