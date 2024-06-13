Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A390CC27C79
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F93210E1B9;
	Thu, 13 Jun 2024 04:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mc+gx+Yl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D246210E102
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252033; x=1749788033;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XAJRpBfzo5ZnByXPMeXdEUKzPeXusAh3b/5jS5OrhvQ=;
 b=Mc+gx+Yl0OamwUmgIOUm8H20GwXnYxL0TMh0EHMp4ExRqDbgEsltnV33
 wzvqvKKWKM+RHm7hkXZfHLr1MyVm4Sh3SlOx5oZc0XMZc1nOoFtIPMV0J
 dHvSLwcSL9q+aatMAjtF9QlTluxeSR/eoyj+/AQf28QrIyz+2B5DzAoyz
 nK2jnq1h0Rl3g9Ot2KStXjMf4AkZrYsKXrlBBNOnKzvGjVpkAYDXaAneS
 r30ECC5pYLkksU4oJdMcLe9GY8Lq1FuGvtUTvMNwUEUKH4SiKfT0iZVV9
 5jLIXUanE4aa4oSe4GZFfcMPIVBoCuMmjcTW5ViC6hmj9Hrt3f9Bmai4P w==;
X-CSE-ConnectionGUID: LSyFCLzhSL+LV6kpFu3c4w==
X-CSE-MsgGUID: LiXb/NBFSzCOv8JGZD1tfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847990"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847990"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:49 -0700
X-CSE-ConnectionGUID: +CwAsdz0RdOSG5V6EI2ksw==
X-CSE-MsgGUID: D8qARWEzRYy2kpqVue0Ing==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476364"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 38/42] drm/xe/svm: Introduce DRM_XE_SVM kernel config
Date: Thu, 13 Jun 2024 00:24:25 -0400
Message-Id: <20240613042429.637281-38-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613042429.637281-1-oak.zeng@intel.com>
References: <20240613042429.637281-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Introduce a DRM_XE_SVM kernel config entry for
xe svm feature. xe svm feature allows share
virtual address space between CPU and GPU program.

v1: Improve commit message (Thomas)
    Avoid using #if directive (Thomas)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/Kconfig   | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile.c | 11 ++++++++---
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 7bbe46a98ff1..27d6145cefa7 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -84,6 +84,27 @@ config DRM_XE_FORCE_PROBE
 	  4571.
 
 	  Use "!*" to block the probe of the driver for all known devices.
+config DRM_XE_SVM
+	bool "Enable Shared Virtual Memory support in xe"
+	depends on DRM_XE
+	depends on ARCH_ENABLE_MEMORY_HOTPLUG
+	depends on ARCH_ENABLE_MEMORY_HOTREMOVE
+	depends on MEMORY_HOTPLUG
+	depends on MEMORY_HOTREMOVE
+	depends on ARCH_HAS_PTE_DEVMAP
+	depends on SPARSEMEM_VMEMMAP
+	depends on ZONE_DEVICE
+	depends on DEVICE_PRIVATE
+	depends on MMU
+	select HMM_MIRROR
+	select MMU_NOTIFIER
+	default y
+	help
+	  Choose this option if you want Shared Virtual Memory (SVM)
+	  support in xe. With SVM, virtual address space is shared
+	  between CPU and GPU. This means any virtual address such
+	  as malloc or mmap returns, variables on stack, or global
+	  memory pointers, can be used for GPU transparently.
 
 menu "drm/Xe Debugging"
 depends on DRM_XE
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 6c50df281b11..1f938d001094 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -171,8 +171,13 @@ static void __init_drm_mem_region_ops(struct drm_mem_region_ops *ops)
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	int err;
-	struct xe_device *xe = tile_to_xe(tile);
-	struct drm_device *drm = &xe->drm;
+	struct xe_device __maybe_unused *xe;
+	struct drm_device __maybe_unused *drm;
+
+	if (IS_ENABLED(CONFIG_DRM_XE_SVM)) {
+		xe = tile_to_xe(tile);
+		drm = &xe->drm;
+	}
 
 	err = tile_ttm_mgr_init(tile);
 	if (err)
@@ -186,7 +191,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 
 	err = xe_tile_sysfs_init(tile);
 
-	if (xe->info.has_usm) {
+	if (IS_ENABLED(CONFIG_DRM_XE_SVM) && xe->info.has_usm) {
 		__init_drm_mem_region_ops(&tile->mem.vram.drm_mr.mr_ops);
 		drm_svm_register_mem_region(drm, &tile->mem.vram.drm_mr, MEMORY_DEVICE_PRIVATE);
 	}
-- 
2.26.3

