Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016FED73E83
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 20:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBBA10E910;
	Thu, 29 Jan 2026 20:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGOnOM+d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D13910E905;
 Thu, 29 Jan 2026 20:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769720326; x=1801256326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qz4RvKvhtgfjqNlEBm5Six8p0JrsePchLa5KsJ77oPI=;
 b=kGOnOM+dwqaAq/Kga7V80do9qQaVpqRR/hKq0v4dhq+PD/OfDMu1KWlg
 1tTGyYalI/ANBFH+pvE0cgqY48GlFdOimJtbVXuYBLXgZpxABjMc3QYOG
 LyAgkXQaT4DmEVDVEv4HncnP6Zbkkjs++Z1VOSrUEqtuARbUGhERlN+Vh
 0eWDoxJ7NDaaVwaKxEivQSa2HSVkFndDfI+Vd6dhQAUZHqWZ9YuLg2VwM
 FXtHQIzj4G+qkQYlyg5JMDLLba2HIV5VIfFzC/6EVdm5jHEJgwRWTAYEF
 I2MjxmMhmmJZ/+JGDqvGaocw0OwDJVwi8E+vaatMS77gDzLk+txoqKWlC g==;
X-CSE-ConnectionGUID: hcRHVWw3Q2mIBS3iSBDgYw==
X-CSE-MsgGUID: 6z19R0UgQhioyfx4gjuddg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88545349"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="88545349"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 12:58:46 -0800
X-CSE-ConnectionGUID: E/fKtTMVSriZoO+Yd3RR9g==
X-CSE-MsgGUID: eCqP60x0TZipbHsM5KIB+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="239927264"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2026 12:58:44 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 17/19] drm/i915: Remove i915_reg.h from intel_display_power_well.c
Date: Fri, 30 Jan 2026 02:43:56 +0530
Message-ID: <20260129211358.1240283-18-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260129211358.1240283-1-uma.shankar@intel.com>
References: <20260129211358.1240283-1-uma.shankar@intel.com>
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

Make intel_display_power_well.c free from including i915_reg.h.

v2: Include specific pcode header, drop common header (Jani)

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power_well.c | 2 +-
 drivers/gpu/drm/i915/display/intel_display_regs.h       | 2 ++
 drivers/gpu/drm/i915/i915_reg.h                         | 3 ---
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 6f9bc6f9615e..f98de1baa63d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -6,8 +6,8 @@
 #include <linux/iopoll.h>
 
 #include <drm/drm_print.h>
+#include <drm/intel/intel_pcode.h>
 
-#include "i915_reg.h"
 #include "intel_backlight_regs.h"
 #include "intel_combo_phy.h"
 #include "intel_combo_phy_regs.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 4a9b7560ce8c..758749c5c322 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -359,6 +359,8 @@
 #define  FW_CSPWRDWNEN		(1 << 15)
 
 #define MI_ARB_VLV		_MMIO(VLV_DISPLAY_BASE + 0x6504)
+/* Disable display A/B trickle feed */
+#define   MI_ARB_DISPLAY_TRICKLE_FEED_DISABLE	(1 << 2)
 
 #define CZCLK_CDCLK_FREQ_RATIO	_MMIO(VLV_DISPLAY_BASE + 0x6508)
 #define   CDCLK_FREQ_SHIFT	4
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 9cd7fce09ebe..e4fc61dcd384 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -428,9 +428,6 @@
 #define   MI_ARB_LOW_PRIORITY_GRACE_4KB		(0 << 4)	/* default */
 #define   MI_ARB_LOW_PRIORITY_GRACE_8KB		(1 << 4)
 
-/* Disable display A/B trickle feed */
-#define   MI_ARB_DISPLAY_TRICKLE_FEED_DISABLE	(1 << 2)
-
 /* Set display plane priority */
 #define   MI_ARB_DISPLAY_PRIORITY_A_B		(0 << 0)	/* display A > display B */
 #define   MI_ARB_DISPLAY_PRIORITY_B_A		(1 << 0)	/* display B > display A */
-- 
2.50.1

