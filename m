Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739AAC021AD
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 19:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D0610EB8F;
	Thu, 13 Feb 2025 19:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3yUukVa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D290010EB8C
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739474976; x=1771010976;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UiIy4YZRTJ5IvPyhlfKA5D2kS9IeNLGm17ynDIIySQI=;
 b=F3yUukVaQ/tzMKcgDIQIEqfH8ckDQKZbMsKduGtBJoTJFDHk1yFBE5KN
 G/xO7zassTE7oL6QUPiShYw9rkXj3m3bNxQVyNomAIbZUcuzHSBBSA6WO
 LHcKSU2vlcb+LHtzF02hOPYF6O2VD+WjRxa3dIF7WZu/PS2kdxys4XTet
 S/8AkuWWUlqDeY7t/4ZMjdoImO0WK7deVPcZeP5QNzOvhW+5OgpPhU8F7
 S+sDc9yZjok1e3ahNbXBbIeR9B5hqwIWrFZKqfGDRJsR28RSNnGRxxj/N
 AfrZ3qU6Wtj6TuuV+hRpZOfYOjqX73GAssTvUSGo9pcUIx7k69Jmvw3zG w==;
X-CSE-ConnectionGUID: sWui6eHhRySBXCHrU7bvXA==
X-CSE-MsgGUID: gXlux0hgT5iFBbFWGYvRGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40127934"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40127934"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:29:35 -0800
X-CSE-ConnectionGUID: nMfyGbbMTTeeswFN1SBooQ==
X-CSE-MsgGUID: 7M4cNLs3Rce1jTx94gVXSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150416893"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:29:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 13/13] drm/xe/hwmon: Stop ignoring errors on probe
Date: Thu, 13 Feb 2025 11:29:09 -0800
Message-ID: <20250213192909.996148-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213192909.996148-1-lucas.demarchi@intel.com>
References: <20250213192909.996148-1-lucas.demarchi@intel.com>
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

Not registering hwmon because it's not available (SRIOV_VF and DGFX) is
different from failing the initialization. Handle the errors
appropriately.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  4 +++-
 drivers/gpu/drm/xe/xe_hwmon.c  | 31 ++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_hwmon.h  |  4 ++--
 3 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 44471604142fc..31013491f8d7e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -895,7 +895,9 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_debugfs_register(xe);
 
-	xe_hwmon_register(xe);
+	err = xe_hwmon_register(xe);
+	if (err)
+		goto err_unregister_display;
 
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 7f327e3342123..48d80ffdf7bb9 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -839,10 +839,9 @@ static const struct hwmon_chip_info hwmon_chip_info = {
 };
 
 static void
-xe_hwmon_get_preregistration_info(struct xe_device *xe)
+xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 {
-	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
-	struct xe_hwmon *hwmon = xe->hwmon;
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	long energy;
 	u64 val_sku_unit = 0;
 	int channel;
@@ -876,33 +875,34 @@ static void xe_hwmon_mutex_destroy(void *arg)
 	mutex_destroy(&hwmon->hwmon_lock);
 }
 
-void xe_hwmon_register(struct xe_device *xe)
+int xe_hwmon_register(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
 	struct xe_hwmon *hwmon;
+	int ret;
 
 	/* hwmon is available only for dGfx */
 	if (!IS_DGFX(xe))
-		return;
+		return 0;
 
 	/* hwmon is not available on VFs */
 	if (IS_SRIOV_VF(xe))
-		return;
+		return 0;
 
 	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
 	if (!hwmon)
-		return;
-
-	xe->hwmon = hwmon;
+		return -ENOMEM;
 
 	mutex_init(&hwmon->hwmon_lock);
-	if (devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon))
-		return;
+	ret = devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon);
+	if (ret)
+		return ret;
 
 	/* There's only one instance of hwmon per device */
 	hwmon->xe = xe;
+	xe->hwmon = hwmon;
 
-	xe_hwmon_get_preregistration_info(xe);
+	xe_hwmon_get_preregistration_info(hwmon);
 
 	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
 
@@ -910,11 +910,12 @@ void xe_hwmon_register(struct xe_device *xe)
 	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev, "xe", hwmon,
 								&hwmon_chip_info,
 								hwmon_groups);
-
 	if (IS_ERR(hwmon->hwmon_dev)) {
-		drm_warn(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
+		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
 		xe->hwmon = NULL;
-		return;
+		return PTR_ERR(hwmon->hwmon_dev);
 	}
+
+	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
index c42a1de2cd7a2..d02c1bfe8c0a0 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.h
+++ b/drivers/gpu/drm/xe/xe_hwmon.h
@@ -11,9 +11,9 @@
 struct xe_device;
 
 #if IS_REACHABLE(CONFIG_HWMON)
-void xe_hwmon_register(struct xe_device *xe);
+int xe_hwmon_register(struct xe_device *xe);
 #else
-static inline void xe_hwmon_register(struct xe_device *xe) { };
+static inline int xe_hwmon_register(struct xe_device *xe) { return 0; };
 #endif
 
 #endif /* _XE_HWMON_H_ */
-- 
2.48.1

