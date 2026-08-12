Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CB5C5DF64
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E396410F0F9;
	Wed, 12 Aug 2026 19:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdoJUtZv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A2710F0F9
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562160; x=1818098160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uyyiJOMxikUXEDJXZKHj4gfg/blNd8zpm9VVDqx3L6g=;
 b=BdoJUtZv0LPRG6F7LJ3V3eK/ga+aj01+EFGOKJ0+WqtjDhJShIQFB8Pk
 UfZUymaCaoBItvP3EQgRDbl3zySgYOOovYUQ4zBSV6J2zc4uTmjVwQWCi
 zGN1Q9qmXz7EA+tHp5e5roHjIj+ckU0xJagqpzqhXAXduHQdgiMSOok4G
 MALDvVF97H2OJZwwWR3AcgemeEvWCp0QicHxIVI7etjV5G77MsYtTSPIx
 e6YkTw3ivOjgkUj4DL7L9DR5zfsiy8Of8Dvu6OczFMA8qqia9VHp+E71h
 YVY+X+NrJXSsq7WvsiSNAxBn/THjq5x2wmrAe7AR7dy8ykzXwQUzOIZJ/ w==;
X-CSE-ConnectionGUID: 2pggEY2gQ72B8WXtpQo+Sw==
X-CSE-MsgGUID: EuNUfBJVTvi+5Wnr97wGrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987629"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987629"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:16:00 -0700
X-CSE-ConnectionGUID: lBsCcpMUTeaCQ2ahmM0RlQ==
X-CSE-MsgGUID: gWO1tjmJRi2/UvYBuRo3gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268892143"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 32/32] drm/xe/pci: Report 'cannot re-enable' error using
 SIGID
Date: Wed, 12 Aug 2026 21:14:48 +0200
Message-ID: <20260812191450.11690-33-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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

