Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27154C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 04:10:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1D710F923;
	Tue, 15 Sep 2026 04:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izDg3oiY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADC810F923;
 Tue, 15 Sep 2026 04:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789445399; x=1820981399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I4GK5h/0hM8df+64hM92F0X1gETTEa8NrqMuVM63Vr0=;
 b=izDg3oiYv3UNP5E2XfOxb3d0rKdnpVk/yLvL33Vstw9qY14WF7w6stTR
 M08DP6It+h6NMNSfbC6CQSaE/eWKowYjFzMgzoIR5yXbwTsbvkiGJmU9k
 Z1rdkPEH+BUjR6ulzxJFbhOoS+Ld0t++ZgeR+aTSiOWAOtgoDySU+ixIs
 EfHt00PXUqjjXbQJAni+8l8UvWsuJ1KufNY8QIKyR19PxopP0n8QeVnuL
 NSeduZ9lrNzItZGZgFG1lVKOVagJcio6F8BXW21cUXYMhV1503+1Stnry
 hlzwqyGzGQjeVdjZbGgpuHUIuL1zf6o2g+G5suuj5pGZzMObr744SjsoP w==;
X-CSE-ConnectionGUID: 76sq4Q/zQzq3gTh0kRAnDw==
X-CSE-MsgGUID: YuxWUbOhQF20sIEuJJ2pvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89931380"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89931380"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 21:09:59 -0700
X-CSE-ConnectionGUID: aScqnxVUT9yiWHKWKs0k1Q==
X-CSE-MsgGUID: FC+kMuRjSH2XZVUtc4BCpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="297851889"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa001.fm.intel.com with ESMTP; 14 Sep 2026 21:09:57 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	ankit.k.nautiyal@intel.com
Subject: [PATCH v2] drm/i915/display: Add command line param for DC balance
Date: Tue, 15 Sep 2026 09:30:15 +0530
Message-ID: <20260915040015.2451786-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
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

Add an 'enable_dc_balance' display module parameter, disabled by
default, so the feature can be explicitly opted in at driver
initialization on configurations where it is known to be beneficial,
while preserving existing behaviour everywhere else.
intel_vrr_dc_balance_compute_config() honours the parameter, so no
recompilation is needed to try the feature.

--v2:
- Make enable_dc_balance a bool and keep it disabled by default; fix the
  parameter type/value mismatch and correct the description (Chaitanya
  Kumar Borah, Jani Nikula)
- Explain in the commit message why the feature is gated and why a
  module parameter is used (Jani Nikula)

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_params.c | 4 ++++
 drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
 drivers/gpu/drm/i915/display/intel_vrr.c            | 4 +++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
index 2aed110c5b090..ca0ef466bb103 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.c
+++ b/drivers/gpu/drm/i915/display/intel_display_params.c
@@ -120,6 +120,10 @@ intel_display_param_named_unsafe(enable_psr, int, 0400,
 	"(0=disabled, 1=enable up to PSR1, 2=enable up to PSR2) "
 	"Default: -1 (use per-chip default)");
 
+intel_display_param_named_unsafe(enable_dc_balance, bool, 0400,
+	"Enable VRR DC balance (0=disabled, 1=enabled). "
+	"Default: 0 (disabled)");
+
 intel_display_param_named_unsafe(enable_panel_replay, int, 0400,
 	"Enable Panel Replay (0=disabled, 1=enabled). Default: -1 (use per-chip default)");
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index ba01aeaf89440..5c5a1a1358c32 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -46,6 +46,7 @@ struct drm_printer;
 	param(bool, enable_dp_mst, true, 0600) \
 	param(int, enable_fbc, -1, 0600) \
 	param(int, enable_psr, -1, 0600) \
+	param(bool, enable_dc_balance, false, 0600) \
 	param(int, enable_panel_replay, -1, 0600) \
 	param(bool, psr_safest_params, false, 0400) \
 	param(bool, enable_psr2_sel_fetch, true, 0400) \
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index e36db11744405..1698c54e258b4 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -439,10 +439,12 @@ static bool intel_vrr_dc_balance_possible(const struct intel_crtc_state *crtc_st
 static void
 intel_vrr_dc_balance_compute_config(struct intel_crtc_state *crtc_state)
 {
+	struct intel_display *display = to_intel_display(crtc_state);
 	int guardband_usec, adjustment_usec;
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 
-	if (!intel_vrr_dc_balance_possible(crtc_state) || !crtc_state->vrr.enable)
+	if (!intel_vrr_dc_balance_possible(crtc_state) ||
+	    !crtc_state->vrr.enable || !display->params.enable_dc_balance)
 		return;
 
 	crtc_state->vrr.dc_balance.vmax = crtc_state->vrr.vmax;
-- 
2.48.1

