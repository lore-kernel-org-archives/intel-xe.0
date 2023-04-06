Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DA0C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 09:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDD110E196;
	Thu,  6 Apr 2023 09:23:56 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F1910E196
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 09:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680773032; x=1712309032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dl7jofMqSqke8VH72qPNd4FaCIVhwiZtG4MxEy6VjGE=;
 b=QT9ptMiRZOvQD2jfYH14WfkhT3q7Jbj96aApV/6CxnJMXmiy1WZJf8I+
 O+J33EB0hEFimJOB/BcfBQcmy62XXvSuPHY6GdB0IQKX44VEkjKg4Vs9M
 OHeJBcxtth9YwGBUEcBJHwxfu509Vy1HaWJWgSiyeqamn+Q2067UYMlYC
 mEm8Ox37AuKsNax8xW2Gpkd+XEccS6OFUi5ZKIcJb1SQIbHSK0M/dvPfk
 YjBNlKRZDNFVYrU1Y0OqJjewSZ74mAWBr7sBikqxtkTq3D8wx6kLt4gGP
 wRHJfeTN4YIEHoFMET0eBrsVBprOJc38oe/grz1oOIg79SfSMKs3l+bdI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="370524044"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="370524044"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 02:23:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="798252078"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="798252078"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2023 02:23:45 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 14:56:30 +0530
Message-Id: <20230406092631.2820028-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230406092631.2820028-1-himal.prasad.ghimiray@intel.com>
References: <20230406092631.2820028-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/xe/ras: Count SOC and SGUNIT errors
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

From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Count the SOC, SGUNIT hardware errors as signaled by relevant
interrupts and respective registers.

Co-authored-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h | 116 ++++++++++++++-
 drivers/gpu/drm/xe/xe_device.c    |   6 +
 drivers/gpu/drm/xe/xe_gt.c        |   1 +
 drivers/gpu/drm/xe/xe_gt_types.h  |  28 ++++
 drivers/gpu/drm/xe/xe_irq.c       | 236 +++++++++++++++++++++++++++++-
 5 files changed, 381 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index b3d35d0c5a77..422ed63ab32e 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -130,8 +130,9 @@ enum hardware_error {
 #define DEV_ERR_STAT_REG(x)             _MMIO(_PICK_EVEN((x), \
 						_DEV_ERR_STAT_CORRECTABLE, \
 						_DEV_ERR_STAT_NONFATAL))
-
-#define  DEV_ERR_STAT_GT_ERROR          REG_BIT(0)
+#define  DEV_ERR_STAT_SOC_ERROR	        REG_BIT(16)
+#define  DEV_ERR_STAT_SGUNIT_ERROR      REG_BIT(12)
+#define  DEV_ERR_STAT_GT_ERROR	        REG_BIT(0)
 
 enum gt_vctr_registers {
 	ERR_STAT_GT_VCTR0 = 0,
@@ -211,4 +212,115 @@ enum gt_vctr_registers {
 #define SLM_ECC_ERROR_CNTR(x)           _MMIO((x) == HARDWARE_ERROR_CORRECTABLE ? \
 						_SLM_ECC_ERROR_CNT : \
 						_SLM_UNCORR_ECC_ERROR_CNT)
+#define SOC_PVC_BASE	               0x00282000
+#define SOC_PVC_SLAVE_BASE             0x00283000
+
+#define _SOC_LERRCORSTS		       0x000294
+#define _SOC_LERRUNCSTS		       0x000280
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
+#define _SOC_GSYSEVTCTL		        0x000264
+#define SOC_GSYSEVTCTL_REG(base, slave_base, x)	_MMIO(_PICK_EVEN((x), \
+							base + _SOC_GSYSEVTCTL, \
+							slave_base + _SOC_GSYSEVTCTL))
+#define _SOC_GCOERRSTS		        0x000200
+#define _SOC_GNFERRSTS		        0x000210
+#define _SOC_GFAERRSTS		        0x000220
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
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a79f934e3d2d..771ea5382815 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -334,8 +334,14 @@ int xe_device_probe(struct xe_device *xe)
 
 static void xe_device_remove_display(struct xe_device *xe)
 {
+	struct xe_gt *gt;
+	u32 id;
+
 	xe_display_unregister(xe);
 
+	for_each_gt(gt, xe, id)
+		xa_destroy(&gt->errors.soc);
+
 	drm_dev_unplug(&xe->drm);
 	xe_display_modset_driver_remove(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index ce9ce2748394..518c76553e31 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -543,6 +543,7 @@ int xe_gt_init(struct xe_gt *gt)
 	int err;
 	int i;
 
+	xa_init(&gt->errors.soc);
 	INIT_WORK(&gt->reset.worker, gt_reset_worker);
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 9580a40c0142..bd4a85959df3 100644
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
@@ -397,9 +409,25 @@ struct xe_gt {
 
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
index 4626f7280aaf..c047d9b66a7c 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -637,6 +637,233 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
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
+xe_soc_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
+{
+	unsigned long mst_glb_errstat, slv_glb_errstat, lcl_errstat, index;
+	u32 errbit, base, slave_base;
+	int i;
+
+	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
+	if (gt->xe->info.platform != XE_PVC)
+		return;
+
+	base = SOC_PVC_BASE;
+	slave_base = SOC_PVC_SLAVE_BASE;
+
+	xe_gt_hw_err(gt, "SOC %s error\n", hardware_error_type_to_str(hw_err));
+
+	if (hw_err == HARDWARE_ERROR_CORRECTABLE || hw_err == HARDWARE_ERROR_NONFATAL) {
+		for (i = 0; i < INTEL_GT_SOC_NUM_IEH; i++)
+			xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i).reg,
+					~REG_BIT(hw_err));
+
+		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err).reg,
+				REG_GENMASK(31, 0));
+		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err).reg,
+				REG_GENMASK(31, 0));
+		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err).reg,
+				REG_GENMASK(31, 0));
+		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err).reg,
+				REG_GENMASK(31, 0));
+
+		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT, "UNKNOWN SOC %s error\n",
+				       hardware_error_type_to_str(hw_err));
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
+	mst_glb_errstat = xe_mmio_read32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err).reg);
+	xe_gt_hw_err(gt, "SOC_GLOBAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n", mst_glb_errstat);
+	if (mst_glb_errstat & REG_BIT(SOC_SLAVE_IEH)) {
+		slv_glb_errstat = xe_mmio_read32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base,
+										   hw_err).reg);
+		xe_gt_hw_err(gt, "SOC_GLOBAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
+			     slv_glb_errstat);
+
+		if (slv_glb_errstat & REG_BIT(SOC_IEH1_LOCAL_ERR_STATUS)) {
+			lcl_errstat = xe_mmio_read32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base,
+										      hw_err).reg);
+			xe_gt_hw_err(gt, "SOC_LOCAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
+				     lcl_errstat);
+
+			for_each_set_bit(errbit, &lcl_errstat, SOC_HW_ERR_MAX_BITS) {
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
+						     soc_err_index_to_str(index));
+			}
+			xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err).reg,
+					lcl_errstat);
+		}
+
+		for_each_set_bit(errbit, &slv_glb_errstat, SOC_HW_ERR_MAX_BITS) {
+			index = SOC_ERR_INDEX(INTEL_GT_SOC_IEH1, INTEL_SOC_REG_GLOBAL, hw_err, errbit);
+			update_soc_hw_error_cnt(gt, index);
+			if (gt->xe->info.platform == XE_PVC)
+				xe_gt_hw_err(gt, "%s SOC FATAL error\n",
+					     soc_err_index_to_str(index));
+		}
+		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err).reg,
+				slv_glb_errstat);
+	}
+
+	if (mst_glb_errstat & REG_BIT(SOC_IEH0_LOCAL_ERR_STATUS)) {
+		lcl_errstat = xe_mmio_read32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err).reg);
+		xe_gt_hw_err(gt, "SOC_LOCAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n", lcl_errstat);
+		for_each_set_bit(errbit, &lcl_errstat, SOC_HW_ERR_MAX_BITS) {
+			index = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_LOCAL, hw_err, errbit);
+			update_soc_hw_error_cnt(gt, index);
+			if (gt->xe->info.platform == XE_PVC)
+				xe_gt_hw_err(gt, "%s SOC FATAL error\n",
+					     soc_err_index_to_str(index));
+		}
+		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err).reg,
+				lcl_errstat);
+	}
+
+	for_each_set_bit(errbit, &mst_glb_errstat, SOC_HW_ERR_MAX_BITS) {
+		index = SOC_ERR_INDEX(INTEL_GT_SOC_IEH0, INTEL_SOC_REG_GLOBAL, hw_err, errbit);
+		update_soc_hw_error_cnt(gt, index);
+		if (gt->xe->info.platform == XE_PVC)
+			xe_gt_hw_err(gt, "%s SOC FATAL error\n",
+				     soc_err_index_to_str(index));
+	}
+	xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err).reg,
+			mst_glb_errstat);
+
+	for (i = 0; i < INTEL_GT_SOC_NUM_IEH; i++)
+		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i).reg,
+				(HARDWARE_ERROR_MAX << 1) + 1);
+}
+
 static void
 xe_hw_error_source_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 {
@@ -655,10 +882,11 @@ xe_hw_error_source_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 	if (errsrc & DEV_ERR_STAT_GT_ERROR)
 		xe_gt_hw_error_handler(gt, hw_err);
 
-	if (errsrc & ~DEV_ERR_STAT_GT_ERROR)
-		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
-				       "non-GT hardware error(s) in DEV_ERR_STAT_REG_%s: 0x%08x\n",
-				       hw_err_str, errsrc & ~DEV_ERR_STAT_GT_ERROR);
+	if (errsrc & DEV_ERR_STAT_SGUNIT_ERROR)
+		gt->errors.sgunit[hw_err]++;
+
+	if (errsrc & DEV_ERR_STAT_SOC_ERROR)
+		xe_soc_hw_error_handler(gt, hw_err);
 
 	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err).reg, errsrc);
 
-- 
2.25.1

