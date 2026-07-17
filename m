Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EDCC44520
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 14:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA3710E47A;
	Fri, 17 Jul 2026 14:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUxXDCNC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69A210E47A
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 14:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784297833; x=1815833833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F69sX1hnmQe551DFiOOewuJSFa7zafR8RG73+ZDZRRo=;
 b=LUxXDCNCAAHE6DKIQwBrfQ2xON7Yt2g9jCAgXxF91yvO9DEmiNSVZDVz
 /oNLMyseOf9f7bou+zs8JHuJJL64cUiK4L9seXZ6g87wVOJquGaHpLeG0
 OK9tzgu06Obb8sVSxtnho4zTbXgNnzfVxDWb25RqC9OpY3AE0B/5JQjUF
 dWnpbZQy9pbj4iZXIFfVg5tO+RIbTbehLmeRoRZrlN87CJEPLHURagizw
 2c7vW7+R6egpRcuSXXkD0MZB0e8bt6vHQW2CkXgTRxfaRqxyVgSuJd3iZ
 4MPfuj+x951gjfL7rSxX2d2cLC3v7lMvktukgd+1YD2agmm8tGblO8ofr Q==;
X-CSE-ConnectionGUID: +pSWkRwYQrmMJA0G5skmaA==
X-CSE-MsgGUID: 3gjND8z8Su22BpEmHhb4xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84995797"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="84995797"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:17:13 -0700
X-CSE-ConnectionGUID: hsqlPlQpROyujfu0YdPpJg==
X-CSE-MsgGUID: E2etPwnBRe2FhnWSejiHCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="255031633"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:17:10 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v10 3/3] drm/xe/xe_ras: Add support to query device memory
 errors
Date: Fri, 17 Jul 2026 19:46:54 +0530
Message-ID: <20260717141650.2487761-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260717141650.2487761-5-riana.tauro@intel.com>
References: <20260717141650.2487761-5-riana.tauro@intel.com>
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
Page offlining is handled in
https://lore.kernel.org/intel-xe/20260716103949.1554216-13-tejas.upadhyay@intel.com/

v2: simplify structures

v3: fix reserved member (Mallesh)

v4: add handling for poison and data parity

v5: rebase
---
 drivers/gpu/drm/xe/xe_ras.c       | 33 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h | 20 +++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 73f9949286b4..a31e06b8aa67 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -276,6 +276,36 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 	return XE_RAS_RECOVERY_ACTION_RESET;
 }
 
+static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
+{
+	struct xe_ras_memory_error *info = (void *)arr->details;
+
+	/*
+	 * For memory errors, the recovery action depends on the error category
+	 *
+	 * TODO: Double-bit ECC errors: Page offlining
+	 * Poison and data parity errors: Log only
+	 * For any other memory errors, request a reset as recovery mechanism
+	 */
+	switch (info->category) {
+	case XE_RAS_MEMORY_POISON:
+		xe_info(xe, "[RAS]: Poison error detected\n");
+		break;
+	case XE_RAS_MEMORY_DATA_PARITY:
+		xe_info(xe, "[RAS]: Data parity error detected\n");
+		break;
+	case XE_RAS_MEMORY_DB_ECC:
+		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
+			info->sw_address);
+		/* TODO: Add page offlining for Double-bit ECC error */
+		fallthrough;
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
@@ -402,6 +432,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
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
index 8803a198b3aa..9b0a30e3d591 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -12,6 +12,10 @@
 #define XE_RAS_NUM_ERROR_ARR			3
 /* Error bits in IEH global error status register */
 #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
+/* Device memory error categories */
+#define XE_RAS_MEMORY_DB_ECC			BIT(1)
+#define XE_RAS_MEMORY_POISON			BIT(2)
+#define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
 
 /**
  * enum xe_ras_recovery_action - RAS recovery actions
@@ -229,6 +233,22 @@ struct xe_ras_ieh_error {
 	u32 info[10];
 } __packed;
 
+/**
+ * struct xe_ras_memory_error - Device memory error details
+ */
+struct xe_ras_memory_error {
+	/** @category: Device memory error category */
+	u8 category;
+	/** @reserved: Reserved for future use */
+	u8 reserved[7];
+	/** @reserved1: Reserved for future use */
+	u64 reserved1;
+	/** @sw_address: Software address where error occurred */
+	u64 sw_address;
+	/** @reserved2: Reserved for future use */
+	u32 reserved2[10];
+} __packed;
+
 /**
  * struct xe_ras_get_health_request - Request structure for obtaining gpu health
  */
-- 
2.47.1

