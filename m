Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0238FCA0FFE
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 13:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B063810E6E1;
	Tue,  2 Sep 2025 13:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2n/0jbY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3F610E6E1
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 13:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756819079; x=1788355079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ms6um01iWD7wDogHEIf1yCf86CK5In+HGYld6cXhqB8=;
 b=F2n/0jbYGiaS52DXn9vNTt6e5YWk8kuGygKZCmp4CW7eRI54Dtdvk8zO
 SAMDqhZ7oaiaM2yVGqgp50vwbGV/NV69PADIlRuIbw28mgB+N0P6lB8sj
 5KXC3zipn6F8foHdLcifMjVkDzRPK7eVIOGuUDarDpiS8kT9+nZmi4o6h
 8L0VNK7+nHP8sw4KMTYlZ4NPKdJilktHdgNJfSwiEqIDNoEkRpidFwATT
 ja90624ll1aZ/nc1kJ/qB8NsBJ/fNlyJV9IOrP3PhnyG+zlo8t6/7EjsD
 Eu6Y7xBYI8FcBS8OtyoXeM+kj8pgYAJb9HEkL/yaHV/JbOU4oHqZnUMKJ w==;
X-CSE-ConnectionGUID: uDeIzw+YTO6n/DzQev6EgQ==
X-CSE-MsgGUID: emCM+KvVRy6hmi0mc3p3MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="76535163"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="76535163"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 06:17:59 -0700
X-CSE-ConnectionGUID: hWMLy/ykRDSRhMGEuhhTdQ==
X-CSE-MsgGUID: aVF+EmTVSP+21S+pz0zc3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="175642837"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 06:17:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH 3/3] drm/xe/configfs: Don't expose survivability_mode if not
 applicable
Date: Tue,  2 Sep 2025 15:17:44 +0200
Message-ID: <20250902131744.5076-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902131744.5076-1-michal.wajdeczko@intel.com>
References: <20250902131744.5076-1-michal.wajdeczko@intel.com>
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

The survivability_mode attribute is applicable only for DGFX and
platforms newer than BATTLEMAGE. Use .is_visible() hook to hide
this attribute when above conditions are not met. Remove code that
was trying to fix such configuration during the runtime.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c           | 24 ++++++----------------
 drivers/gpu/drm/xe/xe_configfs.h           |  2 --
 drivers/gpu/drm/xe/xe_survivability_mode.c | 11 +---------
 3 files changed, 7 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 43f000260752..0337811864cd 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -369,7 +369,12 @@ static bool xe_config_device_is_visible(struct config_item *item,
 {
 	struct xe_config_group_device *dev = to_xe_config_group_device(item);
 
-	return dev->desc; /* shall be always true */
+	if (attr == &attr_survivability_mode) {
+		if (!dev->desc->is_dgfx || dev->desc->platform < XE_BATTLEMAGE)
+			return false;
+	}
+
+	return true;
 }
 
 static struct configfs_group_operations xe_config_device_group_ops = {
@@ -558,23 +563,6 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 	return mode;
 }
 
-/**
- * xe_configfs_clear_survivability_mode - clear configfs survivability mode
- * @pdev: pci device
- */
-void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
-{
-	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
-
-	if (!dev)
-		return;
-
-	guard(mutex)(&dev->lock);
-	dev->config.survivability_mode = 0;
-
-	config_group_put(&dev->group);
-}
-
 /**
  * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 58c8c3164000..1402e863b71c 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -15,7 +15,6 @@ int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
-void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 #else
@@ -23,7 +22,6 @@ static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
 static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
-static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
 #endif
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 79426ea46861..19a1732e33d4 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -287,19 +287,10 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
 	u32 data;
 	bool survivability_mode;
 
-	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE)
 		return false;
 
 	survivability_mode = xe_configfs_get_survivability_mode(pdev);
-
-	if (xe->info.platform < XE_BATTLEMAGE) {
-		if (survivability_mode) {
-			dev_err(&pdev->dev, "Survivability Mode is not supported on this card\n");
-			xe_configfs_clear_survivability_mode(pdev);
-		}
-		return false;
-	}
-
 	/* Enable survivability mode if set via configfs */
 	if (survivability_mode)
 		return true;
-- 
2.47.1

