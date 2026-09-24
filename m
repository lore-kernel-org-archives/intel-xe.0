Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6AAC9832F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 23:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF75210F7FA;
	Thu, 24 Sep 2026 23:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIeyLCk3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB4710E558
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 23:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790290883; x=1821826883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L9o1reQsapOX6YWxjnDnupUgrb4UmoyWoWDCnTGeIWU=;
 b=hIeyLCk3yBkxiiN11OcIY1q+DD5fdjhEjeNO9dHk3xHOA7NWctmQQHeB
 M7wgJeG/j0htvdDaYYbaXdQmLWDCamjm00rJiHjM8Cd1euW8g2KliDyxX
 U2iMcRp6L2TCvtHaiqmvlORbL05OFiUG6OQdI0815YdE9oypW7mCNr1Oi
 q+KH8u5ro7JnxtUdfD2RBFuULGiQVEyJB4yka9QTLk2Qu4PzBnMK2zU8F
 PykPHQCjrRIOYMuBmJGL+KgGlPXcP/U9Ob3uAH91qIXKfvqYNMaUoAIJA
 1oMMD6cKuksfju6o5Rt+oBBEf5pNJzb6C+ZOtp8uvGhG4EMc6jEQRPZkj Q==;
X-CSE-ConnectionGUID: GJHnRMxuTz2iwZG9YXeEzA==
X-CSE-MsgGUID: PmufXpYIQteRg65bnf0+CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90120171"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90120171"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 16:01:22 -0700
X-CSE-ConnectionGUID: EHrIcTQDSdS2jbi15YMqLA==
X-CSE-MsgGUID: o8pVjO/6QMa6w0mEOD+0Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="270651600"
Received: from dut4435arlh.fm.intel.com ([10.105.8.61])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 16:01:22 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 04/16] drm/xe: Require CONFIGFS_FS
Date: Thu, 24 Sep 2026 23:01:23 +0000
Message-ID: <20260924230120.389685-22-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924230120.389685-18-stuart.summers@intel.com>
References: <20260924230120.389685-18-stuart.summers@intel.com>
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

configfs is not optional for xe in practice: a growing set of device
settings is only reachable through it, and the !CONFIGFS_FS stubs
silently return defaults instead, so those builds quietly ignore every
configfs knob. Select it and drop the stubs rather than keep growing a
second, no-op copy of the getter API.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-opus-5
---
 drivers/gpu/drm/xe/Kconfig       |  1 +
 drivers/gpu/drm/xe/Makefile      |  2 +-
 drivers/gpu/drm/xe/xe_configfs.h | 32 --------------------------------
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 4d7dcaff2b91..a24b5e574699 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -6,6 +6,7 @@ config DRM_XE
 	depends on INTEL_VSEC || !INTEL_VSEC
 	depends on X86_PLATFORM_DEVICES || !(X86 && ACPI)
 	depends on PAGE_SIZE_4KB || COMPILE_TEST || BROKEN
+	select CONFIGFS_FS
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
 	# the shmem_readpage() which depends upon tmpfs
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index ba4404896f2f..aa5d6184713b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -164,7 +164,7 @@ xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
 xe-$(CONFIG_HWMON) += xe_hwmon.o
 
 xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
-xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
+xe-y += xe_configfs.o
 
 # graphics virtualization (SR-IOV) support
 xe-y += \
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index f89dc0ffb884..ff902d7488ca 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -5,16 +5,12 @@
 #ifndef _XE_CONFIGFS_H_
 #define _XE_CONFIGFS_H_
 
-#include <linux/limits.h>
 #include <linux/types.h>
 
-#include "xe_defaults.h"
 #include "xe_hw_engine_types.h"
-#include "xe_module.h"
 
 struct pci_dev;
 
-#if IS_ENABLED(CONFIG_CONFIGFS_FS)
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
@@ -35,33 +31,5 @@ ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
 bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
 #endif
-#else
-static inline int xe_configfs_init(void) { return 0; }
-static inline void xe_configfs_exit(void) { }
-static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
-static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
-static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
-static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
-static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
-static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
-static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
-static inline bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev) { return false; }
-static inline ssize_t xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
-							 enum xe_engine_class class,
-							 u32 *cs, size_t max_len) { return 0; }
-static inline ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
-							  enum xe_engine_class class,
-							  u32 *cs, size_t max_len) { return 0; }
-#ifdef CONFIG_PCI_IOV
-static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
-{
-	return xe_modparam.max_vfs;
-}
-static inline bool xe_configfs_admin_only_pf(struct pci_dev *pdev)
-{
-	return XE_DEFAULT_ADMIN_ONLY_PF;
-}
-#endif
-#endif
 
 #endif
-- 
2.43.0

