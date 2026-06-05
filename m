Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4504CCD6E74
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 09:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0238B11A66A;
	Fri,  5 Jun 2026 09:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNKVUj4u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFE011A66A
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 09:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780652124; x=1812188124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SDPEhzO4+XH7UrTbDpmvlQUEbwky0O7N+c2wrag8h6g=;
 b=YNKVUj4uqZulvL/VJEnUFhHJH75DLJOrmjgGV2c3tvppzD41CQzHxBnr
 8kbsVfClw4Fo7yUMdjVJwkSZqBEi7f3Z7qO/iBB17IMkpAx7gPN30ML8w
 nP9is5W6YK9ZKlHnUcrLgwHPWtywbgVp6PkrQpOXy9WJUV2yJzVVjS3SR
 yxpBEmGVvy/NUMTakbH8RschJ4+Rg05Km3F2Pnw1bI7uiwc/zzAc0cUGG
 4VgVzmcHjZh0uH2E7QckCBk6ocRHFqtLxEqXGKIMli23r2uRGKgXkky9R
 qRwur8EZdsuIuwjE8rAGFWouDI9dYknOkd57V09zzgAbFynf4Y7SxNW/s g==;
X-CSE-ConnectionGUID: cfNCQBv4RjOm22KhEAchGQ==
X-CSE-MsgGUID: EcYEnhMDTXG2GqbmCn+PUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="98903930"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="98903930"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:35:24 -0700
X-CSE-ConnectionGUID: ktdwA3ltTma9Iasadc0yYA==
X-CSE-MsgGUID: HnVfErnuTDSPwTFPxZXQOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249133593"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:35:21 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 05/15] drm/xe/xe_pci_error: Group all devres to release
 them on PCIe slot reset
Date: Fri,  5 Jun 2026 15:04:51 +0530
Message-ID: <20260605093446.4189929-22-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260605093446.4189929-17-riana.tauro@intel.com>
References: <20260605093446.4189929-17-riana.tauro@intel.com>
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
 drivers/gpu/drm/xe/xe_pci_error.c    | 1 +
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 66e673e4e3e7..943e4796bdf1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -497,6 +497,9 @@ struct xe_device {
 		bool inconsistent_reset;
 	} wedged;
 
+	/** @devres_group_id: id for devres group */
+	void *devres_group_id;
+
 	/** @bo_device: Struct to control async free of BOs */
 	struct xe_bo_dev {
 		/** @bo_device.async_free: Free worker */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1d3d2ea82aed..ab74a5852dbd 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1077,6 +1077,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	const struct xe_device_desc *desc = (const void *)ent->driver_data;
 	const struct xe_subplatform_desc *subplatform_desc;
 	struct xe_device *xe;
+	void *devres_id;
 	int err;
 
 	subplatform_desc = find_subplatform(desc, pdev->device);
@@ -1104,6 +1105,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (xe_display_driver_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
+	devres_id = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
+	if (!devres_id)
+		return -ENOMEM;
+
 	err = pcim_enable_device(pdev);
 	if (err)
 		return err;
@@ -1112,6 +1117,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
 
+	xe->devres_group_id = devres_id;
+
 	pci_set_drvdata(pdev, &xe->drm);
 
 	xe_pm_assert_unbounded_bridge(xe);
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 7a846151e5a3..4bf9ebbb1e96 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -83,6 +83,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 	 * kernel BOs.
 	 */
 	pdev->driver->remove(pdev);
+	devres_release_group(&pdev->dev, xe->devres_group_id);
 
 	if (pdev->driver->probe(pdev, ent))
 		return PCI_ERS_RESULT_DISCONNECT;
-- 
2.47.1

