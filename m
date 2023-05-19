Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF65CC7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 16:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B664810E54E;
	Fri, 19 May 2023 16:28:32 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276C910E2BA
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 16:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684513709; x=1716049709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=50rVIWzl5+1uANhNWHyoasvtLo9vx2VLfpeUbfMIGhw=;
 b=IyLugJgxcVobxjr01eNWdgcMhiM+MowjUeq0i9ABKp5udb+jgfsJ2mEp
 MDXeouCUkXR7bZk7A/AtsIdqe12qV+VPl8fw5VxmWMU4Splwl0re+30pe
 vqoKMg+qsLI/rCgYuwCNmAwn3W++koBbX7fJ7ao2m8wu6UPSqNEPSbdoi
 FkTH8k9VyZVHid6VF686pj8z1PB7BJcPOFrQb59g1+DCDtrIhA0gXuDwE
 5+HZHpgoZVJtQksW1PbXB3TOiYNFIUK2xAuhnEmQJ8CdQtPhhuW/GT/3/
 RbeQI6g9kdJ8oGg+jfwdDolelV2LsJgGXMW3yFG2QpOKdzSJzhOt5MBw9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="332022414"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="332022414"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 09:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="1032660335"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="1032660335"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 09:28:26 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 21:55:54 +0530
Message-Id: <20230519162555.409853-4-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230519162555.409853-1-anshuman.gupta@intel.com>
References: <20230519162555.409853-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/xe/pm: Add vram_d3cold_threshold Sysfs
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add per pci device vram_d3cold_threshold Sysfs to
control the d3cold_allowed knob.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++++
 drivers/gpu/drm/xe/xe_pm.c           | 65 ++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8fd3acf60719..68222a3447cf 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -272,6 +272,14 @@ struct xe_device {
 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
 	bool d3cold_allowed;
 
+	/**
+	 * @vram_d3cold_threshold is the permissible threshold(in megabytes)
+	 * for vram save/restore. d3cold will be disallowed, when vram_usages is
+	 * above threshold value to avoid the vram save/restore latency.
+	 * Default threshold value is 300mb.
+	 */
+	u32 vram_d3cold_threshold;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c250a36b99ad..ebdbdf2e0898 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -7,6 +7,7 @@
 
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_managed.h>
 #include <drm/ttm/ttm_placement.h>
 
 #include "xe_bo.h"
@@ -132,6 +133,68 @@ static bool xe_pm_pci_d3cold_capable(struct pci_dev *pdev)
 	return true;
 }
 
+static ssize_t
+vram_d3cold_threshold_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int ret;
+
+	if (!xe)
+		return -EINVAL;
+
+	ret = sysfs_emit(buf, "%d\n", xe->vram_d3cold_threshold);
+
+	return ret;
+}
+
+static ssize_t
+vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
+			    const char *buff, size_t count)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	u32 vram_d3cold_threshold;
+	int ret;
+
+	if (!xe)
+		return -EINVAL;
+
+	ret = kstrtou32(buff, 0, &vram_d3cold_threshold);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "vram_d3cold_threshold: %d\n", vram_d3cold_threshold);
+
+	xe->vram_d3cold_threshold = vram_d3cold_threshold;
+
+	return ret ?: count;
+}
+
+DEVICE_ATTR_RW(vram_d3cold_threshold);
+
+void xe_pm_sysfs_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_device *xe = arg;
+
+	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
+}
+
+int xe_pm_sysfs_init(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+	int ret;
+
+	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
+	if (ret)
+		return ret;
+
+	ret = drmm_add_action_or_reset(&xe->drm, xe_pm_sysfs_fini, xe);
+
+	return ret;
+}
+
 static void xe_pm_runtime_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -150,6 +213,8 @@ void xe_pm_init(struct xe_device *xe)
 
 	xe_pm_runtime_init(xe);
 	xe->d3cold_capable = xe_pm_pci_d3cold_capable(pdev);
+	xe->vram_d3cold_threshold = 300;
+	xe_pm_sysfs_init(xe);
 }
 
 void xe_pm_runtime_fini(struct xe_device *xe)
-- 
2.38.0

