Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AE9C44500
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 09:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B82610E968;
	Thu, 22 Jan 2026 09:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTMx1Drc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A2510E968
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 09:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769074556; x=1800610556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o67LMSLKmupvyWPMYm7Tu8ro91QHM8Zhg8LKI7TV5YU=;
 b=bTMx1Drc8U0Im13am1FwX6kJqTKe8EP/tdOcgqY4xFIHWr90VOotMK0n
 cfB+fUN/hOBxLLE8Obx3ThI/HHq5o7g5mD/aYXU/pMJtHq8qcdaMJwiJP
 5+0QxL75AZ/l/syPfQ0kNViLMHbyUEk1TMZb/SZwHjmEmJH0ea8FMf3AI
 pJbF/LUVro1w1KL2nCtCM6Aikdyw6cnCqbbM4a8vlvOuU5qTlz/SHdmh6
 9LsWyRmn3044MturaQpdq7goZC1eutkxylnGLiz2X91pQd+c/+8YMi6B6
 vaI85lAeCCTiikTYKU+8/VpcaIuUYhl5r4AR0V3VG8tzKNZvojHdOusKm Q==;
X-CSE-ConnectionGUID: jCJY+qfETHKZJULSUmOu/w==
X-CSE-MsgGUID: ilalEMgCT2aeU4uJLS+ncg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80937745"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="80937745"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 01:35:56 -0800
X-CSE-ConnectionGUID: 99ztYVOBRdGDyPrS36K2YA==
X-CSE-MsgGUID: zvLsdMjBS8O95dGPzEjpNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="207122755"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 01:35:53 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 3/8] drm/xe/xe_pci_error: Group all devres to release them on
 PCIe slot reset
Date: Thu, 22 Jan 2026 15:36:15 +0530
Message-ID: <20260122100613.3631582-13-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260122100613.3631582-10-riana.tauro@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
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
---
 drivers/gpu/drm/xe/xe_device.c       | 7 +++++++
 drivers/gpu/drm/xe/xe_device_types.h | 3 +++
 drivers/gpu/drm/xe/xe_pci_error.c    | 1 +
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 16fc6da01357..0cf6480b8aad 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -440,6 +440,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
 	struct xe_device *xe;
+	void *devres_id;
 	int err;
 
 	xe_display_driver_set_hooks(&driver);
@@ -448,10 +449,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		return ERR_PTR(err);
 
+	devres_id = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
+	if (!devres_id)
+		return ERR_PTR(-ENOMEM);
+
 	xe = devm_drm_dev_alloc(&pdev->dev, &driver, struct xe_device, drm);
 	if (IS_ERR(xe))
 		return xe;
 
+	xe->devres_group_id = devres_id;
+
 	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
 			      xe->drm.anon_inode->i_mapping,
 			      xe->drm.vma_offset_manager, 0);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2d140463dc5e..3a19e9b5dfae 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -672,6 +672,9 @@ struct xe_device {
 	/** @in_recovery: Indicates if device is in recovery */
 	atomic_t in_recovery;
 
+	/** @devres_group_id: id for devres group */
+	void *devres_group_id;
+
 	/** @bo_device: Struct to control async free of BOs */
 	struct xe_bo_dev {
 		/** @bo_device.async_free: Free worker */
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index a3cc01afa179..0960aa5861bc 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -65,6 +65,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 	 */
 	pdev->driver->remove(pdev);
 	xe_device_clear_in_recovery(xe);
+	devres_release_group(&pdev->dev, xe->devres_group_id);
 
 	if (!pdev->driver->probe(pdev, ent))
 		return PCI_ERS_RESULT_RECOVERED;
-- 
2.47.1

