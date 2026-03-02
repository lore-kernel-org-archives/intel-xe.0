Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB62AE9B344
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 09:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC4E10E474;
	Mon,  2 Mar 2026 09:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYZ09uTT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6E410E474
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 09:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772445050; x=1803981050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3n9AEvkRtNHT1vW6KCPPvetmd4a4L+B9fIpfGpdznxY=;
 b=iYZ09uTT9TIj2I5l1CeCnp/4KWV45tMpI7NQ/3lzhdS3Y459CmR7vKEo
 IF0FciRwdmnpM4AcJNoeIMUSHTgnC9Y+kd3fWwKpsGLID8IPG2s/zpafC
 42fkNTzlMYiA9S96LpEQuWF6Hqe4JaAIvjF/XpngVB0SBXTKUIPCQ02nQ
 HaWjzPl2iAigKBWx+r7PxoOy0ZWW+w47wvQr+/uBGu2Wz7IO9AhYqT7W5
 Ya1RnSktwLV47GOhMhYVr4mrBmFb8VDZYvTQLezWnSSQF05XSsunA3Dye
 e+0Mz2Drpog5ENO8Obf0rxDlB0o7IQRb4SzXTuUhFI+6Nja0uDd2YIsW+ w==;
X-CSE-ConnectionGUID: YmqVKE5LTLKi10lzRMilMA==
X-CSE-MsgGUID: GyrSXJcqSMeHPHW/jX4c8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="83783065"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="83783065"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:50:49 -0800
X-CSE-ConnectionGUID: xL162nywT9W85LL2koGOjw==
X-CSE-MsgGUID: cgdYuc3JQ5+vvj4Gq5fiqQ==
X-ExtLoop1: 1
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:50:47 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH v2 10/11] drm/xe/xe_ras: Handle Uncorrectable SoC Internal
 errors
Date: Mon,  2 Mar 2026 15:52:05 +0530
Message-ID: <20260302102155.4074630-23-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260302102155.4074630-13-riana.tauro@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
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

Some critical errors such as CSC firmware and Punit are reported under
SoC Internal Errors.

CSC errors are classified as hardware errors and firmware errors.
Hardware errors can be recovered using a SBR whereas firmware errors
are critical and require a firmware flash. On such errors, device will
be wedged and runtime survivability mode will be enabed to notify
userspace that a firmware flash is required.

PUNIT uncorrectable errors can only be recovered through a cold reset.
TODO: Wedge device and notify userspace that a cold reset is required.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 52 +++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 61c01a4bfadb..f35d77654c8f 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -7,6 +7,7 @@
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_ras_types.h"
+#include "xe_survivability_mode.h"
 #include "xe_sysctrl_mailbox.h"
 #include "xe_sysctrl_mailbox_types.h"
 
@@ -102,6 +103,54 @@ static enum xe_ras_recovery_action handle_compute_errors(struct xe_device *xe,
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
+static enum xe_ras_recovery_action handle_soc_internal_errors(struct xe_device *xe,
+							      struct xe_ras_error_array *arr)
+{
+	struct xe_ras_soc_error *error_info = (struct xe_ras_soc_error *)arr->error_details;
+	struct xe_ras_soc_error_source source = error_info->error_source;
+	struct xe_ras_error_common common_info = arr->error_class.common;
+	enum xe_ras_recovery_action action;
+
+	/* Default action */
+	action = XE_RAS_RECOVERY_ACTION_RESET;
+
+	log_ras_error(xe, &arr->error_class);
+
+	if (source.csc) {
+		struct xe_ras_csc_error *csc_error = (struct xe_ras_csc_error *)error_info->additional_details;
+
+		/*
+		 * CSC uncorrectable errors are classified as hardware errors and firmware errors.
+		 * CSC firmware errors are critical errors that can be recovered only by firmware
+		 * update via SPI driver. PCODE enables FDO mode and sets the bit in the capability
+		 * register. On receiving this error, the driver enables runtime survivability mode
+		 * which notifies userspace that a firmware update is required.
+		 */
+		if (csc_error->hec_uncorr_fw_err_dw0) {
+			xe_err(xe, "[RAS]: CSC %s error detected: 0x%x\n",
+			       severity_to_str(xe, common_info.severity),
+			       csc_error->hec_uncorr_fw_err_dw0);
+			xe_survivability_mode_runtime_enable(xe);
+			action = XE_RAS_RECOVERY_ACTION_DISCONNECT;
+		}
+	}
+
+	if (source.soc) {
+		struct xe_ras_ieh_error *ieh_error = (struct xe_ras_ieh_error *)error_info->additional_details;
+
+		if (ieh_error->error_sources_ieh0.punit) {
+			xe_err(xe, "[RAS]: PUNIT %s error detected: 0x%x\n",
+			       severity_to_str(xe, common_info.severity),
+			       ieh_error->error_sources_ieh0.punit);
+			/** TODO: Add PUNIT error handling */
+			action = XE_RAS_RECOVERY_ACTION_DISCONNECT;
+		}
+	}
+
+	/* For other SOC internal errors, request a reset as recovery mechanism */
+	return action;
+}
+
 static void xe_ras_prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
 					   u32 cmd_mask, void *request, size_t request_len,
 					   void *response, size_t response_len)
@@ -180,6 +229,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			case XE_RAS_COMPONENT_CORE_COMPUTE:
 				action = handle_compute_errors(xe, &arr);
 				break;
+			case XE_RAS_COMPONENT_SOC_INTERNAL:
+				action = handle_soc_internal_errors(xe, &arr);
+				break;
 			default:
 				xe_err(xe, "[RAS]: Unknown error component %u\n", component);
 				break;
-- 
2.47.1

