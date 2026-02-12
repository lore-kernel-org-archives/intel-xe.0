Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B92EEA84F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 18:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E90E10E781;
	Thu, 12 Feb 2026 18:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PzxvBEpd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572CD10E782;
 Thu, 12 Feb 2026 18:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770922136; x=1802458136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gpvV46PJXo7+i8RXADKgDiuw0JDN8wb+yeIpEQOtdJg=;
 b=PzxvBEpdrtJmJJKQWe3tRGZsQBwFhWUCfe+Z/UqCVzbbdxnFs4UcAlfX
 S3UpEJgLdmtdqYq/arJXGZAPvrY9davWcW2iI4jMuRG1BbS5x3i9COYLO
 8haM2BXSjWfrMJnwGrylxWXWZmp8QSQZ/alPakwqjcT0RvK1LbJkBztDS
 emC+zlZhuGIXT+fZORuwmXUvlygI/DBLeAK7XEcv12NIctHKSzdZzJjlR
 3wH58Ecru9+zzcQuWmTMn/kXYYuZRGgqBTIOOLZmzSLEISCsxtD6uGFsX
 Y6DeKwZW3eT/i5apG1CBzAyQ6bEFj6BGIa0u4XkyQI9C5+0lvyRMxVBBt A==;
X-CSE-ConnectionGUID: MCVpmEMITWmH0B12wyOLjw==
X-CSE-MsgGUID: mWp5MD7hRm+eOSaebPITYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72204171"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="72204171"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 10:48:46 -0800
X-CSE-ConnectionGUID: 03ffmW61RBSzVT/cd3AEHQ==
X-CSE-MsgGUID: lE8qOaYaT4+ZqM927k3+Bg==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.217])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 10:48:45 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 15/15] drm/i915/display: convert W/As in skl_watermark.c to
 new framework
Date: Thu, 12 Feb 2026 20:46:13 +0200
Message-ID: <20260212184737.352515-16-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260212184737.352515-1-luciano.coelho@intel.com>
References: <20260212184737.352515-1-luciano.coelho@intel.com>
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

Convert the low-hanging fruits of workaround checks to the workaround
framework.  Instead of having display structure checks for the
workarounds all over, concentrate the checks in intel_wa.c.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.c | 2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 drivers/gpu/drm/i915/display/skl_watermark.c    | 3 ++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 20216514c085..99a2097275b7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -142,6 +142,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 			 IS_DISPLAY_STEP(display, STEP_A0, STEP_B0));
 	case INTEL_DISPLAY_WA_22010178259:
 		return DISPLAY_VER(display) == 12;
+	case INTEL_DISPLAY_WA_22010947358:
+		return display->platform.alderlake_p;
 	case INTEL_DISPLAY_WA_22012278275:
 		return display->platform.alderlake_p &&
 			IS_DISPLAY_STEP(display, STEP_A0, STEP_E0);
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 784baf66222b..52c3e3ebdeab 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -54,6 +54,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_16025596647,
 	INTEL_DISPLAY_WA_18034343758,
 	INTEL_DISPLAY_WA_22010178259,
+	INTEL_DISPLAY_WA_22010947358,
 	INTEL_DISPLAY_WA_22011320316,
 	INTEL_DISPLAY_WA_22012278275,
 	INTEL_DISPLAY_WA_22012358565,
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 8e3031adb09f..1940d914ddd5 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -22,6 +22,7 @@
 #include "intel_display_rpm.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
+#include "intel_display_wa.h"
 #include "intel_dram.h"
 #include "intel_fb.h"
 #include "intel_fixed.h"
@@ -3412,7 +3413,7 @@ static u32 pipe_mbus_dbox_ctl(const struct intel_crtc *crtc,
 	if (DISPLAY_VER(display) >= 14)
 		val |= dbuf_state->joined_mbus ?
 			MBUS_DBOX_A_CREDIT(12) : MBUS_DBOX_A_CREDIT(8);
-	else if (display->platform.alderlake_p)
+	else if (intel_display_wa(display, 22010947358))
 		/* Wa_22010947358:adl-p */
 		val |= dbuf_state->joined_mbus ?
 			MBUS_DBOX_A_CREDIT(6) : MBUS_DBOX_A_CREDIT(4);
-- 
2.51.0

