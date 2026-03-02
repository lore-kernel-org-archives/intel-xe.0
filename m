Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DE2D58E50
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 04:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31B910E42C;
	Mon,  2 Mar 2026 04:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f357XT0w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A7A10E350;
 Mon,  2 Mar 2026 04:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772424386; x=1803960386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/GE3c1xsKSe4lf/lUb9NThTQ8JKaW+1QpiTX2QO0+7E=;
 b=f357XT0wYEjctLIh6aVfKTHxqusYcWtG64eKeqlQytheZ6dxW0HUTU0T
 p5CHQaEHxhHMvwUV8rFD5QNgBF7x3LFdjIDouNHnUSqzYtKXSJV/xDZC5
 qXrQLvW1vIMvSAQfDANO3QO/92ah1seiEGtGWPkxaLjEdaYfru6zFCFvk
 SoD/JYPjsocFOfWo25onC/CRcfmiW5fVaHTTchqbnyVrrwmSurKVwkc2e
 FMZWEdYUg15g9VZVq0cbrz/lYdXwuQ/CTy7oP8SDmZi1EwjUmLrpgn0tw
 M7d1N/QuPo1e6GiqSYzuWXxdi3aOdiiZncLq/k0gcsftQSpMhKp+AgFTQ Q==;
X-CSE-ConnectionGUID: L4gvYfplSIi207hfKAL1eg==
X-CSE-MsgGUID: O+ylvlZZSj+R4YpWSfj7ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="77294428"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="77294428"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 20:06:20 -0800
X-CSE-ConnectionGUID: pHQvbcqNQBmBToFjebQOOw==
X-CSE-MsgGUID: rbBJqGL/SK6mp6Tpsxpk/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="217540994"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 01 Mar 2026 20:06:19 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [RESEND 1/8] drm/i915/backlight: Use default/max brightness for VESA
 AUX backlight init
Date: Mon,  2 Mar 2026 09:36:06 +0530
Message-Id: <20260302040613.3324049-2-suraj.kandpal@intel.com>
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

If the brightness fetched from VBT/previous state is 0 on backlight
initialization, then set the brightness to a default/max value.
Whenever the minimum brightness is reported as 0 there are chances
we end up with blank screen. This confuses the user into thinking
the display is acting weird. This occurs in eDP 1.5 when
we are using PANEL_LUMINANCE_OVERRIDE mode to mainpulate brightness
via luminance values.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15671
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 517e32d7702d..b9e9a05861d8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -564,6 +564,8 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 		}
 		panel->backlight.level = intel_dp_aux_vesa_get_backlight(connector, 0);
 		panel->backlight.enabled = panel->backlight.level != 0;
+		if (!panel->backlight.level)
+			panel->backlight.level = panel->backlight.max;
 		drm_dbg_kms(display->drm,
 			    "[CONNECTOR:%d:%s] AUX VESA Nits backlight level is controlled through DPCD\n",
 			    connector->base.base.id, connector->base.name);
@@ -573,6 +575,8 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 		if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
 			panel->backlight.level = current_level;
 			panel->backlight.enabled = panel->backlight.level != 0;
+			if (!panel->backlight.level)
+				panel->backlight.level = panel->backlight.max;
 		} else {
 			panel->backlight.level = panel->backlight.max;
 			panel->backlight.enabled = false;
-- 
2.34.1

