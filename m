Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C35CD58E56
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 04:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3195010E42D;
	Mon,  2 Mar 2026 04:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOX+RQZ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A7610E42D;
 Mon,  2 Mar 2026 04:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772424390; x=1803960390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YdFxXf9K2ra8sAheHhlvBnUlq9w/q21/sQ9O6ehNUj0=;
 b=bOX+RQZ2d2mqj4u/xcDEJaezQ2YB8A2LP4kMcYi9BWXXHFnEal247kWX
 uiBlrfB40xqjh6jufGcbVuBpdd2z6I5+1/8V/oh13rFm5SY4FhASIkUJQ
 Q7HoxHpLZWcDsXk8Il4C6TTcW+sbakGQVct9ORjMjQRB8coBTx7kHwpeM
 0khfIQrEAJJ7Xn12WVXmd5ShkaND5Pv0lCGHDYEQNcrYMvkTtGzMvUVVm
 csTq7UIF1klBSYmpxbpkCldTr+X75HUVsgE9K5277DghPbowXPfqdimnD
 yieAeHr0X3FctgvaN340QFN+Oa6/DXrNu/DjYCQP0Qjktzuxsqs9sD8cV Q==;
X-CSE-ConnectionGUID: 2epk7ZISS9Cf++91V9Z7sQ==
X-CSE-MsgGUID: ovC5ZZLqQsywyVPOYIgSaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="77294451"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="77294451"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 20:06:30 -0800
X-CSE-ConnectionGUID: 4iP94NO6RKG8dRgLncsiRg==
X-CSE-MsgGUID: iGeZ/Q6MRiOL6eYK0wWAFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="217541027"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 01 Mar 2026 20:06:28 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [RESEND 7/8] drm/i915/backlight: Provide clear description on how
 backlight level is controlled
Date: Mon,  2 Mar 2026 09:36:12 +0530
Message-Id: <20260302040613.3324049-8-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302040613.3324049-1-suraj.kandpal@intel.com>
References: <20260302040613.3324049-1-suraj.kandpal@intel.com>
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

Currently it takes us multiple log prints to arrive at the conclusion
on how we are actually controlling backlight level. Make the logging
concise.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index af05b30a0a7a..cedfbf516b5d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -368,6 +368,16 @@ static const char *dpcd_vs_pwm_str(bool aux)
 	return aux ? "DPCD" : "PWM";
 }
 
+static const char *backlight_unit_str(struct intel_panel *panel)
+{
+	if (panel->backlight.edp.vesa.info.luminance_set)
+		return "NITS";
+	else if (panel->backlight.edp.vesa.info.aux_set)
+		return "Brightness %";
+	else
+		return "PWM";
+}
+
 static void
 intel_dp_aux_write_panel_luminance_override(struct intel_connector *connector)
 {
@@ -542,9 +552,11 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 		    dpcd_vs_pwm_str(panel->backlight.edp.vesa.info.aux_enable ||
 				    panel->backlight.edp.vesa.info.luminance_set));
 	drm_dbg_kms(display->drm,
-		    "[CONNECTOR:%d:%s] AUX VESA backlight level is controlled through %s\n",
+		    "[CONNECTOR:%d:%s] AUX VESA backlight level is controlled through %s using %s values\n",
 		    connector->base.base.id, connector->base.name,
-		    dpcd_vs_pwm_str(panel->backlight.edp.vesa.info.aux_set));
+		    dpcd_vs_pwm_str(panel->backlight.edp.vesa.info.aux_set ||
+				    panel->backlight.edp.vesa.info.luminance_set),
+		    backlight_unit_str(panel));
 
 	if (!panel->backlight.edp.vesa.info.aux_set ||
 	    !panel->backlight.edp.vesa.info.aux_enable) {
@@ -569,9 +581,6 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 		panel->backlight.enabled = panel->backlight.level != 0;
 		if (!panel->backlight.level)
 			panel->backlight.level = panel->backlight.max;
-		drm_dbg_kms(display->drm,
-			    "[CONNECTOR:%d:%s] AUX VESA Nits backlight level is controlled through DPCD\n",
-			    connector->base.base.id, connector->base.name);
 	} else if (panel->backlight.edp.vesa.info.aux_set) {
 		panel->backlight.max = panel->backlight.edp.vesa.info.max;
 		panel->backlight.min = 0;
-- 
2.34.1

