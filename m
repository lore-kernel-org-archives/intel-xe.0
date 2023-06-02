Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FF2C77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 23:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F1110E10D;
	Fri,  2 Jun 2023 23:52:18 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E304E10E10D
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 23:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685749936; x=1717285936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VIoGAKQBTcHVans69N9RVACao18quFfhjHkaYr4MKfs=;
 b=QJtB9pfEoCy2hIkaHixZtoYPHt+nN/ru94w0Gp5nnbPrHubJqDladhfT
 unfNRimlN1UqvFnRSITbRYNukPTF9fbYvc832hauIX8H4lFMfO9FhM3gj
 8Rmhi19bRGFO900GEIbJail+NiTyzkphwkFe18Fu39Zj8InZjNDMaTD9G
 5GTpYXJIBeU5VTrwzYUK3WkVh/NmwGQaKcX1260zjAHv5/KurT2T/vpZb
 BuwPiPY/tJVYuYkI/G+AKRliPNY94BniWG4LvRIu+LAimFctULiaBJYh7
 Pm+zBkrRy6uNUuzlPyXpbdgLcXTFohZO4RqLdDe5OZSIYaZqHa2j10Nn9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354849608"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; d="scan'208";a="354849608"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 16:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="658430467"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; d="scan'208";a="658430467"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 16:52:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 16:52:08 -0700
Message-Id: <20230602235210.1314028-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Reformat xe_guc_regs.h
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reformat the GuC register header according to the same rules used by
other register headers:
 - Register definitions are ordered by offset
 - Value of #define's start on column 49
 - Lowercase used for hex values

No functional change.

This header has some things that aren't directly related to register
definitions (e.g., number of doorbells, doorbell info structure, GuC
interrupt vector layout, etc.  These items have been moved to the bottom
of the header.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h | 186 +++++++++++++-------------
 1 file changed, 93 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index b4f27cadb68f..ea8118f16722 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -13,65 +13,37 @@
 
 /* Definitions of GuC H/W registers, bits, etc */
 
-#define GUC_STATUS			XE_REG(0xc000)
-#define   GS_AUTH_STATUS_MASK		REG_GENMASK(31, 30)
-#define   GS_AUTH_STATUS_BAD		REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x1)
-#define   GS_AUTH_STATUS_GOOD		REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x2)
-#define   GS_MIA_MASK			REG_GENMASK(18, 16)
-#define   GS_MIA_CORE_STATE		REG_FIELD_PREP(GS_MIA_MASK, 0x1)
-#define   GS_MIA_HALT_REQUESTED		REG_FIELD_PREP(GS_MIA_MASK, 0x2)
-#define   GS_MIA_ISR_ENTRY		REG_FIELD_PREP(GS_MIA_MASK, 0x4)
-#define   GS_UKERNEL_MASK		REG_GENMASK(15, 8)
-#define   GS_BOOTROM_MASK		REG_GENMASK(7, 1)
-#define   GS_BOOTROM_RSA_FAILED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x50)
-#define   GS_BOOTROM_JUMP_PASSED	REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
-#define   GS_MIA_IN_RESET		REG_BIT(0)
+#define DIST_DBS_POPULATED			XE_REG(0xd08)
+#define   DOORBELLS_PER_SQIDI_MASK		REG_GENMASK(23, 16)
+#define   SQIDIS_DOORBELL_EXIST_MASK		REG_GENMASK(15, 0)
 
-#define SOFT_SCRATCH(n)			XE_REG(0xc180 + (n) * 4)
-#define SOFT_SCRATCH_COUNT		16
+#define DRBREGL(x)				XE_REG(0x1000 + (x) * 8)
+#define   DRB_VALID				REG_BIT(0)
+#define DRBREGU(x)				XE_REG(0x1000 + (x) * 8 + 4)
 
-#define UOS_RSA_SCRATCH(i)		XE_REG(0xc200 + (i) * 4)
-#define UOS_RSA_SCRATCH_COUNT		64
-
-#define DMA_ADDR_0_LOW			XE_REG(0xc300)
-#define DMA_ADDR_0_HIGH			XE_REG(0xc304)
-#define DMA_ADDR_1_LOW			XE_REG(0xc308)
-#define DMA_ADDR_1_HIGH			XE_REG(0xc30c)
-#define   DMA_ADDR_SPACE_MASK		REG_GENMASK(20, 16)
-#define   DMA_ADDRESS_SPACE_WOPCM	REG_FIELD_PREP(DMA_ADDR_SPACE_MASK, 7)
-#define DMA_COPY_SIZE			XE_REG(0xc310)
-#define DMA_CTRL			XE_REG(0xc314)
-#define   HUC_UKERNEL			REG_BIT(9)
-#define   UOS_MOVE			REG_BIT(4)
-#define   START_DMA			REG_BIT(0)
-#define DMA_GUC_WOPCM_OFFSET		XE_REG(0xc340)
-#define   GUC_WOPCM_OFFSET_SHIFT	14
-#define   GUC_WOPCM_OFFSET_MASK		REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
-#define   HUC_LOADING_AGENT_GUC		REG_BIT(1)
-#define   GUC_WOPCM_OFFSET_VALID	REG_BIT(0)
-#define GUC_MAX_IDLE_COUNT		XE_REG(0xc3e4)
-
-#define HUC_STATUS2			XE_REG(0xd3b0)
-#define   HUC_FW_VERIFIED		REG_BIT(7)
-
-#define HUC_KERNEL_LOAD_INFO		XE_REG(0xc1dc)
-#define   HUC_LOAD_SUCCESSFUL		REG_BIT(0)
-
-#define GUC_WOPCM_SIZE			XE_REG(0xc050)
-#define   GUC_WOPCM_SIZE_MASK		REG_GENMASK(31, 12)
-#define   GUC_WOPCM_SIZE_LOCKED		REG_BIT(0)
-
-#define GT_PM_CONFIG			XE_REG(0x13816c)
-#define   GT_DOORBELL_ENABLE		REG_BIT(0)
-
-#define GTCR				XE_REG(0x4274)
-#define   GTCR_INVALIDATE		REG_BIT(0)
-
-#define GUC_TLB_INV_CR			XE_REG(0xcee8)
-#define   GUC_TLB_INV_CR_INVALIDATE	REG_BIT(0)
+#define GTCR					XE_REG(0x4274)
+#define   GTCR_INVALIDATE			REG_BIT(0)
 
 #define GUC_ARAT_C6DIS				XE_REG(0xa178)
 
+#define GUC_STATUS				XE_REG(0xc000)
+#define   GS_AUTH_STATUS_MASK			REG_GENMASK(31, 30)
+#define   GS_AUTH_STATUS_BAD			REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x1)
+#define   GS_AUTH_STATUS_GOOD			REG_FIELD_PREP(GS_AUTH_STATUS_MASK, 0x2)
+#define   GS_MIA_MASK				REG_GENMASK(18, 16)
+#define   GS_MIA_CORE_STATE			REG_FIELD_PREP(GS_MIA_MASK, 0x1)
+#define   GS_MIA_HALT_REQUESTED			REG_FIELD_PREP(GS_MIA_MASK, 0x2)
+#define   GS_MIA_ISR_ENTRY			REG_FIELD_PREP(GS_MIA_MASK, 0x4)
+#define   GS_UKERNEL_MASK			REG_GENMASK(15, 8)
+#define   GS_BOOTROM_MASK			REG_GENMASK(7, 1)
+#define   GS_BOOTROM_RSA_FAILED			REG_FIELD_PREP(GS_BOOTROM_MASK, 0x50)
+#define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
+#define   GS_MIA_IN_RESET			REG_BIT(0)
+
+#define GUC_WOPCM_SIZE				XE_REG(0xc050)
+#define   GUC_WOPCM_SIZE_MASK			REG_GENMASK(31, 12)
+#define   GUC_WOPCM_SIZE_LOCKED			REG_BIT(0)
+
 #define GUC_SHIM_CONTROL			XE_REG(0xc064)
 #define   PVC_GUC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
 #define   PVC_GUC_MOCS_UC_INDEX			1
@@ -86,11 +58,78 @@
 #define   GUC_ENABLE_READ_CACHE_LOGIC		REG_BIT(1)
 #define   GUC_DISABLE_SRAM_INIT_TO_ZEROES	REG_BIT(0)
 
+#define SOFT_SCRATCH(n)				XE_REG(0xc180 + (n) * 4)
+#define SOFT_SCRATCH_COUNT			16
+
+#define HUC_KERNEL_LOAD_INFO			XE_REG(0xc1dc)
+#define   HUC_LOAD_SUCCESSFUL			REG_BIT(0)
+
+#define UOS_RSA_SCRATCH(i)			XE_REG(0xc200 + (i) * 4)
+#define UOS_RSA_SCRATCH_COUNT			64
+
+#define DMA_ADDR_0_LOW				XE_REG(0xc300)
+#define DMA_ADDR_0_HIGH				XE_REG(0xc304)
+#define DMA_ADDR_1_LOW				XE_REG(0xc308)
+#define DMA_ADDR_1_HIGH				XE_REG(0xc30c)
+#define   DMA_ADDR_SPACE_MASK			REG_GENMASK(20, 16)
+#define   DMA_ADDRESS_SPACE_WOPCM		REG_FIELD_PREP(DMA_ADDR_SPACE_MASK, 7)
+#define DMA_COPY_SIZE				XE_REG(0xc310)
+#define DMA_CTRL				XE_REG(0xc314)
+#define   HUC_UKERNEL				REG_BIT(9)
+#define   UOS_MOVE				REG_BIT(4)
+#define   START_DMA				REG_BIT(0)
+#define DMA_GUC_WOPCM_OFFSET			XE_REG(0xc340)
+#define   GUC_WOPCM_OFFSET_SHIFT		14
+#define   GUC_WOPCM_OFFSET_MASK			REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
+#define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
+#define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
+#define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
 
 #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
 #define   GUC_SEND_TRIGGER			REG_BIT(0)
+
+#define GUC_BCS_RCS_IER				XE_REG(0xc550)
+#define GUC_VCS2_VCS1_IER			XE_REG(0xc554)
+#define GUC_WD_VECS_IER				XE_REG(0xc558)
+#define GUC_PM_P24C_IER				XE_REG(0xc55c)
+
+#define GUC_TLB_INV_CR				XE_REG(0xcee8)
+#define   GUC_TLB_INV_CR_INVALIDATE		REG_BIT(0)
+
+#define HUC_STATUS2				XE_REG(0xd3b0)
+#define   HUC_FW_VERIFIED			REG_BIT(7)
+
+#define GT_PM_CONFIG				XE_REG(0x13816c)
+#define   GT_DOORBELL_ENABLE			REG_BIT(0)
+
 #define GUC_HOST_INTERRUPT			XE_REG(0x1901f0)
 
+#define VF_SW_FLAG(n)				XE_REG(0x190240 + (n) * 4)
+#define VF_SW_FLAG_COUNT			4
+
+#define MED_GUC_HOST_INTERRUPT			XE_REG(0x190304)
+
+#define MED_VF_SW_FLAG(n)			XE_REG(0x190310 + (n) * 4)
+#define MED_VF_SW_FLAG_COUNT			4
+
+/* GuC Interrupt Vector */
+#define GUC_INTR_GUC2HOST			REG_BIT(15)
+#define GUC_INTR_EXEC_ERROR			REG_BIT(14)
+#define GUC_INTR_DISPLAY_EVENT			REG_BIT(13)
+#define GUC_INTR_SEM_SIG			REG_BIT(12)
+#define GUC_INTR_IOMMU2GUC			REG_BIT(11)
+#define GUC_INTR_DOORBELL_RANG			REG_BIT(10)
+#define GUC_INTR_DMA_DONE			REG_BIT(9)
+#define GUC_INTR_FATAL_ERROR			REG_BIT(8)
+#define GUC_INTR_NOTIF_ERROR			REG_BIT(7)
+#define GUC_INTR_SW_INT_6			REG_BIT(6)
+#define GUC_INTR_SW_INT_5			REG_BIT(5)
+#define GUC_INTR_SW_INT_4			REG_BIT(4)
+#define GUC_INTR_SW_INT_3			REG_BIT(3)
+#define GUC_INTR_SW_INT_2			REG_BIT(2)
+#define GUC_INTR_SW_INT_1			REG_BIT(1)
+#define GUC_INTR_SW_INT_0			REG_BIT(0)
+
 #define GUC_NUM_DOORBELLS			256
 
 /* format of the HW-monitored doorbell cacheline */
@@ -103,43 +142,4 @@ struct guc_doorbell_info {
 	u32 reserved[14];
 } __packed;
 
-#define DRBREGL(x)				XE_REG(0x1000 + (x) * 8)
-#define   DRB_VALID				REG_BIT(0)
-#define DRBREGU(x)				XE_REG(0x1000 + (x) * 8 + 4)
-
-#define DIST_DBS_POPULATED			XE_REG(0xd08)
-#define   DOORBELLS_PER_SQIDI_MASK		REG_GENMASK(23, 16)
-#define   SQIDIS_DOORBELL_EXIST_MASK		REG_GENMASK(15, 0)
-
-#define GUC_BCS_RCS_IER				XE_REG(0xC550)
-#define GUC_VCS2_VCS1_IER			XE_REG(0xC554)
-#define GUC_WD_VECS_IER				XE_REG(0xC558)
-#define GUC_PM_P24C_IER				XE_REG(0xC55C)
-
-#define VF_SW_FLAG(n)				XE_REG(0x190240 + (n) * 4)
-#define VF_SW_FLAG_COUNT			4
-
-#define MED_GUC_HOST_INTERRUPT			XE_REG(0x190304)
-
-#define MED_VF_SW_FLAG(n)			XE_REG(0x190310 + (n) * 4)
-#define MED_VF_SW_FLAG_COUNT			4
-
-/* GuC Interrupt Vector */
-#define GUC_INTR_GUC2HOST			BIT(15)
-#define GUC_INTR_EXEC_ERROR			BIT(14)
-#define GUC_INTR_DISPLAY_EVENT			BIT(13)
-#define GUC_INTR_SEM_SIG			BIT(12)
-#define GUC_INTR_IOMMU2GUC			BIT(11)
-#define GUC_INTR_DOORBELL_RANG			BIT(10)
-#define GUC_INTR_DMA_DONE			BIT(9)
-#define GUC_INTR_FATAL_ERROR			BIT(8)
-#define GUC_INTR_NOTIF_ERROR			BIT(7)
-#define GUC_INTR_SW_INT_6			BIT(6)
-#define GUC_INTR_SW_INT_5			BIT(5)
-#define GUC_INTR_SW_INT_4			BIT(4)
-#define GUC_INTR_SW_INT_3			BIT(3)
-#define GUC_INTR_SW_INT_2			BIT(2)
-#define GUC_INTR_SW_INT_1			BIT(1)
-#define GUC_INTR_SW_INT_0			BIT(0)
-
 #endif
-- 
2.40.1

