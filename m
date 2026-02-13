Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6C9EE369A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 09:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F4E10E7C2;
	Fri, 13 Feb 2026 09:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="joOeRjJM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E56610E7C2;
 Fri, 13 Feb 2026 09:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770974231; x=1802510231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GwGThaG7X6VBjNkZ92hx2ROD+vw4F80Z8vRDyYwsFDc=;
 b=joOeRjJMCZ5lRTl+zXfweEZO9nhtOXRlUumG94EpbPe9gZwESE7s8zDU
 C2Sk20gwkswmPlu2VXNlvGwOVccwMJCs0zGtgRao78HSkeefE3HBbAb1Q
 BOSfTyz/zFm1/wpreiJEVhmWXULqjwtMN8Q2dnw0ygoPrzBYmwAtkWMbP
 9jW4SL5DxrWeqzsovWfMo+lRnSLRrdXXMtqXm5nF0E/w6kfuGqDoeFy3u
 JQcAHhtQMzp3h69k+AEwUQW+oYzPTqogmqxr7eEREwsDDKanxtSxPTn76
 QwBVsW1L+cgWDHIVzDoMPsYHPt5D4nhpQTrlwVxFAIL3WVclHjZ6LRTnk w==;
X-CSE-ConnectionGUID: 0P53u5kbRam6ERFHC2FTLw==
X-CSE-MsgGUID: 9JFA3J0vSI2DDAizrihowg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72146686"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72146686"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:17:10 -0800
X-CSE-ConnectionGUID: NCwvdFmBSOyZhRn7eXQx3w==
X-CSE-MsgGUID: qD/wqtjBRDGNbztOLemWQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="211778836"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2026 01:17:09 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 3/8] drm/i915/backlight: Take luminance_set into account for
 VESA backlight
Date: Fri, 13 Feb 2026 14:46:48 +0530
Message-Id: <20260213091653.2250887-4-suraj.kandpal@intel.com>
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

When deciding what functions to enable to help control backlight we
used to only check aux_enable. Now with PANEL_LUMINANCE_OVERRIDE in
picture we need to take care that we do not enable PWM function if
luminance_set is set.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15671
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 0237cad11299..4a67068f4098 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -490,7 +490,8 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 
-	if (!panel->backlight.edp.vesa.info.aux_enable) {
+	if (!(panel->backlight.edp.vesa.info.aux_enable ||
+	      panel->backlight.edp.vesa.info.luminance_set)) {
 		u32 pwm_level;
 
 		if (!panel->backlight.edp.vesa.info.aux_set)
-- 
2.34.1

