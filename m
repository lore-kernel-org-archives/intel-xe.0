Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B58CAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 17:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87B410E3CD;
	Thu, 11 Sep 2025 17:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R7hMjqR7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D5E10E282
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 17:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757611539; x=1789147539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MejGKdAGRV2lUi90BI0rJ8dxDfm6rEXt3bBmltoiSDc=;
 b=R7hMjqR74Rz5xN09IpZ2hl3zxNaJWbCQCC2nFMz5MuTgw3iRDYGHaLLh
 KoJNoHGgm0CrOk5CLEW5+DqUpoQT8Ab9l4D+aWYH5QE9UOQibCsqM9EHC
 2r8pgFO2XQh60P1kw8BK2g0cN/Xc19MJ0PGff73TWTMMCLpsVS3WKOynM
 L5YInt4IiYnUk1kCCF0/35EwRxAWnQNcXQObfwj40SfMRUq4y46SBPdgE
 yeocDcXcWRWIKyyw9rMR3KwdS5Ypzld8bqhkbjVPDxKAKtA7PA4VL3qwA
 uv3QtXb3PmhP8UX5wTCdrsSYIW8SUfAwP4aMXrd7u8SQvkVMIEhQazvbO w==;
X-CSE-ConnectionGUID: WIxc3CmoTlOokhT7M1WFgw==
X-CSE-MsgGUID: /xW65MgqQ+yAAVFHGdvKCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59810773"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="59810773"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 10:25:39 -0700
X-CSE-ConnectionGUID: 3ujlOqrzT5iZWlQgWgsxuQ==
X-CSE-MsgGUID: UToEgmPVSB25O1gmWzopQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="178956847"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 10:25:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v3 4/5] drm/xe/guc: Extract function to print load error
Date: Thu, 11 Sep 2025 10:25:22 -0700
Message-ID: <20250911-xe-iopoll-v3-4-6a95f1cc3b0b@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com>
References: <20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com>
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
to clean up the wait function.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 81 ++++++++++++++++++++++-----------------------
 1 file changed, 39 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d8fc060c9682e..da1bb4939c6b8 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1049,6 +1049,44 @@ static int guc_load_done(u32 status)
 #endif
 #define GUC_LOAD_TIME_WARN_MS      200
 
+static void print_bootrom_ukernel_err(struct xe_gt *gt, u32 bootrom, u32 ukernel)
+{
+	switch (bootrom) {
+	case XE_BOOTROM_STATUS_NO_KEY_FOUND:
+		xe_gt_err(gt, "invalid key requested, header = 0x%08X\n",
+			  xe_mmio_read32(&gt->mmio, GUC_HEADER_INFO));
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
+			  xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(13)));
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
 static void guc_wait_ucode(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -1114,48 +1152,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
 			  REG_FIELD_GET(GS_MIA_MASK, status),
 			  REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
 
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
-
+		print_bootrom_ukernel_err(gt, bootrom, ukernel);
 		xe_device_declare_wedged(gt_to_xe(gt));
 	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
 		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",

-- 
2.50.1

