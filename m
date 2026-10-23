Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909A9606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 04:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MFg9h0KC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556F7112961;
	Fri, 23 Oct 2026 04:17:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0E410E528
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 04:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792729064; x=1824265064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HCRSo0XXUNSFgsHFF18z/Bp+bhcZEY5uvSVdDpgIRgg=;
 b=MFg9h0KCCGVGgYOawskVozU8ehza6iJywj3SRg+oAkZK6/DUyAHpbKw0
 L1f9kvI+orqKpUe6HHPMb8NN5rCL2KUSqFASKstUAx0Jx4TVOkV83WHkY
 ZAQ1rNLD1hQMovMCdjA02thdY1BGxjjKWyE+RM9IEM5/PImMgmVeAQG8g
 0EWjWp0pL4N0HGF8Bsg9t8qyf2uJu9y99GlFoeFYMd5DeOwp4X7pCn399
 JDFW7wlD/RGjfmQIImyy7qTkkTJOEpDJHWqbSDpo6PMRzAGjHaxqMqCdO
 ThIAtU8Bvg+tJ9g+G9uDz0bPCCNunEaIiaMC3bSFoGVwAPy04j3MjAOOA Q==;
X-CSE-ConnectionGUID: ZiuxOmXXR2KyxyWmYrafeA==
X-CSE-MsgGUID: fiaHZzt2SImJ1+a7tcrGvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1383497"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1383497"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:44 -0700
X-CSE-ConnectionGUID: pF0O5uiSS4G1cKQYnALH+Q==
X-CSE-MsgGUID: HR3A19YfR/eYFT6rTREvgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3658283"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:41 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v5 07/13] drm/xe/xe_ras: Report device memory errors using
 SIGID
Date: Fri, 23 Oct 2026 10:04:29 +0530
Message-ID: <20261023043422.681260-22-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023043422.681260-15-badal.nilawar@intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use xe_log_comp_info helper to report device memory errors using the
corresponding SIGID.

Example:
	xe 0000:03:00.0: [drm] SIGID=202 (020100020008002000300000)
DEVICE_MEMORY: Double-bit ECC error detected at sw address 0x63000

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
v5:
  - Log unknown memory errors
  - Add example log in commit message (Raag)
---
 drivers/gpu/drm/xe/xe_ras.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 95e87c635b04..5ebfc6e8dfc7 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -643,6 +643,7 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
 {
 	struct xe_ras_memory_error *info = (void *)arr->details;
+	u8 cper_sev = ras_sev_to_cper_sev(arr->counter.common.severity);
 	int ret;
 
 	/*
@@ -654,17 +655,30 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 	 */
 	switch (info->category) {
 	case XE_RAS_MEMORY_POISON:
-		xe_info(xe, "[RAS]: Poison error detected\n");
+		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+				 "Poison error detected\n");
 		break;
 	case XE_RAS_MEMORY_DATA_PARITY:
-		xe_info(xe, "[RAS]: Data parity error detected\n");
+		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+				 "Data parity error detected\n");
 		break;
 	case XE_RAS_MEMORY_DB_ECC:
 		ret = handle_page_offline(xe, info->sw_address, true);
-		if (ret)
+		if (ret) {
+			xe_log_comp(xe, cper_sev, DEVICE_MEMORY,
+				    &arr->counter, sizeof(arr->counter),
+				    "Failed to recover double-bit ECC error at sw address 0x%llx\n",
+				    info->sw_address);
 			return XE_RAS_RECOVERY_ACTION_RESET;
+		}
+
+		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+				 "Double-bit ECC error at sw address 0x%llx\n",
+				 info->sw_address);
 		break;
 	default:
+		xe_log_comp(xe, cper_sev, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+			    "Unknown error detected\n");
 		return XE_RAS_RECOVERY_ACTION_RESET;
 	}
 
-- 
2.54.0

