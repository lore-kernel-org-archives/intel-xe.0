Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665CAC4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 05:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2DA112955;
	Tue,  6 Feb 2024 05:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rz0kUsg6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9260C112955
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 05:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707198568; x=1738734568;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=86RVoaxzQZTEWAHAZ25pxJSwQssa9Q1OdyQBeREyGSE=;
 b=Rz0kUsg6tMz44MfS7okdnxcUI7CQ5ItvjwsFnCDG/3cRK+rFbYfP5+rF
 xvh6mpqFvS0oIvQKpSL3pflaefKBUyO/jzBch4+2WvYow17rotzD7bgcJ
 S5RKGBVyUUdLf0cjKLZ8Yv32w+E7eDMwG39Q2Ry1YEe9vnC4eu5TCCsj7
 gS+gIEUwQrbCssyaXU2rDvn6LiW3mk+h+guGYa4bC5Rf2KRKflwbJd3K1
 A1Kl7GRbL2i1U/jbGVZj34EmDl1X4kLco6sIZOe8Lh5LGeZl5jXHKco1d
 V2KAL9gipOpGsoGNh5AsBM5lReFTxJl5dT5s3euagd0GwkfNQJmCvmOT5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="435806045"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="435806045"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 21:49:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="925012"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 21:49:26 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH] drm/xe/pm: add debug logs for D3cold
Date: Tue,  6 Feb 2024 11:29:17 +0530
Message-Id: <20240206055917.2629027-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

add additional debug logs for PME# capability and
presence of ACPI _PR3 resources. This is to identify
the reason why the card is not capable of D3cold.

No functional changes

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index d5f219796d7e..3d55ff77f7c3 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -125,17 +125,26 @@ int xe_pm_resume(struct xe_device *xe)
 	return 0;
 }
 
-static bool xe_pm_pci_d3cold_capable(struct pci_dev *pdev)
+static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
 {
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct pci_dev *root_pdev;
 
 	root_pdev = pcie_find_root_port(pdev);
 	if (!root_pdev)
 		return false;
 
-	/* D3Cold requires PME capability and _PR3 power resource */
-	if (!pci_pme_capable(root_pdev, PCI_D3cold) || !pci_pr3_present(root_pdev))
+	/* D3Cold requires PME capability */
+	if (!pci_pme_capable(root_pdev, PCI_D3cold)) {
+		drm_dbg(&xe->drm, "d3cold: PME# not supported\n");
 		return false;
+	}
+
+	/* D3Cold requires _PR3 power resource */
+	if (!pci_pr3_present(root_pdev)) {
+		drm_dbg(&xe->drm, "d3cold: ACPI _PR3 not present\n");
+		return false;
+	}
 
 	return true;
 }
@@ -171,15 +180,13 @@ void xe_pm_init_early(struct xe_device *xe)
 
 void xe_pm_init(struct xe_device *xe)
 {
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-
 	/* For now suspend/resume is only allowed with GuC */
 	if (!xe_device_uc_enabled(xe))
 		return;
 
 	drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
 
-	xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
+	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
 
 	if (xe->d3cold.capable) {
 		xe_device_sysfs_init(xe);
-- 
2.40.0

