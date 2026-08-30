Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67A3C61DD9
	for <intel-xe@archiver.kernel.org>; Sun, 30 Aug 2026 06:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D6110E13D;
	Sun, 30 Aug 2026 06:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COJNZd4r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EEB10E13D
 for <intel-xe@lists.freedesktop.org>; Sun, 30 Aug 2026 06:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788072985; x=1819608985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uoYFs5x+y5dVAR8ibLa4ehhybjEE3g2LGUBpn6WEOgI=;
 b=COJNZd4r/hzCh+pjZpCa9qeCzCXuYNsINv3V/7RkoQ5tvvTBMRKMSQQW
 Jvj+5s6EIaf3rnqFWdB8MgXcgnd60x/+/PD3KElZzGgLZA3aAEDlo7GXL
 xM9Nd6+ItdhqJsu05D30d9AcaDCZHkUuVD2H/+0YJJonyC0blriC3x90R
 BJ3f0f2cRhAds8P/VrtMmCr+ZpOF+TBOyOtRb0tVWyjM4ztE1V/AAAJry
 87FVS9SWI4/GnXTaev2vujn9wG9fICSBYeRXUo2lALs8lsIHWaTypI3MH
 tJwr5Up+m+MdYQarv9yYY6rPCVh8Up9HuLOjgzXTUYzjOitBNGUkpTtAF A==;
X-CSE-ConnectionGUID: uKAXaHVESyy9QXZKPmveyQ==
X-CSE-MsgGUID: 5TTEd+JGSDa6ao6K1/lIeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="105890233"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; d="scan'208";a="105890233"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2026 23:56:25 -0700
X-CSE-ConnectionGUID: nxQSi71NRoOQCsw799f0Ew==
X-CSE-MsgGUID: VNrHd/anTqW4CetRZ6tI+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; d="scan'208";a="268560042"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2026 23:56:23 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com
Subject: [PATCH 3/3] drm/xe/xe_hw_error: Handle non-fatal errors routed via
 direct IRQ
Date: Sun, 30 Aug 2026 12:26:07 +0530
Message-ID: <20260830065603.419055-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260830065603.419055-5-riana.tauro@intel.com>
References: <20260830065603.419055-5-riana.tauro@intel.com>
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

Process, log and recover non-fatal errors routed via direct IRQ. For errors
that cannot be recovered locally, wedge the device with bus-reset as the
recovery action.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 37 ++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 5a57b7eaebc3..8435c74147ed 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -14,6 +14,7 @@
 #include "xe_drm_ras.h"
 #include "xe_hw_error.h"
 #include "xe_mmio.h"
+#include "xe_ras.h"
 #include "xe_survivability_mode.h"
 
 #define GT_HW_ERROR_MAX_ERR_BITS		16
@@ -165,11 +166,38 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
 						 pvc_master_local_fatal_err_reg : \
 						 pvc_master_local_nonfatal_err_reg)
 
+static const char *hw_err_to_str(const enum hardware_error hw_err)
+{
+	switch (hw_err) {
+	case HARDWARE_ERROR_CORRECTABLE:
+		return "Correctable";
+	case HARDWARE_ERROR_NONFATAL:
+		return "Non-Fatal";
+	case HARDWARE_ERROR_FATAL:
+		return "Fatal";
+	default:
+		return "Unknown";
+	}
+}
+
 static void hw_error_work(struct work_struct *work)
 {
 	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
 	struct xe_device *xe = tile_to_xe(tile);
 
+	if (xe->info.has_sysctrl) {
+		int ret;
+
+		ret = xe_ras_process_errors(xe);
+		/* For any non-fatal errors that do not return recovered, declare wedged */
+		if (ret) {
+			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
+			xe_device_declare_wedged(xe);
+		}
+
+		return;
+	}
+
 	xe_survivability_mode_runtime_enable(xe);
 }
 
@@ -431,12 +459,13 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 		return;
 
 	/*
-	 * Hardware errors are reported through System Controller on the platforms that
-	 * support it, and never routed as direct IRQ to SGUnit. So we should never be
-	 * here for those platforms.
+	 * Non fatal errors are routed as a direct IRQ on platforms that support
+	 * system controller.
 	 */
 	if (xe->info.has_sysctrl) {
-		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
+		drm_err_ratelimited(&xe->drm, HW_ERR "%s %s reported\n", hw_err_to_str(hw_err),
+				    severity_str);
+		schedule_work(&tile->hw_error_work);
 		return;
 	}
 
-- 
2.47.1

