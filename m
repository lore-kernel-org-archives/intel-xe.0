Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CC9EFB7F5
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 03:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464A210E4A8;
	Tue, 24 Feb 2026 03:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GESr/QVm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBBD10E4A6;
 Tue, 24 Feb 2026 03:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771904742; x=1803440742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JE55NGO6XNJbfXNGe9wiitFTfZPdiA55t/B0sRS7myo=;
 b=GESr/QVmZOuVU9IBoyXguxF6xoN9zS3FzbNFmzA2RE1qRBnOTveTJRWa
 VSqCIeup4gQxZ1qTQT1RgMVdgj8VTu5Bvwz6PSaGVQf2Y7KP5c37jeYTE
 PaH3RkNiR+qtqXiEmrL3XuEsMSrDMBjRPySXcQtbbM3vD9IgXpv2Oundq
 TYw9HZKudhLdYdqd7rjSUjzqCQ4aPmejytErDQZjbk9petMDGlKOj7HVl
 qIkRB1KtyxDHfB4o1bd98wQzCOs58koItyoS+Ey7vLAZ/NosTmUwMep3z
 RTwRHdr8qCAX5HXR3GFQxSeKKjsNI05FXb6ix5Bvg07uhqlc0HIBcSL9s g==;
X-CSE-ConnectionGUID: NJN9j1icRX2RV1wqss9aiw==
X-CSE-MsgGUID: PQC7SX0gRUuZ4I7c+1cZkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72817867"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72817867"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 19:45:42 -0800
X-CSE-ConnectionGUID: em5P7xHFQ8OR2dwZvcYopA==
X-CSE-MsgGUID: Ibni2khnSfmKrb0j1jQghA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="215010641"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 23 Feb 2026 19:45:40 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 7/8] drm/i915/backlight: Provide clear description on how
 backlight level is controlled
Date: Tue, 24 Feb 2026 09:15:25 +0530
Message-Id: <20260224034526.2730130-8-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224034526.2730130-1-suraj.kandpal@intel.com>
References: <20260224034526.2730130-1-suraj.kandpal@intel.com>
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
index 043c9aef2ea6..aac6cdb5b69b 100644
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

