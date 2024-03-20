Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949D3C54E58
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 03:32:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8DA10E089;
	Wed, 20 Mar 2024 03:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGOcYEBF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E039E10E7FF
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 03:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710905530; x=1742441530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uVqoHX45a0L1DY+/eU1yyseVvsPgwcWxeIwW5nSRAlk=;
 b=RGOcYEBFxgX1oUFJjITs1c9RBTnPCW33sHYkyeZn+js3tA40t35od33E
 iMtASDvl6BiVr1m2XyFDnCS9oPwPFNjViYSLGsavwjly7EpTGaZ3ScHCz
 0gtUcAw6BPgOhyPHpM+wyQVsBWYO6wJWSmcFqcE+POzFv5TDpjqbugoDC
 KP9lH1SHXTbp/t6C3+zTw50OYBseWAs+fY/NWnzH0MBG4N73WeQskdE1O
 uyR2LHwZ0ccPLolsoLc28599DFA+TayfoY1LZnGqwZ33qfiCSjdqnO9Q8
 oeNU5NiBLx1hzE1IxIjKtiETNrBw/JEeoAOkh520d0T+h8pzf1I6hAR0o Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5688804"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="5688804"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 20:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="18599088"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 20:32:09 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, brian.welty@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 2/8] drm/xe/svm: Introduce DRM_XE_SVM kernel config
Date: Tue, 19 Mar 2024 23:44:19 -0400
Message-Id: <20240320034425.1785007-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240320034425.1785007-1-oak.zeng@intel.com>
References: <20240320034425.1785007-1-oak.zeng@intel.com>
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

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/Kconfig   | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile.c |  4 +++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 1a556d087e63..e244165459c5 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -83,6 +83,27 @@ config DRM_XE_FORCE_PROBE
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
index f1c4f9de51df..a484799364c9 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -159,7 +159,9 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
  */
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
+#if IS_ENABLED(CONFIG_DRM_XE_SVM)
 	struct xe_device *xe = tile_to_xe(tile);
+#endif
 	int err;
 
 	xe_device_mem_access_get(tile_to_xe(tile));
@@ -177,7 +179,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 
 	xe_tile_sysfs_init(tile);
 
-	if (xe->info.has_usm)
+	if (IS_ENABLED(CONFIG_DRM_XE_SVM) && xe->info.has_usm)
 		xe_devm_add(tile, &tile->mem.vram);
 err_mem_access:
 	xe_device_mem_access_put(tile_to_xe(tile));
-- 
2.26.3

