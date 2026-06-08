Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C1BCD8C8E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012AF10EF89;
	Mon,  8 Jun 2026 08:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ClVqTdUv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794F910EF90
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780908470; x=1812444470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g+G/kUaNTKHcyg5ziQoOA2zWIiMszoC44Z6LrjsPjpk=;
 b=ClVqTdUv1PCt/OXjvNvq8vspTADNvBFBB6/XPiMUnmbf7+7Dj1UXFb8L
 vDj+ZBMGuRGYM9xNjhSs78rdkrpW+PaAkrD9fAWP/hjAQ0oZAqYXiVacD
 TUmvTtsnfxL0UnBtuPC9W97aRSptipHElOXS5LhgBRfOGK9KpzYZr6e0+
 gLF6Vg8TmIRg4NMZtdjfkTb75eKm11/WhCP4A17aEw9f9CF1aNBJA5NwR
 KWOCyCM+FdMQcoAzyZHVeOSXpMQkmV35QilG2vh2BJE/iwmakYvZsL5xV
 44gOfPg5yOz501E1v87eDagnVA3b5hXRT3QmxWtBJRrKZSRXWK8hlIVaW g==;
X-CSE-ConnectionGUID: sgczl0PoQM+yp9IUGhK4Zg==
X-CSE-MsgGUID: MPp+/XweRgS4lgeYe7+pCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93029101"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="93029101"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:50 -0700
X-CSE-ConnectionGUID: Mq/4MF6RRnSl+MHP/YQYtg==
X-CSE-MsgGUID: H3JT0f6kSTWX7S7CLvWKng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269466114"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:46 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v8 09/15] drm/xe/xe_ras: Handle uncorrectable SoC Internal
 errors
Date: Mon,  8 Jun 2026 14:17:10 +0530
Message-ID: <20260608084700.640376-26-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260608084700.640376-17-riana.tauro@intel.com>
References: <20260608084700.640376-17-riana.tauro@intel.com>
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
index 005db8ab9622..cd4b19b57c04 100644
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

