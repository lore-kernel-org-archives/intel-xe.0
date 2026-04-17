Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE142F8DFD0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 08:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D2110E99A;
	Fri, 17 Apr 2026 08:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eXW9eB+m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18A810E997
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 08:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776414367; x=1807950367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zRyun+0m3AWV8Kt4iwo6WF2e1tHxI8z44emZN+tYpAA=;
 b=eXW9eB+mqUNHUTeyYwRhx2tg8P/jnbMK8baxKruy6ljdxOVYp14/8Gmo
 Rd3l6O2aatW4XdoIBj/+im5r9JT2Or6J+ngXakOGZ+1zY1yl9zPIWfxBM
 de05nTzDxFO23EeN6bCPcvYic3HIvppcIZwBbT265trqcpbBYADS1TefP
 A1P5MT3UaBhnzJCuuySq2+R8y/jctYQdDNx9vXZY8khxzqKwdDNlvinHo
 Q4tC2KgEAM6LmYMXwlsosTw0ApFGQraRhtgU5v3kH3ubCc/gV9IAkbiMr
 9994QcWeLVaeKqNiRUqBZfuE6cx7+Bo41DxZ84+M7h19K+h0djCWDleAM w==;
X-CSE-ConnectionGUID: 6uWjNaOCSrOEbbF2LcdhMQ==
X-CSE-MsgGUID: QnsN+rpySlCAd8sj1gPMpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88045893"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="88045893"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:26:06 -0700
X-CSE-ConnectionGUID: KK3hz4/fQZSM8wg0HVVubw==
X-CSE-MsgGUID: 4bozqnTrTTaS9LcW5UXWfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235962288"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:26:03 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 09/13] drm/xe/xe_ras: Handle uncorrectable device memory
 errors
Date: Fri, 17 Apr 2026 14:28:21 +0530
Message-ID: <20260417085812.4013309-24-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260417085812.4013309-15-riana.tauro@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
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

Add support to handle uncorrectable device memory errors. Double bit ECC
(Error Correcting Code) errors are logged. These will be handled using
Page offlining in a later patch. The other memory error categories require
a Secondary bus reset (SBR) to recover.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
Memory offlining patch will be integrated once 
https://patchwork.freedesktop.org/series/161473/ is merged.
---
 drivers/gpu/drm/xe/xe_ras.c       | 23 ++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h | 61 +++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 5010cf6211ea..347844b3d2bf 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -138,6 +138,26 @@ static enum xe_ras_recovery_action handle_soc_internal_errors(struct xe_device *
 	return XE_RAS_RECOVERY_ACTION_RESET;
 }
 
+static enum xe_ras_recovery_action handle_memory_errors(struct xe_device *xe,
+							struct xe_ras_error_array *arr)
+{
+	struct xe_ras_memory_error *error_info = (struct xe_ras_memory_error *)arr->error_details;
+	struct xe_ras_error_category category = error_info->category;
+	struct xe_ras_error_common common = arr->error_class.common;
+
+	xe_err(xe, "[RAS]: %s %s Error detected", severity_to_str(xe, common.severity),
+	       comp_to_str(xe, common.component));
+
+	if (category.ecc_error) {
+		xe_err(xe, "[RAS]: Double bit ECC error detected at sw address 0x%llx\n",
+		       (unsigned long long)error_info->sw_address);
+		/* TODO: page offline handling for 2-bit ECC errors and return accordingly */
+	}
+
+	/* Request a RESET for other device memory error categories */
+	return XE_RAS_RECOVERY_ACTION_RESET;
+}
+
 static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
 				    u32 cmd_mask, void *request, size_t request_len,
 				    void *response, size_t response_len)
@@ -217,6 +237,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			case XE_RAS_COMPONENT_SOC_INTERNAL:
 				action = handle_soc_internal_errors(xe, &arr);
 				break;
+			case XE_RAS_COMPONENT_DEVICE_MEMORY:
+				action = handle_memory_errors(xe, &arr);
+				break;
 			default:
 				xe_err(xe, "[RAS]: Unknown error component %u\n", component);
 				action = XE_RAS_RECOVERY_ACTION_RESET;
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 4f640124f38f..020e3f92a057 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -199,4 +199,65 @@ struct xe_ras_ieh_error {
 	/** @additional_info: Additional information */
 	u32 additional_info[10];
 } __packed;
+
+/**
+ * struct xe_ras_hardware_address - Device memory hardware address details
+ *
+ * Hardware physical address structure for device memory error reporting.
+ */
+struct xe_ras_hardware_address {
+	/** @column: Column address */
+	u64 column:6;
+	/** @bank: Bank */
+	u64 bank:2;
+	/** @bank_group: Bank group */
+	u64 bank_group:2;
+	/** @row: Row address */
+	u64 row:16;
+	/** @channel: Memory Channel */
+	u64 channel:8;
+	/** @msu: MSU index */
+	u64 msu:8;
+	/** @reserved: Reserved for future use */
+	u64 reserved:22;
+} __packed;
+
+/**
+ * struct xe_ras_error_category - Device memory error category details
+ */
+struct xe_ras_error_category {
+	/** @pma_error: PMA (Power Management Agent) error */
+	u8 pma_error:1;
+	/** @ecc_error: Double bit ECC error */
+	u8 ecc_error:1;
+	/** @poison_detected: Write poison detected */
+	u8 poison_detected:1;
+	/** @parity_error: Parity error */
+	u8 parity_error:1;
+	/** @phy_error: PHY error */
+	u8 phy_error:1;
+	/** @reserved: Reserved for future use */
+	u8 reserved:3;
+} __packed;
+
+/**
+ * struct xe_ras_memory_error - Device memory error details
+ *
+ * This structure provides detailed information about a device memory error.
+ * Cast from error_details array for device memory errors.
+ */
+struct xe_ras_memory_error {
+	/** @category: Device memory error category */
+	struct xe_ras_error_category category;
+	/** @reserved: Reserved for future use */
+	u8 reserved[7];
+	/** @hw_address: Memory hardware physical address */
+	struct xe_ras_hardware_address hw_address;
+	/** @sw_address: Software address where error occurred */
+	u64 sw_address;
+	/** @log_array: Error syndromes associated with the error */
+	u32 log_array[8];
+	/** @reserved2: Reserved for future use */
+	u32 reserved2[2];
+} __packed;
 #endif
-- 
2.47.1

