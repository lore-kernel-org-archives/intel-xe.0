Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8A4C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 04:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0380010E0F8;
	Thu, 16 Mar 2023 04:03:24 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C77010E0F8
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 04:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678939402; x=1710475402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gLIwfliGgN5f8v/yrML201jcp3/qXiralCbPNk0NB5w=;
 b=PRj15ByvDI5xVfPGW0aZbDApd93Qjanp4tOYGXquyMdHMz7VeXhCWGGc
 HG5vZvS8a8axQ+8u9N+5LWXOOTx4bYEvQSrTu/riIkDTmzAZPRBiVfA5N
 y772pd/mcKmFFFgrqhnCVffMzKqNwbgeJB52j9zzXWrHP7y2WKKZu72sf
 eEyJf3Qo3GDb0bPTUU2R8+gdTFVCmad7E4v+UQ3xH9sFEMXm0ixKnk6Fr
 e/bsWXG0VC9u19Ny2NURfNxMDKLrz4DeHgPCOrIuvzMZU2gpCsPJ7FR5A
 TWaKCtd8RP4XYNeQP0g/nqYuEzaknWEjnzmt9KVLX3IokvZcxFMyQDD8t w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="365572372"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; d="scan'208";a="365572372"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 21:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="743953328"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; d="scan'208";a="743953328"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga008.fm.intel.com with ESMTP; 15 Mar 2023 21:03:20 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Mar 2023 09:35:43 +0530
Message-Id: <20230316040543.1616473-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230316040543.1616473-1-himal.prasad.ghimiray@intel.com>
References: <20230316040543.1616473-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] drm/xe/RAS: Count SOC and SGUNIT errors
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
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Count the SOC, SGUNIT hardware errors as signaled by relevant
interrupts and respective registers.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h | 192 +++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_device.c    |   5 +
 drivers/gpu/drm/xe/xe_gt.c        |   1 +
 drivers/gpu/drm/xe/xe_gt_types.h  |  28 ++++
 drivers/gpu/drm/xe/xe_irq.c       | 241 ++++++++++++++++++++++++++++++
 5 files changed, 426 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index fb772c8b12f5..65db44f2171e 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -92,10 +92,10 @@
 #define   GEN11_GU_MISC_IRQ			(1 << 29)
 #define   GEN11_DISPLAY_IRQ			(1 << 16)
 #define   GEN11_GT_DW_IRQ(x)			(1 << (x))
-#define   GEN12_FATAL_ERROR_IRQ                 REG_BIT(28)
-#define   GEN12_NON_FATAL_ERROR_IRQ             REG_BIT(27)
-#define   GEN12_CORRECTABLE_ERROR_IRQ           REG_BIT(26)
-#define   GEN12_ERROR_IRQ(x)                    REG_BIT(26 + (x))
+#define   GEN12_FATAL_ERROR_IRQ	         REG_BIT(28)
+#define   GEN12_NON_FATAL_ERROR_IRQ	     REG_BIT(27)
+#define   GEN12_CORRECTABLE_ERROR_IRQ	   REG_BIT(26)
+#define   GEN12_ERROR_IRQ(x)	            REG_BIT(26 + (x))
 
 #define DG1_MSTR_TILE_INTR			_MMIO(0x190008)
 #define   DG1_MSTR_IRQ				REG_BIT(31)
@@ -122,20 +122,20 @@ enum hardware_error {
 	HARDWARE_ERROR_MAX,
 };
 
-#define DEV_PCIEERR_STATUS              _MMIO(0x100180)
+#define DEV_PCIEERR_STATUS	      _MMIO(0x100180)
 #define DEV_PCIEERR_TILE_STATUS_MASK    REG_GENMASK(2, 0)
 #define DEV_PCIEERR_TILE_STATUS(x)      (DEV_PCIEERR_TILE_STATUS_MASK << (x * 4))
-#define DEV_PCIEERR_IS_FATAL(x)         (REG_BIT(2) << (x * 4))
-#define _DEV_ERR_STAT_FATAL             0x100174
-#define _DEV_ERR_STAT_NONFATAL          0x100178
+#define DEV_PCIEERR_IS_FATAL(x)	 (REG_BIT(2) << (x * 4))
+#define _DEV_ERR_STAT_FATAL	     0x100174
+#define _DEV_ERR_STAT_NONFATAL	  0x100178
 #define _DEV_ERR_STAT_CORRECTABLE       0x10017c
-#define DEV_ERR_STAT_REG(x)             _MMIO(_PICK_EVEN((x), \
+#define DEV_ERR_STAT_REG(x)	     _MMIO(_PICK_EVEN((x), \
 						_DEV_ERR_STAT_CORRECTABLE, \
 						_DEV_ERR_STAT_NONFATAL))
-#define  DEV_ERR_STAT_SOC_ERROR         REG_BIT(16)
+#define  DEV_ERR_STAT_SOC_ERROR	 REG_BIT(16)
 #define  DEV_ERR_STAT_SGUNIT_ERROR      REG_BIT(12)
-#define  DEV_ERR_STAT_GSC_ERROR         REG_BIT(8)
-#define  DEV_ERR_STAT_GT_ERROR          REG_BIT(0)
+#define  DEV_ERR_STAT_GSC_ERROR	 REG_BIT(8)
+#define  DEV_ERR_STAT_GT_ERROR	  REG_BIT(0)
 
 enum gt_vctr_registers {
 	ERR_STAT_GT_VCTR0 = 0,
@@ -148,11 +148,11 @@ enum gt_vctr_registers {
 	ERR_STAT_GT_VCTR7,
 };
 
-#define ERR_STAT_GT_COR_VCTR_LEN        (4)
-#define _ERR_STAT_GT_COR_VCTR_0         0x1002a0
-#define _ERR_STAT_GT_COR_VCTR_1         0x1002a4
-#define _ERR_STAT_GT_COR_VCTR_2         0x1002a8
-#define _ERR_STAT_GT_COR_VCTR_3         0x1002ac
+#define ERR_STAT_GT_COR_VCTR_LEN	(4)
+#define _ERR_STAT_GT_COR_VCTR_0	 0x1002a0
+#define _ERR_STAT_GT_COR_VCTR_1	 0x1002a4
+#define _ERR_STAT_GT_COR_VCTR_2	 0x1002a8
+#define _ERR_STAT_GT_COR_VCTR_3	 0x1002ac
 #define ERR_STAT_GT_COR_VCTR_REG(x)     _MMIO(_PICK_EVEN((x), \
 						_ERR_STAT_GT_COR_VCTR_0, \
 						_ERR_STAT_GT_COR_VCTR_1))
@@ -170,19 +170,19 @@ enum gt_vctr_registers {
 					_ERR_STAT_GT_FATAL_VCTR_0, \
 					_ERR_STAT_GT_FATAL_VCTR_1))
 
-#define _ERR_STAT_GT_COR                0x100160
-#define _ERR_STAT_GT_NONFATAL           0x100164
-#define _ERR_STAT_GT_FATAL              0x100168
-#define ERR_STAT_GT_REG(x)              _MMIO(_PICK_EVEN((x), \
+#define _ERR_STAT_GT_COR	        0x100160
+#define _ERR_STAT_GT_NONFATAL	   0x100164
+#define _ERR_STAT_GT_FATAL	      0x100168
+#define ERR_STAT_GT_REG(x)	      _MMIO(_PICK_EVEN((x), \
 					_ERR_STAT_GT_COR, \
 					_ERR_STAT_GT_NONFATAL))
 
-#define  EU_GRF_COR_ERR                 (15)
-#define  EU_IC_COR_ERR                  (14)
-#define  SLM_COR_ERR                    (13)
-#define  SAMPLER_COR_ERR                (12)
-#define  GUC_COR_ERR                    (1)
-#define  L3_SNG_COR_ERR                 (0)
+#define  EU_GRF_COR_ERR	         (15)
+#define  EU_IC_COR_ERR	          (14)
+#define  SLM_COR_ERR	            (13)
+#define  SAMPLER_COR_ERR	        (12)
+#define  GUC_COR_ERR	            (1)
+#define  L3_SNG_COR_ERR	         (0)
 
 #define PVC_COR_ERR_MASK \
 		(REG_BIT(GUC_COR_ERR) | \
@@ -190,17 +190,17 @@ enum gt_vctr_registers {
 		 REG_BIT(EU_IC_COR_ERR) | \
 		 REG_BIT(EU_GRF_COR_ERR))
 
-#define EU_GRF_FAT_ERR                  (15)
-#define EU_IC_FAT_ERR                   (14)
-#define SLM_FAT_ERR                     (13)
-#define SAMPLER_FAT_ERR                 (12)
-#define SQIDI_FAT_ERR                   (9)
-#define IDI_PAR_FAT_ERR                 (8)
-#define GUC_FAT_ERR                     (6)
-#define L3_ECC_CHK_FAT_ERR              (5)
-#define L3_DOUBLE_FAT_ERR               (4)
-#define FPU_UNCORR_FAT_ERR              (3)
-#define ARRAY_BIST_FAT_ERR              (1)
+#define EU_GRF_FAT_ERR	          (15)
+#define EU_IC_FAT_ERR	           (14)
+#define SLM_FAT_ERR	             (13)
+#define SAMPLER_FAT_ERR	         (12)
+#define SQIDI_FAT_ERR	           (9)
+#define IDI_PAR_FAT_ERR	         (8)
+#define GUC_FAT_ERR	             (6)
+#define L3_ECC_CHK_FAT_ERR	      (5)
+#define L3_DOUBLE_FAT_ERR	       (4)
+#define FPU_UNCORR_FAT_ERR	      (3)
+#define ARRAY_BIST_FAT_ERR	      (1)
 
 #define PVC_FAT_ERR_MASK \
 		(REG_BIT(FPU_UNCORR_FAT_ERR) | \
@@ -208,12 +208,122 @@ enum gt_vctr_registers {
 		 REG_BIT(SLM_FAT_ERR)  | \
 		 REG_BIT(EU_GRF_FAT_ERR))
 
-#define GT_HW_ERROR_MAX_ERR_BITS        16
+#define GT_HW_ERROR_MAX_ERR_BITS	16
 
-#define _SLM_ECC_ERROR_CNT              0xe7f4
+#define _SLM_ECC_ERROR_CNT	      0xe7f4
 #define _SLM_UNCORR_ECC_ERROR_CNT       0xe7c0
-#define SLM_ECC_ERROR_CNTR(x)           _MMIO((x) == HARDWARE_ERROR_CORRECTABLE ? \
+#define SLM_ECC_ERROR_CNTR(x)	   _MMIO((x) == HARDWARE_ERROR_CORRECTABLE ? \
 						_SLM_ECC_ERROR_CNT : \
 						_SLM_UNCORR_ECC_ERROR_CNT)
+#define SOC_PVC_BASE	    0x00282000
+#define SOC_PVC_SLAVE_BASE      0x00283000
+
+#define _SOC_LERRCORSTS		0x000294
+#define _SOC_LERRUNCSTS		0x000280
+#define SOC_LOCAL_ERR_STAT_SLAVE_REG(base, x)	_MMIO((x) > HARDWARE_ERROR_CORRECTABLE ? \
+							base + _SOC_LERRUNCSTS : \
+							base + _SOC_LERRCORSTS)
+#define SOC_FABRIC_SS1_3		(7)
+#define SOC_FABRIC_SS1_2		(6)
+#define SOC_FABRIC_SS1_1		(5)
+#define SOC_FABRIC_SS1_0		(4)
+
+#define SOC_LOCAL_ERR_STAT_MASTER_REG(base, x)	_MMIO((x) > HARDWARE_ERROR_CORRECTABLE ? \
+							base + _SOC_LERRUNCSTS : \
+							base + _SOC_LERRCORSTS)
+#define PVC_SOC_PSF_2			(13)
+#define PVC_SOC_PSF_1			(12)
+#define PVC_SOC_PSF_0			(11)
+#define SOC_PSF_CSC_2			(10)
+#define SOC_PSF_CSC_1			(9)
+#define SOC_PSF_CSC_0			(8)
+#define SOC_FABRIC_SS0_3		(7)
+#define SOC_FABRIC_SS0_2		(6)
+#define SOC_FABRIC_SS0_1		(5)
+#define SOC_FABRIC_SS0_0		(4)
+
+#define _SOC_GSYSEVTCTL		0x000264
+#define SOC_GSYSEVTCTL_REG(base, slave_base, x)	_MMIO(_PICK_EVEN((x), \
+							base + _SOC_GSYSEVTCTL, \
+							slave_base + _SOC_GSYSEVTCTL))
+#define _SOC_GCOERRSTS		0x000200
+#define _SOC_GNFERRSTS		0x000210
+#define _SOC_GFAERRSTS		0x000220
+#define SOC_GLOBAL_ERR_STAT_SLAVE_REG(base, x)	_MMIO(_PICK_EVEN((x), \
+							base + _SOC_GCOERRSTS, \
+							base + _SOC_GNFERRSTS))
+#define PVC_SOC_HBM_SS3_7		(16)
+#define PVC_SOC_HBM_SS3_6		(15)
+#define PVC_SOC_HBM_SS3_5		(14)
+#define PVC_SOC_HBM_SS3_4		(13)
+#define PVC_SOC_HBM_SS3_3		(12)
+#define PVC_SOC_HBM_SS3_2		(11)
+#define PVC_SOC_HBM_SS3_1		(10)
+#define PVC_SOC_HBM_SS3_0		(9)
+#define PVC_SOC_HBM_SS2_7		(8)
+#define PVC_SOC_HBM_SS2_6		(7)
+#define PVC_SOC_HBM_SS2_5		(6)
+#define PVC_SOC_HBM_SS2_4		(5)
+#define PVC_SOC_HBM_SS2_3		(4)
+#define PVC_SOC_HBM_SS2_2		(3)
+#define PVC_SOC_HBM_SS2_1		(2)
+#define PVC_SOC_HBM_SS2_0		(1)
+#define SOC_HBM_SS1_15			(17)
+#define SOC_HBM_SS1_14			(16)
+#define SOC_HBM_SS1_13			(15)
+#define SOC_HBM_SS1_12			(14)
+#define SOC_HBM_SS1_11			(13)
+#define SOC_HBM_SS1_10			(12)
+#define SOC_HBM_SS1_9			(11)
+#define SOC_HBM_SS1_8			(10)
+#define SOC_HBM_SS1_7			(9)
+#define SOC_HBM_SS1_6			(8)
+#define SOC_HBM_SS1_5			(7)
+#define SOC_HBM_SS1_4			(6)
+#define SOC_HBM_SS1_3			(5)
+#define SOC_HBM_SS1_2			(4)
+#define SOC_HBM_SS1_1			(3)
+#define SOC_HBM_SS1_0			(2)
+#define SOC_FABRIC_SS1_4		(1)
+#define SOC_IEH1_LOCAL_ERR_STATUS	(0)
+
+#define SOC_GLOBAL_ERR_STAT_MASTER_REG(base, x) _MMIO(_PICK_EVEN((x), \
+							base + _SOC_GCOERRSTS, \
+							base + _SOC_GNFERRSTS))
+#define PVC_SOC_MDFI_SOUTH		(6)
+#define PVC_SOC_MDFI_EAST		(4)
+#define PVC_SOC_CD0_MDFI		(18)
+#define PVC_SOC_CD0			(17)
+#define PVC_SOC_HBM_SS1_7		(17)
+#define PVC_SOC_HBM_SS1_6		(16)
+#define PVC_SOC_HBM_SS1_5		(15)
+#define PVC_SOC_HBM_SS1_4		(14)
+#define PVC_SOC_HBM_SS1_3		(13)
+#define PVC_SOC_HBM_SS1_2		(12)
+#define PVC_SOC_HBM_SS1_1		(11)
+#define PVC_SOC_HBM_SS1_0		(10)
+#define SOC_MDFI_SOUTH			(21)
+#define SOC_MDFI_WEST			(20)
+#define SOC_MDFI_EAST			(19)
+#define SOC_PUNIT			(18)
+#define SOC_HBM_SS0_15			(17)
+#define SOC_HBM_SS0_14			(16)
+#define SOC_HBM_SS0_13			(15)
+#define SOC_HBM_SS0_12			(14)
+#define SOC_HBM_SS0_11			(13)
+#define SOC_HBM_SS0_10			(12)
+#define SOC_HBM_SS0_9			(11)
+#define SOC_HBM_SS0_8			(10)
+#define SOC_HBM_SS0_7			(9)
+#define SOC_HBM_SS0_6			(8)
+#define SOC_HBM_SS0_5			(7)
+#define SOC_HBM_SS0_4			(6)
+#define SOC_HBM_SS0_3			(5)
+#define SOC_HBM_SS0_2			(4)
+#define SOC_HBM_SS0_1			(3)
+#define SOC_HBM_SS0_0			(2)
+#define SOC_SLAVE_IEH			(1)
+#define SOC_IEH0_LOCAL_ERR_STATUS	(0)
+#define SOC_HW_ERR_MAX_BITS             (32)
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1553949d12b6..d4a4cea398d3 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -336,7 +336,12 @@ int xe_device_probe(struct xe_device *xe)
 
 static void xe_device_remove_display(struct xe_device *xe)
 {
+	struct xe_gt *gt;
+	u32 id;
+
 	xe_display_unregister(xe);
+	for_each_gt(gt,xe,id)
+		 xa_destroy(&gt->errors.soc);
 
 	drm_dev_unplug(&xe->drm);
 	xe_display_modset_driver_remove(xe);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index e943810eeb53..7d81e0b19389 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -606,6 +606,7 @@ int xe_gt_init(struct xe_gt *gt)
 	int i;
 
 	spin_lock_init(&gt->irq_lock);
+	xa_init(&gt->errors.soc);
 	INIT_WORK(&gt->reset.worker, gt_reset_worker);
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d15724792082..425d8129843c 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_GT_TYPES_H_
 #define _XE_GT_TYPES_H_
 
+#include "regs/xe_regs.h"
 #include "xe_force_wake_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
@@ -66,6 +67,17 @@ enum xe_gt_driver_errors {
 	INTEL_GT_DRIVER_ERROR_COUNT
 };
 
+enum intel_soc_num_ieh {
+	INTEL_GT_SOC_IEH0 = 0,
+	INTEL_GT_SOC_IEH1,
+	INTEL_GT_SOC_NUM_IEH
+};
+
+enum intel_soc_ieh_reg_type {
+	INTEL_SOC_REG_LOCAL = 0,
+	INTEL_SOC_REG_GLOBAL
+};
+
 void xe_gt_log_driver_error(struct xe_gt *gt,
 				const enum xe_gt_driver_errors error,
 				const char *fmt, ...);
@@ -387,9 +399,25 @@ struct xe_gt {
 
 	struct intel_hw_errors {
 		unsigned long hw[INTEL_GT_HW_ERROR_COUNT];
+		struct xarray soc;
+		unsigned long sgunit[HARDWARE_ERROR_MAX];
 		unsigned long driver[INTEL_GT_DRIVER_ERROR_COUNT];
 	} errors;
 
 };
 
+#define SOC_HW_ERR_SHIFT	ilog2(SOC_HW_ERR_MAX_BITS)
+#define SOC_ERR_BIT		BIT(IEH_SHIFT + 1)
+#define IEH_SHIFT		(REG_GROUP_SHIFT + REG_GROUP_BITS)
+#define IEH_MASK		(0x1)
+#define REG_GROUP_SHIFT		(HW_ERR_TYPE_BITS + SOC_HW_ERR_SHIFT)
+#define REG_GROUP_BITS		(1)
+#define HW_ERR_TYPE_BITS	(2)
+#define SOC_ERR_INDEX(IEH, REG_GROUP, HW_ERR, ERRBIT) \
+	(SOC_ERR_BIT | \
+	 (IEH) << IEH_SHIFT | \
+	 (REG_GROUP) << REG_GROUP_SHIFT | \
+	 (HW_ERR) << SOC_HW_ERR_SHIFT | \
+	 (ERRBIT))
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 4a3b3ff99db1..819d39bdfecd 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -639,6 +639,241 @@ gen12_gt_hw_error_handler(struct xe_gt *gt,
 		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
 }
 
+static const char *
+soc_err_index_to_str(unsigned long index)
+{
+	switch (index) {
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, HARDWARE_ERROR_FATAL, SOC_PSF_CSC_0):
+		return "PSF CSC0";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, HARDWARE_ERROR_FATAL, SOC_PSF_CSC_1):
+		return "PSF CSC1";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, HARDWARE_ERROR_FATAL, SOC_PSF_CSC_2):
+		return "PSF CSC2";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, HARDWARE_ERROR_FATAL, PVC_SOC_PSF_0):
+		return "PSF0";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, HARDWARE_ERROR_FATAL, PVC_SOC_PSF_1):
+		return "PSF1";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, HARDWARE_ERROR_FATAL, PVC_SOC_PSF_2):
+		return "PSF2";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_CD0):
+		return "CD0";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_CD0_MDFI):
+		return "CD0 MDFI";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, HARDWARE_ERROR_FATAL, PVC_SOC_MDFI_EAST):
+		return "MDFI EAST";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, HARDWARE_ERROR_FATAL, PVC_SOC_MDFI_SOUTH):
+		return "MDFI SOUTH";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_PUNIT):
+		return "PUNIT";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_HBM_SS0_0):
+		return "HBM SS0: Sbbridge0";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_HBM_SS0_1):
+		return "HBM SS0: Sbbridge1";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_HBM_SS0_2):
+		return "HBM SS0: Sbbridge2";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_HBM_SS0_3):
+		return "HBM SS0: Sbbridge3";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_HBM_SS0_4):
+		return "HBM SS0: Sbbridge4";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_HBM_SS0_5):
+		return "HBM SS0: Sbbridge5";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_HBM_SS0_6):
+		return "HBM SS0: Sbbridge6";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, SOC_HBM_SS0_7):
+		return "HBM SS0: Sbbridge7";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS1_0):
+		return "HBM SS1: Sbbridge0";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS1_1):
+		return "HBM SS1: Sbbridge1";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS1_2):
+		return "HBM SS1: Sbbridge2";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS1_3):
+		return "HBM SS1: Sbbridge3";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS1_4):
+		return "HBM SS1: Sbbridge4";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS1_5):
+		return "HBM SS1: Sbbridge5";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS1_6):
+		return "HBM SS1: Sbbridge6";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS1_7):
+		return "HBM SS1: Sbbridge7";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS2_0):
+		return "HBM SS2: Sbbridge0";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS2_1):
+		return "HBM SS2: Sbbridge1";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS2_2):
+		return "HBM SS2: Sbbridge2";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS2_3):
+		return "HBM SS2: Sbbridge3";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS2_4):
+		return "HBM SS2: Sbbridge4";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS2_5):
+		return "HBM SS2: Sbbridge5";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS2_6):
+		return "HBM SS2: Sbbridge6";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS2_7):
+		return "HBM SS2: Sbbridge7";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS3_0):
+		return "HBM SS3: Sbbridge0";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS3_1):
+		return "HBM SS3: Sbbridge1";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS3_2):
+		return "HBM SS3: Sbbridge2";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS3_3):
+		return "HBM SS3: Sbbridge3";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS3_4):
+		return "HBM SS3: Sbbridge4";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS3_5):
+		return "HBM SS3: Sbbridge5";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS3_6):
+		return "HBM SS3: Sbbridge6";
+	case SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, HARDWARE_ERROR_FATAL, PVC_SOC_HBM_SS3_7):
+		return "HBM SS3: Sbbridge7";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static void update_soc_hw_error_cnt(struct xe_gt *gt, unsigned long index)
+{
+	unsigned long flags;
+	void *entry;
+
+	entry = xa_load(&gt->errors.soc, index);
+	entry = xa_mk_value(xa_to_value(entry) + 1);
+
+	xa_lock_irqsave(&gt->errors.soc, flags);
+	if (xa_is_err(__xa_store(&gt->errors.soc, index, entry, GFP_ATOMIC)))
+		drm_err_ratelimited(&gt->xe->drm,
+				    HW_ERR "SOC error reported by IEH%lu on GT %d lost\n",
+				   (index >> IEH_SHIFT) & IEH_MASK,
+				    gt->info.id);
+	xa_unlock_irqrestore(&gt->errors.soc, flags);
+}
+
+static void
+gen12_soc_hw_error_handler(struct xe_gt *gt,
+			  const enum hardware_error hw_err)
+{
+	unsigned long mst_glb_errstat, slv_glb_errstat, lcl_errstat, index;
+	u32 errbit, base, slave_base;
+	int i;
+
+	lockdep_assert_held(&gt->irq_lock);
+	if (gt->xe->info.platform != XE_PVC)
+		return;
+
+	base = SOC_PVC_BASE;
+	slave_base = SOC_PVC_SLAVE_BASE;
+
+	xe_gt_hw_err(gt, "SOC %s error\n", hardware_error_type_to_str(hw_err));
+
+	if ((hw_err == HARDWARE_ERROR_CORRECTABLE) || (hw_err ==
+						       HARDWARE_ERROR_NONFATAL))
+		{
+		for (i = 0; i < INTEL_GT_SOC_NUM_IEH; i++)
+			xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i).reg,
+				      ~REG_BIT(hw_err));
+
+		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err).reg,
+			      REG_GENMASK(31, 0));
+		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err).reg,
+			      REG_GENMASK(31, 0));
+		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err).reg,
+			      REG_GENMASK(31, 0));
+		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err).reg,
+			      REG_GENMASK(31, 0));
+
+		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT, "UNKNOWN SOC %s error\n", hardware_error_type_to_str(hw_err));
+	}
+
+	/*
+	 * Mask error type in GSYSEVTCTL so that no new errors of the type
+	 * will be reported. Read the master global IEH error register if
+	 * BIT 1 is set then process the slave IEH first. If BIT 0 in
+	 * global error register is set then process the corresponding
+	 * Local error registers
+	 */
+	for (i = 0; i < INTEL_GT_SOC_NUM_IEH; i++)
+		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i).reg, ~REG_BIT(hw_err));
+
+	mst_glb_errstat = xe_mmio_read32(gt,
+				       SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err).reg);
+	xe_gt_hw_err(gt, "SOC_GLOBAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n", mst_glb_errstat);
+	if (mst_glb_errstat & REG_BIT(SOC_SLAVE_IEH)) {
+		slv_glb_errstat = xe_mmio_read32(gt,
+					       SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base,
+									     hw_err).reg);
+		xe_gt_hw_err(gt, "SOC_GLOBAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
+			      slv_glb_errstat);
+
+		if (slv_glb_errstat & REG_BIT(SOC_IEH1_LOCAL_ERR_STATUS)) {
+			lcl_errstat = xe_mmio_read32(gt,
+						   SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base,
+										hw_err).reg);
+			xe_gt_hw_err(gt, "SOC_LOCAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
+				      lcl_errstat);
+
+			for_each_set_bit(errbit, &lcl_errstat,
+					 SOC_HW_ERR_MAX_BITS) {
+				/*
+				 * SOC errors have global and local error
+				 * registers for each correctable non-fatal
+				 * and fatal categories and these are per IEH
+				 * on platform. XEHPSDV and PVC have two IEHs
+				 */
+				index = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_LOCAL, hw_err, errbit);
+				update_soc_hw_error_cnt(gt, index);
+				if (gt->xe->info.platform == XE_PVC)
+					xe_gt_hw_err(gt, "%s SOC FATAL error\n",
+						      soc_err_index_to_str(index));
+			}
+			xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err).reg,
+				      lcl_errstat);
+		}
+
+		for_each_set_bit(errbit, &slv_glb_errstat, SOC_HW_ERR_MAX_BITS) {
+			index = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, hw_err, errbit);
+			update_soc_hw_error_cnt(gt, index);
+			if (gt->xe->info.platform == XE_PVC)
+				xe_gt_hw_err(gt, "%s SOC FATAL error\n",
+					      soc_err_index_to_str(index));
+		}
+		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err).reg,
+			      slv_glb_errstat);
+	}
+
+	if (mst_glb_errstat & REG_BIT(SOC_IEH0_LOCAL_ERR_STATUS)) {
+		lcl_errstat = xe_mmio_read32(gt,
+					   SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err).reg);
+		xe_gt_hw_err(gt, "SOC_LOCAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n", lcl_errstat);
+		for_each_set_bit(errbit, &lcl_errstat, SOC_HW_ERR_MAX_BITS) {
+			index = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, hw_err, errbit);
+			update_soc_hw_error_cnt(gt, index);
+			if (gt->xe->info.platform == XE_PVC)
+				xe_gt_hw_err(gt, "%s SOC FATAL error\n",
+					      soc_err_index_to_str(index));
+		}
+		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err).reg,
+			      lcl_errstat);
+	}
+
+	for_each_set_bit(errbit, &mst_glb_errstat, SOC_HW_ERR_MAX_BITS) {
+		index = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, hw_err, errbit);
+		update_soc_hw_error_cnt(gt, index);
+		if (gt->xe->info.platform == XE_PVC)
+			xe_gt_hw_err(gt, "%s SOC FATAL error\n",
+				      soc_err_index_to_str(index));
+	}
+	xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err).reg,
+		      mst_glb_errstat);
+
+	for (i = 0; i < INTEL_GT_SOC_NUM_IEH; i++)
+		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i).reg,
+			      (HARDWARE_ERROR_MAX << 1) + 1);
+}
+
+
 static void
 gen12_hw_error_source_handler(struct xe_gt *gt,
 			      const enum hardware_error hw_err)
@@ -657,6 +892,12 @@ gen12_hw_error_source_handler(struct xe_gt *gt,
 
 	if (errsrc & DEV_ERR_STAT_GT_ERROR)
 		gen12_gt_hw_error_handler(gt, hw_err);
+	
+	if (errsrc & DEV_ERR_STAT_SGUNIT_ERROR)
+		gt->errors.sgunit[hw_err]++;
+	
+	if (errsrc & DEV_ERR_STAT_SOC_ERROR)
+		gen12_soc_hw_error_handler(gt, hw_err);
 
 	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err).reg, errsrc);
 
-- 
2.25.1

