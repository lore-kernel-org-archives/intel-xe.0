Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40880CC6B03
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 06:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0194810F041;
	Thu,  2 Apr 2026 06:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EUPotwvP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEDA10F041
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 06:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775111386; x=1806647386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wx3kpsx/zfvxuZGxB8fBl7q34rfK81eywZcxNG6kEE0=;
 b=EUPotwvP8eAD1ar66UdX9IckpvwbLX9GuzjWCjKPjDNfv4AgliADUZb5
 niO81VFSZrQtTqgh8dQqqtm5cLOIZsqnes/2x+s7985WtoEdBf5dz7cZj
 NOxX3Jx49ASKDbPibuLGwyVNazpB8pC6aUwly+amZt1GM9MNLeKYJYYDz
 o6Z7Tx2IpdZ2M1t0KCeXBmF75AmQedOtGdBGTgg1KpQnri9ymPmqeGmBB
 tUqrcwRp2b0fFA+ejgSimiqQ+Luil9M5b4mG/jOVkdRRjCX4jifFeaZJ0
 b37kF21xukO3v8hYdrZPv/M1B4YuOfVpM45729T+ksgMEGtIZ459rFgUK w==;
X-CSE-ConnectionGUID: Ue/7ptMgS72pR1vniqZaGg==
X-CSE-MsgGUID: +yC/ty90Q6qfD/XjpFGjwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76051481"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76051481"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:29:46 -0700
X-CSE-ConnectionGUID: NhBjSpIHRwG+kcbRI53CWA==
X-CSE-MsgGUID: XhppE1SZRM2OT/eD3R3Mvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="222532256"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:29:42 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 03/10] drm/xe/xe_pci_error: Group all devres to release
 them on PCIe slot reset
Date: Thu,  2 Apr 2026 12:31:34 +0530
Message-ID: <20260402070131.1603828-15-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260402070131.1603828-12-riana.tauro@intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
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
 drivers/gpu/drm/xe/xe_pci_error.c    | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cbce1d0ffe48..d0b29d94edd2 100644
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
index cd9f39010278..28b2f4f7c24b 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -64,6 +64,7 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 {
 	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
 
 	dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
 
@@ -80,6 +81,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 	 * requiring XE KMD to perform a device removal and reprobe.
 	 */
 	pdev->driver->remove(pdev);
+	devres_release_group(&pdev->dev, xe->devres_group_id);
 
 	if (!pdev->driver->probe(pdev, ent))
 		return PCI_ERS_RESULT_RECOVERED;
-- 
2.47.1

