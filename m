Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F51C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A36112F19;
	Tue,  9 Apr 2024 20:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHAubQmZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5212A10EE99
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693094; x=1744229094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VRXB3mfxgm+CwfAhRMECwEWuorIEmmFSbvhYPMXxhqc=;
 b=GHAubQmZN0s8ETiVvv6/AEkP5DHintAx5MmvXRj301+yGnSRjrvs8NoW
 VCw2DzNVVt+ksTAzob9DoObowshq/84lCNL5XRkuW35Bi6MN94phfZhSo
 3DpePRSUY8Jywx0KNGeuM0KAOU/66ffzU2nKkoLcJBDn6ToJtTfO7+JbS
 a5csTbNhr/zIhIaoqvtwGcxVDPoeRZIQycUEj0gR93I40vfrxcMw60jqs
 TyZwjxX+Mt6+JofeKzHzP3K3fNk99JfsS299t0Lopq9jt0UB7mx4e9ROW
 n2TGyPtUoJXVKJdwX2K+Zf7j8lya5mWucw15VPuPAKsBscD+SjAGpqLA6 A==;
X-CSE-ConnectionGUID: z+tqQDAJRBm2vU4OQwiRGA==
X-CSE-MsgGUID: 7cMnZATTTbmdj2w0yVMkWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803750"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803750"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: TZrcQLAJQtehrkjFLJZx9Q==
X-CSE-MsgGUID: 9UsYBegERICdqZkKBdC03Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773751"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 13/31] drm/xe/svm: Introduce DRM_XE_SVM kernel config
Date: Tue,  9 Apr 2024 16:17:24 -0400
Message-Id: <20240409201742.3042626-14-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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
 drivers/gpu/drm/xe/xe_tile.c |  7 +++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 449a1ecbc92a..0accb2cb81d6 100644
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
index f1c4f9de51df..a1a436912fe3 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -159,9 +159,12 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
  */
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
-	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_device __maybe_unused *xe;
 	int err;
 
+	if (IS_ENABLED(CONFIG_DRM_XE_SVM))
+		xe = tile_to_xe(tile);
+
 	xe_device_mem_access_get(tile_to_xe(tile));
 
 	err = tile_ttm_mgr_init(tile);
@@ -177,7 +180,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 
 	xe_tile_sysfs_init(tile);
 
-	if (xe->info.has_usm)
+	if (IS_ENABLED(CONFIG_DRM_XE_SVM) && xe->info.has_usm)
 		xe_devm_add(tile, &tile->mem.vram);
 err_mem_access:
 	xe_device_mem_access_put(tile_to_xe(tile));
-- 
2.26.3

