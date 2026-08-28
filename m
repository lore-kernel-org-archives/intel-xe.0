Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C250C61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 09:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD2910F2FE;
	Fri, 28 Aug 2026 09:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdSOoeNU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B019C10F2FC;
 Fri, 28 Aug 2026 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787907631; x=1819443631;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9haalhvNYYI+D00r5O2IJBlyVdkN2m6Jm5VvOeuu8NY=;
 b=FdSOoeNUGggH1fufX4zNzghUNx9RuEQp1cQ+xH24Edy/TQ593dPibRuz
 AfdWfwHnZU5lqDExQfQKZMX718xmYNDZGkDE2Ajf9Ox7/OBhsZ/E4LTqi
 cfoPFjrmAJS4uruvvjla78YDIIXwYKm4CeKeoWhr2Tifzg9oPcUyVl49s
 ZgECn6BYLs1SXNJAMmqiSntgx8J6cx6TlMg/LDpXBp3myXVgPl5GnQdzL
 fCk4UOIBj71zOgFcc6rL+NK0Ci15zKs9aqv0/dWFI64Uv6Wljbg+IniFO
 7NBe0nezpNwEL2YGHJsZ4kP10HmMXv/GQ8m310AzzhTgiS0YRoMIiZm0A Q==;
X-CSE-ConnectionGUID: I+dgsgLLRwmz9bjRAx0w6w==
X-CSE-MsgGUID: v4IIxkNBTNuWMC7QlGmCTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="111190558"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="111190558"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 02:00:31 -0700
X-CSE-ConnectionGUID: E4tsy1fLRlObfTom/gzfvg==
X-CSE-MsgGUID: /9Rt3sdXSZGAZoADw1DXrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="271629170"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa003.jf.intel.com with ESMTP; 28 Aug 2026 02:00:29 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	ankit.k.nautiyal@intel.com
Subject: [PATCH v1] drm/i915/display: Add command line param for DC balance
Date: Fri, 28 Aug 2026 14:20:36 +0530
Message-ID: <20260828085037.1430881-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add a new module parameter 'enable_dc_balance' to allow enabling or
disabling the VRR DC balance feature at runtime. The DC balance
computation in intel_vrr_dc_balance_compute_config() now honours this
parameter, so the feature can be toggled without recompiling.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_params.c | 3 +++
 drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
 drivers/gpu/drm/i915/display/intel_vrr.c            | 4 +++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
index 2aed110c5b09..ed3aa84c5d43 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.c
+++ b/drivers/gpu/drm/i915/display/intel_display_params.c
@@ -120,6 +120,9 @@ intel_display_param_named_unsafe(enable_psr, int, 0400,
 	"(0=disabled, 1=enable up to PSR1, 2=enable up to PSR2) "
 	"Default: -1 (use per-chip default)");
 
+intel_display_param_named_unsafe(enable_dc_balance, int, 0400,
+	"Enable DC Balance (0=disabled, 1=enable). Default: 1 (use per-chip default)");
+
 intel_display_param_named_unsafe(enable_panel_replay, int, 0400,
 	"Enable Panel Replay (0=disabled, 1=enabled). Default: -1 (use per-chip default)");
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index b95ecf728daa..8c28c27e2c46 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -46,6 +46,7 @@ struct drm_printer;
 	param(bool, enable_dp_mst, true, 0600) \
 	param(int, enable_fbc, -1, 0600) \
 	param(int, enable_psr, -1, 0600) \
+	param(int, enable_dc_balance, false, 0600) \
 	param(int, enable_panel_replay, -1, 0600) \
 	param(bool, psr_safest_params, false, 0400) \
 	param(bool, enable_psr2_sel_fetch, true, 0400) \
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index e36db1174440..1698c54e258b 100644
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

