Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCD8C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 05:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8840010E277;
	Wed, 16 Sep 2026 05:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3yfOMpS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C14310E277
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 05:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789536539; x=1821072539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BbSO0qok4TZggIXgRZ1/DOGVqK+xyrIvV+CZCkAEMH8=;
 b=R3yfOMpSGUT6eIu3fGFqrHSk62GUQLiCG0pVEiqAAeXrw17KY2+TDxL9
 51puJ+O1/VlstiQLmBACHg1Kz7gBdhNkpZhwmQ5d8BM8eaaB2mdWyQpa0
 ygQ9eEKVbHwscVtWNH4btPuBE21QlJVdyjPV0VBR3Cc61YF+UA3fLUd/c
 s45kfcpwIXPeZI195rU/76rJD3oCaopC9HK08yik/D3hJSrM7GPMjdC1L
 +1iuoUKdzhfL6A0iS+V4tOLr4nzXv0xne04VkZBF+hW+svP9aD7GDY4tw
 caz5ADfpuGcldSmeVQ/pdEGM6AV2FU+aMVLRgmkR60MinbJo6G6Tlx3Q5 A==;
X-CSE-ConnectionGUID: lVe2xfIwRn6fkMkWWTJovQ==
X-CSE-MsgGUID: g59M9mJGRhab3Fe+coiNAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77469961"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77469961"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 22:28:59 -0700
X-CSE-ConnectionGUID: /ALUEoxiTgKs65VTnmCO3Q==
X-CSE-MsgGUID: oFf05tdjSVi8Zpz8lUDmLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275190126"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 22:28:56 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH v2 2/2] drm/xe/xe_ras: Add support for PCIe error component
 handling
Date: Wed, 16 Sep 2026 10:58:39 +0530
Message-ID: <20260916052836.2953509-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260916052836.2953509-4-riana.tauro@intel.com>
References: <20260916052836.2953509-4-riana.tauro@intel.com>
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

Add support for handling PCIe subsystem errors. PCIe subsystem power
management errors require a Seconday bus reset(SBR) for recovery. Treat all
others as recovered and take no further action.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: add mapping to cper severity (Badal, Rodrigo)
    add abbreviations
    fix punctuations (Raag)
---
 drivers/gpu/drm/xe/xe_ras.c       | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index c1939fd71f2d..83adcd211864 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -409,6 +409,22 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
+static u8 handle_pcie_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
+{
+	struct xe_ras_ieh_error *info = (void *)arr->details;
+	u8 severity = arr->counter.common.severity;
+
+	if (info->global_error_status & XE_RAS_PCIE_IEH_GPMA) {
+		xe_log_comp(xe, ras_sev_to_cper_sev(severity), PCIE, &arr->counter,
+			    sizeof(arr->counter), "GPMA error detected\n");
+		return XE_RAS_RECOVERY_ACTION_RESET;
+	}
+
+	xe_log_comp(xe, ras_sev_to_cper_sev(arr->counter.common.severity), PCIE, &arr->counter,
+		    sizeof(arr->counter), "Errors detected\n");
+	return XE_RAS_RECOVERY_ACTION_RECOVERED;
+}
+
 static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
 {
 	struct xe_ras_error_product *product = &arr->counter.product;
@@ -588,6 +604,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
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
index 4a8cd6fc5ba2..324e9754742b 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -12,6 +12,7 @@
 #define XE_RAS_NUM_ERROR_ARR			3
 /* Error bits in IEH global error status register */
 #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
+#define XE_RAS_PCIE_IEH_GPMA			BIT(5)
 /* Bits 16-31 represent individual SAF MHB unit */
 #define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
 
-- 
2.47.1

