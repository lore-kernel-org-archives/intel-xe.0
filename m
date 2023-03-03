Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C45C678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 10:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20ED10E07E;
	Fri,  3 Mar 2023 10:52:36 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC57110E07E
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 10:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677840754; x=1709376754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lz5VMzChfggmFusPExaH0yfESF2705azQmOY6JakGZ8=;
 b=UaPMB5g3xcawRKqpHmBmwjXG7KgxDt8lzDTLcUaBRzcVMU8QLLtj2UNU
 2lV+pZYx0/VoJp6vaPesi/Gi6qXlKlEMY29xNmp8/1rsySFWRKUg0a7sb
 i4E3h9xxf5W2AQMIsMD/InGKvvj9WQTct8U/Z8ZXGQ88+FYA8glpmlKex
 PJJjmDbppFjfX1KQOrYuily5jWSgoi1gvIFLXAuoRitaWZJdJe6ecnkNf
 EAOp+tDeGGakY/UUxqrj7eEIw0dPqcFs117Dq+BruAEoCDblH9NbRcLAy
 uWy9GZWQ8gvkPextCuPpPOdlGbOJ2t5NAExFbEGIrEudJDetmhiZpKL/C g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="421288090"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="421288090"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:52:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739467632"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="739467632"
Received: from msieb-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:52:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 12:52:15 +0200
Message-Id: <20230303105222.3550161-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303105222.3550161-1-jani.nikula@intel.com>
References: <20230303105222.3550161-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/8] drm/i915/display: don't use relative
 ../i915 includes
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

Note: This reverts local changes in xe branch, and should be squashed to
commit a09f88e470b6("drm/i915/display: Remaining changes to make xe
compile").

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

