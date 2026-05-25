Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E658ECD5BC8
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 09:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9E310E111;
	Mon, 25 May 2026 09:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V7/sgJOY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCA910E111
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779701631; x=1811237631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Cg8ygtVP2Qo8UgBOYD1kBdGB3CfeNQyNQkSvJqE3Mk=;
 b=V7/sgJOYH2VdUYkgE0EW2oAaBKQIT3x3Ha0ugUL1LS7JFWTkhcfGGL3Q
 MO+1MXziT7xx0D3VcMSJot4aDa50qfOP0tSQfGKllkHTXbabTgbMJGZgY
 n8o5P6K65JqIrKYcYukLqjL+jb7m3fbbVmRnxuar4vvlSXHCM60MgbTlM
 bEWopogVmEHUPfqJniT5VdI6bdvL7s/4FQeO1wiAtOf1NBoY7rWr5HG3y
 E44lEr8UjoZvmuYsYz83hkgVC6bNu7PbAqe9x99UZkJIgtEuFfbhw8fRr
 EfVkXxh+enlwy6CD7eZQFJrHrZz7syyZgy8rMKSt9xSxewcvdM+QNKgTx Q==;
X-CSE-ConnectionGUID: j8wPVyewRg2a+3k83iuVqA==
X-CSE-MsgGUID: eQ/pmgD2TW27Zw5ktN3apg==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="68046862"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="68046862"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:33:51 -0700
X-CSE-ConnectionGUID: yEh1zfhRRzCxqvNV88UYEA==
X-CSE-MsgGUID: mhtimwbjT8eMQy8tqwwotA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="279669728"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:33:48 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v6 13/15] drm/xe/xe_pci_error: Process errors in mmio_enabled
Date: Mon, 25 May 2026 15:36:32 +0530
Message-ID: <20260525100619.3155663-30-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260525100619.3155663-17-riana.tauro@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
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

v5: call pci_prepare_reset() before requesting SBR
---
 drivers/gpu/drm/xe/xe_pci_error.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 8792ccfbddf2..5d2a2cc6c36f 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -11,6 +11,7 @@
 #include "xe_gt.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
+#include "xe_ras.h"
 #include "xe_survivability_mode.h"
 #include "xe_uc.h"
 
@@ -36,6 +37,21 @@ static void pci_prepare_reset(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
+static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u32 action)
+{
+	switch (action) {
+	case XE_RAS_RECOVERY_ACTION_RECOVERED:
+		return PCI_ERS_RESULT_RECOVERED;
+	case XE_RAS_RECOVERY_ACTION_RESET:
+		pci_prepare_reset(pdev);
+		return PCI_ERS_RESULT_NEED_RESET;
+	case XE_RAS_RECOVERY_ACTION_DISCONNECT:
+		return PCI_ERS_RESULT_DISCONNECT;
+	default:
+		return PCI_ERS_RESULT_DISCONNECT;
+	}
+}
+
 static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
@@ -63,10 +79,14 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 
 static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 {
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	enum xe_ras_recovery_action action;
+
 	dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
 
-	pci_prepare_reset(pdev);
-	return PCI_ERS_RESULT_NEED_RESET;
+	action = xe_ras_process_errors(xe);
+
+	return ras_action_to_pci_result(pdev, action);
 }
 
 static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
-- 
2.47.1

