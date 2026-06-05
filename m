Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC176CD6E74
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 09:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A474911A664;
	Fri,  5 Jun 2026 09:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBfdglU4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB8C11A66F
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 09:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780652142; x=1812188142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2bT9+UXS0EiorzBBsTxa1WkLMTcwDAanmaz7XVi84DQ=;
 b=KBfdglU4HSMuYjE7MQDnk4aF9+PV5jRH32diG5zrouvJ0eUsqR9LuUo1
 WUO+5q3OXaP58ddFFf7kRTV81hjXrlesoUHG9t3pzJfqhXIOWJA/sOZGh
 wAn/mtsWaDx0I6/Gf+i3httPndLDBC5BHdlWS10teo0jZx9ocUmCO1yuY
 kaDAgNHio4UCN50vDin16GLUIfP4PJmjsH1Py6D7rRZnSjyxL7i6OvDNW
 tefr8xdh9E03/MoAkzbcnTTKcK3zPX7Wy7ZaHdIh8KkxiRHhjXuyzvkcK
 Y3tLrkJVh38zKuVNkKy+cFUBKgOjG7GRiHCCfbzl72U+r2g9HnS2tPWPz w==;
X-CSE-ConnectionGUID: UxhgKZDoSkizEGpsDZc4LQ==
X-CSE-MsgGUID: mqz1w4MuQDK4sySpPc0dZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="98903980"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="98903980"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:35:40 -0700
X-CSE-ConnectionGUID: 0OS/G3CvRgutsl3IMvB8yQ==
X-CSE-MsgGUID: eD00J9akR26/fhlsh6u3UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249133642"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:35:37 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v7 09/15] drm/xe/xe_ras: Handle uncorrectable SoC Internal
 errors
Date: Fri,  5 Jun 2026 15:04:55 +0530
Message-ID: <20260605093446.4189929-26-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260605093446.4189929-17-riana.tauro@intel.com>
References: <20260605093446.4189929-17-riana.tauro@intel.com>
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

Some critical errors such as CSC firmware and Punit are reported under SoC
internal errors and require special handling.

CSC errors are classified into hardware errors and firmware errors.
Hardware errors can be recovered using a SBR (Secondary Bus Reset) whereas
firmware errors are critical and require a firmware flash. On such errors,
device is wedged and runtime survivability mode will be enabled to notify
userspace that a firmware flash is required.

PUNIT uncorrectable errors can only be recovered through a cold reset.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: simplify soc structures
    return error code for each SoC error (Mallesh)

v3: squash patches (Raag)

v4: re-use csc work 

v5: do not use csc work (Mallesh)
    simplify structure member names
    fix sparse warnings
---
 drivers/gpu/drm/xe/xe_ras.c       | 45 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h | 50 +++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 52f5907482a0..7fe23a061c89 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -7,6 +7,7 @@
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_ras_types.h"
+#include "xe_survivability_mode.h"
 #include "xe_sysctrl.h"
 #include "xe_sysctrl_event_types.h"
 #include "xe_sysctrl_mailbox.h"
@@ -89,6 +90,47 @@ static enum xe_ras_recovery_action handle_core_compute_errors(struct xe_ras_erro
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
+static enum xe_ras_recovery_action handle_soc_internal_errors(struct xe_device *xe,
+							      struct xe_ras_error_array *arr)
+{
+	struct xe_ras_soc_error *info = (void *)arr->details;
+	struct xe_ras_soc_error_source *source = &info->source;
+	struct xe_ras_error_class *counter = &arr->counter;
+
+	if (source->csc) {
+		struct xe_ras_csc_error *csc_error = (void *)info->details;
+
+		/*
+		 * CSC uncorrectable errors are classified as hardware errors and firmware errors.
+		 * CSC firmware errors are critical errors that can be recovered only by firmware
+		 * update via SPI driver. On a CSC firmware error, PCODE enables FDO mode and sets
+		 * the bit in the capability register. On receiving this error, the driver enables
+		 * runtime survivability mode which notifies userspace that a firmware update
+		 * is required.
+		 */
+		if (csc_error->hec_fw_error) {
+			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
+			       sev_to_str(counter->common.severity),
+			       csc_error->hec_fw_error);
+			xe_survivability_mode_runtime_enable(xe);
+			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
+		}
+	} else if (source->ieh) {
+		struct xe_ras_ieh_error *ieh_error = (void *)info->details;
+
+		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
+			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",
+			       sev_to_str(counter->common.severity),
+			       ieh_error->global_error_status);
+			/* TODO: Add PUNIT error handling */
+			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
+		}
+	}
+
+	/* For other SOC internal errors, request a reset as recovery mechanism */
+	return XE_RAS_RECOVERY_ACTION_RESET;
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -177,6 +219,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			case XE_RAS_COMP_CORE_COMPUTE:
 				action = handle_core_compute_errors(arr);
 				break;
+			case XE_RAS_COMP_SOC_INTERNAL:
+				action = handle_soc_internal_errors(xe, arr);
+				break;
 			default:
 				/* For any other component, reset */
 				action = XE_RAS_RECOVERY_ACTION_RESET;
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 3ffd7baa7a8c..2749ba0b0239 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -10,6 +10,7 @@
 
 #define XE_RAS_NUM_ERROR_ARR			3
 #define XE_RAS_NUM_COUNTERS			16
+#define XE_RAS_SOC_IEH_PUNIT			BIT(1)
 
 /**
  * enum xe_ras_recovery_action - RAS recovery actions
@@ -125,4 +126,53 @@ struct xe_ras_compute_error {
 	u32 reserved[15];
 } __packed;
 
+/**
+ * struct xe_ras_soc_error_source - Source of SoC error
+ */
+struct xe_ras_soc_error_source {
+	/** @csc: CSC */
+	u32 csc:1;
+	/** @ieh: IEH (Integrated Error Handler) */
+	u32 ieh:1;
+	/** @reserved: Reserved for future use */
+	u32 reserved:30;
+} __packed;
+
+/**
+ * struct xe_ras_soc_error - Error details of SoC internal error
+ */
+struct xe_ras_soc_error {
+	/** @source: Error source */
+	struct xe_ras_soc_error_source source;
+	/** @details: Error details specific to the error source */
+	u32 details[15];
+} __packed;
+
+/**
+ * struct xe_ras_csc_error - CSC error details
+ */
+struct xe_ras_csc_error {
+	/** @reserved: Reserved */
+	u32 reserved;
+	/** @hec_fw_error: CSC firmware error */
+	u32 hec_fw_error;
+} __packed;
+
+/**
+ * struct xe_ras_ieh_error - SoC IEH (Integrated Error Handler) error details
+ */
+struct xe_ras_ieh_error {
+	/** @ieh_instance: IEH instance */
+	u32 ieh_instance:2;
+	/** @reserved: Reserved for future use */
+	u32 reserved:30;
+	/** @global_error_status: Global error status */
+	u32 global_error_status;
+	/** @local_error_status: Local error status */
+	u32 local_error_status;
+	/** @gerr_mask: Global error mask */
+	u32 gerr_mask;
+	/** @info: Additional information */
+	u32 info[10];
+} __packed;
 #endif
-- 
2.47.1

