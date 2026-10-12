Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8E8CA9EDC
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 23:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C7210E6B1;
	Mon, 12 Oct 2026 23:29:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4E910E6CF
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 23:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791847767; x=1823383767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dXgAqOFr2+BQruuWgntDWNbuFlN3IZ+arpimRa9KsUw=;
 b=J+B2IVQMC1fsIwOxZOzbBeBF5+wOHa477o04ewUdB5ZCIz2fE8dalwC8
 ea4jp7CIP7QwHro5N/IDCKXzW2N4Ujks1fdfglucAFeRaZfz5oUCUc4Cr
 Gsii5QHzspGf8We6uyx8WSZmtbgP7pkLeAWKcbjrUKsAN0R9tBfO3iqzC
 1+jtO/P65i3E5IGckCIMm1hL1F2LWSJhlW17yLcr+ziWJwSjMfRfWt6xF
 B1aDBzgjoscpp6S6+gwlX7USfj2J294k/1wVpTRwc39HKR60FPfXCr0C0
 N6X1HpfeWfam6J9lGf+6zjyWkjIp+w6eCW8l24z9UewmucvCcSk+PyLR0 g==;
X-CSE-ConnectionGUID: SPzr8lr1RNim2drb7UIHYg==
X-CSE-MsgGUID: qawMSX5oTuu5kU2bcSVpUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="450715"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="450715"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 16:29:17 -0700
X-CSE-ConnectionGUID: zu5UFbKiS0Cm6CPi0g+HsA==
X-CSE-MsgGUID: AepGBlQTT8aSCGYUPM/PaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1337848"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 16:29:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, aravind.iddamsetty@intel.com,
 mallesh.koujalagi@intel.com, alan.previn.teres.alexis@intel.com,
 julia.filipchuk@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v7 5/7] drm/xe/uc: Report DMA failure using SIGID
Date: Mon, 12 Oct 2026 16:29:13 -0700
Message-ID: <20261012232907.83649-14-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012232907.83649-9-umesh.nerlige.ramappa@intel.com>
References: <20261012232907.83649-9-umesh.nerlige.ramappa@intel.com>
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Convert the uC DMA failure error to use the xe_log_err() helper.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6edba1401f7a..0db13cb03eac 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -18,6 +18,7 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_gt_types.h"
 #include "xe_guc.h"
+#include "xe_log.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
@@ -915,8 +916,12 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
 	int err;
 
+	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC ||
+		     uc_fw->type == XE_UC_FW_TYPE_HUC);
+
 	/* make sure the status was cleared the last time we reset the uc */
 	xe_assert(xe, !xe_uc_fw_is_loaded(uc_fw));
 
@@ -932,9 +937,11 @@ int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 	return 0;
 
 fail:
-	drm_err(&xe->drm, "Failed to load %s firmware %s (%d)\n",
-		xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
-		err);
+	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
+		xe_log_err(gt, GUC, err, "Failed to load firmware %s\n", uc_fw->path);
+	else
+		xe_log_err(gt, HUC, err, "Failed to load firmware %s\n", uc_fw->path);
+
 	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_LOAD_FAIL);
 	return err;
 }
-- 
2.55.0

