Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD65AC61DBE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 14:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6937410EA9A;
	Tue, 25 Aug 2026 14:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZjMgcYd3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D0710EA8B
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 14:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787667091; x=1819203091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t9eC6N3GSreYSmaOltLtr7z8FfB/nPvF7OS9eQDOJsk=;
 b=ZjMgcYd3eiSNxBnCf+cv1DGEJS8advOFMYlb3obCAUDgp53dviDMWcf+
 96WNFYzxxzeuRr/BL4tQLHd3m+fy0dMuLCp4cQkItp9sERJZZNxvBu3oX
 enMUKX4P6vZz3P4H/Q0pwH4wG0viBrhvqpgyuSzI1dZBR6Ysv6HfuTSHe
 AVmSMBq+zyl+tWfnXjQr/oaiD1QiPIsCZXyS0SVZBOps5NzZGrPQHwu7G
 Rcg5EBnTEJ8tHofoKpIbqpCMFKz9/kPGiGeJ/WfULlIrX1HWf2uDAXpV3
 3PJMjU4oBZvCkM1PL/wHkYS5sIdZiiuupxuZkyFVWIl68BkIhzk++tjEc A==;
X-CSE-ConnectionGUID: jP7ASPzuTbmkyKf6eVN0WA==
X-CSE-MsgGUID: ncRgOmsYTyiKqsKDH87gPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="90648437"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="90648437"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:11:31 -0700
X-CSE-ConnectionGUID: t/S9o8hTSoieLmWAx7+TdA==
X-CSE-MsgGUID: M+99pZDhQ8+1wm/TlbH0uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="265996140"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.238.50])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:11:28 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH 2/2] drm/xe/xe_ras: Add support for PCIe error component
 handling
Date: Tue, 25 Aug 2026 19:41:12 +0530
Message-ID: <20260825141109.3797483-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260825141109.3797483-4-riana.tauro@intel.com>
References: <20260825141109.3797483-4-riana.tauro@intel.com>
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

PCIe Subsystem GPMA errors and other uncorrectable non-fatal usp errors
are collected and classified by system controller under component PCIe.
For PCIe SS GPMA errors, request a Secondary Bus Reset.
All other PCIe errors are treated as recovered with no further action.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c       | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 586dc28a638a..39e5fdb9770d 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -394,6 +394,21 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
+static u8 handle_pcie_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
+{
+	struct xe_ras_ieh_error *info = (void *)arr->details;
+
+	if (info->global_error_status & XE_RAS_PCIE_IEH_GPMA) {
+		xe_log_comp_fatal(xe, PCIE, &arr->counter, sizeof(arr->counter),
+				  "GPMA error detected\n");
+		return XE_RAS_RECOVERY_ACTION_RESET;
+	}
+
+	xe_log_comp_recoverable(xe, PCIE, &arr->counter, sizeof(arr->counter),
+				"Other errors detected\n");
+	return XE_RAS_RECOVERY_ACTION_RECOVERED;
+}
+
 static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
 {
 	struct xe_ras_error_product *product = &arr->counter.product;
@@ -572,6 +587,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			case XE_RAS_COMP_DEVICE_MEMORY:
 				action = handle_device_memory_errors(xe, arr);
 				break;
+			case XE_RAS_COMP_PCIE:
+				action = handle_pcie_errors(xe, arr);
+				break;
 			case XE_RAS_COMP_FABRIC:
 				action = handle_fabric_errors(xe, arr);
 				break;
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 73517fd0d415..0a9747df8a69 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -12,6 +12,7 @@
 #define XE_RAS_NUM_ERROR_ARR			3
 /* Error bits in IEH global error status register */
 #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
+#define XE_RAS_PCIE_IEH_GPMA			BIT(5)
 /* Bits 16-31 represent individual SAF MHB unit */
 #define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
 /* Fabric Data payload parity errors */
-- 
2.47.1

