Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C19E9B344
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 09:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9F310E472;
	Mon,  2 Mar 2026 09:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVMPPLvg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8EA10E472
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772445027; x=1803981027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q8SHIlKMSd2cd10VfTd78JuxX6QEHHk2xyfFXEk8rI8=;
 b=EVMPPLvgQHZpKRuRjOwPg73ka2S3tCY8RpNtIJJXQXNQeb/ML2AnMQJu
 FMRaI5jxews4gUk7En3W3vK2+Wi3AmmeZHefvexQzkeExUzaiq0KNnIiy
 GuHzelJQpBO/cp0afqvqBrV/C3CYPNjC3RY8W2m1wEzwMYt37Q4iTyg1b
 9MBYTlnGxKtFh/mFGgpCQq06FR0XDr+lEZelAP3W8A+T1QVcy+LbdHMAz
 URWmpjVWOnRIcm58mJDnzLh3sRR2DhyRbcoxltLffNgGiO0KTZXiARySS
 /6Th1bPgS24mVNKBkpgbVDcYuMuE0w31nnOLBdQqZANwz4LWBZUIjuBzn w==;
X-CSE-ConnectionGUID: Tv9RXb0YR+KgEyV1UKk7dg==
X-CSE-MsgGUID: AHoo0jF1SA21SBEjubGX6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="83783031"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="83783031"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:50:27 -0800
X-CSE-ConnectionGUID: uld2u/0JTkeYVRydCAlpoA==
X-CSE-MsgGUID: JKcS08UrQwiSlo4zGHubHg==
X-ExtLoop1: 1
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:50:24 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 04/11] drm/xe/xe_pci_error: Group all devres to release
 them on PCIe slot reset
Date: Mon,  2 Mar 2026 15:51:59 +0530
Message-ID: <20260302102155.4074630-17-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260302102155.4074630-13-riana.tauro@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
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
index 1d61bb504e9b..eea67cf13539 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -441,6 +441,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
 	struct xe_device *xe;
+	void *devres_id;
 	int err;
 
 	xe_display_driver_set_hooks(&driver);
@@ -449,10 +450,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
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
index 616d74792902..22dfaec30c58 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -507,6 +507,9 @@ struct xe_device {
 	/** @in_recovery: Indicates if device is in recovery */
 	atomic_t in_recovery;
 
+	/** @devres_group_id: id for devres group */
+	void *devres_group_id;
+
 	/** @bo_device: Struct to control async free of BOs */
 	struct xe_bo_dev {
 		/** @bo_device.async_free: Free worker */
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index d4896a4a5014..ba62868f00d4 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -75,6 +75,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 	 * requiring XE KMD to perform a device removal and reprobe.
 	 */
 	pdev->driver->remove(pdev);
+	devres_release_group(&pdev->dev, xe->devres_group_id);
 
 	if (!pdev->driver->probe(pdev, ent))
 		return PCI_ERS_RESULT_RECOVERED;
-- 
2.47.1

