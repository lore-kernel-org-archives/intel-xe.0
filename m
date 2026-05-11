Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D65CCD4840
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 16:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E598F10E1D7;
	Mon, 11 May 2026 16:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kaOtd6la";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2FF10E1D7
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 16:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778518602; x=1810054602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IO49ShdbKaQPpthaoeLs6l18yoR7GDFWE8YHTas2nAM=;
 b=kaOtd6la0cGcvCsbXYAqxz1m1ZOzj1rxVrREdCDYXN3Ieh2EkCrbdupf
 YPV59q7mYF9WLl4YK7TVtv2t31oi5F8/VirzpjvHjON10iywzkmSiPxOO
 KjCdQ+Y+XMBgUIuwGgOfO6gGaMi4DJlxW9F9JiBXx3MHrdd4l8I5CQ//L
 Z1JmU2O0rMhWyhFY+ERmCbhtcgpLkW+NyzhMJo7h1HXJNJO7jIkeVolAU
 +y5hHx+elDFdXliu5rU4LmuIle/HdsPm/YVJQ9fmQsyep7zKCYCn3Mka8
 3t55clGho9yEzSPG5cmTYk06yXll0hTHLcZgRPNnVEmggRtXi6U68X9h2 A==;
X-CSE-ConnectionGUID: R8o8aYq9R6+Vgs2AEA79nA==
X-CSE-MsgGUID: DxckXmOnTj6XQPhsD1dAqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90513578"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90513578"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:42 -0700
X-CSE-ConnectionGUID: GoEPGXg9QOKYZvj7sON0bQ==
X-CSE-MsgGUID: Qdyfp8IjQ2qMCCIcwnkPqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="260988805"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:38 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v5 12/14] drm/xe/xe_pci_error: Process errors in mmio_enabled
Date: Mon, 11 May 2026 22:59:19 +0530
Message-ID: <20260511172908.1122252-28-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260511172908.1122252-16-riana.tauro@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
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
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
v2: use ras recovery enum (Raag)

v3: add comment for mapping
    use const (Mallesh)

v4: use switch (Raag, Anshuman)
---
 drivers/gpu/drm/xe/xe_pci_error.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 7d8c36bec7ae..8d62bcbcbbb6 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -9,9 +9,24 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_pci.h"
+#include "xe_ras.h"
 #include "xe_survivability_mode.h"
 #include "xe_uc.h"
 
+static pci_ers_result_t ras_action_to_pci_result(enum xe_ras_recovery_action action)
+{
+	switch (action) {
+	case XE_RAS_RECOVERY_ACTION_RECOVERED:
+		return PCI_ERS_RESULT_RECOVERED;
+	case XE_RAS_RECOVERY_ACTION_RESET:
+		return PCI_ERS_RESULT_NEED_RESET;
+	case XE_RAS_RECOVERY_ACTION_DISCONNECT:
+		return PCI_ERS_RESULT_DISCONNECT;
+	default:
+		return PCI_ERS_RESULT_DISCONNECT;
+	}
+}
+
 static void xe_pci_error_handling(struct pci_dev *pdev)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
@@ -58,9 +73,14 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 
 static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 {
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	enum xe_ras_recovery_action action;
+
 	dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
 
-	return PCI_ERS_RESULT_NEED_RESET;
+	action = xe_ras_process_errors(xe);
+
+	return ras_action_to_pci_result(action);
 }
 
 static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
-- 
2.47.1

