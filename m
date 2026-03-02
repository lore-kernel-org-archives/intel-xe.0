Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B3AE9B344
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 09:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B589D10E472;
	Mon,  2 Mar 2026 09:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2v3MfNF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD4410E472
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 09:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772445053; x=1803981053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=47+TnE7mnTN/5x1tAGEBpleWSiaKaeIYk+ZAQfUNY84=;
 b=A2v3MfNFgJb4zfxt2riWlG2kg5h12Y4bYNzetTYkQh7ZY9pyawHZbBjq
 VpTCeZuLGC22ogPFaYY2zmSV3XuvnH1SxvLQyh7BqagxBEzwYU3d3otkm
 4XyN2Ae3WBAORZ/Rk811MygAaFeGmnLh6IB50gozUDeGgVXLgFi6C4HbN
 kjaW4ALltnCH+qfY6cYGW+k0KCUTERpAx9CCDTJzoh+0OrPqN79n1fx8z
 RMQNsymOpo50P5hedphTqfNa1CXxR3VH/AkRUaAyiDPj4GG6q1BrX3NTD
 QWnCRsX4VT8QGD0bGbGLsgSLI6SaZQQwTIyT2BTJV5c+gH2q/KmQBQHbf g==;
X-CSE-ConnectionGUID: HCK6Oy19SYybGWVksAebFg==
X-CSE-MsgGUID: wgl0jy7+RaeZ1prWzlLOow==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="83783069"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="83783069"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:50:53 -0800
X-CSE-ConnectionGUID: SGxD2XPkTlelxAlaq1/4jQ==
X-CSE-MsgGUID: /IyJTKX6SYKZCofvvefj+w==
X-ExtLoop1: 1
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:50:50 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: [PATCH v2 11/11] drm/xe/xe_pci_error: Process errors in mmio_enabled
Date: Mon,  2 Mar 2026 15:52:06 +0530
Message-ID: <20260302102155.4074630-24-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260302102155.4074630-13-riana.tauro@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
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
---
 drivers/gpu/drm/xe/xe_pci_error.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index ba62868f00d4..35bc5b8cee99 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -9,6 +9,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_pci.h"
+#include "xe_ras.h"
 #include "xe_uc.h"
 
 static void xe_pci_error_handling(struct pci_dev *pdev)
@@ -26,6 +27,12 @@ static void xe_pci_error_handling(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
+static pci_ers_result_t ras_recovery_action_to_pci_result[] = {
+	[XE_RAS_RECOVERY_ACTION_RECOVERED] = PCI_ERS_RESULT_RECOVERED,
+	[XE_RAS_RECOVERY_ACTION_RESET] = PCI_ERS_RESULT_NEED_RESET,
+	[XE_RAS_RECOVERY_ACTION_DISCONNECT] = PCI_ERS_RESULT_DISCONNECT,
+};
+
 static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
@@ -50,9 +57,13 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 
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

