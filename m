Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228A3EEA84E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 18:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C593E10E2A6;
	Thu, 12 Feb 2026 18:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WP2WCDvI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65BFD10E2A0;
 Thu, 12 Feb 2026 18:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770922109; x=1802458109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/br7ir/fh/K2HPHC4Stn/TYzp6/Hb3yCOBV1XibnV4g=;
 b=WP2WCDvI+cX8N4CiGhC57Erxu+BVwDLOsHnz1Qq7/3tPFubZQM7d53BW
 VGwtt+6uaaXkZhTdeDSJpJ8AkcOSCzr539vBeBkjg8TXv6rzXRqlqewnO
 xL/Wi30upeyPnoRtdn2uCoB4jBqwtF4YhDceo4O3xeOmcwx3614p1EO67
 t+NZCEzywD5CCzC26jhTR93AocrJPrhGakhbdW8G2gOAt2+L3hGoJJUt/
 UfEAz/BWXV0RqSrXR7h976K9CcaTZcj/VA9YliHUsUDN77vSjS29bOpI2
 yhphZx/KOzwjQyb4CSPj7bxBnJkF3bLfmNGyToKbduQhcIlWJWjfhCOx4 g==;
X-CSE-ConnectionGUID: 2HBlsw0+Q6eSXhGafARL4g==
X-CSE-MsgGUID: Lxuh0XMWSXKcjLoifvaOhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72204124"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="72204124"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 10:48:29 -0800
X-CSE-ConnectionGUID: vSHOaxIvT9mISdm7+Q675g==
X-CSE-MsgGUID: ehIfFaJaRSahREsddarcpg==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.217])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 10:48:28 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 04/15] drm/i915/display: convert W/As in intel_cursor.c to
 new framework
Date: Thu, 12 Feb 2026 20:46:02 +0200
Message-ID: <20260212184737.352515-5-luciano.coelho@intel.com>
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
 drivers/gpu/drm/i915/display/intel_cursor.c     | 3 ++-
 drivers/gpu/drm/i915/display/intel_display_wa.c | 1 +
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 2c5d917fbd7e..53cd27fd4fc7 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -19,6 +19,7 @@
 #include "intel_display.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
+#include "intel_display_wa.h"
 #include "intel_fb.h"
 #include "intel_fb_pin.h"
 #include "intel_frontbuffer.h"
@@ -424,7 +425,7 @@ static u32 i9xx_cursor_ctl(const struct intel_plane_state *plane_state)
 		cntl |= MCURSOR_ROTATE_180;
 
 	/* Wa_22012358565:adl-p */
-	if (DISPLAY_VER(display) == 13)
+	if (intel_display_wa(display, 22012358565))
 		cntl |= MCURSOR_ARB_SLOTS(1);
 
 	return cntl;
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index f0311cd477a5..8473cb25c92e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -85,6 +85,7 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 			INTEL_PCH_TYPE(display) < PCH_DG1;
 	case INTEL_DISPLAY_WA_14011503030:
 	case INTEL_DISPLAY_WA_14011503117:
+	case INTEL_DISPLAY_WA_22012358565:
 		return DISPLAY_VER(display) == 13;
 	case INTEL_DISPLAY_WA_14011508470:
 		return (IS_DISPLAY_VERx100(display, 1200, 1300));
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 0d0501fc276f..7e5f5a466e2a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -42,6 +42,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_16025573575,
 	INTEL_DISPLAY_WA_22010178259,
 	INTEL_DISPLAY_WA_22011320316,
+	INTEL_DISPLAY_WA_22012358565,
 	INTEL_DISPLAY_WA_22014263786,
 	INTEL_DISPLAY_WA_22021048059,
 };
-- 
2.51.0

