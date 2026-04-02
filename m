Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70401CC6B00
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 06:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3105910F0E1;
	Thu,  2 Apr 2026 06:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLz6z0dJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849E510F0E1
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 06:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775111409; x=1806647409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JZIv7FiGNm0On8tiLitu0d3HWlxWqxeEapVkkMaHlj0=;
 b=SLz6z0dJVhxtM1ur4omfaCQmnJlgsSV1v7lFjX9W9Cg2Vg2hpODR/osU
 aSFrNbEw58FJ4DzXPgXqcSv5s/8ITn324kdvKAu0T2fYkLLVG/WfsjixY
 wwlwF/VRXLKVBOJR0xHZD3BNlAVRd/L/GoeFIkVmDnsh2mwtHrTz7Vg+b
 xiOB9CFASvjJP9/zomxH05ibaOnFyWRL1zKyTjxRuLm+4VGf75HfDK+qP
 pfn30067hawdl3AqB+tSQ6yO3VV1IGp6OnUx60ErTEAq1WTFbKhLiJUBT
 DppBcWTBN0hEhYs093b9Gnl+i4NK0RxLtGswIUMSmJ3u8oCSqLXROSMwi Q==;
X-CSE-ConnectionGUID: cqurT75UQrKNTbRbrTqQSw==
X-CSE-MsgGUID: 2WmQVOycSJimgGKHe0Ku/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76051513"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76051513"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:30:09 -0700
X-CSE-ConnectionGUID: VghRVctJRweCSL4IA0mQNg==
X-CSE-MsgGUID: QWrX6qGTRCq3daRjAdymow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="222532353"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:30:05 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 09/10] drm/xe/xe_ras: Handle Uncorrectable SoC Internal
 errors
Date: Thu,  2 Apr 2026 12:31:40 +0530
Message-ID: <20260402070131.1603828-21-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260402070131.1603828-12-riana.tauro@intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: return error code for each SoC error (Mallesh)
---
 drivers/gpu/drm/xe/xe_ras.c | 49 +++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 6542ed4a6a24..2762a0f0d621 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -8,6 +8,7 @@
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_ras_types.h"
+#include "xe_survivability_mode.h"
 #include "xe_sysctrl_mailbox.h"
 #include "xe_sysctrl_mailbox_types.h"
 
@@ -90,6 +91,51 @@ static enum xe_ras_recovery_action handle_compute_errors(struct xe_device *xe,
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
+static enum xe_ras_recovery_action handle_soc_internal_errors(struct xe_device *xe,
+							      struct xe_ras_error_array *arr)
+{
+	struct xe_ras_soc_error *error_info = (struct xe_ras_soc_error *)arr->error_details;
+	struct xe_ras_soc_error_source source = error_info->error_source;
+	struct xe_ras_error_common common = arr->error_class.common;
+
+	xe_err(xe, "[RAS]: %s %s Error detected", severity_to_str(xe, common.severity),
+	       comp_to_str(xe, common.component));
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
+			       severity_to_str(xe, common.severity),
+			       csc_error->hec_uncorr_fw_err_dw0);
+			xe_survivability_mode_runtime_enable(xe);
+			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
+		}
+	}
+
+	if (source.soc) {
+		struct xe_ras_ieh_error *ieh_error = (struct xe_ras_ieh_error *)error_info->additional_details;
+
+		if (ieh_error->global_error_status & XE_RAS_IEH_PUNIT_ERROR) {
+			xe_err(xe, "[RAS]: PUNIT %s error detected: 0x%x\n",
+			       severity_to_str(xe, common.severity),
+			       ieh_error->global_error_status);
+			/** TODO: Add PUNIT error handling */
+			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
+		}
+	}
+
+	/* For other SOC internal errors, request a reset as recovery mechanism */
+	return XE_RAS_RECOVERY_ACTION_RESET;
+}
+
 static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
 				    u32 cmd_mask, void *request, size_t request_len,
 				    void *response, size_t response_len)
@@ -164,6 +210,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			case XE_RAS_COMPONENT_CORE_COMPUTE:
 				action = handle_compute_errors(xe, &arr);
 				break;
+			case XE_RAS_COMPONENT_SOC_INTERNAL:
+				action = handle_soc_internal_errors(xe, &arr);
+				break;
 			default:
 				xe_err(xe, "[RAS]: Unknown error component %u\n", component);
 				action = XE_RAS_RECOVERY_ACTION_RESET;
-- 
2.47.1

