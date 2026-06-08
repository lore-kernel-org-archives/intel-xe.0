Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFA6CD8C92
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:48:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115A210EF86;
	Mon,  8 Jun 2026 08:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WyymSj7I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6366D10EF86
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780908482; x=1812444482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KejMg6NTFzOMyHyUN7NKraB5dctKHx9V/PaV56FG35c=;
 b=WyymSj7IViNOgqUf0ijRbHiXl6hA5WVuheNb+d51pRPRYaL28l0y6R2N
 8kge1b+XSYXbL3cuXb+vOn75UmtYB3Gn0A8sObBE9SCTD723yR3Fl5AGm
 Krl550QsuDBXYG4wO2LQ4H/UnZzqCv4ejI8tS3TGA041S/zoKH5fEu9Ci
 diWKpUYaRIhC4wSRDVOs6sRLUCxI27TTEaOZGEZsSo2/wtqIvsNYJhG8k
 8bUqIOUfKyvDmMYftGLGIArqE/lu4AjqQY+ot9IrLpQTKc9EYSjd4xSh2
 BArawlY8Bd891hqUso8N9WTeQhJ8hGI69cAZUkAZCtuQEbxDyUMOuAUrO w==;
X-CSE-ConnectionGUID: 8jSIDrtpSo+BmGNZcc4HxQ==
X-CSE-MsgGUID: PDPkS1N0RaaBQaGHw+3TKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93029121"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="93029121"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:48:01 -0700
X-CSE-ConnectionGUID: XmSScilkQbKc2UqTpsrOFQ==
X-CSE-MsgGUID: qESqVYATT1S9pQ1ge+3dxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269466142"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:58 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v8 12/15] drm/xe/xe_ras: Add support to query device memory
 errors
Date: Mon,  8 Jun 2026 14:17:13 +0530
Message-ID: <20260608084700.640376-29-riana.tauro@intel.com>
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

Add initial support to query uncorrectable device memory errors from
system controller. The recovery action for memory errors depends on the
error category. Firmware will set only one error category per response.
Double bit ECC (Error Correcting Code) errors will be handled using Page
offlining in a later patch. Poison and data parity errors are only logged.
Rest of the errors require SBR (Secondary Bus Reset) to recover.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: simplify structures

v3: fix reserved member (Mallesh)

v4: add handling for poison and data parity
---
 drivers/gpu/drm/xe/xe_ras.c       | 33 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h | 20 +++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 837cb51fc854..495478f10cb8 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -131,6 +131,36 @@ static enum xe_ras_recovery_action handle_soc_internal_errors(struct xe_device *
 	return XE_RAS_RECOVERY_ACTION_RESET;
 }
 
+static enum xe_ras_recovery_action handle_device_memory_errors(struct xe_device *xe,
+							       struct xe_ras_error_array *arr)
+{
+	struct xe_ras_memory_error *info = (void *)arr->details;
+
+	/*
+	 * For memory errors, the recovery action depends on the error category
+	 *
+	 * TODO: Double bit ECC: Page offline handling
+	 * Poison and data parity errors: Log only
+	 * For any other memory errors, request a reset as recovery mechanism
+	 */
+	switch (info->category) {
+	case XE_RAS_MEMORY_ECC:
+		xe_err(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
+		       info->sw_address);
+		break;
+	case XE_RAS_MEMORY_POISON:
+		xe_info(xe, "[RAS]: Poison error detected\n");
+		break;
+	case XE_RAS_MEMORY_DATA_PARITY:
+		xe_info(xe, "[RAS]: Data parity error detected\n");
+		break;
+	default:
+		return XE_RAS_RECOVERY_ACTION_RESET;
+	}
+
+	return XE_RAS_RECOVERY_ACTION_RECOVERED;
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -222,6 +252,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			case XE_RAS_COMP_SOC_INTERNAL:
 				action = handle_soc_internal_errors(xe, arr);
 				break;
+			case XE_RAS_COMP_DEVICE_MEMORY:
+				action = handle_device_memory_errors(xe, arr);
+				break;
 			default:
 				/* For any other component, reset */
 				action = XE_RAS_RECOVERY_ACTION_RESET;
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 2749ba0b0239..cbd871c09b6a 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -11,6 +11,10 @@
 #define XE_RAS_NUM_ERROR_ARR			3
 #define XE_RAS_NUM_COUNTERS			16
 #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
+/* Device memory error categories */
+#define XE_RAS_MEMORY_ECC			BIT(1)
+#define XE_RAS_MEMORY_POISON			BIT(2)
+#define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
 
 /**
  * enum xe_ras_recovery_action - RAS recovery actions
@@ -175,4 +179,20 @@ struct xe_ras_ieh_error {
 	/** @info: Additional information */
 	u32 info[10];
 } __packed;
+
+/**
+ * struct xe_ras_memory_error - Device memory error details
+ */
+struct xe_ras_memory_error {
+	/** @category: Device memory error category */
+	u8 category;
+	/** @reserved: Reserved for future use */
+	u8 reserved[7];
+	/** @hardware_address: Hardware physical address details */
+	u64 hardware_address;
+	/** @sw_address: Software address where error occurred */
+	u64 sw_address;
+	/** @reserved1: Reserved */
+	u32 reserved1[10];
+} __packed;
 #endif
-- 
2.47.1

