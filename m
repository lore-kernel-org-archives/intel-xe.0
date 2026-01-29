Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9473D73E8B
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 20:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D5410E8E2;
	Thu, 29 Jan 2026 20:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OudOEp/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4EF10E8E2;
 Thu, 29 Jan 2026 20:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769720305; x=1801256305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BNng0eUweAXQzlLVbqm0jcfF534x4OUBzcpmP9B1xsg=;
 b=OudOEp/462h3IlExYEpcJofwGepWSSv1BCl/5dBJjD/N4HBWE5iotjy3
 j0K3rTFZ2cnvSdAziya+NRFq66FR1xOzB2ZcDwRchmktC9a86y8zuHl3T
 6OkSoxRv8J/kj8fnzLVPyQFxQDpPigL0lFUVgnylYRa9WeX49F5aHT2fZ
 2QxFt535jtgf6JVxKxWzCiexHuMNFw+t53p3WB/8G+RroDAzW3sFZ7z8Z
 heQOaHQiuGeWekmZeO6ETU4zBT12GCZ3YZmskMeQHmdRscciaAePE3MM5
 pcOqFJd6dEdq6UYF3hVSuOL5x8IXE1vV4UA8x8Gq2cBTAPh4SIUtwE5q6 A==;
X-CSE-ConnectionGUID: Dp9obfA6Qcaxt/SWJG/lEA==
X-CSE-MsgGUID: ou6agdWDTyGTz5LsrMrbwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88545316"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="88545316"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 12:58:25 -0800
X-CSE-ConnectionGUID: AfODDL+1TOyWhyrKTjqTSw==
X-CSE-MsgGUID: jEEKLXxMRaqwnsN+4N4+Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="239927136"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2026 12:58:22 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 06/19] drm/i915: Remove i915_reg.h from intel_display_device.c
Date: Fri, 30 Jan 2026 02:43:45 +0530
Message-ID: <20260129211358.1240283-7-uma.shankar@intel.com>
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

Move GU_CNTL_PROTECTED and GMD_ID_DISPLAY to common header,
this helps intel_display_device.c free from i915_reg.h dependency.

v2: Move GMD_ID_DISPLAY to display header instead of common (Jani)

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 7 +++----
 drivers/gpu/drm/i915/display/intel_display_regs.h   | 8 ++++++++
 drivers/gpu/drm/i915/i915_reg.h                     | 4 ----
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 471f236c9ddf..d449528bfc7f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -10,7 +10,6 @@
 #include <drm/drm_print.h>
 #include <drm/intel/pciids.h>
 
-#include "i915_reg.h"
 #include "intel_cx0_phy_regs.h"
 #include "intel_de.h"
 #include "intel_display.h"
@@ -1539,9 +1538,9 @@ probe_gmdid_display(struct intel_display *display, struct intel_display_ip_ver *
 		return NULL;
 	}
 
-	gmd_id.ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val);
-	gmd_id.rel = REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
-	gmd_id.step = REG_FIELD_GET(GMD_ID_STEP, val);
+	gmd_id.ver = REG_FIELD_GET(GMD_ID_DISPLAY_ARCH_MASK, val);
+	gmd_id.rel = REG_FIELD_GET(GMD_ID_DISPLAY_RELEASE_MASK, val);
+	gmd_id.step = REG_FIELD_GET(GMD_ID_DISPLAY_STEP, val);
 
 	for (i = 0; i < ARRAY_SIZE(gmdid_display_map); i++) {
 		if (gmd_id.ver == gmdid_display_map[i].ver &&
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index f90d52f7e5be..0d7788db4a7f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -6,6 +6,9 @@
 
 #include "intel_display_reg_defs.h"
 
+#define GU_CNTL_PROTECTED		_MMIO(0x10100C)
+#define   DEPRESENT			REG_BIT(9)
+
 #define _GEN7_PIPEA_DE_LOAD_SL	0x70068
 #define _GEN7_PIPEB_DE_LOAD_SL	0x71068
 #define GEN7_PIPE_DE_LOAD_SL(pipe) _MMIO_PIPE(pipe, _GEN7_PIPEA_DE_LOAD_SL, _GEN7_PIPEB_DE_LOAD_SL)
@@ -1626,6 +1629,11 @@
 #define   GLK_DFSM_DISPLAY_DSC_DISABLE	(1 << 7)
 #define   XE2LPD_DFSM_DBUF_OVERLAP_DISABLE	(1 << 3)
 
+#define GMD_ID_DISPLAY				_MMIO(0x510a0)
+#define   GMD_ID_DISPLAY_ARCH_MASK		REG_GENMASK(31, 22)
+#define   GMD_ID_DISPLAY_RELEASE_MASK		REG_GENMASK(21, 14)
+#define   GMD_ID_DISPLAY_STEP			REG_GENMASK(5, 0)
+
 #define XE2LPD_DE_CAP			_MMIO(0x41100)
 #define   XE2LPD_DE_CAP_3DLUT_MASK	REG_GENMASK(31, 30)
 #define   XE2LPD_DE_CAP_DSC_MASK	REG_GENMASK(29, 28)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index c7361e82a0c6..4341308c3b2b 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -117,9 +117,6 @@
  *  #define GEN8_BAR                    _MMIO(0xb888)
  */
 
-#define GU_CNTL_PROTECTED		_MMIO(0x10100C)
-#define   DEPRESENT			REG_BIT(9)
-
 #define GU_CNTL				_MMIO(0x101010)
 #define   LMEM_INIT			REG_BIT(7)
 #define   DRIVERFLR			REG_BIT(31)
@@ -926,7 +923,6 @@
 #define   MASK_WAKEMEM				REG_BIT(13)
 #define   DDI_CLOCK_REG_ACCESS			REG_BIT(7)
 
-#define GMD_ID_DISPLAY				_MMIO(0x510a0)
 #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
 #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
 #define   GMD_ID_STEP				REG_GENMASK(5, 0)
-- 
2.50.1

