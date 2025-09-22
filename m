Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B15CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 19:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE1910E50F;
	Mon, 22 Sep 2025 19:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c4OUd5IL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C2D10E50B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 19:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758571128; x=1790107128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fDVSyhPIRWo5lJVBBwGaVwmsOqYNeabFrwmU5AhqMSY=;
 b=c4OUd5ILGnMmib0Ou07bmjcV6V62A3S10CYjosAlqwc2LZ4PRZ/iQyHm
 6Db1Zre2HBWnospkXMjGoeT3s8WILa8rVsPV5ObLCiArM93rvjuEPaibm
 +ICNdQWzX+/rwZLs5tH6TuTIei8UP/QFoBiIeAm3jbLtnRJNmBxd9xvwE
 +TQV7mN3Hya2TuLE7qu/iYZbZrgMZKF4IHofbrvZq09s1o3NWqNz7PvLy
 6VWKGKJyEs92AbYtJBDt9Rz0yUT0grRfOiQSVAx9UHUVxHvBfhZj1zV9K
 aPMJwXSEcR9vmCITlTgIr7+PMy0ncBJ9q+QR0dvF4FiMyfr29ss8Oj5Ep A==;
X-CSE-ConnectionGUID: HcjtrCaTSLO1AMIGpeaYIw==
X-CSE-MsgGUID: wxwxlhqsSEOtLFCCLOdh0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72267354"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="72267354"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 12:58:47 -0700
X-CSE-ConnectionGUID: MT2eSK6EShWcSEcdgZihmg==
X-CSE-MsgGUID: VWiDfXKhRbWjGcIBiWuUVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="207306254"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 12:58:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 4/5] drm/xe/guc: Extract function to print load error
Date: Mon, 22 Sep 2025 12:58:32 -0700
Message-ID: <20250922-xe-iopoll-v4-4-06438311a63f@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250922-xe-iopoll-v4-0-06438311a63f@intel.com>
References: <20250922-xe-iopoll-v4-0-06438311a63f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

Move the error parsing and print out of guc_wait_ucode() into a helper
to clean up the wait function. Since now the `load_done != 1` condition
has a return statement, also simplify the if/else chain.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com> # v2
---
v2: Rename function to print_load_status_err() and move the other err
    message inside it now that we fail module loading if guc fails to
    load
---
 drivers/gpu/drm/xe/xe_guc.c | 104 ++++++++++++++++++++++----------------------
 1 file changed, 53 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 708e08fb0779f..5fffff5927cdf 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1047,6 +1047,55 @@ static int guc_load_done(u32 status)
 #endif
 #define GUC_LOAD_TIME_WARN_MS      200
 
+static void print_load_status_err(struct xe_gt *gt, u32 status)
+{
+	struct xe_mmio *mmio = &gt->mmio;
+
+	u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
+	u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
+
+	xe_gt_err(gt, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
+		  REG_FIELD_GET(GS_MIA_IN_RESET, status),
+		  bootrom, ukernel,
+		  REG_FIELD_GET(GS_MIA_MASK, status),
+		  REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
+
+	switch (bootrom) {
+	case XE_BOOTROM_STATUS_NO_KEY_FOUND:
+		xe_gt_err(gt, "invalid key requested, header = 0x%08X\n",
+			  xe_mmio_read32(mmio, GUC_HEADER_INFO));
+		break;
+	case XE_BOOTROM_STATUS_RSA_FAILED:
+		xe_gt_err(gt, "firmware signature verification failed\n");
+		break;
+	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
+		xe_gt_err(gt, "firmware production part check failure\n");
+		break;
+	}
+
+	switch (ukernel) {
+	case XE_GUC_LOAD_STATUS_HWCONFIG_START:
+		xe_gt_err(gt, "still extracting hwconfig table.\n");
+		break;
+	case XE_GUC_LOAD_STATUS_EXCEPTION:
+		xe_gt_err(gt, "firmware exception. EIP: %#x\n",
+			  xe_mmio_read32(mmio, SOFT_SCRATCH(13)));
+		break;
+	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
+		xe_gt_err(gt, "illegal init/ADS data\n");
+		break;
+	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
+		xe_gt_err(gt, "illegal register in save/restore workaround list\n");
+		break;
+	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
+		xe_gt_err(gt, "illegal workaround KLV data\n");
+		break;
+	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
+		xe_gt_err(gt, "illegal feature flag specified\n");
+		break;
+	}
+}
+
 static int guc_wait_ucode(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -1100,62 +1149,15 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	} while (1);
 
 	if (load_done != 1) {
-		u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
-		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
-
 		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz), done = %d\n",
 			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
 			  xe_guc_pc_get_cur_freq_fw(guc_pc), load_done);
-		xe_gt_err(gt, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
-			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
-			  bootrom, ukernel,
-			  REG_FIELD_GET(GS_MIA_MASK, status),
-			  REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
-
-		switch (bootrom) {
-		case XE_BOOTROM_STATUS_NO_KEY_FOUND:
-			xe_gt_err(gt, "invalid key requested, header = 0x%08X\n",
-				  xe_mmio_read32(mmio, GUC_HEADER_INFO));
-			break;
-
-		case XE_BOOTROM_STATUS_RSA_FAILED:
-			xe_gt_err(gt, "firmware signature verification failed\n");
-			break;
-
-		case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
-			xe_gt_err(gt, "firmware production part check failure\n");
-			break;
-		}
-
-		switch (ukernel) {
-		case XE_GUC_LOAD_STATUS_HWCONFIG_START:
-			xe_gt_err(gt, "still extracting hwconfig table.\n");
-			break;
-
-		case XE_GUC_LOAD_STATUS_EXCEPTION:
-			xe_gt_err(gt, "firmware exception. EIP: %#x\n",
-				  xe_mmio_read32(mmio, SOFT_SCRATCH(13)));
-			break;
-
-		case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
-			xe_gt_err(gt, "illegal init/ADS data\n");
-			break;
-
-		case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
-			xe_gt_err(gt, "illegal register in save/restore workaround list\n");
-			break;
-
-		case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
-			xe_gt_err(gt, "illegal workaround KLV data\n");
-			break;
-
-		case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
-			xe_gt_err(gt, "illegal feature flag specified\n");
-			break;
-		}
+		print_load_status_err(gt, status);
 
 		return -EPROTO;
-	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
+	}
+
+	if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
 		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
 			   delta_ms, status, count);
 		xe_gt_warn(gt, "excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",

-- 
2.50.1

