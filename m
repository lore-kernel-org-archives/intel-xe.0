Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAECC021B3
	for <intel-xe@archiver.kernel.org>; Sat, 22 Feb 2025 00:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B88C10EB46;
	Sat, 22 Feb 2025 00:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oo5r+kbH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C6E10E0E9
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Feb 2025 00:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740183070; x=1771719070;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JMnQrLB1TezwfKJOugQSfOP/M9ZV/qLdbu2jM/OKzhI=;
 b=Oo5r+kbHZ9+hqk6uYr7SkC6V45GJk0STFFgmpo9MVWd2wzmap7jacneF
 AFyLwfZRidO5xtQB9MNqzjFZbLpI30D/usnNFL/wDJq08XeDy6Er4QOBH
 HbSQy+h0DKeSmYqR/jLthhPZIZ2MIo6/VWQOMMMipAOBYJV5StFpfBmVj
 wnTuIG6XMZf27NwZ8zsRSwUEGWy1CoAPvxDMDUqBs8xvnOSmhediCVast
 L6x/YZ1tQCjHkzeCVotMSJdMx4meHDqrXzhL1mvdK6nH1esA6vRN80Dd0
 KqbaAfFGfp3qDUlNI6DMWhAZmwDe0psVDDQ09UdePQntBtLG4EVQWv0sj g==;
X-CSE-ConnectionGUID: 6KiDU+C4Q0SWnvRb/P5g1g==
X-CSE-MsgGUID: OXVWFN+lTbyFX1B51S4Vkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44926389"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="44926389"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:09 -0800
X-CSE-ConnectionGUID: 8JJ4/ExYSx6Uq1ouK930mA==
X-CSE-MsgGUID: TDTHig3SQdmo+ofknWfwpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="115704938"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 04/11] drm/xe: Stop setting drvdata to NULL
Date: Fri, 21 Feb 2025 16:10:44 -0800
Message-ID: <20250222001051.3012936-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222001051.3012936-1-lucas.demarchi@intel.com>
References: <20250222001051.3012936-1-lucas.demarchi@intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
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

