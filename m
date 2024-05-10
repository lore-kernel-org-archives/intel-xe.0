Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA92C25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165E410EEE9;
	Fri, 10 May 2024 18:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+Cm8BBt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3888510EEE9
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364751; x=1746900751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4kEZZ69f3qFS3aQNRzuWf9eNyR7MILrRHrAL3cuTR0Y=;
 b=F+Cm8BBtiKk1Sklx2CZ19t9ZFdp78VucUsZJD7WzHlsKRM3u7wjpFg4q
 1nfofi+i5JMrJqGJSHbSikYNYxjTcpbk+lb7yYofmy9xzCuh3umxrtiWh
 Mw/F2oZyPxIqLOMkox6QfJp9JwJlYALROD3lUxwE2HfjOxH246N6rmBtL
 XDGNGWY3qe5fG17Iiw0kOVusgy8Z95qeDEkJbMynpoN+xoAHgSIIxlH7B
 efGw+2Sk47qep3t7DIbUGhK3mGAzTmNGLbSGoetiPc1MZn8CNp4m1XmV4
 nA5E8Rb5kl9gLBDicxr3qT0woOGD0ti/+qbDqOsdbpQV54lO1oVYxapES Q==;
X-CSE-ConnectionGUID: 9fNwK1gPTr+BngzIzlbOXA==
X-CSE-MsgGUID: ikIwxwn5RBmpbc8eWPQ14A==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844578"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844578"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:31 -0700
X-CSE-ConnectionGUID: wckGX/35QSOipMdsj2BsuA==
X-CSE-MsgGUID: Fp2AxdorTU2Qcr0M8nsNTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544065"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:29 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 04/20] drm/xe: covert sysfs over to devm
Date: Fri, 10 May 2024 19:12:17 +0100
Message-ID: <20240510181212.264622-26-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510181212.264622-22-matthew.auld@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
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

Hotunplugging the device seems to result in stuff like:

kobject_add_internal failed for tile0 with -EEXIST, don't try to
register things with the same name in the same directory.

We only remove the sysfs as part of drmm, however that is tied to the
lifetime of the driver instance and not the device underneath. Attempt
to fix by using devm for all of the remaining sysfs stuff related to the
device.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1667
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1432
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c          |  4 ++--
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c           |  4 ++--
 drivers/gpu/drm/xe/xe_gt_freq.c               |  4 ++--
 drivers/gpu/drm/xe/xe_gt_idle.c               |  4 ++--
 drivers/gpu/drm/xe/xe_gt_sysfs.c              |  4 ++--
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     |  4 ++--
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 12 ++++++------
 drivers/gpu/drm/xe/xe_tile_sysfs.c            |  4 ++--
 drivers/gpu/drm/xe/xe_vram_freq.c             |  4 ++--
 9 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 21677b8cd977..7375937934fa 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -69,7 +69,7 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RW(vram_d3cold_threshold);
 
-static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
+static void xe_device_sysfs_fini(void *arg)
 {
 	struct xe_device *xe = arg;
 
@@ -85,5 +85,5 @@ int xe_device_sysfs_init(struct xe_device *xe)
 	if (ret)
 		return ret;
 
-	return drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
+	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index a34c9a24dafc..5d6ab24348a7 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -150,7 +150,7 @@ static const struct attribute *gt_ccs_mode_attrs[] = {
 	NULL,
 };
 
-static void xe_gt_ccs_mode_sysfs_fini(struct drm_device *drm, void *arg)
+static void xe_gt_ccs_mode_sysfs_fini(void *arg)
 {
 	struct xe_gt *gt = arg;
 
@@ -182,5 +182,5 @@ int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	return drmm_add_action_or_reset(&xe->drm, xe_gt_ccs_mode_sysfs_fini, gt);
+	return devm_add_action_or_reset(xe->drm.dev, xe_gt_ccs_mode_sysfs_fini, gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 855de40e40ea..e0305942644c 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -209,7 +209,7 @@ static const struct attribute *freq_attrs[] = {
 	NULL
 };
 
-static void freq_fini(struct drm_device *drm, void *arg)
+static void freq_fini(void *arg)
 {
 	struct kobject *kobj = arg;
 
@@ -237,7 +237,7 @@ int xe_gt_freq_init(struct xe_gt *gt)
 	if (!gt->freq)
 		return -ENOMEM;
 
-	err = drmm_add_action_or_reset(&xe->drm, freq_fini, gt->freq);
+	err = devm_add_action(xe->drm.dev, freq_fini, gt->freq);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index a4f6f0a96d05..749b7f4b688f 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -145,7 +145,7 @@ static const struct attribute *gt_idle_attrs[] = {
 	NULL,
 };
 
-static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
+static void gt_idle_sysfs_fini(void *arg)
 {
 	struct kobject *kobj = arg;
 
@@ -182,7 +182,7 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
 		return err;
 	}
 
-	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
+	return devm_add_action_or_reset(xe->drm.dev, gt_idle_sysfs_fini, kobj);
 }
 
 void xe_gt_idle_enable_c6(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index 1e5971072bc8..a05c3699e8b9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -22,7 +22,7 @@ static const struct kobj_type xe_gt_sysfs_kobj_type = {
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
-static void gt_sysfs_fini(struct drm_device *drm, void *arg)
+static void gt_sysfs_fini(void *arg)
 {
 	struct xe_gt *gt = arg;
 
@@ -51,5 +51,5 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
 
 	gt->sysfs = &kg->base;
 
-	return drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
+	return devm_add_action(xe->drm.dev, gt_sysfs_fini, gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
index fbe21a8599ca..c9e04151286d 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
@@ -229,7 +229,7 @@ static const struct attribute_group throttle_group_attrs = {
 	.attrs = throttle_attrs,
 };
 
-static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
+static void gt_throttle_sysfs_fini(void *arg)
 {
 	struct xe_gt *gt = arg;
 
@@ -245,5 +245,5 @@ int xe_gt_throttle_sysfs_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	return drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, gt);
+	return devm_add_action_or_reset(xe->drm.dev, gt_throttle_sysfs_fini, gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index 844ec68cbbb8..258078a6b461 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -492,7 +492,7 @@ static const struct attribute * const files[] = {
 	NULL
 };
 
-static void kobj_xe_hw_engine_class_fini(struct drm_device *drm, void *arg)
+static void kobj_xe_hw_engine_class_fini(void *arg)
 {
 	struct kobject *kobj = arg;
 
@@ -517,7 +517,7 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char
 	}
 	keclass->xe = xe;
 
-	err = drmm_add_action_or_reset(&xe->drm, kobj_xe_hw_engine_class_fini,
+	err = devm_add_action_or_reset(xe->drm.dev, kobj_xe_hw_engine_class_fini,
 				       &keclass->base);
 	if (err)
 		return NULL;
@@ -525,7 +525,7 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char
 	return keclass;
 }
 
-static void hw_engine_class_defaults_fini(struct drm_device *drm, void *arg)
+static void hw_engine_class_defaults_fini(void *arg)
 {
 	struct kobject *kobj = arg;
 
@@ -552,7 +552,7 @@ static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
 	if (err)
 		goto err_object;
 
-	return drmm_add_action_or_reset(&xe->drm, hw_engine_class_defaults_fini, kobj);
+	return devm_add_action_or_reset(xe->drm.dev, hw_engine_class_defaults_fini, kobj);
 
 err_object:
 	kobject_put(kobj);
@@ -611,7 +611,7 @@ static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
 	.sysfs_ops = &xe_hw_engine_class_sysfs_ops,
 };
 
-static void hw_engine_class_sysfs_fini(struct drm_device *drm, void *arg)
+static void hw_engine_class_sysfs_fini(void *arg)
 {
 	struct kobject *kobj = arg;
 
@@ -698,7 +698,7 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
 			goto err_object;
 	}
 
-	return drmm_add_action_or_reset(&xe->drm, hw_engine_class_sysfs_fini, kobj);
+	return devm_add_action_or_reset(xe->drm.dev, hw_engine_class_sysfs_fini, kobj);
 
 err_object:
 	kobject_put(kobj);
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 64661403afcd..b804234a6551 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -22,7 +22,7 @@ static const struct kobj_type xe_tile_sysfs_kobj_type = {
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
-static void tile_sysfs_fini(struct drm_device *drm, void *arg)
+static void tile_sysfs_fini(void *arg)
 {
 	struct xe_tile *tile = arg;
 
@@ -55,5 +55,5 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
 	if (err)
 		return err;
 
-	return drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
+	return devm_add_action_or_reset(xe->drm.dev, tile_sysfs_fini, tile);
 }
diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
index 3e21ddc6e60c..99ff95e408e0 100644
--- a/drivers/gpu/drm/xe/xe_vram_freq.c
+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
@@ -87,7 +87,7 @@ static const struct attribute_group freq_group_attrs = {
 	.attrs = freq_attrs,
 };
 
-static void vram_freq_sysfs_fini(struct drm_device *drm, void *arg)
+static void vram_freq_sysfs_fini(void *arg)
 {
 	struct kobject *kobj = arg;
 
@@ -122,5 +122,5 @@ int xe_vram_freq_sysfs_init(struct xe_tile *tile)
 		return err;
 	}
 
-	return drmm_add_action_or_reset(&xe->drm, vram_freq_sysfs_fini, kobj);
+	return devm_add_action_or_reset(xe->drm.dev, vram_freq_sysfs_fini, kobj);
 }
-- 
2.45.0

