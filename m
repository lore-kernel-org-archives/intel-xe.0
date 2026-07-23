Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD4DC531CC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 20:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1093010F206;
	Thu, 23 Jul 2026 20:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvNejWID";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B275410F1FC
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 20:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784839121; x=1816375121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uyyiJOMxikUXEDJXZKHj4gfg/blNd8zpm9VVDqx3L6g=;
 b=fvNejWIDryPtnDLKCnI9UvTBUF6dd0WTrNqLPoJ1JkQRmaSjV7oULvGr
 /tn0qRHgyPIxa89dRjqRdm0bD9VyJBapImTLb3e0W395l53dxMQqMT3lR
 wOs8stPlLOGIDUTS6Q+6hgIoXmRPs3/1Wi5OIPRmwTIdiVtOrCXE2OMOl
 D0+y8Miz0UoR7M9ugrYTHeGU9ZCwNCdTHWYtk3RarPWDwmm40S/dmDRmX
 OV0e0JrTZgcjq91uGaCWTB5EvgGfnQv9uXCD28d1hcIYvR4R42or3rZHf
 qR1u6h9qET5NrU5uWehavSykXpjoVrZtbuHF7+WuN7VR7MtliH1HqaNcC Q==;
X-CSE-ConnectionGUID: hmflNnYFRiOAwfv1ubfdfg==
X-CSE-MsgGUID: NiMUmzZrQdS+vG/ziugtDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84484326"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="84484326"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:41 -0700
X-CSE-ConnectionGUID: t+aBVCs0Q0GzXJyLD79Fgw==
X-CSE-MsgGUID: +fTxiUNhTQqnaXS8ie8bag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="254578641"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 19/19] drm/xe/pci: Report 'cannot re-enable' error using SIGID
Date: Thu, 23 Jul 2026 22:37:52 +0200
Message-ID: <20260723203754.3782-20-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723203754.3782-1-michal.wajdeczko@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
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

