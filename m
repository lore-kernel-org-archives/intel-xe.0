Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FBBCD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 11:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17FF10F039;
	Wed, 20 May 2026 11:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fy3i1aLk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E676810F039
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 11:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779277188; x=1810813188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9a50VuhidNJ2zsnUCDO8npyOpdGfja2fsWZWPs0a56M=;
 b=fy3i1aLkODiu0mKspFqqZWf1ZR9uU+ZgaLtMe68WTy8UmucbUs9FUEh6
 W0c1s4o1vnZmK74NlCbyVLuk9aeki9A0IBfGfQJ9NIxaNWxXFxdqeGFX0
 qPr/wOXVZ3m+q29u8XBAV+nAZHNbFEgK/JjMLeAOwuLCqSVYDBUHpBo4U
 ibrPbiNbelzrZnsl+L8f+mzyAqjbyKSLoZJBlEMC4Sn5BrL9Oic+ex4om
 1QFtSjemE+0tcl7AxM9irVWQlsFcHDjaJukda4G9BwLbHl9KKIPkZxxyU
 NgyT1GeLa5rxx8bppEylXmlj3v0FFAEeUy7oCyHuhOYAPTPN1ja+qEPcs w==;
X-CSE-ConnectionGUID: ydn7il5ISVuPxSHnRMrWCg==
X-CSE-MsgGUID: Y87Dka5bT3OM/6MRXcIQBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80023173"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80023173"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 04:39:48 -0700
X-CSE-ConnectionGUID: xZ1rWNfrRASqA4T/beoi8g==
X-CSE-MsgGUID: xHWlfYkUSyK6mcTUClpuNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="233792260"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 20 May 2026 04:39:45 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 4/5] drm/xe/hw_error: Setup hardware error routing
Date: Wed, 20 May 2026 17:04:09 +0530
Message-ID: <20260520113622.171462-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520113622.171462-1-raag.jadav@intel.com>
References: <20260520113622.171462-1-raag.jadav@intel.com>
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

Hardware errors are reported through System Controller on the platforms
that support it. This requires that they are routed as PCIe errors
instead of direct IRQ to SGUnit, but this routing prevents the user from
investigating those errors in case it is needed for debug cases.

Setup hardware error routing based on XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
which bypasses System Controller and allows the user to investigate errors
without System Controller involvement.

                 default   with NO_RESET   w/o NO_RESET
                 -------   -------------   ------------
        fatal      PCIe         IRQ            PCIe
    non-fatal      IRQ          IRQ            PCIe
  correctable      IRQ          IRQ            PCIe

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Explain the usecase (Matt Roper)
    Allow hardware error routing through debugfs (Mallesh)
v3: Reorder macros (Riana)
    Squash debugfs patch with routing setup patch (Riana)
---
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  5 +++++
 drivers/gpu/drm/xe/xe_debugfs.c            |  4 ++++
 drivers/gpu/drm/xe/xe_hw_error.c           | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h           |  1 +
 drivers/gpu/drm/xe/xe_irq.c                |  1 +
 5 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
index 046e1756c698..e03a5e90993c 100644
--- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
@@ -34,6 +34,11 @@
 #define PVC_FAT_ERR_MASK				(FPU_FAT_ERR | GUC_FAT_ERR | \
 							 EU_GRF_FAT_ERR | SLM_FAT_ERR)
 
+#define DEV_ERR_ROUTING_CTRL				XE_REG(0x100170)
+#define   FATAL_ERR_ROUTING				BIT(2)
+#define   NONFATAL_ERR_ROUTING				BIT(1)
+#define   CORR_ERR_ROUTING				BIT(0)
+
 #define DEV_ERR_STAT_NONFATAL				0x100178
 #define DEV_ERR_STAT_CORRECTABLE			0x10017c
 #define DEV_ERR_STAT_REG(x)				XE_REG(_PICK_EVEN((x), \
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 22b471303984..f3b871acc030 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -20,6 +20,7 @@
 #include "xe_gt_printk.h"
 #include "xe_guc_ads.h"
 #include "xe_hw_engine.h"
+#include "xe_hw_error.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_psmi.h"
@@ -323,6 +324,9 @@ static int wedged_mode_set_reset_policy(struct xe_device *xe, enum xe_wedged_mod
 
 	xe->wedged.inconsistent_reset = false;
 
+	if (!IS_SRIOV_VF(xe))
+		xe_hw_error_irq_postinstall(xe);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index c1b6d57f5388..8f548e7f4b26 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -524,6 +524,26 @@ static int hw_error_info_init(struct xe_device *xe)
 	return xe_drm_ras_init(xe);
 }
 
+/**
+ * xe_hw_error_irq_postinstall - irq routing of hw errors
+ * @xe: xe device instance
+ *
+ * Set irq routing of hw errors.
+ */
+void xe_hw_error_irq_postinstall(struct xe_device *xe)
+{
+	u32 mask = CORR_ERR_ROUTING | NONFATAL_ERR_ROUTING | FATAL_ERR_ROUTING;
+	bool irq = xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET;
+	struct xe_tile *tile;
+	u8 id;
+
+	if (!xe->info.has_sysctrl)
+		return;
+
+	for_each_tile(tile, xe, id)
+		xe_mmio_rmw32(&tile->mmio, DEV_ERR_ROUTING_CTRL, mask, irq ? mask : 0);
+}
+
 /*
  * Process hardware errors during boot
  */
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index a9af4c947d77..fc3f54d5de58 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -11,5 +11,6 @@ struct xe_tile;
 struct xe_device;
 
 void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
+void xe_hw_error_irq_postinstall(struct xe_device *xe);
 int xe_hw_error_init(struct xe_device *xe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5ea50d203db1..92d7d8a5dbd9 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -708,6 +708,7 @@ static void xe_irq_postinstall(struct xe_device *xe)
 			xe_memirq_postinstall(&tile->memirq);
 	}
 
+	xe_hw_error_irq_postinstall(xe);
 	xe_display_irq_postinstall(xe);
 	xe_i2c_irq_postinstall(xe);
 
-- 
2.43.0

