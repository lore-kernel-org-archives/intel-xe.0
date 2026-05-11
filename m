Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC60CD4840
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 16:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3967410E849;
	Mon, 11 May 2026 16:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fx4LWcPe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7223B10E84F
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 16:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778518590; x=1810054590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WacS91cl/pAcP5dc07nQjUYV5c+xGjqJ+1LE6a9LnFs=;
 b=fx4LWcPeNFFclYvaPs1MlD8fCg6RAasGvVavLyf/dCahzKZjFvgDOFTk
 oVtcMKtt1tcEgiGwZjVcGJUrkkDPeSXIq+9HLswTDsK1pPAkHKGWqxFoF
 UploeJOao4bHmdXJH91zmW796m/9TLdnQ+VG79Up8Zsg498PmWg8N7I4p
 PrupEXnB1cSlQ0FDyFpEp+mLr0RoC1VGrmdPtmD3OyfJW4ylop4j6XVkX
 iprJsTKfIotRXEOiMD4OimzrCO0/6fZnRkFEfjS4tg8bAidCob0V7eMnH
 rTbnWkByJEes6FND9NopzaXB7yOge7qQUOA5zk3PVHTH9Kd+MylacwPZf A==;
X-CSE-ConnectionGUID: ETovqL3YT32rJznDaCejWQ==
X-CSE-MsgGUID: 3FpjR2PeTN2vJHcD3Jmqvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90513562"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90513562"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:30 -0700
X-CSE-ConnectionGUID: v6s1Lr/fQLuJvPLEtpqPbw==
X-CSE-MsgGUID: Rh0Gw3txRLaHFMvShRvkFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="260988769"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:26 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 09/14] drm/xe/xe_ras: Add support to query device memory
 errors
Date: Mon, 11 May 2026 22:59:16 +0530
Message-ID: <20260511172908.1122252-25-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260511172908.1122252-16-riana.tauro@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
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
---
v2: simplify structures 
---
 drivers/gpu/drm/xe/xe_ras.c       | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h | 17 +++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 0d4e2116ef61..803f5fd204bd 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -153,6 +153,21 @@ static enum xe_ras_recovery_action handle_soc_internal_errors(struct xe_device *
 	return XE_RAS_RECOVERY_ACTION_RESET;
 }
 
+static enum xe_ras_recovery_action handle_device_memory_errors(struct xe_device *xe,
+							       struct xe_ras_error_array *arr)
+{
+	struct xe_ras_memory_error *error_info = (struct xe_ras_memory_error *)arr->error_details;
+
+	if (error_info->category & XE_RAS_MEMORY_ECC) {
+		xe_err(xe, "[RAS]: double-bit ECC error detected at sw address 0x%llx\n",
+		       error_info->sw_address);
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
@@ -246,6 +261,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
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
index c5a283317d90..5999e7b4af1c 100644
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
 	/** @additional_info: Additional information */
 	u32 additional_info[10];
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
+	/** @reserved2: Reserved for future use */
+	u32 reserved2[10];
+} __packed;
 #endif
-- 
2.47.1

