Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B058FC021A6
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 21:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FDC10E08A;
	Fri, 14 Feb 2025 21:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zois6+qK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC9110ED43
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 21:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739568224; x=1771104224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rBB3zdLtyQOnd1ZgSQnMoIkzMGPOHEWfo7TbSXZWNBk=;
 b=Zois6+qKK4xz8TrRpYoKHF4sRhGv6W2UE1ObD3tqYKSj+9FXaYqIthQ4
 3Zb8fyQ6S6/Y5c0TQkpQ5g7PBWZOBng/KsuulF/6JNafRiNTmqyqHCRR1
 8MVW2w1OhMIGN9egq/xdLsIYf+OBVQzVO066nYG2zXKlOxlHn7XZJ5avN
 Q73dnnDY2VGfL5B8SwKNkQFe5zAwDyl5ADHwdM4sqtqUlsoIv/jBuwKoL
 wmOaG8h9SnBsHDKZI4nR0iEItMXkGewsmUHvFViscgVZGaXE1r6ygBCBV
 u8Lpm1bl25wGnsZffWoX5Tizk2jvWvOsxhsYXRZ1FZLq6uyhH2zqgZB9n Q==;
X-CSE-ConnectionGUID: JL+hOgyEQuGfkxlrNa36Sw==
X-CSE-MsgGUID: +PlM+BZRQ0CvTh+Jn4P1Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40447018"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40447018"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:23:43 -0800
X-CSE-ConnectionGUID: pLR5SLzcSeuGyJdhoJriXw==
X-CSE-MsgGUID: 4GvOt6FSTJaB+5ggswkjiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="113757024"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:23:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/9] drm/xe: Stop setting drvdata to NULL
Date: Fri, 14 Feb 2025 13:23:06 -0800
Message-ID: <20250214212313.1767562-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214212313.1767562-1-lucas.demarchi@intel.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
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

PCI subsystem is not supposed to call the remove() function when probe
fails and doesn't need a protection for that. The only places checking
for NULL drvdata, is on 2 sysfs files and they shouldn't be needed since
the files are removed and reads on open fds just return an error.

For this protection the core driver implementation in
drivers/base/dd.c:device_unbind_cleanup() already sets it to NULL, after
the release of dev resources.

Remove the setting to NULL so it's possible to obtain the xe pointer
from callbacks like the component unbind from device_unbind_cleanup(),
i.e. after xe_pci_remove() already finished.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c       | 6 ------
 drivers/gpu/drm/xe/xe_pci.c                | 7 +------
 drivers/gpu/drm/xe/xe_survivability_mode.c | 1 -
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 7375937934fae..7efbd4c52791c 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -32,9 +32,6 @@ vram_d3cold_threshold_show(struct device *dev,
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	int ret;
 
-	if (!xe)
-		return -EINVAL;
-
 	xe_pm_runtime_get(xe);
 	ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
 	xe_pm_runtime_put(xe);
@@ -51,9 +48,6 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
 	u32 vram_d3cold_threshold;
 	int ret;
 
-	if (!xe)
-		return -EINVAL;
-
 	ret = kstrtou32(buff, 0, &vram_d3cold_threshold);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 70b697fde5b96..41ec6825b9bcc 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -770,11 +770,7 @@ static int xe_info_init(struct xe_device *xe,
 
 static void xe_pci_remove(struct pci_dev *pdev)
 {
-	struct xe_device *xe;
-
-	xe = pdev_to_xe_device(pdev);
-	if (!xe) /* driver load aborted, nothing to cleanup */
-		return;
+	struct xe_device *xe = pdev_to_xe_device(pdev);
 
 	if (IS_SRIOV_PF(xe))
 		xe_pci_sriov_configure(pdev, 0);
@@ -784,7 +780,6 @@ static void xe_pci_remove(struct pci_dev *pdev)
 
 	xe_device_remove(xe);
 	xe_pm_runtime_fini(xe);
-	pci_set_drvdata(pdev, NULL);
 }
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 02b4eadf84079..04a341606a7c5 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -202,7 +202,6 @@ void xe_survivability_mode_remove(struct xe_device *xe)
 	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
 	xe_heci_gsc_fini(xe);
 	kfree(survivability->info);
-	pci_set_drvdata(pdev, NULL);
 }
 
 /**
-- 
2.48.1

