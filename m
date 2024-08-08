Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30589C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 17:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0222A10E7AA;
	Thu,  8 Aug 2024 17:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YX24nxS1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E9410E7A1
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 17:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723137091; x=1754673091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gn+qtC5eIDpstWHkg9ioDAK4rgu80TEqXceCgH6uf2s=;
 b=YX24nxS1RLHcwCQkgG8pLcHroAxOAsbuBUaP82FktQ9TSNHHHuwSZMfp
 PuqtmiuhXAL9pdApaDsvayE9DWfXnRKUm2PXGQwNBbBtUQya4ZoIZGIDe
 +6iwwP+DW4k/TcAblt5BDjPLh3FbzYiLq+lDERRnrxIUlq7wW4G5c6Eyu
 0iyzWMJy+TLGklWUEXqVtHtuOuFFmuiP3erZUitivKmW6ncZXQ6L+7/li
 J2/GR96x6qv95XT6LhS6d0nZdeOv1aZ8sQExrkD4M8pTuJIdKtyJ3Nqa3
 wgu2Th0t1xMzagR5m29yf/aRRM2UPjnXI+ahyMRC4nl4Rbfn0iYbbiATP w==;
X-CSE-ConnectionGUID: IbkXNYrNRv2Dcg3DBNeHEA==
X-CSE-MsgGUID: yvK2XN9RSiu5+Of3UoyivQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32428508"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="32428508"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:11:30 -0700
X-CSE-ConnectionGUID: uyzwnbn0RsyXDVRjP6MSPQ==
X-CSE-MsgGUID: X5Rgyrg+T4a40YT6x0OuRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="57988139"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:11:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Allow to compile out debugfs
Date: Thu,  8 Aug 2024 10:11:21 -0700
Message-ID: <20240808171121.2484237-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Use a dummy xe_debugfs_register() if debugfs is not enabled and move all
debugfs-related files under `ifeq ($(CONFIG_DEBUG_FS),y)` in the
Makefile. This is similar to what was done for display in
commit 439987f6f471 ("drm/xe: don't build debugfs files when
CONFIG_DEBUG_FS=n").

This removes the following warning while loading xe with
CONFIG_DEUBG_FS=n:

	xe 0000:03:00.0: [drm] Create GT directory failed

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile     | 16 +++++++++-------
 drivers/gpu/drm/xe/xe_debugfs.h |  4 ++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1ff9602a52f6..b846b36a7bfd 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -28,7 +28,6 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
 xe-y += xe_bb.o \
 	xe_bo.o \
 	xe_bo_evict.o \
-	xe_debugfs.o \
 	xe_devcoredump.o \
 	xe_device.o \
 	xe_device_sysfs.o \
@@ -46,7 +45,6 @@ xe-y += xe_bb.o \
 	xe_gt.o \
 	xe_gt_ccs_mode.o \
 	xe_gt_clock.o \
-	xe_gt_debugfs.o \
 	xe_gt_freq.o \
 	xe_gt_idle.o \
 	xe_gt_mcr.o \
@@ -59,7 +57,6 @@ xe-y += xe_bb.o \
 	xe_guc_ads.o \
 	xe_guc_ct.o \
 	xe_guc_db_mgr.o \
-	xe_guc_debugfs.o \
 	xe_guc_hwconfig.o \
 	xe_guc_id_mgr.o \
 	xe_guc_klv_helpers.o \
@@ -71,7 +68,6 @@ xe-y += xe_bb.o \
 	xe_hw_engine_class_sysfs.o \
 	xe_hw_fence.o \
 	xe_huc.o \
-	xe_huc_debugfs.o \
 	xe_irq.o \
 	xe_lrc.o \
 	xe_migrate.o \
@@ -107,7 +103,6 @@ xe-y += xe_bb.o \
 	xe_ttm_vram_mgr.o \
 	xe_tuning.o \
 	xe_uc.o \
-	xe_uc_debugfs.o \
 	xe_uc_fw.o \
 	xe_vm.o \
 	xe_vram.o \
@@ -124,7 +119,6 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
 # graphics virtualization (SR-IOV) support
 xe-y += \
 	xe_gt_sriov_vf.o \
-	xe_gt_sriov_vf_debugfs.o \
 	xe_guc_relay.o \
 	xe_memirq.o \
 	xe_sriov.o
@@ -133,7 +127,6 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_gt_sriov_pf.o \
 	xe_gt_sriov_pf_config.o \
 	xe_gt_sriov_pf_control.o \
-	xe_gt_sriov_pf_debugfs.o \
 	xe_gt_sriov_pf_monitor.o \
 	xe_gt_sriov_pf_policy.o \
 	xe_gt_sriov_pf_service.o \
@@ -281,6 +274,15 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
 endif
 
 ifeq ($(CONFIG_DEBUG_FS),y)
+	xe-y += xe_debugfs.o \
+		xe_gt_debugfs.o \
+		xe_gt_sriov_vf_debugfs.o \
+		xe_guc_debugfs.o \
+		xe_huc_debugfs.o \
+		xe_uc_debugfs.o
+
+	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
+
 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
 		i915-display/intel_display_debugfs.o \
 		i915-display/intel_display_debugfs_params.o \
diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
index 715b8e2e0bd9..17f4c2f1b5e4 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.h
+++ b/drivers/gpu/drm/xe/xe_debugfs.h
@@ -8,6 +8,10 @@
 
 struct xe_device;
 
+#ifdef CONFIG_DEBUG_FS
 void xe_debugfs_register(struct xe_device *xe);
+#else
+static inline void xe_debugfs_register(struct xe_device *xe) { }
+#endif
 
 #endif
-- 
2.43.0

