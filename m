Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEFBC43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 07:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A597910E593;
	Mon, 13 Jul 2026 07:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFE6ID51";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A8310E80E
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 07:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783928913; x=1815464913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IFLJJ9g0RzTCRWuuS/xJmp73Td99vJqSqIsoMzqIppk=;
 b=UFE6ID511G1on0z90iq6ooAWd5/LrncUOxS0zFqIzKcxNRV59gOjgzwR
 35VrRmICJoPLEINZNRKklQugz6XmZvSsd1r4/XfRxEUrXZUq1x11kC7wM
 xVZ+xnaf5QFDl+2QDMo/KNzFo7pCHe1RRayp3NMJinnCuPh9uXPfdOpbW
 LRURb+VIsxr0KaObuB7LO4yt+YKhWU3+5nVKOBdILACDXxEFhQdqaB+nv
 DRo2R+12N8f4D8R7yc4ic3UwsGE/6aFY4/JVVjRnuk0ib3JCgBFbqt/vZ
 9qjB1+o/8XPzPYafGngrTsBYu/ni/IkvFjx8J98Q/AyH67311oryXVaDc Q==;
X-CSE-ConnectionGUID: 3CpLAnvwQviSfgLKOra2Jw==
X-CSE-MsgGUID: MovpqWEcS/OLNeXFscizLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84548863"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84548863"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 00:48:33 -0700
X-CSE-ConnectionGUID: lsTcCAHMS72sTAj0DYpcyw==
X-CSE-MsgGUID: eesb+6VQQVuMikdTNSUc0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="278737310"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 00:48:29 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v9 4/4] drm/xe/xe_pci_error: Process errors in mmio_enabled
Date: Mon, 13 Jul 2026 13:18:00 +0530
Message-ID: <20260713074755.1278607-10-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260713074755.1278607-6-riana.tauro@intel.com>
References: <20260713074755.1278607-6-riana.tauro@intel.com>
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
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: use ras recovery enum (Raag)

v3: add comment for mapping
    use const (Mallesh)

v4: use switch (Raag, Anshuman)

v5: call pci_prepare_reset() before requesting SBR

v6: rebase
---
 drivers/gpu/drm/xe/xe_pci_error.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 9b78cc0d3293..e41af2ac7f23 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -10,6 +10,7 @@
 #include "xe_pci.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
+#include "xe_ras.h"
 #include "xe_survivability_mode.h"
 
 static void prepare_device_for_reset(struct pci_dev *pdev)
@@ -34,6 +35,21 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
+static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u8 action)
+{
+	switch (action) {
+	case XE_RAS_RECOVERY_ACTION_RECOVERED:
+		return PCI_ERS_RESULT_RECOVERED;
+	case XE_RAS_RECOVERY_ACTION_RESET:
+		prepare_device_for_reset(pdev);
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
@@ -62,11 +78,12 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	enum xe_ras_recovery_action action;
 
 	xe_info(xe, "PCI error: MMIO enabled\n");
+	action = xe_ras_process_errors(xe);
 
-	/* TODO: Query system controller for the type of error and take appropriate action */
-	return PCI_ERS_RESULT_RECOVERED;
+	return ras_action_to_pci_result(pdev, action);
 }
 
 static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
-- 
2.47.1

