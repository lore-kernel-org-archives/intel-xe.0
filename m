Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF046F8DFD0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 08:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEA410E992;
	Fri, 17 Apr 2026 08:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtYm7FGw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C643410E992
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 08:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776414341; x=1807950341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v4jEljPdjDD+JT2yY0789DPhEbDrqki9T2kSeXODXLQ=;
 b=gtYm7FGwqhrKC6SHPVPZ7k514b4sG1RG1kkeqJT5CCQ2DjlaJPEICWEP
 zso5E8DL6I/JA9WwoHKGxUYiNbpqJDn7dRqVsGFFFjpqYbJjUCSKku0uY
 KxqpWTW4wnzjpq0yvw4TtE2WKVyZYi7pEQ3GFLuwKJ8RrGm29+/m8TB2m
 yULdUzXIthKa6UymitNMvlN/RKZ1tnr93RtYihVMjgcOu4GgNdEg7KKqa
 elJDtcMsyLngJed2kUPF25vfCOYhU8/h850LoQzp/KMGl3zGPQdZnbSMK
 zef2tf7/68v+TeMkJII96zzLomNI8uLq66+JRZeRU62Xi8I/wtY3/HO7j A==;
X-CSE-ConnectionGUID: Qp9zNwDXRlqX9bs65Du+8A==
X-CSE-MsgGUID: IdJ+8brnR2mJPRNRYQIQlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88045826"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="88045826"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:25:40 -0700
X-CSE-ConnectionGUID: cCq8VCzXTmGwYEaJiGxt3A==
X-CSE-MsgGUID: m5MzKqBKTaSZonGHmfx5SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235962242"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:25:37 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 03/13] drm/xe/xe_pci_error: Group all devres to release
 them on PCIe slot reset
Date: Fri, 17 Apr 2026 14:28:15 +0530
Message-ID: <20260417085812.4013309-18-riana.tauro@intel.com>
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
 drivers/gpu/drm/xe/xe_device.c       | 7 +++++++
 drivers/gpu/drm/xe/xe_device_types.h | 3 +++
 drivers/gpu/drm/xe/xe_pci_error.c    | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4b45b617a039..cbdf7426e09c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -477,6 +477,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 {
 	struct drm_driver *driver = &regular_driver;
 	struct xe_device *xe;
+	void *devres_id;
 	int err;
 
 #ifdef CONFIG_PCI_IOV
@@ -494,10 +495,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		return ERR_PTR(err);
 
+	devres_id = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
+	if (!devres_id)
+		return ERR_PTR(-ENOMEM);
+
 	xe = devm_drm_dev_alloc(&pdev->dev, driver, struct xe_device, drm);
 	if (IS_ERR(xe))
 		return xe;
 
+	xe->devres_group_id = devres_id;
+
 	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
 			      xe->drm.anon_inode->i_mapping,
 			      xe->drm.vma_offset_manager, 0);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c9fe86b670bd..c89e2d31583c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -497,6 +497,9 @@ struct xe_device {
 	/** @in_recovery: Indicates if device is in recovery */
 	atomic_t in_recovery;
 
+	/** @devres_group_id: id for devres group */
+	void *devres_group_id;
+
 	/** @bo_device: Struct to control async free of BOs */
 	struct xe_bo_dev {
 		/** @bo_device.async_free: Free worker */
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 427a8e09408c..7d80bc2a6954 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -67,6 +67,7 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 {
 	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
 
 	dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
 
@@ -83,6 +84,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 	 * requiring XE KMD to perform a device removal and reprobe.
 	 */
 	pdev->driver->remove(pdev);
+	devres_release_group(&pdev->dev, xe->devres_group_id);
 
 	if (!pdev->driver->probe(pdev, ent))
 		return PCI_ERS_RESULT_RECOVERED;
-- 
2.47.1

