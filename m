Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6B7C25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 08:00:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EC810E94F;
	Fri, 27 Oct 2023 08:00:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1F610E963
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 08:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698393609; x=1729929609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A25T+C79lYuRMD2ICR3Z+aCnEqXnfYI1CzI6Jm2h6mA=;
 b=kzPHfdkwoWvAiMSMxeOG02x2480MsquNziqhgVjs0FifwnceYIlzEkKV
 wsf/KX6rOVDgWhpQKSlRFo1eTfy8VAV14NNABmsE8tbNVCOysZ0CeinGj
 RIry9mRsFwE2V5GpE1+vK/h0PJqmImXxe7rD+zpxQE23BgIehp78LuV7h
 2BXxQkt7FnfWKx/mZDPPed8p8kmf0vXt6xTt0CvC8Fio1KRAXEuFIVYOm
 vCR4PeJeUfwXjd93Vi0VzKBP3qB7xm3y9FebRNrZURz1J9B3+Bx/29Knq
 ekcX7DXRDVHdW2pDm6wvZHIBYX51War4/5yreeJ3qfvkQiQQW8iIUws0d A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391603821"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="391603821"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794510326"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="794510326"
Received: from inyestex-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.212.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 01:00:07 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 10:59:06 +0300
Message-Id: <20231027075918.2206862-20-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 19/31] drm/i915/display: Move edp_vswing module
 parameter under display
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231024124109.384973-16-jouni.hogander@intel.com
(cherry picked from commit 87706a67ad57725470a0512d26ea2aaca700e2d5)
---
 drivers/gpu/drm/i915/display/intel_bios.c           | 4 ++--
 drivers/gpu/drm/i915/display/intel_display_params.c | 6 ++++++
 drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
 drivers/gpu/drm/i915/i915_params.c                  | 6 ------
 drivers/gpu/drm/i915/i915_params.h                  | 1 -
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 70c0491aac42..69db1a3a1499 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -1514,9 +1514,9 @@ parse_edp(struct drm_i915_private *i915,
 		u8 vswing;
 
 		/* Don't read from VBT if module parameter has valid value*/
-		if (i915->params.edp_vswing) {
+		if (i915->display.params.edp_vswing) {
 			panel->vbt.edp.low_vswing =
-				i915->params.edp_vswing == 1;
+				i915->display.params.edp_vswing == 1;
 		} else {
 			vswing = (edp->edp_vswing_preemph >> (panel_type * 4)) & 0xF;
 			panel->vbt.edp.low_vswing = vswing == 0;
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
index 2d721afaba30..70a475223512 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.c
+++ b/drivers/gpu/drm/i915/display/intel_display_params.c
@@ -66,6 +66,12 @@ intel_display_param_named_unsafe(invert_brightness, int, 0400,
 	"to dri-devel@lists.freedesktop.org, if your machine needs it. "
 	"It will then be included in an upcoming module version.");
 
+/* WA to get away with the default setting in VBT for early platforms.Will be removed */
+intel_display_param_named_unsafe(edp_vswing, int, 0400,
+	"Ignore/Override vswing pre-emph table selection from VBT "
+	"(0=use value from vbt [default], 1=low power swing(200mV),"
+	"2=default swing(400mV))");
+
 intel_display_param_named_unsafe(enable_fbc, int, 0400,
 	"Enable frame buffer compression for power savings "
 	"(default: -1 (use per-chip default))");
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index 4723b4522413..10c79ce23063 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -34,6 +34,7 @@ struct drm_i915_private;
 	param(int, disable_power_well, -1, 0400) \
 	param(bool, enable_ips, true, 0600) \
 	param(int, invert_brightness, 0, 0600) \
+	param(int, edp_vswing, 0, 0400) \
 	param(int, enable_fbc, -1, 0600) \
 	param(int, enable_psr, -1, 0600) \
 	param(bool, psr_safest_params, false, 0400) \
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 423fe54484e1..6b9df9f9d842 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -111,12 +111,6 @@ i915_param_named(verbose_state_checks, bool, 0600,
 i915_param_named_unsafe(nuclear_pageflip, bool, 0400,
 	"Force enable atomic functionality on platforms that don't have full support yet.");
 
-/* WA to get away with the default setting in VBT for early platforms.Will be removed */
-i915_param_named_unsafe(edp_vswing, int, 0400,
-	"Ignore/Override vswing pre-emph table selection from VBT "
-	"(0=use value from vbt [default], 1=low power swing(200mV),"
-	"2=default swing(400mV))");
-
 i915_param_named_unsafe(enable_guc, int, 0400,
 	"Enable GuC load for GuC submission and/or HuC load. "
 	"Required functionality can be selected using bitmask values. "
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index ae0873443a65..c33edaee5032 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -55,7 +55,6 @@ struct drm_printer;
 	param(char *, gsc_firmware_path, NULL, 0400) \
 	param(bool, memtest, false, 0400) \
 	param(int, mmio_debug, -IS_ENABLED(CONFIG_DRM_I915_DEBUG_MMIO), 0600) \
-	param(int, edp_vswing, 0, 0400) \
 	param(unsigned int, reset, 3, 0600) \
 	param(unsigned int, inject_probe_failure, 0, 0) \
 	param(int, enable_dpcd_backlight, -1, 0600) \
-- 
2.34.1

