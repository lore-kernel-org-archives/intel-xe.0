Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04610E9B344
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 09:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA14810E477;
	Mon,  2 Mar 2026 09:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXti1N4j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D4410E477
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772445046; x=1803981046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0MeZ8+VPPrmHAmjmXrqZT+7eeoh/UTzPq0Yoti+kmT4=;
 b=fXti1N4jhJt+PKJcxITLS0lxihiFMXTy1xvmYVlUbc4PhaZKCtYdYWBv
 9tPmEwre7PEXkEsQsD/o7BtJQ0MEiMvR6URib/Ga1uhECN3h/H1Dnx7SB
 fE+4+8ni5RrMqW4vo6qkQNiHk7gCX66E47JY9FPcSrmzeD7TmiFjxR8jN
 SrGuXWYnchRXkE7vbwCpz+1FFfcVbMcKJR0l1+HNhBqa3ipCjRkUmvFDN
 AqcV2tWkgrRbv2Ssok61EX2+GCtcPU3MUCnDYKShWzpTa9lcM++uEucmu
 3ZcrKRv50OUfaAPBUvIWj+kEex7lWX5UWJBhyt+Gi7h60ZFARctIjgo3F A==;
X-CSE-ConnectionGUID: Y5Ixh1k0R8WcZdV5xNJKCg==
X-CSE-MsgGUID: rg+fOVgFRzqVjUtXSQ9zLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="83783058"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="83783058"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:50:46 -0800
X-CSE-ConnectionGUID: VyYru2SYR/ebs/kgZYLrQw==
X-CSE-MsgGUID: sXf+MQdeQtu5+2UEPvySow==
X-ExtLoop1: 1
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:50:43 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH v2 09/11] drm/xe/xe_ras: Add structures for SoC Internal errors
Date: Mon,  2 Mar 2026 15:52:04 +0530
Message-ID: <20260302102155.4074630-22-riana.tauro@intel.com>
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

Add response structures for SoC Internal errors.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras_types.h | 134 ++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 221d07efd84c..466db9f47127 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -145,4 +145,138 @@ struct xe_ras_compute_error {
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
+ * struct xe_ras_ieh_error - SoC IEH error details
+ */
+struct xe_ras_ieh_error {
+	/** @ieh_instance: IEH instance */
+	u32 ieh_instance:2;
+	/** @reserved: Reserved for future use */
+	u32 reserved:30;
+	union {
+		/** @global_error_status: Global error status */
+		u32 global_error_status;
+		/** @error_sources_ieh0: Error sources for IEH0 */
+		struct {
+			/** @psf0_psf1_npk: PSF0, PSF1, NPK */
+			u32 psf0_psf1_npk:1;
+			/** @punit: PUNIT */
+			u32 punit:1;
+			/** @reserved_2: Reserved */
+			u32 reserved_2:1;
+			/** @oobmsm: OOBMSM */
+			u32 oobmsm:1;
+			/** @i2c: I2C */
+			u32 i2c:1;
+			/** @pciess_gpma: PCIESS GPMA */
+			u32 pciess_gpma:1;
+			/** @lpioss_pma: LPIOSS PMA */
+			u32 lpioss_pma:1;
+			/** @fabss0_pma: FabSS0 PMA */
+			u32 fabss0_pma:1;
+			/** @fabss1_pma: FabSS1 PMA */
+			u32 fabss1_pma:1;
+			/** @reserved_9: Reserved */
+			u32 reserved_9:1;
+			/** @reserved_10: Reserved */
+			u32 reserved_10:1;
+			/** @reserved_11: Reserved */
+			u32 reserved_11:1;
+			/** @reserved_12: Reserved */
+			u32 reserved_12:1;
+			/** @reserved_13: Reserved */
+			u32 reserved_13:1;
+			/** @memss_ieh1: MEMSS -> IEH1 */
+			u32 memss_ieh1:1;
+			/** @memss_ieh2: MEMSS -> IEH2 */
+			u32 memss_ieh2:1;
+			/** @saf0_mhb0: SAF0 MHB0 */
+			u32 saf0_mhb0:1;
+			/** @saf0_mhb1: SAF0 MHB1 */
+			u32 saf0_mhb1:1;
+			 /** @saf0_mhb2: SAF0 MHB2 */
+			u32 saf0_mhb2:1;
+			/** @saf0_mhb3: SAF0 MHB3 */
+			u32 saf0_mhb3:1;
+			/** @saf0_mhb4: SAF0 MHB4 */
+			u32 saf0_mhb4:1;
+			/** @saf0_mhb5: SAF0 MHB5 */
+			u32 saf0_mhb5:1;
+			/** @saf0_mhb6: SAF0 MHB6 */
+			u32 saf0_mhb6:1;
+			/** @saf0_mhb7: SAF0 MHB7 */
+			u32 saf0_mhb7:1;
+			/** @saf1_mhb0: SAF1 MHB0 */
+			u32 saf1_mhb0:1;
+			/** @saf1_mhb1: SAF1 MHB1 */
+			u32 saf1_mhb1:1;
+			/** @saf1_mhb2: SAF1 MHB2 */
+			u32 saf1_mhb2:1;
+			/** @saf1_mhb3: SAF1 MHB3 */
+			u32 saf1_mhb3:1;
+			/** @saf1_mhb4: SAF1 MHB4 */
+			u32 saf1_mhb4:1;
+			/** @saf1_mhb5: SAF1 MHB5 */
+			u32 saf1_mhb5:1;
+			/** @saf1_mhb6: SAF1 MHB6 */
+			u32 saf1_mhb6:1;
+			/** @saf1_mhb7: SAF1 MHB7 */
+			u32 saf1_mhb7:1;
+		} error_sources_ieh0;
+	};
+
+	/** @lerr_status_ieh0: Local error status of IEH0 */
+	struct {
+		/** @reserved_0: Reserved for future use */
+		u32 reserved_0:1;
+		/** @psf0: PSF0 */
+		u32 psf0:1;
+		/** @psf1: PSF1 */
+		u32 psf1:1;
+		/** @reserved_26: Reserved */
+		u32 reserved_26:26;
+		/** @npk: NPK */
+		u32 npk:1;
+		/** @reserved_30: Reserved */
+		u32 reserved_30:2;
+	} lerr_status_ieh0;
+
+	/** @gerr_mask: Global error mask */
+	u32 gerr_mask;
+	/** @additional_info: Additional information */
+	u32 additional_info[10];
+} __packed;
+
 #endif
-- 
2.47.1

