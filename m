Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16CCC10F16
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 15:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D04D11250A;
	Tue, 30 Apr 2024 15:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cwIfxt42";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFE2112367
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 15:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714492289; x=1746028289;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=Pc6T99MumclGrmsTGCss3tG5ZJwHBtuEFSleC4014uw=;
 b=cwIfxt42fGp4WGEXoKVQizXvWEGQVZZ0xGvlgx8oU/leiWUBr0DdmgsG
 uQM8K1hUl+BGVscZxh/W8i8Y+bvECaMaqyYSja7Zz57uptLpC0i4aB2f7
 REaCwp8k1wnVdZu1kJkVhI0BObpJRmXAN5kgk7LptkybcQsD3iBs8Rt2F
 hZ/FIrsWpMyvKLBBx4/ohAKM7BVd6R44Xmel8Sk3+75A7yILOSZuZfUl5
 q4m4q6B4GI0W2CGh5hhw1RaM4AGGHFJO9QQjnYommAkNhVKlixdSlgOBu
 Job6to4YFE86QKTllk/JrNPpa+kYEVJGlrrhm0vPEnizg9969uRJ6rWZn Q==;
X-CSE-ConnectionGUID: zl+C/g/8T3e+6NjBJgphnA==
X-CSE-MsgGUID: LgxvGCI1QeSQd0pssGlZGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="13133471"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="13133471"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 08:51:28 -0700
X-CSE-ConnectionGUID: ExROXnrGRrSA/qJ+ascmtg==
X-CSE-MsgGUID: t0pn7p6yQBiAKf3BopGMQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="30972752"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 08:51:28 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 30 Apr 2024 17:51:11 +0200
Subject: [PATCH] drm/xe: remove sysfs entries on driver unbind
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-hotrebind_xu-v1-1-3c5e88d1516b@intel.com>
X-B4-Tracking: v=1; b=H4sIAG4TMWYC/x3MTQqDMBBA4avIrDsQTcC2Vyml5GdsZtGxTLQEx
 Lsbu/wW721QSJkK3LsNlH5ceJaG/tJBzF7ehJyaYTCDM84azPOiFFjSq654vY0xWtdbP07Qkq/
 SxPW/ezybgy+EQb3EfE6SfrASCtUF9v0AYQ3jIXwAAAA=
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12237;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=Pc6T99MumclGrmsTGCss3tG5ZJwHBtuEFSleC4014uw=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmMRN+NK+UyNax4BLfJHPZ3ypJbHWOuOvmOqNLIZK1
 kEZ8wzaJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZjETfgAKCRAjYrKT3hD91x+2C/
 wOTZTctfEdHj/1UB5nmxucWofzA9cIHyGCxDn4u2rtauBj9sHviBpsxkedZomV2f6YnzsKQ9t6PwCN
 B97yI4dlX6v/mclGlzv+jLrSVDx1ARLjsu3OgI53Iqy8mgX3dVrP9Jw5KhunxS4gYh7eBmMtGyiiuF
 KhkjmhfMeMd3lGep27G+/cU9h2AhYJG/A1jL5p/LraoT58rCr3d3nsDTRw5DTu+NTDK/cm9X3MoiID
 t+wupSlnsK0qhCkVPVCBWqAIUdiBttZTWuSL6/PnwO18kHommIO5haR3bmJ1mI5RvE7zrvrIHDUOEb
 YWwWfh3eTKg1cv1krUfoNMRJSCSGN8Spduelfa4txGD7T4qjAUi2TL/gw3kUZQyyiphs7g8fwhi+YA
 O6KUVBEtJw3RLFAfEuMW5s+nD3V6Oh534lHQ1OR2HtaN/THfsG+aG/sKJ5scYk+E1pGmrSykUbBrd5
 Rf5PJ5R/UIu+Lzr9BQssKsn8Cvyqkx2eRFe+uGYFRUcrE=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

After unbinding driver from the device, driver is responsible for
leaving the device in it's initial state, to be ready to bind to another
driver or to rebind. Particularly device sysfs entries added by the driver
should disappear. Removing them together with drm device is too late,
as it's life-time can be prolonged by userspace keeping open drm
descriptor. Removing them at driver's unbind seems the proper solution.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
Hi all,

xe driver seems to be not protected against hot-rebind scenario - driver
re-bind with opened drm descriptor.
This patch solves one of the issues - removal of sysfs entires, but
apparently there are more:
[  845.740016] ---[ end trace 0000000000000000 ]---
[  845.771285] xe 0000:00:02.0: [drm] *ERROR* power well DC_off state mismatch (refcount 1/enabled 0)
[  845.771309] xe 0000:00:02.0: [drm] *ERROR* power well PW_2 state mismatch (refcount 1/enabled 0)
[  845.771324] xe 0000:00:02.0: [drm] *ERROR* power well PW_A state mismatch (refcount 1/enabled 0)
[  845.771338] xe 0000:00:02.0: [drm] *ERROR* power well PW_B state mismatch (refcount 1/enabled 0)
[  845.771351] xe 0000:00:02.0: [drm] *ERROR* power well PW_C state mismatch (refcount 1/enabled 0)
[  845.771365] xe 0000:00:02.0: [drm] *ERROR* power well PW_D state mismatch (refcount 1/enabled 0)
[  845.774682] ------------[ cut here ]------------
[  845.774697] xe 0000:00:02.0: Missing outer runtime PM protection
[  845.774743] WARNING: CPU: 16 PID: 2228 at drivers/gpu/drm/xe/xe_pm.c:550 xe_pm_runtime_get_noresume+0x141/0x1d0 [xe]
...
[  845.777795] Call Trace:
[  845.777801]  <TASK>
[  845.777809]  ? show_regs+0x71/0x90
[  845.777824]  ? __warn+0xce/0x300
[  845.777835]  ? xe_pm_runtime_get_noresume+0x141/0x1d0 [xe]
[  845.778002]  ? report_bug+0x2ad/0x300
[  845.778015]  ? handle_bug+0x46/0x90
[  845.778027]  ? exc_invalid_op+0x19/0x50
[  845.778037]  ? asm_exc_invalid_op+0x1b/0x20
[  845.778052]  ? xe_pm_runtime_get_noresume+0x141/0x1d0 [xe]
[  845.778215]  xe_ggtt_remove_node+0x69/0x1c0 [xe]
[  845.780754]  xe_ggtt_remove_bo+0x10a/0x650 [xe]
[  845.780909]  ? __pfx_xe_ggtt_remove_bo+0x10/0x10 [xe]
[  845.781064]  ? _raw_write_unlock+0x23/0x50
[  845.781076]  ? drm_vma_offset_remove+0x72/0x90 [drm]
[  845.781190]  xe_ttm_bo_destroy+0x351/0x770 [xe]
[  845.781341]  ? ww_mutex_unlock+0x1a6/0x280
[  845.781354]  ttm_bo_release+0x41d/0xae0 [ttm]
[  845.781380]  ? __pfx_ttm_bo_release+0x10/0x10 [ttm]
[  845.781402]  ? __pfx___mutex_unlock_slowpath+0x10/0x10
[  845.781413]  ? __kasan_check_read+0x11/0x20
[  845.781425]  ? do_raw_spin_unlock+0x5c/0x210
[  845.781437]  ? _raw_spin_unlock+0x23/0x50
[  845.781448]  ttm_bo_put+0x50/0x80 [ttm]
[  845.781469]  xe_gem_object_free+0x88/0x190 [xe]
[  845.781610]  drm_gem_object_free+0x59/0x90 [drm]
[  845.781697]  __xe_bo_unpin_map_no_vm+0xcf/0x110 [xe]
[  845.781839]  drm_managed_release+0x1a3/0x4e0 [drm]
[  845.781925]  ? drm_client_dev_restore+0x1f4/0x280 [drm]
[  845.782001]  drm_minor_release+0xd1/0x140 [drm]
[  845.782079]  drm_release_noglobal+0xad/0x100 [drm]

I guess after device remove call driver should not touch the hardware
at all, it could only maintain objects allocated by userspace in kind
of zombie mode - no interactions with hw, if userspace request hw access
return error.
Question to maintainers of xe/drm. How should it be implemented in xe
driver?
Or maybe drm provides already well tested way of handling such cases?

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
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
index 21677b8cd977..8d096db750fa 100644
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
+	return devm_add_action_or_reset(xe->drm.dev, xe_device_sysfs_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 396aeb5b9924..890da8870b0d 100644
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
index 855de40e40ea..ed7949df5bf5 100644
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
+	err = devm_add_action_or_reset(xe->drm.dev, freq_fini, gt->freq);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 8fc0f3f6ecc5..9e907033f32b 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -144,7 +144,7 @@ static const struct attribute *gt_idle_attrs[] = {
 	NULL,
 };
 
-static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
+static void gt_idle_sysfs_fini(void *arg)
 {
 	struct kobject *kobj = arg;
 
@@ -181,7 +181,7 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
 		return err;
 	}
 
-	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
+	return devm_add_action_or_reset(xe->drm.dev, gt_idle_sysfs_fini, kobj);
 }
 
 void xe_gt_idle_enable_c6(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index 1e5971072bc8..ec2b8246204b 100644
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
+	return devm_add_action_or_reset(xe->drm.dev, gt_sysfs_fini, gt);
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
index 64661403afcd..12b2c3e5c421 100644
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
+	return devm_add_action_or_reset(dev, tile_sysfs_fini, tile);
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

---
base-commit: 4caf410766add8cf376a3afc910b17dd0961dd75
change-id: 20240430-hotrebind_xu-897cc3413a7f

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

