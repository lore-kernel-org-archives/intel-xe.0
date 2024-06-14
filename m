Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CD6C41513
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3C110E2BA;
	Fri, 14 Jun 2024 21:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gUY+fNTp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02BC10E2B7
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401660; x=1749937660;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MfFG6yUSDe30tzhW0r74o+cMNMirgCwlgqoBUo30DfM=;
 b=gUY+fNTpqrBva1wfGyufDDcxP/kfsYQX9+wGD4FBdfwOziKtRLShf8XY
 ljWfBAOUHomU06tDflC32TQw3tiF+2MmgGAYTz3ZogI1foj+e+dQbEwfD
 BoG0pzGnVIAG1UWC/lkTjTHCl2pP7w76G7JmGKIYGcK6WOHByvW1MdcvQ
 yi3vkHIshsJpG5yKIRyTrnhnt4qhVEm8QdudSD7KLsL6CtW36p1BYR6gV
 nmfbyG9H7Ued680FzBhgmm3DvCPSn68kAPwsLUiZ0piasHD+F/2nG8SZF
 +2LcDXEfRru07aTqIxVpeoOOHRLmB9XaYbUA6zJSgsiKmKr6PNPz7fVlr g==;
X-CSE-ConnectionGUID: 3LFFTFOGQEGyRDqB96rhKA==
X-CSE-MsgGUID: szpt2vsqTzSEqhq1m4khdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886600"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886600"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
X-CSE-ConnectionGUID: gCftYtiHRlSKzFjf+D9NiQ==
X-CSE-MsgGUID: pbun/F4eTg6bpL871NqscQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572434"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 40/44] drm/xe/svm: Introduce DRM_XE_SVM kernel config
Date: Fri, 14 Jun 2024 17:58:13 -0400
Message-Id: <20240614215817.1097633-40-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
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
 drivers/gpu/drm/xe/Kconfig   | 11 +++++++++++
 drivers/gpu/drm/xe/xe_tile.c | 11 ++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 7bbe46a98ff1..29d583ed6cd0 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -84,6 +84,17 @@ config DRM_XE_FORCE_PROBE
 	  4571.
 
 	  Use "!*" to block the probe of the driver for all known devices.
+config DRM_XE_SVM
+	bool "Enable Shared Virtual Memory support in xe"
+	depends on DRM_XE
+	depends on DRM_SVM
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

