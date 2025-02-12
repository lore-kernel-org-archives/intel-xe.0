Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D71EC02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 19:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD02D10E206;
	Wed, 12 Feb 2025 19:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VoWmWHXM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B338A10E978
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 19:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739388997; x=1770924997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FRyGrgw6qmHo5PtK0KQ8QrmkoQgsqgx2C1sPkNdAZCE=;
 b=VoWmWHXMlvVWVK4280BCbYH0yMeSDtwz4SuswNN09Ddvq/WRjQXLwM9u
 XladnDvleFOInN1ISUMJiPSSqqy/2WJWNdQ6/Kd+v0st02Dl1RIrfMZtl
 RwiUFlVi9nb5qT3gvE3/PfmRiGF+jCgy50OmcU/CD+Aq0lMsWlznquCQA
 wUSU3aFREUHTXq64EPP8KzFhgpo7udZQB0mysE/Lj4hs6nlqaFxhtbWTa
 l1oxVixvEWJRyZtdt8YqUd5FZgyD0uPCMSUWejGtohcvXny9fdjxjYhfH
 4a++J1d/6eXGIQHDna5yMmPjMqKRvo0Ba/dtlqBrRDSuIm8RKENwR/fFa g==;
X-CSE-ConnectionGUID: ZXi9N82NRWKURDvr+kWK/A==
X-CSE-MsgGUID: GYgWDLufSBKvTChEjTyBJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40184256"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40184256"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:36 -0800
X-CSE-ConnectionGUID: LFmrOaYVStiF3OyiLguCRw==
X-CSE-MsgGUID: ysqfnkB/SHOstvFJ6wWCAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113437892"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:36 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 13/13] drm/xe/hwmon: Stop ignoring errors on probe
Date: Wed, 12 Feb 2025 11:36:00 -0800
Message-ID: <20250212193600.475089-14-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212193600.475089-1-lucas.demarchi@intel.com>
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
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
index 7469bbcdc65f2..4b4039cf29fd4 100644
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

