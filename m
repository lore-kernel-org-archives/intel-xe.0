Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF50FC88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 07:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F3210E444;
	Thu, 17 Sep 2026 07:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SeciGi0y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B2D10E444;
 Thu, 17 Sep 2026 07:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789631584; x=1821167584;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FO19pMOrYyrg3614Ca13MpV/M30JRrC1TLuPT+HmTHw=;
 b=SeciGi0y3rYOhqt4d5YnAaPGo82pVEZ0FveaJaDkbiEqTtVTf25oOE3j
 FnQ/zPPwyOZ2lgm/nrTsp3aLyf1wydn5QcC/R80kSu3JuYim1/7zcUexK
 b+NxZydvMYzPYiPmE55+KtghDisVWHxAUU3EA+1Jp9oAvGeGjOxZEXCmG
 log/Y60QKBaqs09KbA+5pXb6HboLYOt8MGvtzw1cGhVoSt2mDobmQWi0P
 iiNWBk/uJvksTm9zLNwi0pU/jPmvz8hpDElNkl5hHEbow8GNrCY5eENBs
 1QmEGdgY1+G7tob93ZrVCBoZNPYEyyQjaVrq4PJANCTV4tpSWUv0Sl6SZ A==;
X-CSE-ConnectionGUID: guGM3xtwScSII09iCkcTgg==
X-CSE-MsgGUID: ZVsZJTefTOC5RveBFgYTLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88962266"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88962266"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 00:53:04 -0700
X-CSE-ConnectionGUID: YHsfxrQhSOOQps6vDfHRBw==
X-CSE-MsgGUID: SYkElSfvSkuP+ssfeCBAsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="298724068"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa001.fm.intel.com with ESMTP; 17 Sep 2026 00:53:02 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@linux.intel.com, chaitanya.kumar.borah@intel.com,
 stable@vger.kernel.org
Subject: [PATCH v3] drm/i915/vrr: Disable DC balance by default
Date: Thu, 17 Sep 2026 13:13:22 +0530
Message-ID: <20260917074322.2606738-1-mitulkumar.ajitkumar.golani@intel.com>
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

Disable VRR DC balance by default due to timing issues observed on some
panel/TCON combinations.

Keep the module parameter to enable DC balance during debugging and to
isolate DC balance effects from underlying VRR/display timing issues.

--v2:
- Make enable_dc_balance a bool and keep it disabled by default; fix the
  parameter type/value mismatch and correct the description (Chaitanya
  Kumar Borah, Jani Nikula)
- Explain in the commit message why the feature is gated and why a
  module parameter is used (Jani Nikula)

--v3:
- Commit message update (Jani Nikula)

Fixes: 555819270707 ("drm/i915/vrr: Enable DC Balance")
Cc: <stable@vger.kernel.org> # v7.0+
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
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

