Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BB3FF8868
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 18:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9C010E8DE;
	Mon, 27 Apr 2026 18:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3Vr1s8Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FFC10E8DA;
 Mon, 27 Apr 2026 18:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777315397; x=1808851397;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MZOgGXps4ARg2Jmv8Rjq+IdfnSMLpri3izUiL6i7Of8=;
 b=O3Vr1s8Y6K4PX49pNyvMVPTPkxgG64iyoRpxxhm1MSNh/pd17oFvSvqV
 7vImL76UFRpEFmp2Q2AtbQQKA0Hc6TApfr2VwD6AXtcQ30b0O72TIeu25
 E1TKdY7Ok+soR2MbR6r5WPUxbWUTfbYxdK+qyFUboHKnPty//E3gVw1EX
 ovrRTkCPnrmoM1Yrd1arcvRPXTBPNViWBpBJlBHf5VNCPTyWHjZrS2x/d
 TpghdgGwGUcgLADMggk18OMVsWrpMmpi4htTwKHIJ3+MMqz4uhSPrBcTC
 Xo4cLJQtzOI7O59/veBFAV4K2IIDn/j6X605d5xrhpGt6Z7DXpSIGL7hp A==;
X-CSE-ConnectionGUID: 3KeDM30FR5mS2iqW2wvD6A==
X-CSE-MsgGUID: WBHdmafDR6O7x+p0MLDmJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78197999"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78197999"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 11:43:17 -0700
X-CSE-ConnectionGUID: KyBjdXekSwyBZXwaELU5oQ==
X-CSE-MsgGUID: jQAmmDEZQkGjjUjOaDoyDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="238755276"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.116])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 11:43:15 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/i915/scaler: Don't preserve scaler state over
 modeset/fastset
Date: Mon, 27 Apr 2026 21:43:12 +0300
Message-ID: <20260427184312.31945-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Currently we try to preserve the scaler state across modeset/fastsets.
That does not work correctly with the sharpness filter because the
scaler selected prior to the modeset/fastset may not support the
sharpness filter, and a new scaler will not be allocated if a
scaler has already been selected.

Simply reset the scaler state fully on modeset/fastset so that all
scalers get allocated from scratch.

It might be nice to preserve the previous scaler allocation (if
still workable) because a failed vblank evasion in combination
with scaler reassignment might have slightly more serious
consequences than a vblank evasion failure without scaler
reassignment. But the scaler allocation code will basically
need a full rewrite to handle all the corner cases correctly.
In the meantime let's just stick to whatever works.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 674a4ece6d0f..b3d1a4de2319 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4638,7 +4638,6 @@ intel_crtc_prepare_cleared_state(struct intel_atomic_state *state,
 
 	saved_state->uapi = crtc_state->uapi;
 	saved_state->inherited = crtc_state->inherited;
-	saved_state->scaler_state = crtc_state->scaler_state;
 	saved_state->intel_dpll = crtc_state->intel_dpll;
 	saved_state->dpll_hw_state = crtc_state->dpll_hw_state;
 	memcpy(saved_state->icl_port_dplls, crtc_state->icl_port_dplls,
-- 
2.52.0

