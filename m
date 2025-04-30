Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6C6C369DC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 04:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDC910E6CE;
	Wed, 30 Apr 2025 04:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVKVxvG1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCDF10E6CE
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 04:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745987158; x=1777523158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SAYhm+U4HIsoqpes4xh5JHcqbTB/FgEu3O+jUytKk9w=;
 b=VVKVxvG19uTL5/TtBod9QnTfOs6+57w9Cb5gvdk9rAU0gWikZ8sOL88c
 1dhgQkLiLtiJ5IFSJQPVfCOkz9M4sU4q/H6SzlbTt1MELBBVxShBE34zZ
 fLpn+3H1Bv0m6ejPrEIVXR1ATaIomfmeu71+eUCYsUjqOJR5+oRs8XemP
 37N8q8xw2wnnAICdxD3yyU5yu0YuijL0WJuTJuN74O0qjK9sB5WKHs5J5
 EP9ymG1vU5dZzXK/7/j1GXERg6+yW3jtv85jT+98VdznQ6g5L6TVYnDpx
 kEcOG70UUVyOaY+7LXdniwZgySnDNWSTrY0BYTeGjkP0ycPJUO7Nd/Uco g==;
X-CSE-ConnectionGUID: pt1MLUlvQ3eZfbVaf8kiZA==
X-CSE-MsgGUID: pVhSnCWfTu2I34XLjK+XKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="59009467"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="59009467"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 21:25:58 -0700
X-CSE-ConnectionGUID: 1A3/rTNRR1ilEAWKxQnsmg==
X-CSE-MsgGUID: UaHJCmWTTZe+seZ2kFYa2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="138841585"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2025 21:25:55 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 1/3] drm/xe/pm: s/xe_device_sysfs_init/xe_pm_sysfs_init
Date: Wed, 30 Apr 2025 09:54:17 +0530
Message-Id: <20250430042419.3256029-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430042419.3256029-1-raag.jadav@intel.com>
References: <20250430042419.3256029-1-raag.jadav@intel.com>
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

