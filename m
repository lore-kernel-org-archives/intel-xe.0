Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB692CD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 16:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA0910E3D1;
	Mon, 25 May 2026 16:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQ2DK9No";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C2910E3D4
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 16:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779725144; x=1811261144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V6tTEZwzaLj1nMNAf2+m6zCObdPCiU20Qyo5ryOS8RU=;
 b=aQ2DK9NolciQBIkPx5f7A3axYgXHYD9vOF0FL2mjn1C7+Fyi+n7XbBE7
 /sVL0FxwwmFzcJKFUbu6WY1iK3dpanGUz4HaC3RNz82/ba9h2aTsXrt01
 QG+zPWssIGlRhkOGIgThTd6nGSTax/KdBRE2d7Amsa/FrPKrTw+GoU4jm
 RkRfPoRPnqfhPfL5MgWmdB6e2MiOQiPODPglbeb/66uxU7ZcAn8Y4RGDD
 bX8zkKrqtCHbiGN5SMD0pvvJ47p6WdEJYDiaR6alv8RvCI9BXnux33+/A
 z1Axu+dfUtk2SPp3diPCRSPQ1i8xftnnhxJS5lpZ3rAL0JnlVrDpuECoB g==;
X-CSE-ConnectionGUID: tfgEtejNSM+ZNd/zzLTfWw==
X-CSE-MsgGUID: yUagZQAySj+NMKkavMGevQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80275439"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80275439"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 09:05:44 -0700
X-CSE-ConnectionGUID: lWojYLgaTJiVAUrXzU5iXw==
X-CSE-MsgGUID: 5HQTHO+nSei+dxRhJmfE7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="235275257"
Received: from gkearney-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.94])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 09:05:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 5/6] drm/xe/pm: Don't access device in init_early()
Date: Mon, 25 May 2026 18:05:28 +0200
Message-ID: <20260525160529.15890-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525160529.15890-1-michal.wajdeczko@intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
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

We should separate software-only state initialization from anything
else that requires access to the device's hardware. Extract d3cold
capability detection into a new function. Add simple kernel-doc for
updated functions here.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  4 ++++
 drivers/gpu/drm/xe/xe_pci.c    |  5 +----
 drivers/gpu/drm/xe/xe_pm.c     | 27 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pm.h     |  1 +
 4 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7ba407f73a02..d224861b6f6f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -594,6 +594,10 @@ int xe_device_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_pm_init_early(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6b1a4cb7ccb0..35e611cd2e29 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1167,7 +1167,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		str_yes_no(xe_device_has_sriov(xe)),
 		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
 
-	err = xe_pm_init_early(xe);
+	err = xe_pm_probe(xe);
 	if (err)
 		return err;
 
@@ -1179,9 +1179,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		goto err_driver_cleanup;
 
-	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
-		str_yes_no(xe->d3cold.capable));
-
 	return 0;
 
 err_driver_cleanup:
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index d4672eb07476..5d1a3a26cb6e 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -24,6 +24,7 @@
 #include "xe_irq.h"
 #include "xe_late_bind_fw.h"
 #include "xe_pcode.h"
+#include "xe_printk.h"
 #include "xe_pxp.h"
 #include "xe_sriov_vf_ccs.h"
 #include "xe_sysctrl.h"
@@ -349,6 +350,15 @@ static void xe_pm_runtime_init(struct xe_device *xe)
 	pm_runtime_put(dev);
 }
 
+/**
+ * xe_pm_init_early() - Initialize Xe Power Management
+ * @xe: the &xe_device instance
+ *
+ * Initialize everything that is a "software-only" state that does not
+ * require access to any of the device's hardware data.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_pm_init_early(struct xe_device *xe)
 {
 	int err;
@@ -363,11 +373,26 @@ int xe_pm_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
 
+/**
+ * xe_pm_probe() - Initialize Xe Power Management
+ * @xe: the &xe_device instance
+ *
+ * Check d3cold capability.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_pm_probe(struct xe_device *xe)
+{
+	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
+	xe_dbg(xe, "d3cold: capable=%s\n", str_yes_no(xe->d3cold.capable));
+
+	return 0;
+}
+
 static u32 vram_threshold_value(struct xe_device *xe)
 {
 	if (xe->info.platform == XE_BATTLEMAGE) {
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 6b27039e7b2d..6d5ab09cb769 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -17,6 +17,7 @@ int xe_pm_suspend(struct xe_device *xe);
 int xe_pm_resume(struct xe_device *xe);
 
 int xe_pm_init_early(struct xe_device *xe);
+int xe_pm_probe(struct xe_device *xe);
 int xe_pm_init(struct xe_device *xe);
 void xe_pm_fini(struct xe_device *xe);
 bool xe_pm_runtime_suspended(struct xe_device *xe);
-- 
2.47.1

