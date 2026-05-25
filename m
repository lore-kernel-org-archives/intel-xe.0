Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1642CD5BBF
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 09:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36C810E0F1;
	Mon, 25 May 2026 09:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSOpWACc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFC010E0F1
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 09:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779701583; x=1811237583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sD1117AzlJgpaa1SSA7YedjsJg/l8xC2w5nyHu+TJ3A=;
 b=aSOpWACccjDFoFvQFvpYQND2LmxVcfyHGnpIBCauGTxKlCbWxeYsNLn1
 jzfkLcaTEAL45aQxldgguRFctjP/42LQ2oZF5L8WMhLHnd2iOrBKsiIsX
 6fGJhtJamJSoMCn/uJJJu3xfAgt63iwzDaD9aZsAioBtAkKJbKZ/2c/Pn
 l6WSsmla7V1LqU/j08YfUeFFINcxm0V57nx/1BYrRm9ghOMp4zR30zckh
 dcTDoF9xPuebGmcfhZtqimVns/qzzNw1/Z0n83xIJz0twv9ZH0Nsti28x
 LgDt8WZb0x3QUSzopipWDZEeIbDQ0jW+mLKDKNLwar4o3/lkNDJ4fJnyy Q==;
X-CSE-ConnectionGUID: Oe72eOWzQainiuX2Gs4wHw==
X-CSE-MsgGUID: Bj0N/FawQkGzwE/XLRcOjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="68046777"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="68046777"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:33:03 -0700
X-CSE-ConnectionGUID: lRRJKb1oSDKpAHK2CTE3+Q==
X-CSE-MsgGUID: MdOKRWFiTpetstv54/BsqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="279669552"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:33:00 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 04/15] drm/xe/xe_pci_error: Group all devres to release
 them on PCIe slot reset
Date: Mon, 25 May 2026 15:36:23 +0530
Message-ID: <20260525100619.3155663-21-riana.tauro@intel.com>
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

Add devres grouping to handle device resource cleanup during
PCI error recovery.

Secondary Bus Reset (SBR) is triggered by PCI core when the
error_detected/mmio_enabled callbacks return PCI_ERS_RESULT_NEED_RESET.

Once SBR is complete, the slot_reset callback is triggered. SBR wipes
out all device memory requiring XE KMD to perform a device removal and
reprobe.
Calling xe_pci_remove() alone does not free the devres allocated.
Since there are no exported functions to release all devres, group the
devres allocations and release the entire group during slot reset to
ensure proper cleanup.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: move to xe pci layer
---
 drivers/gpu/drm/xe/xe_device_types.h | 3 +++
 drivers/gpu/drm/xe/xe_pci.c          | 7 +++++++
 drivers/gpu/drm/xe/xe_pci_error.c    | 3 ++-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32dd2ffbc796..714d2e25d3b0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -495,6 +495,9 @@ struct xe_device {
 		bool inconsistent_reset;
 	} wedged;
 
+	/** @devres_group_id: id for devres group */
+	void *devres_group_id;
+
 	/** @bo_device: Struct to control async free of BOs */
 	struct xe_bo_dev {
 		/** @bo_device.async_free: Free worker */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5462ddb25d29..b0b5f2fe7ba8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1063,6 +1063,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	const struct xe_device_desc *desc = (const void *)ent->driver_data;
 	const struct xe_subplatform_desc *subplatform_desc;
 	struct xe_device *xe;
+	void *devres_id;
 	int err;
 
 	xe_configfs_check_device(pdev);
@@ -1088,6 +1089,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (xe_display_driver_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
+	devres_id = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
+	if (!devres_id)
+		return -ENOMEM;
+
 	err = pcim_enable_device(pdev);
 	if (err)
 		return err;
@@ -1096,6 +1101,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
 
+	xe->devres_group_id = devres_id;
+
 	pci_set_drvdata(pdev, &xe->drm);
 
 	xe_pm_assert_unbounded_bridge(xe);
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 218d67074385..7e714a02feb2 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -70,7 +70,7 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 {
 	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
-	struct xe_device *xe;
+	struct xe_device *xe = pdev_to_xe_device(pdev);
 
 	dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
 
@@ -90,6 +90,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 	 * kernel BOs.
 	 */
 	pdev->driver->remove(pdev);
+	devres_release_group(&pdev->dev, xe->devres_group_id);
 
 	if (pdev->driver->probe(pdev, ent))
 		return PCI_ERS_RESULT_DISCONNECT;
-- 
2.47.1

