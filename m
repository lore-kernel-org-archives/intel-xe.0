Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45693C77B78
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 07:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EED10E02E;
	Wed, 19 Apr 2023 07:45:02 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B2F10E8E3
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 07:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681890298; x=1713426298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gSe/gnreEpgogXFOxWyB0/SePhY0PXJyC+Jl9u2PSbc=;
 b=ifohpvmRYX9W7z+creIJgttsTiJspvq+LQHKAEjy5WzInR4i4fvKDgmn
 Zxe5DSBu7SmcYS5PBCA35KywKe7ouvwct0dxutNI4WDuMczSNzispUHIl
 QplFxUFrakoqv/RXlOsPKwUaLuFcM/364nncQy22IQ8GX1Eaqp5sJY9vc
 VMgXOFV/OC8fmIFv6ZXDyNUXN0F/M4g09NwuXb6dLmSz7CDCO5xcFM+Uq
 ZG9qGt9rs6EgIHAWiXMCizyR8PEKWEitCDp/7g1KTEAlUfPyBMZi+JbG9
 cH49UB2yZZr/SKQTy0Yd8Vh+bdGWj0SRYPOb915eiaTMw1mRIfmDVRlrd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="334186117"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="334186117"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 00:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693951886"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="693951886"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 00:44:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 00:44:31 -0700
Message-Id: <20230419074440.4006398-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230419074440.4006398-1-lucas.demarchi@intel.com>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 08/17] drm/xe/guc: Convert GuC registers to
 REG_FIELD/REG_BIT
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Cleanup GuC register declarations by converting them to use REG_FIELD,
REG_BIT and REG_GENMASK. While converting, also reorder the bitfields
so they follow the convention of declaring the higher bits first.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h | 168 +++++++++++++-------------
 drivers/gpu/drm/xe/xe_ggtt.c          |   6 +-
 drivers/gpu/drm/xe/xe_guc.c           |   8 +-
 drivers/gpu/drm/xe/xe_guc_ads.c       |   3 +-
 4 files changed, 89 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 011868ff38aa..facb1f0a55b6 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -14,23 +14,18 @@
 /* Definitions of GuC H/W registers, bits, etc */
 
 #define GUC_STATUS			_MMIO(0xc000)
-#define   GS_RESET_SHIFT		0
-#define   GS_MIA_IN_RESET		  (0x01 << GS_RESET_SHIFT)
-#define   GS_BOOTROM_SHIFT		1
-#define   GS_BOOTROM_MASK		  (0x7F << GS_BOOTROM_SHIFT)
-#define   GS_BOOTROM_RSA_FAILED		  (0x50 << GS_BOOTROM_SHIFT)
-#define   GS_BOOTROM_JUMP_PASSED	  (0x76 << GS_BOOTROM_SHIFT)
-#define   GS_UKERNEL_SHIFT		8
-#define   GS_UKERNEL_MASK		  (0xFF << GS_UKERNEL_SHIFT)
-#define   GS_MIA_SHIFT			16
-#define   GS_MIA_MASK			  (0x07 << GS_MIA_SHIFT)
-#define   GS_MIA_CORE_STATE		  (0x01 << GS_MIA_SHIFT)
-#define   GS_MIA_HALT_REQUESTED		  (0x02 << GS_MIA_SHIFT)
-#define   GS_MIA_ISR_ENTRY		  (0x04 << GS_MIA_SHIFT)
-#define   GS_AUTH_STATUS_SHIFT		30
-#define   GS_AUTH_STATUS_MASK		  (0x03 << GS_AUTH_STATUS_SHIFT)
-#define   GS_AUTH_STATUS_BAD		  (0x01 << GS_AUTH_STATUS_SHIFT)
-#define   GS_AUTH_STATUS_GOOD		  (0x02 << GS_AUTH_STATUS_SHIFT)
+#define   GS_AUTH_STATUS_MASK		REG_GENMASK(31, 30)
+#define   GS_AUTH_STATUS_BAD		REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x1)
+#define   GS_AUTH_STATUS_GOOD		REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x2)
+#define   GS_MIA_MASK			REG_GENMASK(18, 16)
+#define   GS_MIA_CORE_STATE		REG_FIELD_PREP(GS_MIA_MASK, 0x1)
+#define   GS_MIA_HALT_REQUESTED		REG_FIELD_PREP(GS_MIA_MASK, 0x2)
+#define   GS_MIA_ISR_ENTRY		REG_FIELD_PREP(GS_MIA_MASK, 0x4)
+#define   GS_UKERNEL_MASK		REG_GENMASK(15, 8)
+#define   GS_BOOTROM_MASK		REG_GENMASK(7, 1)
+#define   GS_BOOTROM_RSA_FAILED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x50)
+#define   GS_BOOTROM_JUMP_PASSED	REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
+#define   GS_MIA_IN_RESET		REG_BIT(0)
 
 #define SOFT_SCRATCH(n)			_MMIO(0xc180 + (n) * 4)
 #define SOFT_SCRATCH_COUNT		16
@@ -42,90 +37,89 @@
 #define DMA_ADDR_0_HIGH			_MMIO(0xc304)
 #define DMA_ADDR_1_LOW			_MMIO(0xc308)
 #define DMA_ADDR_1_HIGH			_MMIO(0xc30c)
-#define   DMA_ADDRESS_SPACE_WOPCM	  (7 << 16)
-#define   DMA_ADDRESS_SPACE_GTT		  (8 << 16)
+#define   DMA_ADDR_SPACE_MASK		REG_GENMASK(20, 16)
+#define   DMA_ADDRESS_SPACE_WOPCM	REG_FIELD_PREP(DMA_ADDR_SPACE_MASK, 7)
+#define   DMA_ADDRESS_SPACE_GTT		REG_FIEDL_PREP(DMA_ADDR_SPACE_MASK, 8)
 #define DMA_COPY_SIZE			_MMIO(0xc310)
 #define DMA_CTRL			_MMIO(0xc314)
-#define   HUC_UKERNEL			  (1<<9)
-#define   UOS_MOVE			  (1<<4)
-#define   START_DMA			  (1<<0)
+#define   HUC_UKERNEL			REG_BIT(9)
+#define   UOS_MOVE			REG_BIT(4)
+#define   START_DMA			REG_BIT(0)
 #define DMA_GUC_WOPCM_OFFSET		_MMIO(0xc340)
-#define   GUC_WOPCM_OFFSET_VALID	  (1<<0)
-#define   HUC_LOADING_AGENT_VCR		  (0<<1)
-#define   HUC_LOADING_AGENT_GUC		  (1<<1)
 #define   GUC_WOPCM_OFFSET_SHIFT	14
-#define   GUC_WOPCM_OFFSET_MASK		  (0x3ffff << GUC_WOPCM_OFFSET_SHIFT)
-#define GUC_MAX_IDLE_COUNT		_MMIO(0xC3E4)
+#define   GUC_WOPCM_OFFSET_MASK		REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
+#define   HUC_LOADING_AGENT_MASK	REG_BIT(1)
+#define   HUC_LOADING_AGENT_VCR		REG_FIELD_PREP(HUC_LOADING_AGENT_MASK, 0)
+#define   HUC_LOADING_AGENT_GUC		REG_FIELD_PREP(HUC_LOADING_AGENT_MASK, 1)
+#define   GUC_WOPCM_OFFSET_VALID	REG_BIT(0)
+#define GUC_MAX_IDLE_COUNT		_MMIO(0xc3e4)
 
-#define HUC_STATUS2             _MMIO(0xD3B0)
-#define   HUC_FW_VERIFIED       (1<<7)
+#define HUC_STATUS2			_MMIO(0xd3b0)
+#define   HUC_FW_VERIFIED		REG_BIT(7)
 
-#define GEN11_HUC_KERNEL_LOAD_INFO	_MMIO(0xC1DC)
-#define   HUC_LOAD_SUCCESSFUL		  (1 << 0)
+#define GEN11_HUC_KERNEL_LOAD_INFO	_MMIO(0xc1dc)
+#define   HUC_LOAD_SUCCESSFUL		REG_BIT(0)
 
 #define GUC_WOPCM_SIZE			_MMIO(0xc050)
-#define   GUC_WOPCM_SIZE_LOCKED		  (1<<0)
-#define   GUC_WOPCM_SIZE_SHIFT		12
-#define   GUC_WOPCM_SIZE_MASK		  (0xfffff << GUC_WOPCM_SIZE_SHIFT)
+#define   GUC_WOPCM_SIZE_MASK		REG_GENMASK(31, 12)
+#define   GUC_WOPCM_SIZE_LOCKED		REG_BIT(0)
 
 #define GEN8_GT_PM_CONFIG		_MMIO(0x138140)
 #define GEN9LP_GT_PM_CONFIG		_MMIO(0x138140)
 #define GEN9_GT_PM_CONFIG		_MMIO(0x13816c)
-#define   GT_DOORBELL_ENABLE		  (1<<0)
+#define   GT_DOORBELL_ENABLE		REG_BIT(0)
 
 #define GEN8_GTCR			_MMIO(0x4274)
-#define   GEN8_GTCR_INVALIDATE		  (1<<0)
-
-#define GEN12_GUC_TLB_INV_CR		_MMIO(0xcee8)
-#define   GEN12_GUC_TLB_INV_CR_INVALIDATE	(1 << 0)
-
-#define GUC_ARAT_C6DIS			_MMIO(0xA178)
-
-#define GUC_SHIM_CONTROL		_MMIO(0xc064)
-#define   GUC_DISABLE_SRAM_INIT_TO_ZEROES	(1<<0)
-#define   GUC_ENABLE_READ_CACHE_LOGIC		(1<<1)
-#define   GUC_ENABLE_MIA_CACHING		(1<<2)
-#define   GUC_GEN10_MSGCH_ENABLE		(1<<4)
-#define   GUC_ENABLE_READ_CACHE_FOR_SRAM_DATA	(1<<9)
-#define   GUC_ENABLE_READ_CACHE_FOR_WOPCM_DATA	(1<<10)
-#define   GUC_ENABLE_MIA_CLOCK_GATING		(1<<15)
-#define   GUC_GEN10_SHIM_WC_ENABLE		(1<<21)
+#define   GEN8_GTCR_INVALIDATE		REG_BIT(0)
+
+#define GEN12_GUC_TLB_INV_CR			_MMIO(0xcee8)
+#define   GEN12_GUC_TLB_INV_CR_INVALIDATE	REG_BIT(0)
+
+#define GUC_ARAT_C6DIS				_MMIO(0xa178)
+
+#define GUC_SHIM_CONTROL			_MMIO(0xc064)
 #define   PVC_GUC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
-#define   PVC_MOCS_UC_INDEX			1
-#define   PVC_GUC_MOCS_INDEX(index)		REG_FIELD_PREP(PVC_GUC_MOCS_INDEX_MASK,\
+#define   PVC_GUC_MOCS_UC_INDEX			1
+#define   PVC_GUC_MOCS_INDEX(index)		REG_FIELD_PREP(PVC_GUC_MOCS_INDEX_MASK, \
 							       index)
+#define   GUC_GEN10_SHIM_WC_ENABLE		REG_BIT(21)
+#define   GUC_ENABLE_MIA_CLOCK_GATING		REG_BIT(15)
+#define   GUC_ENABLE_READ_CACHE_FOR_WOPCM_DATA	REG_BIT(10)
+#define   GUC_ENABLE_READ_CACHE_FOR_SRAM_DATA	REG_BIT(9)
+#define   GUC_GEN10_MSGCH_ENABLE		REG_BIT(4)
+#define   GUC_ENABLE_MIA_CACHING		REG_BIT(2)
+#define   GUC_ENABLE_READ_CACHE_LOGIC		REG_BIT(1)
+#define   GUC_DISABLE_SRAM_INIT_TO_ZEROES	REG_BIT(0)
 
-#define GUC_SEND_INTERRUPT		_MMIO(0xc4c8)
-#define   GUC_SEND_TRIGGER		  (1<<0)
-#define GEN11_GUC_HOST_INTERRUPT	_MMIO(0x1901f0)
 
-#define GUC_NUM_DOORBELLS		256
+#define GUC_SEND_INTERRUPT			_MMIO(0xc4c8)
+#define   GUC_SEND_TRIGGER			REG_BIT(0)
+#define GEN11_GUC_HOST_INTERRUPT		_MMIO(0x1901f0)
+
+#define GUC_NUM_DOORBELLS			256
 
 /* format of the HW-monitored doorbell cacheline */
 struct guc_doorbell_info {
 	u32 db_status;
-#define GUC_DOORBELL_DISABLED		0
-#define GUC_DOORBELL_ENABLED		1
+#define GUC_DOORBELL_DISABLED			0
+#define GUC_DOORBELL_ENABLED			1
 
 	u32 cookie;
 	u32 reserved[14];
 } __packed;
 
-#define GEN8_DRBREGL(x)			_MMIO(0x1000 + (x) * 8)
-#define   GEN8_DRB_VALID		  (1<<0)
-#define GEN8_DRBREGU(x)			_MMIO(0x1000 + (x) * 8 + 4)
+#define GEN8_DRBREGL(x)				_MMIO(0x1000 + (x) * 8)
+#define   GEN8_DRB_VALID			REG_BIT(0)
+#define GEN8_DRBREGU(x)				_MMIO(0x1000 + (x) * 8 + 4)
 
 #define GEN12_DIST_DBS_POPULATED		_MMIO(0xd08)
-#define   GEN12_DOORBELLS_PER_SQIDI_SHIFT	16
-#define   GEN12_DOORBELLS_PER_SQIDI		(0xff)
-#define   GEN12_SQIDIS_DOORBELL_EXIST		(0xffff)
-
-#define DE_GUCRMR			_MMIO(0x44054)
+#define   GEN12_DOORBELLS_PER_SQIDI_MASK	REG_GENMASK(23, 16)
+#define   GEN12_SQIDIS_DOORBELL_EXIST_MASK	REG_GENMASK(15, 0)
 
-#define GUC_BCS_RCS_IER			_MMIO(0xC550)
-#define GUC_VCS2_VCS1_IER		_MMIO(0xC554)
-#define GUC_WD_VECS_IER			_MMIO(0xC558)
-#define GUC_PM_P24C_IER			_MMIO(0xC55C)
+#define GUC_BCS_RCS_IER				_MMIO(0xC550)
+#define GUC_VCS2_VCS1_IER			_MMIO(0xC554)
+#define GUC_WD_VECS_IER				_MMIO(0xC558)
+#define GUC_PM_P24C_IER				_MMIO(0xC55C)
 
 #define VF_SW_FLAG(n)			_MMIO(0x190240 + (n) * 4)
 #define VF_SW_FLAG_COUNT		4
@@ -134,21 +128,21 @@ struct guc_doorbell_info {
 #define MED_VF_SW_FLAG_COUNT		4
 
 /* GuC Interrupt Vector */
-#define GUC_INTR_GUC2HOST		BIT(15)
-#define GUC_INTR_EXEC_ERROR		BIT(14)
-#define GUC_INTR_DISPLAY_EVENT		BIT(13)
-#define GUC_INTR_SEM_SIG		BIT(12)
-#define GUC_INTR_IOMMU2GUC		BIT(11)
-#define GUC_INTR_DOORBELL_RANG		BIT(10)
-#define GUC_INTR_DMA_DONE		BIT(9)
-#define GUC_INTR_FATAL_ERROR		BIT(8)
-#define GUC_INTR_NOTIF_ERROR		BIT(7)
-#define GUC_INTR_SW_INT_6		BIT(6)
-#define GUC_INTR_SW_INT_5		BIT(5)
-#define GUC_INTR_SW_INT_4		BIT(4)
-#define GUC_INTR_SW_INT_3		BIT(3)
-#define GUC_INTR_SW_INT_2		BIT(2)
-#define GUC_INTR_SW_INT_1		BIT(1)
-#define GUC_INTR_SW_INT_0		BIT(0)
+#define GUC_INTR_GUC2HOST			BIT(15)
+#define GUC_INTR_EXEC_ERROR			BIT(14)
+#define GUC_INTR_DISPLAY_EVENT			BIT(13)
+#define GUC_INTR_SEM_SIG			BIT(12)
+#define GUC_INTR_IOMMU2GUC			BIT(11)
+#define GUC_INTR_DOORBELL_RANG			BIT(10)
+#define GUC_INTR_DMA_DONE			BIT(9)
+#define GUC_INTR_FATAL_ERROR			BIT(8)
+#define GUC_INTR_NOTIF_ERROR			BIT(7)
+#define GUC_INTR_SW_INT_6			BIT(6)
+#define GUC_INTR_SW_INT_5			BIT(5)
+#define GUC_INTR_SW_INT_4			BIT(4)
+#define GUC_INTR_SW_INT_3			BIT(3)
+#define GUC_INTR_SW_INT_2			BIT(2)
+#define GUC_INTR_SW_INT_1			BIT(1)
+#define GUC_INTR_SW_INT_0			BIT(0)
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 862e810ef407..cde80eb09d07 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -186,11 +186,11 @@ int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
 }
 
 #define GEN12_GUC_TLB_INV_CR                     _MMIO(0xcee8)
-#define   GEN12_GUC_TLB_INV_CR_INVALIDATE        (1 << 0)
+#define   GEN12_GUC_TLB_INV_CR_INVALIDATE        REG_BIT(0)
 #define PVC_GUC_TLB_INV_DESC0			_MMIO(0xcf7c)
-#define   PVC_GUC_TLB_INV_DESC0_VALID		 (1 << 0)
+#define   PVC_GUC_TLB_INV_DESC0_VALID		 REG_BIT(0)
 #define PVC_GUC_TLB_INV_DESC1			_MMIO(0xcf80)
-#define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	 (1 << 6)
+#define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	 REG_BIT(6)
 
 void xe_ggtt_invalidate(struct xe_gt *gt)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e00177f4d294..d18f2e25ce56 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -357,7 +357,7 @@ static void guc_prepare_xfer(struct xe_guc *guc)
 				GUC_ENABLE_MIA_CACHING;
 
 	if (xe->info.platform == XE_PVC)
-		shim_flags |= PVC_GUC_MOCS_INDEX(PVC_MOCS_UC_INDEX);
+		shim_flags |= PVC_GUC_MOCS_INDEX(PVC_GUC_MOCS_UC_INDEX);
 
 	/* Must program this register before loading the ucode with DMA */
 	xe_mmio_write32(gt, GUC_SHIM_CONTROL.reg, shim_flags);
@@ -848,11 +848,11 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 
 	drm_printf(p, "\nGuC status 0x%08x:\n", status);
 	drm_printf(p, "\tBootrom status = 0x%x\n",
-		   (status & GS_BOOTROM_MASK) >> GS_BOOTROM_SHIFT);
+		   REG_FIELD_GET(GS_BOOTROM_MASK, status));
 	drm_printf(p, "\tuKernel status = 0x%x\n",
-		   (status & GS_UKERNEL_MASK) >> GS_UKERNEL_SHIFT);
+		   REG_FIELD_GET(GS_UKERNEL_MASK, status));
 	drm_printf(p, "\tMIA Core status = 0x%x\n",
-		   (status & GS_MIA_MASK) >> GS_MIA_SHIFT);
+		   REG_FIELD_GET(GS_MIA_MASK, status));
 	drm_printf(p, "\tLog level = %d\n",
 		   xe_guc_log_get_level(&guc->log));
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index fe1d5be1241e..d4fc2d357a78 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -561,8 +561,7 @@ static void guc_doorbell_init(struct xe_guc_ads *ads)
 
 		ads_blob_write(ads,
 			       system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_DOORBELL_COUNT_PER_SQIDI],
-			       ((distdbreg >> GEN12_DOORBELLS_PER_SQIDI_SHIFT)
-				& GEN12_DOORBELLS_PER_SQIDI) + 1);
+			       REG_FIELD_GET(GEN12_DOORBELLS_PER_SQIDI_MASK, distdbreg) + 1);
 	}
 }
 
-- 
2.39.0

