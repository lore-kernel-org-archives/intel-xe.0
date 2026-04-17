Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4847F8DFCE
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 08:26:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBF310E99D;
	Fri, 17 Apr 2026 08:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPyKwDGc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD8210E99C
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 08:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776414385; x=1807950385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WZDgwX596aSBz0JZB6ydV0pYZBjngh2t26ZGFCxMYbg=;
 b=TPyKwDGco/8zSfR8iMNYmgc8SMxaQ7uONsNp0Dn6gfIgtYFsCZMbAIdb
 kk6H6Hii+fde4etjnERwZzvuy5bvfxCgt7BabZ/+UALak5FqiTVv9bfaA
 bsq1EZkdrwPCoMjhUNWJpi0cO4qrKfwDfp+tqVEk478hZucAnvRwg/OLJ
 pduXK5mFYtby7GDVCkAJWeCC+as+s6/wExUu/TSTn2bycvYEpRWVmAAnI
 wVCLVyGKPw/+BjUNVl2fKRF9QmT2LeqtQOV80f8Ar3SGWRXMrINm7fWcL
 g1EeCg+Jn5jq1RjsEylTY7gs6DqKVcutkdRABadqmwPPRrIiqV30NiMNk w==;
X-CSE-ConnectionGUID: wDoIQs29RsWUV90hZWNRHA==
X-CSE-MsgGUID: aQ9wXUqgQ/emR48X+YCrVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88045926"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="88045926"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:26:25 -0700
X-CSE-ConnectionGUID: 7o1OA2NkSaCWl09+GDoIww==
X-CSE-MsgGUID: NaGqo2MzQ4y8v+llLTnAvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235962333"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:26:22 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v4 13/13] drm/xe/xe_pci_error: Process errors in mmio_enabled
Date: Fri, 17 Apr 2026 14:28:25 +0530
Message-ID: <20260417085812.4013309-28-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260417085812.4013309-15-riana.tauro@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
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
index 7d80bc2a6954..b7acf6778603 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -9,6 +9,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_pci.h"
+#include "xe_ras.h"
 #include "xe_survivability_mode.h"
 #include "xe_uc.h"
 
@@ -34,6 +35,13 @@ static void xe_pci_error_handling(struct pci_dev *pdev)
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
@@ -59,9 +67,13 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 
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

