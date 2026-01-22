Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3253C44500
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 09:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9537710E96B;
	Thu, 22 Jan 2026 09:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GXRsK3/K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F57F10E96B
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769074575; x=1800610575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bcuqEp39hN8bIurJgRlM8YvfQR6HjPOT9UUtE4cxYf8=;
 b=GXRsK3/K6sPd3SQaJ0H5xrwKr/nquaK/YGBaTlPmHWr54REb5XZpjDtO
 o/hSs0EMGn9/Q0yHKMTrM+9i/OHWIXHlaqlobqVB4VxTEfcV5qjzB1tVN
 oy/zXDgx8M7eNars4bMkiybyLHsAzymdvQni4IB7p0dVgHUWKDh5cHZcG
 d9GKiit1OTSA+ZWSnArGbDoECRy31tBo2EM5Q2vWoPsMsWLSFcXRdb7da
 m3M2tJlearfhItzr/+t35MjSEIWCeqTn8oHz/8d2sm9nUOgdPN3rPkvtH
 PLyeEykIClHa1yWCeiLpxnLuksMsnGKItgxZ95bKWlRz1CqI8ew074ydW Q==;
X-CSE-ConnectionGUID: ZezxMK3jRuCoZagMwP371A==
X-CSE-MsgGUID: FWn20G/vRy+aWDJlLt266A==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80937771"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="80937771"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 01:36:15 -0800
X-CSE-ConnectionGUID: YFRN7M4JTF6YpmSJ4UIlng==
X-CSE-MsgGUID: NvtYQMofS52YVeIS/yxK9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="207122824"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 01:36:12 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH 8/8] drm/xe/xe_pci_error: Process errors in mmio_enabled
Date: Thu, 22 Jan 2026 15:36:20 +0530
Message-ID: <20260122100613.3631582-18-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260122100613.3631582-10-riana.tauro@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
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

Query system controller when any non fatal error occurs to check
the type of the error, contain and recover.

The system controller is queried in the mmio_enabled callback.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_error.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 0960aa5861bc..2af6c1f45c44 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -8,6 +8,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_pci.h"
+#include "xe_ras.h"
 #include "xe_uc.h"
 
 static void xe_pci_error_handling(struct pci_dev *pdev)
@@ -39,9 +40,15 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 
 static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 {
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int ret;
+
 	dev_err(&pdev->dev, "PCI mmio enabled\n");
+	ret = xe_ras_process_errors(xe);
+	if (ret == PCI_ERS_RESULT_NEED_RESET)
+		xe_pci_error_handling(pdev);
 
-	return PCI_ERS_RESULT_NEED_RESET;
+	return ret;
 }
 
 static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
-- 
2.47.1

