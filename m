Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A86AD1A63D
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 22:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC93910E0F6;
	Fri,  9 Jan 2026 22:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+YM9Gej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B7310E0F6
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 22:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767996199; x=1799532199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fUj0YaCRMqr05giZQWVEbdH1WsjzZMLliNPVyCMQ5tA=;
 b=k+YM9GejWpDkZbmlGzIU4VcvT4wPhCRO2rcJUtOA7uANWf7izFqZkpcp
 eKPGmP2dyEMj9pygWbuFobKN8OPYptagnvSsOOI/yKraOedGu+OFyvO+0
 RxWf+Eu8G6RdnpD+PBvDYKzEIsvmC1YrujYCuRy6M57bAkCAldk4YNPe0
 00KKw67/d8c1dzuhRekQ9YCiNtlYWpUN/DfxilceIBNxfPKOPZxYh05Z4
 I7Q2jmBtdx2/1TwXYHInYU+VFnzmU1kqpAr1wMSQP8Sew2rOlpQU+ETrN
 +QjP0xPJSmfu4Jxnczj4Dka06i+9mSmie4UfJsDpHVFmYJmSXFeoeBSaf A==;
X-CSE-ConnectionGUID: MpSiktt1SOuSmTz+woE7tw==
X-CSE-MsgGUID: 6yn18rsVRz6ydv0BSRzW4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69427281"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="69427281"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 14:03:18 -0800
X-CSE-ConnectionGUID: 1peatv52S7mreV/FYAHNdg==
X-CSE-MsgGUID: ywIZ4OZWSj2APBhf/kxBVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="208099456"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa004.jf.intel.com with ESMTP; 09 Jan 2026 14:03:16 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH] drm/xe: Manage nvm aux cleanup with devres
Date: Fri,  9 Jan 2026 22:00:27 +0000
Message-ID: <20260109220026.2468067-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

Move nvm teardown to a devm-managed action registered from xe_nvm_init().
This ensures the auxiliary NVM device is deleted on probe failure and
device detach without requiring explicit calls from remove paths.

As part of this, drop xe_nvm_fini() from xe_device_remove() and from the
survivability sysfs teardown, and remove the public xe_nvm_fini() API from
the header.

This is to fix below warn message when there is probe failure after
xe_nvm_init(), then xe_device_probe() is called again:
"
[  207.318152] sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/xe.nvm.768'
[  207.318157] CPU: 5 UID: 0 PID: 10261 Comm: modprobe Tainted: G    B   W           6.19.0-rc2-lgci-xe-kernel+ #223 PREEMPT(voluntary)
[  207.318160] Tainted: [B]=BAD_PAGE, [W]=WARN
[  207.318161] Hardware name: ASUS System Product Name/PRIME Z790-P WIFI, BIOS 0812 02/24/2023
[  207.318163] Call Trace:
[  207.318163]  <TASK>
[  207.318165]  dump_stack_lvl+0xa0/0xc0
[  207.318170]  dump_stack+0x10/0x20
[  207.318171]  sysfs_warn_dup+0xd5/0x110
[  207.318175]  sysfs_create_dir_ns+0x1f6/0x280
[  207.318177]  ? __pfx_sysfs_create_dir_ns+0x10/0x10
[  207.318179]  ? lock_acquire+0x1a4/0x2e0
[  207.318182]  ? __kasan_check_read+0x11/0x20
[  207.318185]  ? do_raw_spin_unlock+0x5c/0x240
[  207.318187]  kobject_add_internal+0x28d/0x8e0
[  207.318189]  kobject_add+0x11f/0x1f0
[  207.318191]  ? __pfx_kobject_add+0x10/0x10
[  207.318193]  ? lockdep_init_map_type+0x4b/0x230
[  207.318195]  ? get_device_parent.isra.0+0x43/0x4c0
[  207.318197]  ? kobject_get+0x55/0xf0
[  207.318199]  device_add+0x2d7/0x1500
[  207.318201]  ? __pfx_device_add+0x10/0x10
[  207.318203]  ? lockdep_init_map_type+0x4b/0x230
[  207.318205]  __auxiliary_device_add+0x99/0x140
[  207.318208]  xe_nvm_init+0x7a2/0xef0 [xe]
[  207.318333]  ? xe_devcoredump_init+0x80/0x110 [xe]
[  207.318452]  ? __devm_add_action+0x82/0xc0
[  207.318454]  ? fs_reclaim_release+0xc0/0x110
[  207.318457]  xe_device_probe+0x17dd/0x2c40 [xe]
[  207.318574]  ? __pfx___drm_dev_dbg+0x10/0x10
[  207.318576]  ? add_dr+0x180/0x220
[  207.318579]  ? __pfx___drmm_mutex_release+0x10/0x10
[  207.318582]  ? __pfx_xe_device_probe+0x10/0x10 [xe]
[  207.318697]  ? xe_pm_init_early+0x33a/0x410 [xe]
[  207.318850]  xe_pci_probe+0x936/0x1250 [xe]
[  207.318999]  ? lock_acquire+0x1a4/0x2e0
[  207.319003]  ? __pfx_xe_pci_probe+0x10/0x10 [xe]
[  207.319151]  local_pci_probe+0xe6/0x1a0
[  207.319154]  pci_device_probe+0x523/0x840
[  207.319157]  ? __pfx_pci_device_probe+0x10/0x10
[  207.319159]  ? sysfs_do_create_link_sd.isra.0+0x8c/0x110
[  207.319162]  ? sysfs_create_link+0x48/0xc0
...
"

Fixes: c28bfb107dac ("drm/xe/nvm: add on-die non-volatile memory device")
Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c             |  2 -
 drivers/gpu/drm/xe/xe_nvm.c                | 43 +++++++++++-----------
 drivers/gpu/drm/xe/xe_nvm.h                |  2 -
 drivers/gpu/drm/xe/xe_survivability_mode.c |  4 --
 4 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 329d17fd6100..e08d95554f2a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1068,8 +1068,6 @@ void xe_device_remove(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
 
-	xe_nvm_fini(xe);
-
 	drm_dev_unplug(&xe->drm);
 
 	xe_bo_pci_dev_remove_all(xe);
diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 01510061d4d4..1202a7abc46f 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -95,6 +95,27 @@ static bool xe_nvm_writable_override(struct xe_device *xe)
 	return writable_override;
 }
 
+static void xe_nvm_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct intel_dg_nvm_dev *nvm = xe->nvm;
+
+	if (!xe->info.has_gsc_nvm)
+		return;
+
+	/* No access to internal NVM from VFs */
+	if (IS_SRIOV_VF(xe))
+		return;
+
+	/* Nvm pointer should not be NULL here */
+	if (WARN_ON(!nvm))
+		return;
+
+	auxiliary_device_delete(&nvm->aux_dev);
+	auxiliary_device_uninit(&nvm->aux_dev);
+	xe->nvm = NULL;
+}
+
 int xe_nvm_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -153,30 +174,10 @@ int xe_nvm_init(struct xe_device *xe)
 		auxiliary_device_uninit(aux_dev);
 		goto err;
 	}
-	return 0;
+	return devm_add_action_or_reset(xe->drm.dev, xe_nvm_fini, xe);
 
 err:
 	kfree(nvm);
 	xe->nvm = NULL;
 	return ret;
 }
-
-void xe_nvm_fini(struct xe_device *xe)
-{
-	struct intel_dg_nvm_dev *nvm = xe->nvm;
-
-	if (!xe->info.has_gsc_nvm)
-		return;
-
-	/* No access to internal NVM from VFs */
-	if (IS_SRIOV_VF(xe))
-		return;
-
-	/* Nvm pointer should not be NULL here */
-	if (WARN_ON(!nvm))
-		return;
-
-	auxiliary_device_delete(&nvm->aux_dev);
-	auxiliary_device_uninit(&nvm->aux_dev);
-	xe->nvm = NULL;
-}
diff --git a/drivers/gpu/drm/xe/xe_nvm.h b/drivers/gpu/drm/xe/xe_nvm.h
index 7f3d5f57bed0..fd3467ad35a4 100644
--- a/drivers/gpu/drm/xe/xe_nvm.h
+++ b/drivers/gpu/drm/xe/xe_nvm.h
@@ -10,6 +10,4 @@ struct xe_device;
 
 int xe_nvm_init(struct xe_device *xe);
 
-void xe_nvm_fini(struct xe_device *xe);
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 31456f432fc8..ff406e9a82cb 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -234,13 +234,9 @@ static SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
 static void xe_survivability_mode_fini(void *arg)
 {
 	struct xe_device *xe = arg;
-	struct xe_survivability *survivability = &xe->survivability;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct device *dev = &pdev->dev;
 
-	if (survivability->fdo_mode)
-		xe_nvm_fini(xe);
-
 	device_remove_file(dev, &dev_attr_survivability_mode);
 }
 
-- 
2.50.1

