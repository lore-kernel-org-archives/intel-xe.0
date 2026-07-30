Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F15AC55164
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 15:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4AA10EFC6;
	Thu, 30 Jul 2026 15:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="beoKCz6d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8E210EFBC
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 15:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785425622; x=1816961622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uyyiJOMxikUXEDJXZKHj4gfg/blNd8zpm9VVDqx3L6g=;
 b=beoKCz6dwmhL7w8dzE8w7bzK1/aZz8dL1UPqfx4HN6I6ytkvriicIV8r
 oMjjtZ0ALmrbX+qt5pcQshwyUrhHlcDbREk/2RHoejTBwavpV+amno+SF
 LBKByVWIwgfgCyrqInptK9A3/8ZBbkUITAGdiMajXL/HUXyA5CGGG/4Hb
 qYxXaL11owLVpReN4WX5FQzQpWSbTjB8wwab78k0AvfTNMTXi3I7QBk2o
 g5pyqY+nATgQRA5dz7h1eN6L+5YaOrGDncFp4VFCZ2YS4+7lcXYqvgreY
 mEIBrensD5Mto0/LCnWQ8t3GKWhaPUzkAbJI2ffpraapjD/Xqp0TSzS+x Q==;
X-CSE-ConnectionGUID: uQvS3hIoRNWvD+KJDr7Lqg==
X-CSE-MsgGUID: wYXl6JBNQU262ieybtsU0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="73583153"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="73583153"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:41 -0700
X-CSE-ConnectionGUID: WEt1Uz6+QhuSK4YGXjdZVQ==
X-CSE-MsgGUID: tavorqkITl6vQaCjOljAMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="260387681"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v3 23/23] drm/xe/pci: Report 'cannot re-enable' error using
 SIGID
Date: Thu, 30 Jul 2026 17:21:19 +0200
Message-ID: <20260730152121.576-24-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730152121.576-1-michal.wajdeczko@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
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

