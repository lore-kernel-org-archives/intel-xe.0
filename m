Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6DFCD4840
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 16:56:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811E010E84A;
	Mon, 11 May 2026 16:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVhGvulK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CFF10E84B
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778518570; x=1810054570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1ImW8JLlxPJf7ikSws0wLAYwRcXLix21ONMg7A6i4/E=;
 b=XVhGvulKmWl6TlatNvdciRNQlzM0dkDl/xdgvOjSYt4YrX5t0V8WsIIp
 IjRWOY2+drnik7lQ8ny2kvf+Looye0FmsyTYwbMDnXDXcdlIWLwgkJXFI
 o+xMjv3+thooVdMu+VSz930LMMZDujA/VIRWclhTtv0QPafeaBL+Kp8hW
 SmMyPZAERJr2PsrS4u06oxUYwS5t1KvWEcQ2LwvclOJt/N6EizfXqU6pD
 xlu/pWX9eRudTbTl1eCgRrkTBbV4b5nk9Q+ZZ71lSZV648ZXvU4qZzx6l
 HYOmd3kOPSolnpsVwwwC1OC+B2NfR7L9bxiedFStyVDuh1wvY9oEAklfZ g==;
X-CSE-ConnectionGUID: FvAGKptAS2yLQfVTqiHGyQ==
X-CSE-MsgGUID: C3W8O1l8SdKK9/EN1IBdjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90513527"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90513527"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:10 -0700
X-CSE-ConnectionGUID: uMc2GUQ7SzS3cEbXRJv0Vg==
X-CSE-MsgGUID: TMgUmY2BSiSdEiNhjT0HtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="260988720"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:06 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 04/14] drm/xe/xe_pci_error: Group all devres to release
 them on PCIe slot reset
Date: Mon, 11 May 2026 22:59:11 +0530
Message-ID: <20260511172908.1122252-20-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260511172908.1122252-16-riana.tauro@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
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
index 89437de3001a..ff47d233e8e8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -492,6 +492,9 @@ struct xe_device {
 		bool inconsistent_reset;
 	} wedged;
 
+	/** @devres_group_id: id for devres group */
+	void *devres_group_id;
+
 	/** @bo_device: Struct to control async free of BOs */
 	struct xe_bo_dev {
 		/** @bo_device.async_free: Free worker */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d970c27f5570..1d256bf0bec3 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1052,6 +1052,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	const struct xe_device_desc *desc = (const void *)ent->driver_data;
 	const struct xe_subplatform_desc *subplatform_desc;
 	struct xe_device *xe;
+	void *devres_id;
 	int err;
 
 	xe_configfs_check_device(pdev);
@@ -1077,6 +1078,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (xe_display_driver_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
+	devres_id = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
+	if (!devres_id)
+		return -ENOMEM;
+
 	err = pcim_enable_device(pdev);
 	if (err)
 		return err;
@@ -1085,6 +1090,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
 
+	xe->devres_group_id = devres_id;
+
 	pci_set_drvdata(pdev, &xe->drm);
 
 	xe_pm_assert_unbounded_bridge(xe);
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 42a821ca1a04..b392014ff1f6 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -65,7 +65,7 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 {
 	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
-	struct xe_device *xe;
+	struct xe_device *xe = pdev_to_xe_device(pdev);
 
 	dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
 
@@ -85,6 +85,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 	 * kernel BOs.
 	 */
 	pdev->driver->remove(pdev);
+	devres_release_group(&pdev->dev, xe->devres_group_id);
 
 	if (pdev->driver->probe(pdev, ent))
 		return PCI_ERS_RESULT_DISCONNECT;
-- 
2.47.1

