Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317C2606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R4xKKjLG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C21112157;
	Thu, 26 Nov 2026 08:35:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A251112158
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 08:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795682145; x=1827218145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G/rBKCHGNt96U6qREaDcMt72zxRLg0PG6jbeb1f7fHA=;
 b=R4xKKjLGliMCTJeGUo4LpIYKhZSXbJKdFff08TdFMxP+m7YrAWultH+a
 01WS0iOIgZGV8HxqcDZ1XxL6NsputaWXqWD7j9mIoiWiI/HHiCe2QzXyx
 S4Dx00436YzBSaSlTV7BVxKNxY4ez2Y7r8/+nsYwr1NGPofbwMM5ILDp+
 Denue88S0bhd0Wxl5HZN0mIBo5lj9mFkfobl+vJd0WdGhCEvENBESaidZ
 CbRTSuXZAIldIwaqTvJc67jrKiuaVcJez0qY7mqYWY18ER8wZRxDHQLEs
 a6W30eyOoFEvgrkdMW26K2sLq5p6GBK3ywc3V4rWavcx9nZCJvdicaPua A==;
X-CSE-ConnectionGUID: gGNOF7T6S9+bOnxVxnssuQ==
X-CSE-MsgGUID: K+u0zWlaRHe+ofG9MwlY6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4581218"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4581218"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:35:38 -0800
X-CSE-ConnectionGUID: PYR/F4i6QNKDyWFtzYzpjQ==
X-CSE-MsgGUID: CyEglUH7RWy+IkILFi9bIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12147434"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 00:35:35 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v4 1/3] drm/xe/ras: Wedge the device on page offline failure
 in all callers
Date: Thu, 26 Nov 2026 14:05:18 +0530
Message-ID: <20261126083516.1932195-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261126083516.1932195-5-riana.tauro@intel.com>
References: <20261126083516.1932195-5-riana.tauro@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

handle_page_offline() can fail with -EIO, when the faulty address belongs
to a critical BO or the stolen area, or with -ENOMEM, when no BO can be
allocated to soft-offline the page.

Move the wedge into handle_page_offline() so every caller gets the same
recovery: declare the device wedged with DRM_WEDGE_RECOVERY_BUS_RESET
for critical bos and memory unavailability.

Fixes: b6bd6c613fd5 ("drm/xe: Add support for wa_14028434957")
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 9b04be3405ca..c30cea4901cb 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -347,7 +347,7 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
 		break;
 	case -EIO:
 		xe_err(xe, "[RAS]: Page address 0x%llx belongs to critical BO\n", page_address);
-		return ret;
+		break;
 	case -EEXIST:
 		xe_dbg(xe, "[RAS]: Repeated error on already soft-offlined page address 0x%llx\n",
 		       page_address);
@@ -355,15 +355,24 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
 			action = XE_RAS_PAGE_ACTION_REMOVE;
 		else
 			action = XE_RAS_PAGE_ACTION_OFFLINE;
-		break;
+		goto notify;
 	case -ENOMEM:
+		break;
 	default:
 		xe_err(xe, "[RAS]: Failed to offline page address 0x%llx: %d\n", page_address, ret);
-		/* Only allocation failure is propagated, other errors are not actionable */
-		return ret == -ENOMEM ? ret : 0;
+		return 0;
 	}
 
- notify:
+	/*
+	 * Wedge the device with a bus reset for critical BO's and memory unavailability.
+	 * TODO: Trigger SBR using pci_reset_bus
+	 */
+	if (ret) {
+		xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
+		return ret;
+	}
+
+notify:
 	if (notify_fw) {
 		ret = send_page_offline_cmd(xe, page_address, action);
 		if (ret)
@@ -673,14 +682,8 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 			    DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
 			    "Double-bit ECC error detected at sw address 0x%llx\n",
 			    info->sw_address);
-		/*
-		 * Wedge the device with a bus reset for errors that require SBR to recover.
-		 * TODO: Trigger SBR using pci_reset_bus
-		 */
-		if (ret) {
-			xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
+		if (ret)
 			return XE_RAS_RECOVERY_ACTION_RESET;
-		}
 		break;
 	default:
 		xe_log_comp(xe, cper_sev, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
-- 
2.47.1

