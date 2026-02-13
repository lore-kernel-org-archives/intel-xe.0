Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3104EE36B7
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 09:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A4210E7D2;
	Fri, 13 Feb 2026 09:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3ZzpGgx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F19610E7D2;
 Fri, 13 Feb 2026 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770974240; x=1802510240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h02ltg/bWR6iAdetj8BTG+wc9MjJkDyvjA3LaLJxWso=;
 b=h3ZzpGgxnFLATbmJQTSMKIBXoI0HhV7LXS+XjOeXpR/K5gZbe8ozF958
 eQt/Mw2SzxNvb74PhPgoGTbi1k3PnIa2d9Aznq4bPYOLCbry5do9wrfJ2
 j3K+9rbYZFnLEA8tBaFjE3+eHxpG0yYsYhZ7ErjCOoKKDEoU8Pa9CAGu+
 sSkivssr3xJiQLuTgeZcWzItepM5mQzCH0N84A1U/Z65rTDwCEVbtdgRY
 eR1QtYpii1CGfvAaVf2pp3kacIyETgfMllWlGYQjMhRUZl1IFjINF46tC
 sxz2BLlP7KFWPy6KRvhA0hiNmjZFL/yA5NmQ35y/sPKnY/joPFJ7cnWiI g==;
X-CSE-ConnectionGUID: oTr6f5FHT/+vSbSsQQkIyA==
X-CSE-MsgGUID: 98wfNaPTSDW/rlui1O1tig==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72146732"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72146732"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:17:19 -0800
X-CSE-ConnectionGUID: 01wNpZnpT5itkbOkwflZcg==
X-CSE-MsgGUID: xJKbG6J6Srq8fTQigJYGAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="211778852"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2026 01:17:17 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 8/8] drm/i915/backlight: Avoid 0 brightness for INTEL AUX HDR
 backlight
Date: Fri, 13 Feb 2026 14:46:53 +0530
Message-Id: <20260213091653.2250887-9-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213091653.2250887-1-suraj.kandpal@intel.com>
References: <20260213091653.2250887-1-suraj.kandpal@intel.com>
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

Whenever the minimum brightness is reported as 0 there are chances
we maybe sometimes end up with blank screen. This confuses the user
into thinking the display is acting weird. This occurs in eDP 1.4b
when we use proprietary INTEL AUX HDR DPCD registers to mainupate
brightness via luminance values. Make sure if minimum luminance
range is 0 we program it to 10% of max luminance range.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c   | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 8f86b368612e..cf53759c2860 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -178,6 +178,7 @@ intel_dp_aux_hdr_get_backlight(struct intel_connector *connector, enum pipe pipe
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 	u8 tmp;
 	u8 buf[2] = {};
+	u32 level;
 
 	if (drm_dp_dpcd_readb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &tmp) != 1) {
 		drm_err(display->drm,
@@ -205,7 +206,10 @@ intel_dp_aux_hdr_get_backlight(struct intel_connector *connector, enum pipe pipe
 		return 0;
 	}
 
-	return (buf[1] << 8 | buf[0]);
+	level = (buf[1] << 8 | buf[0]);
+	if (!level)
+		return panel->backlight.min;
+	return level;
 }
 
 static void
@@ -427,10 +431,13 @@ intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum pipe pi
 
 	if (luminance_range->max_luminance) {
 		panel->backlight.max = luminance_range->max_luminance;
-		panel->backlight.min = luminance_range->min_luminance;
+		if (luminance_range->min_luminance)
+			panel->backlight.min = luminance_range->min_luminance;
+		else
+			panel->backlight.min = (luminance_range->max_luminance * 10) / 100;
 	} else {
 		panel->backlight.max = 512;
-		panel->backlight.min = 0;
+		panel->backlight.min = 51;
 	}
 
 	intel_dp_aux_write_panel_luminance_override(connector);
-- 
2.34.1

