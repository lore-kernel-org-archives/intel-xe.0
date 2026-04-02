Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC6ECC6B00
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 06:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F88D10F0F5;
	Thu,  2 Apr 2026 06:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VV8vIn7z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BDF10F0F5
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 06:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775111412; x=1806647412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m91W58w1YnG4GykOWHAmOwEgdEu8S4kJvtE7ZCRPFHM=;
 b=VV8vIn7z45Zvg53aIixeBvv3EQCehemjwjRVKz+TiovmOzRsNNtu6vq+
 0gsURNC/2W2CKjuJS8jqZUFAUu3XWXgEzJ0wqK75852HmvZuQg4cYDLyb
 LNmMZu4pPtHqlNcGSwq6Vexa4Flg/WeEQbPrPYa8lAMnMun9U8k0weBo/
 ZM8IpD74nlSdKECKGbnRMauKddEE/mjhNFYK/oI1OzJM3naDQOI1ERZJq
 LkEvT3iEkI0nkY1/tHElxiZ2Z+JrUPRCKNNWrMWJnu6A6gzlkUSyFU5Ox
 jv3WtNbvmlYbg3fIrZwLmDpciGrOJA6W6P8Xo+VN/XotsboABED5K8U7D g==;
X-CSE-ConnectionGUID: G8EuNjt8Q4mM9kmWaUYsXA==
X-CSE-MsgGUID: PaJbKrMZQKaMkRjg+B0QfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76051517"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76051517"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:30:12 -0700
X-CSE-ConnectionGUID: iImCGwfqTiW+FrxzugY6pg==
X-CSE-MsgGUID: QvT09yPQRjuuNisztoKNAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="222532367"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:30:09 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 10/10] drm/xe/xe_pci_error: Process errors in mmio_enabled
Date: Thu,  2 Apr 2026 12:31:41 +0530
Message-ID: <20260402070131.1603828-22-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260402070131.1603828-12-riana.tauro@intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
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
v2: use ras recovery enum (Raag)

v3: add comment for mapping
    use const (Mallesh)
---
 drivers/gpu/drm/xe/xe_pci_error.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 28b2f4f7c24b..71b6152c1593 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -9,6 +9,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_pci.h"
+#include "xe_ras.h"
 #include "xe_survivability_mode.h"
 #include "xe_uc.h"
 
@@ -31,6 +32,13 @@ static void xe_pci_error_handling(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
+/* Mapping of RAS recovery action to PCI error result */
+static const pci_ers_result_t ras_recovery_action_to_pci_result[] = {
+	[XE_RAS_RECOVERY_ACTION_RECOVERED] = PCI_ERS_RESULT_RECOVERED,
+	[XE_RAS_RECOVERY_ACTION_RESET] = PCI_ERS_RESULT_NEED_RESET,
+	[XE_RAS_RECOVERY_ACTION_DISCONNECT] = PCI_ERS_RESULT_DISCONNECT,
+};
+
 static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
@@ -56,9 +64,13 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 
 static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 {
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	enum xe_ras_recovery_action action;
+
 	dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
+	action = xe_ras_process_errors(xe);
 
-	return PCI_ERS_RESULT_NEED_RESET;
+	return ras_recovery_action_to_pci_result[action];
 }
 
 static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
-- 
2.47.1

