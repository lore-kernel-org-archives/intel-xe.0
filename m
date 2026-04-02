Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E7FCC6B00
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 06:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6455610F0DA;
	Thu,  2 Apr 2026 06:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqZ+D7j8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7AC10F0DA
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 06:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775111405; x=1806647405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PKBf2yIxDQp0id8jGLZYRfVp0Bj9ZNlLkeJXLqs3C0c=;
 b=bqZ+D7j86YHh5fmxxNHxLY39csb6akF/0H9OyPOk5CJw7VpL+tGoGPYN
 bAlN9jOBCaIGm0eI4WlyPlhmbwF6qHuSRYUVw3FjAtduLtm7I8urpIUJB
 5Ek3OsPLOZ4/JBBT2q8qNR2L4NRSJ+7PVmgqDH1cFJ4zgYCE2pfiM9UzX
 HWLDwgd7mcXki9fgYWvsizVzMprWxG7eexsvuKdL60D/Hy7prKkqx8YRM
 xSL5f7CujRWfrByGUlBT6+HI98RFGkTVAYnSWdJp2KSKwirH5Q/fJfpwa
 X7ivrMiJncsu01kmuFbAHBC1+qRjcEe0BiRTSa9cBfoV/HyYRjFy+ufrO g==;
X-CSE-ConnectionGUID: 710gu1/7TOOaWsy/WHQksQ==
X-CSE-MsgGUID: 01ieQy3zQeWA/rWnx+DSnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76051507"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76051507"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:30:05 -0700
X-CSE-ConnectionGUID: 85WnJGc9R9aIn3pjQHW+8A==
X-CSE-MsgGUID: umMN1NgJTp6Dbs6t5ovp+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="222532340"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:30:02 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 08/10] drm/xe/xe_ras: Add structures for SoC Internal errors
Date: Thu,  2 Apr 2026 12:31:39 +0530
Message-ID: <20260402070131.1603828-20-riana.tauro@intel.com>
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

Add response structures for SoC Internal errors.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: simplify soc structures
---
 drivers/gpu/drm/xe/xe_ras_types.h | 51 +++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index e37dd12bffa3..65158bf716a7 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -10,6 +10,7 @@
 
 #define XE_RAS_NUM_ERROR_ARR		3
 #define XE_RAS_MAX_ERROR_DETAILS	16
+#define XE_RAS_IEH_PUNIT_ERROR		BIT(1)
 
 /**
  * enum xe_ras_recovery_action - RAS recovery actions
@@ -149,4 +150,54 @@ struct xe_ras_compute_error {
 	u32 spare_log3;
 } __packed;
 
+/**
+ * struct xe_ras_soc_error_source - Source of SOC error
+ */
+struct xe_ras_soc_error_source {
+	/** @csc: CSC error */
+	u32 csc:1;
+	/** @soc: SOC error */
+	u32 soc:1;
+	/** @reserved: Reserved for future use */
+	u32 reserved:30;
+} __packed;
+
+/**
+ * struct xe_ras_soc_error - SOC error details
+ */
+struct xe_ras_soc_error {
+	/** @error_source: Error Source */
+	struct xe_ras_soc_error_source error_source;
+	/** @additional_details: Additional details */
+	u32 additional_details[15];
+} __packed;
+
+/**
+ * struct xe_ras_csc_error - CSC error details
+ */
+struct xe_ras_csc_error {
+	/** @hec_uncorr_err_status: CSC error */
+	u32 hec_uncorr_err_status;
+	/** @hec_uncorr_fw_err_dw0: CSC f/w error */
+	u32 hec_uncorr_fw_err_dw0;
+} __packed;
+
+/**
+ * struct xe_ras_ieh_error - SoC IEH (Integrated Error Handler) details
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
+	/** @additional_info: Additional information */
+	u32 additional_info[10];
+} __packed;
+
 #endif
-- 
2.47.1

