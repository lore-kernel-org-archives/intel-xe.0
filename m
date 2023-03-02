Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58240C7EE2F
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 14:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154BF10E05A;
	Thu,  2 Mar 2023 14:23:24 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EE810E118
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 14:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677767002; x=1709303002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8XB8WixcQs4sIkuK0svXszBhRM2pC3l9NJETWtCgfhk=;
 b=doy+jBSIgZkHIPl9p3GdgzEw/5JLgGikWli49OoiMjc3ft+3XGDbkjE2
 t6StcOBE3aMnUpaKr4tqSf/xXS8v/1KG2bNsxuFKDMoxL2A+fU/8+kSvM
 RqDSbt1I3M9kEYA1rflKP+UMPOpSXiamMiwjP2nSXWxnXSmZRaJoeW0Fy
 rfi0JcH6JjBtkFbTWr5jpjdINIJLovtCxN3XrBbFqTIdq4itgCqXPCnYk
 jzMpI8IamwpMG1AW6BU85dUmS29bt3FFgYEsd4/OA7rSGw/Yz7uzUqBLw
 3H0dCi59efJRhQDqt4dqiC1QUMtWkT55UPJ+mJuz4EL8kc4It17usCjIj Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397300970"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="397300970"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:12:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739086201"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="739086201"
Received: from martamon-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.129])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:12:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  2 Mar 2023 16:12:23 +0200
Message-Id: <20230302141230.2804699-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302141230.2804699-1-jani.nikula@intel.com>
References: <20230302141230.2804699-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/8] drm/i915/display: don't use relative ../i915
 includes
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We can't have this in upstream i915, so don't try that here either.

Note: This should be squashed to the commit adding the relative
includes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_backlight.c     | 2 +-
 drivers/gpu/drm/i915/display/intel_bw.c            | 2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 4 ++--
 drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         | 2 +-
 drivers/gpu/drm/i915/display/intel_opregion.c      | 2 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index e63eb43622e0..5b7da72c95b8 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -19,7 +19,7 @@
 #include "intel_dp_aux_backlight.h"
 #include "intel_dsi_dcs_backlight.h"
 #include "intel_panel.h"
-#include "../i915/intel_pci_config.h"
+#include "intel_pci_config.h"
 #include "intel_pps.h"
 #include "intel_quirks.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 67b4e947589c..54e03a3eaa0f 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -15,7 +15,7 @@
 #include "intel_display_core.h"
 #include "intel_display_types.h"
 #include "skl_watermark.h"
-#include "../i915/intel_mchbar_regs.h"
+#include "intel_mchbar_regs.h"
 
 /* Parameters for Qclk Geyserville (QGV) */
 struct intel_qgv_point {
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 3b6a37403f25..ecb87542ebb6 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -32,8 +32,8 @@
 #include "intel_crtc.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
-#include "../i915/intel_mchbar_regs.h"
-#include "../i915/intel_pci_config.h"
+#include "intel_mchbar_regs.h"
+#include "intel_pci_config.h"
 #include "intel_psr.h"
 
 #ifdef I915
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 00e32a423708..3315d2bbebc7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -16,7 +16,7 @@
 #include "intel_display_power_well.h"
 #include "intel_display_types.h"
 #include "intel_dmc.h"
-#include "../i915/intel_mchbar_regs.h"
+#include "intel_mchbar_regs.h"
 #include "intel_pch_refclk.h"
 #include "intel_snps_phy.h"
 #include "skl_watermark.h"
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 2d099f4c52cd..0bc4f6b48e80 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -39,7 +39,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_gmbus.h"
-#include "../i915/display/intel_gmbus_regs.h"
+#include "intel_gmbus_regs.h"
 
 struct intel_gmbus {
 	struct i2c_adapter adapter;
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index 057a68237efe..e0184745632c 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -37,7 +37,7 @@
 #include "intel_backlight.h"
 #include "intel_display_types.h"
 #include "intel_opregion.h"
-#include "../i915/intel_pci_config.h"
+#include "intel_pci_config.h"
 
 #define OPREGION_HEADER_OFFSET 0
 #define OPREGION_ACPI_OFFSET   0x100
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 381d4f75e7c8..e254fb21b47f 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -16,7 +16,7 @@
 #include "skl_watermark.h"
 
 #include "i915_drv.h"
-#include "../i915/i915_fixed.h"
+#include "i915_fixed.h"
 #include "i915_reg.h"
 #include "intel_pm.h"
 
-- 
2.39.1

