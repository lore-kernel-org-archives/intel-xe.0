Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D64C369C2
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 14:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642D910E2EA;
	Fri, 25 Apr 2025 14:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmGxyW8l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A4F10E2EA
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Apr 2025 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745590062; x=1777126062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SAYhm+U4HIsoqpes4xh5JHcqbTB/FgEu3O+jUytKk9w=;
 b=fmGxyW8lBvAGhe7iPZY1HBDa/5ACOmCxjudMNnKPOQP31USdOcnGVrSD
 GMmBI7aCmb5jEQ6mekTzQyXOdxk+IRBGpl7Kli8J78FhHVNH8AdECQSQJ
 FtNKhIFu6+pShxRdSdcTQgS6fJYCCZVgtm0O7+bGgsHO803jNGqykoPfq
 WnLjQsXVzc233RHqY0xp3bHfNSUDDJPr21Qb17zmgLJ7bvbeDqZdyKGet
 pN46+/d/VO4yzx+1vhDE+y8bYl4gipo8R3XcDisumQBZU6OPIaOtNCeIL
 rAun+CKCJqOeyRBYGXJQ/ylCGlagNtVCGwq307qEvhSFy9WBL7pLRtcuI A==;
X-CSE-ConnectionGUID: aC9jeg15TY+PmMRMJaO2/A==
X-CSE-MsgGUID: 9shEXEVoQpGclMacbGlX2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47345497"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47345497"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 07:07:42 -0700
X-CSE-ConnectionGUID: 87EeOUvVQgWRr834++KBzA==
X-CSE-MsgGUID: oIed/2qVRYOjQa/ZgDwXbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="132900195"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 25 Apr 2025 07:07:40 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 1/3] drm/xe/pm: s/xe_device_sysfs_init/xe_pm_sysfs_init
Date: Fri, 25 Apr 2025 19:36:24 +0530
Message-Id: <20250425140626.3082588-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425140626.3082588-1-raag.jadav@intel.com>
References: <20250425140626.3082588-1-raag.jadav@intel.com>
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

Attributes being exposed in xe_pm_init() are PM specific and should
follow its naming.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 6 +++---
 drivers/gpu/drm/xe/xe_device_sysfs.h | 2 +-
 drivers/gpu/drm/xe/xe_pm.c           | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 7efbd4c52791..2d25e5b5d4bf 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -63,14 +63,14 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RW(vram_d3cold_threshold);
 
-static void xe_device_sysfs_fini(void *arg)
+static void xe_pm_sysfs_fini(void *arg)
 {
 	struct xe_device *xe = arg;
 
 	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
 }
 
-int xe_device_sysfs_init(struct xe_device *xe)
+int xe_pm_sysfs_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
 	int ret;
@@ -79,5 +79,5 @@ int xe_device_sysfs_init(struct xe_device *xe)
 	if (ret)
 		return ret;
 
-	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
+	return devm_add_action_or_reset(dev, xe_pm_sysfs_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
index f9e83d8bd2c7..2c1fabdba9e4 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
@@ -8,6 +8,6 @@
 
 struct xe_device;
 
-int xe_device_sysfs_init(struct xe_device *xe);
+int xe_pm_sysfs_init(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 38514cef817e..183813e43b29 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -347,7 +347,7 @@ int xe_pm_init(struct xe_device *xe)
 	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
 
 	if (xe->d3cold.capable) {
-		err = xe_device_sysfs_init(xe);
+		err = xe_pm_sysfs_init(xe);
 		if (err)
 			goto err_unregister;
 
-- 
2.34.1

