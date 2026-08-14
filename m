Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F583C5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309C810F6CE;
	Fri, 14 Aug 2026 17:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJIMqFub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6661710F6CE
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727959; x=1818263959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EnrZec7S62n+ITxAlVaTfbDzvC8KSgQfVXblHRvt0pI=;
 b=EJIMqFubXULoBWo8u5C1TASKSi4DoGVDuTBc3gb5Ui5xhaOLd62FREcp
 aQ4iJ+vCvo+i0le7DaErmkfHcwwSl5WUZ0nLbJ0E0CgF3pHMMYLAGAKpT
 xMoj/wRr5WYwB7PpGeFW3M/z6wCYQ4n8QP/ALHQOnp0in+3NcWaDz5jUD
 /U/tOzRKWD9QdcEk5dor6Sp6Ruq7F2VQkMIqO93DI5RbD4N+sVx70S+dX
 VdkDNZNquLJvXtuoxt1S9fzsn6QLGJ3/gZwwOZIgLl5wk2JtWKjV6MA7A
 ZlEK1mna6VqNP6iMm3o61Omcv9jd+XlMGPmJej3mRtJ9tklGyMQejhemr A==;
X-CSE-ConnectionGUID: vPgjvxhqQe6ulI0r12sk3g==
X-CSE-MsgGUID: Lu87zcWFSISFDKsCE3Ub9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464126"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464126"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:19:19 -0700
X-CSE-ConnectionGUID: XhMBpX6LQ8+kePlUgpb3wA==
X-CSE-MsgGUID: QpkDEhHwRhWZINHOvUO40g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946397"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:19:18 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 33/33] drm/xe/pci: Report 'cannot re-enable' error using
 SIGID
Date: Fri, 14 Aug 2026 19:17:59 +0200
Message-ID: <20260814171801.13347-34-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

Report 'cannot re-enable PCI device' error using xe_log() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_error.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index e41af2ac7f23..fb965f52be5e 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -7,6 +7,7 @@
 
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_log.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
@@ -90,13 +91,15 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 {
 	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int err;
 
 	xe_info(xe, "PCI error: slot reset\n");
 
 	pci_restore_state(pdev);
 
-	if (pci_enable_device(pdev)) {
-		xe_err(xe, "Cannot re-enable PCI device after reset\n");
+	err = pci_enable_device(pdev);
+	if (err) {
+		xe_log_err_fatal(xe, PCI, err, "Cannot re-enable PCI device after reset\n");
 		return PCI_ERS_RESULT_DISCONNECT;
 	}
 
-- 
2.47.1

