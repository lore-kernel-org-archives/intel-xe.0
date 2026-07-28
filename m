Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87AFC54F54
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8578B10E987;
	Tue, 28 Jul 2026 16:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DbNrYESj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210AE10E986
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255107; x=1816791107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uyyiJOMxikUXEDJXZKHj4gfg/blNd8zpm9VVDqx3L6g=;
 b=DbNrYESjlcsFUqWtKth4z95IoBj7B8mrIlYIG4BSz3jjD9Hy92Ci6BZw
 uAqWA3eAkBygprjgMif/vF3VIuiVVanhYlcKQ9aLHoUHFR4Pc5DRrG4i4
 QPczSx1q+7tsaqL4LKB+CBMzHiWU2QKCtMWlCsfEVGittRmwSbgge+biB
 Ft/fBjqkRLV0gvE6QLfzQ8dkVqvdZvOFRZ8eaTxYGHWQjr3tRAxPIV3wf
 2HpXn9aOCAYs8bXCO0oM216gRDmCwqb6cZ5k7iXsWhm3gajgHeKqgNJRd
 LL9OjCZxpsmxWpiGTqLRgSH6R417v/IaTtm2rxF7KZC0SPr1pFe8BtWov A==;
X-CSE-ConnectionGUID: lq1e7OijTNWb0F/KLelMBQ==
X-CSE-MsgGUID: gxJBzDXbRuK5fXE3krD+BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103386324"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103386324"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:47 -0700
X-CSE-ConnectionGUID: xahhiWPzTPGoe1TPbK0+dg==
X-CSE-MsgGUID: o5F3AEEzRraMXsFXsmkWbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259819505"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 22/22] drm/xe/pci: Report 'cannot re-enable' error using
 SIGID
Date: Tue, 28 Jul 2026 18:10:37 +0200
Message-ID: <20260728161039.579-23-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728161039.579-1-michal.wajdeczko@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
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

