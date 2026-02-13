Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26B0EF48F3
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 09:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F1810E7C3;
	Fri, 13 Feb 2026 09:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lB7iCeES";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD7610E7BD;
 Fri, 13 Feb 2026 09:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770974228; x=1802510228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T5zTPMCS6kgRgayxfssI0wZ0Ls07piuvPPisKN0lm7A=;
 b=lB7iCeES0NSm+9d19I5mfz3UGDv8llYttIgABLBCIGqpFoGXVJqAf03e
 7O3cRWRXynH5+HMJjA1l/6nu8oPwiU5dqVh6KIHo9+GBadWzI7N0vqfJd
 fzKBmWvCTpROgjj9S0nZTzqxAQHyVqxMXxq6Ogu3SfP0rjZU7O1zaPB5/
 pUK4INEGNyPLysgMaYCIy8a2VtwanljxYGdXWS20qDKNt5HZfBi+OynN1
 2jDE4jjCU0zVDh9AxJFltfzSVPgRWGO8KdERoS7ITYXKbKDmXWfvpd7S2
 Ca89TtcpRqDj7owOdOeccv2nIqFBrxzvoD6OrQY//d6Wi9ZhFtVkTv8hD g==;
X-CSE-ConnectionGUID: madUecCAR6SYQfVXU2Q5WA==
X-CSE-MsgGUID: 7q0PpV/WQn6A0OihYY02cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72146673"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72146673"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:17:07 -0800
X-CSE-ConnectionGUID: Z0Pg7ruiQiW3pG/zFTQ5gA==
X-CSE-MsgGUID: ISqexI7YQdCczq2pIAg6Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="211778830"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2026 01:17:05 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/8] drm/i915/backlight: Avoid 0 brightness for VESA AUX
 backlight
Date: Fri, 13 Feb 2026 14:46:46 +0530
Message-Id: <20260213091653.2250887-2-suraj.kandpal@intel.com>
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
into thinking the display is acting weird. This occurs in eDP 1.5 when
we are PANEL_LUMINANCE_OVERRIDE mode to mainpulate brightness via luminance
values. Make sure if minimum luminance range is 0 we program
it to 10% of max luminance range.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15671
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index eb05ef4bd9f6..f1811beee25f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -456,7 +456,11 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
 		}
 
 		val |= buf[0] | buf[1] << 8 | buf[2] << 16;
-		return val / 1000;
+		val = val / 1000;
+		if (!val)
+			return panel->backlight.min;
+
+		return val;
 	}
 
 	return connector->panel.backlight.level;
@@ -557,10 +561,14 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 	if (panel->backlight.edp.vesa.info.luminance_set) {
 		if (luminance_range->max_luminance) {
 			panel->backlight.max = panel->backlight.edp.vesa.info.max;
-			panel->backlight.min = luminance_range->min_luminance;
+			if (luminance_range->min_luminance)
+				panel->backlight.min = luminance_range->min_luminance;
+			else
+				panel->backlight.min = (luminance_range->max_luminance * 10) / 100;
+
 		} else {
 			panel->backlight.max = 512;
-			panel->backlight.min = 0;
+			panel->backlight.min = 51;
 		}
 		panel->backlight.level = intel_dp_aux_vesa_get_backlight(connector, 0);
 		panel->backlight.enabled = panel->backlight.level != 0;
-- 
2.34.1

