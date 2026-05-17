Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BE2CD4F47
	for <intel-xe@archiver.kernel.org>; Sun, 17 May 2026 02:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77F010E231;
	Sun, 17 May 2026 02:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Plu2nauT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E0C10E22F;
 Sun, 17 May 2026 02:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778986034; x=1810522034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NnVmRh74bzU4s0rzDm5vd1frnNUHKvjU0xREINI6OyY=;
 b=Plu2nauTOpoTJnA2ejUAAdEWzyaKl4N9X3qYyUkzkxxVOE3dA/x3cNQf
 3EiCcoG0mJA7nhU7+wYgzQkdS98BXeUzodzEnBWNgXqsFocQlbzqNG1YW
 RE6ZDlPqPPa9bjfCJtnFJWQ91N3rWEySEofdNt0javkqfSHvIwcAPe+oe
 n/Rs4KwzQGWm1o1NqqQ2y4tH/3jZ1o4oyER7xFSA8+qgwnUHvXls1ybGW
 cz5p3/cD+bRLtvEYmgylTdLeWpz4C7MCf6Y9g6HHIl4QJFoS7xL7alb5O
 PggqWgzrUoOFkLunqc42I+yjyxH/xGPhN1FjAnY9T5rrdP+8FTuclbAUh Q==;
X-CSE-ConnectionGUID: 3PK6+0BpTt+nOco36X+ztQ==
X-CSE-MsgGUID: A3EF0EhCR4aWR7yy/OnaHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79601236"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="79601236"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2026 19:47:14 -0700
X-CSE-ConnectionGUID: 1N7paj3LQpyVohbL9WqelA==
X-CSE-MsgGUID: eoxxLsgQRo2cyPZKeErH2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="244055009"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa005.jf.intel.com with ESMTP; 16 May 2026 19:47:12 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] Revert "drm/i915/backlight: Remove try_vesa_interface"
Date: Sun, 17 May 2026 08:17:09 +0530
Message-Id: <20260517024709.1016121-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515155340.1000997-1-suraj.kandpal@intel.com>
References: <20260515155340.1000997-1-suraj.kandpal@intel.com>
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

This reverts commit 40d2f5820951dee818d05c14677277048bd85f9f.

Removing the try_vesa_interface gate caused a backlight regression on
panels whose VBT correctly reports INTEL_BACKLIGHT_DISPLAY_DDI and whose
PWM path is the actual backlight control, but whose DPCD optimistically
advertises DP_EDP_BACKLIGHT_AUX_ENABLE_CAP / _BRIGHTNESS_AUX_SET_CAP.
After the commit such panels silently bind to the VESA AUX backlight
funcs; AUX writes complete but the panel ignores them, leaving
brightness stuck (no-op backlight). Observed on at least KBL and TGL
eDP setups.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index a8d56ebf06a2..7a6c07f6aaeb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -691,10 +691,9 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_device *dev = connector->base.dev;
 	struct intel_panel *panel = &connector->panel;
-	bool try_intel_interface = false;
+	bool try_intel_interface = false, try_vesa_interface = false;
 
-	/*
-	 * Check the VBT and user's module parameters to figure out which
+	/* Check the VBT and user's module parameters to figure out which
 	 * interfaces to probe
 	 */
 	switch (display->params.enable_dpcd_backlight) {
@@ -703,6 +702,7 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
 	case INTEL_DP_AUX_BACKLIGHT_AUTO:
 		switch (panel->vbt.backlight.type) {
 		case INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE:
+			try_vesa_interface = true;
 			break;
 		case INTEL_BACKLIGHT_DISPLAY_DDI:
 			try_intel_interface = true;
@@ -715,12 +715,20 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
 		if (panel->vbt.backlight.type != INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE)
 			try_intel_interface = true;
 
+		try_vesa_interface = true;
+		break;
+	case INTEL_DP_AUX_BACKLIGHT_FORCE_VESA:
+		try_vesa_interface = true;
 		break;
 	case INTEL_DP_AUX_BACKLIGHT_FORCE_INTEL:
 		try_intel_interface = true;
 		break;
 	}
 
+	/* For eDP 1.5 and above we are supposed to use VESA interface for brightness control */
+	if (intel_dp->edp_dpcd[0] >= DP_EDP_15)
+		try_vesa_interface = true;
+
 	/*
 	 * Since Intel has their own backlight control interface, the majority of machines out there
 	 * using DPCD backlight controls with Intel GPUs will be using this interface as opposed to
@@ -733,9 +741,6 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
 	 * panel with Intel's OUI - which is also required for us to be able to detect Intel's
 	 * backlight interface at all. This means that the only sensible way for us to detect both
 	 * interfaces is to probe for Intel's first, and VESA's second.
-	 *
-	 * Also there is a chance some VBTs may advertise false Intel backlight support even if the
-	 * TCON DPCD says otherwise. This means we keep VESA interface as fallback in that case.
 	 */
 	if (try_intel_interface && intel_dp->edp_dpcd[0] <= DP_EDP_14b &&
 	    intel_dp_aux_supports_hdr_backlight(connector)) {
@@ -745,7 +750,7 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
 		return 0;
 	}
 
-	if (intel_dp_aux_supports_vesa_backlight(connector)) {
+	if (try_vesa_interface && intel_dp_aux_supports_vesa_backlight(connector)) {
 		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Using VESA eDP backlight controls\n",
 			    connector->base.base.id, connector->base.name);
 		panel->backlight.funcs = &intel_dp_vesa_bl_funcs;
-- 
2.34.1

