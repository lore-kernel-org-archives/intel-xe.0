Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A18CCD5BC8
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 09:33:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5FF10E0F1;
	Mon, 25 May 2026 09:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3VqxgkD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A922F10E0F1
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 09:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779701617; x=1811237617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zlR//iPcIwYGMnKtWon0FVZgY5XRiQk6jKJKPc2dW/Y=;
 b=l3VqxgkD9T3drhLsRhU79W6yaIXCyE6xK2n6PPZR+yDu7kfWojEG27mh
 ou5NxEm9ZD8dZ0A7Rs2qyBNPpu1UgNSeI2IoXNgr8IurbmdN9u4O8UiqK
 O25LUJLQ4dF6OEEQ+eJfLEpURn+FVYS+4DYu4iqrkZoxzwV9MnhRs/ZYp
 Wuu0FLI0UXthLN20G5+fdVgvtHrUSl1otOcwNi2Gt/ml4eiTdiLTkUA/K
 5IWVd/e791WyRFt+lwHKCM1ZwC7NIRaCk/qvms0LLp74BYAHVgwvvPuxo
 /qEfIhLHoCoRlbZlP7CgZo8AG8sBzXx2umIrrcYSxovFN3OvoC4cAx1vh A==;
X-CSE-ConnectionGUID: X/2AT1+YTtyP1DxX7ga4wA==
X-CSE-MsgGUID: cAbtDHh7Seu/Yxbm+Lx2PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="68046823"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="68046823"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:33:36 -0700
X-CSE-ConnectionGUID: KwYOtCSIQbuTv9c6Mq1MXQ==
X-CSE-MsgGUID: oKWm+EysR4GPnVr8YKnGdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="279669691"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:33:34 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 10/15] drm/xe/xe_ras: Add support to query device memory
 errors
Date: Mon, 25 May 2026 15:36:29 +0530
Message-ID: <20260525100619.3155663-27-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260525100619.3155663-17-riana.tauro@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
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
system controller. Double bit ECC (Error Correcting Code) errors will
be handled using Page offlining in a later patch. The other device memory
error categories require a Secondary Bus Reset (SBR) to recover.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: simplify structures

v3: fix reserved member (Mallesh)
---
 drivers/gpu/drm/xe/xe_ras.c       | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h | 17 +++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 597c3af55a29..fb6da3d06b9a 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -131,6 +131,21 @@ static enum xe_ras_recovery_action handle_soc_internal_errors(struct xe_device *
 	return XE_RAS_RECOVERY_ACTION_RESET;
 }
 
+static enum xe_ras_recovery_action handle_device_memory_errors(struct xe_device *xe,
+							       struct xe_ras_error_array *arr)
+{
+	struct xe_ras_memory_error *info = (void *)arr->details;
+
+	if (info->category & XE_RAS_MEMORY_ECC) {
+		xe_err(xe, "[RAS]: double-bit ECC error detected at sw address 0x%llx\n",
+		       info->sw_address);
+		/* TODO: page offline handling for double-bit ECC errors and return accordingly */
+	}
+
+	/* Request a reset for other device memory error categories */
+	return XE_RAS_RECOVERY_ACTION_RESET;
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -222,6 +237,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
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
index 2749ba0b0239..8c2d13152b32 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -11,6 +11,7 @@
 #define XE_RAS_NUM_ERROR_ARR			3
 #define XE_RAS_NUM_COUNTERS			16
 #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
+#define XE_RAS_MEMORY_ECC			BIT(1)
 
 /**
  * enum xe_ras_recovery_action - RAS recovery actions
@@ -175,4 +176,20 @@ struct xe_ras_ieh_error {
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

