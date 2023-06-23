Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A0AEB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 04:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D86010E5D5;
	Fri, 23 Jun 2023 04:13:11 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E68B10E5D1
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jun 2023 04:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687493586; x=1719029586;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nb5kmcHxtyEUZvqfKvgEIwH7gm9Al9i95wyj39qtypY=;
 b=Hhp3pgm+bFSWj7UWaSFoC0/dzgULoE4mlnf5tio5XdFdEG6YAH592C4H
 Tw2PNIDcsrSejP4nYuKTAVee775sA7DV9sqHzEyCzG04GKPNs569IDx6d
 R3L4/RSW/DC+oqMvgviwjA7WF4Y8xqWCFnj4CKLNJ63mVbIItCq+jMKjg
 82uabqoTq+5pBv5QE7dz5CZ/VX3Za7DnZLOlgHcJmxaII48eY/8ZoJrtN
 WCQ9Z94qZ6Uvsi8ISKKYMNmTc6YlBzbHUHcOJ+44QIqP1sgRxaSbiUki8
 Jrl+lpF+Rkw1QwUphsyfwvint8EXVGiqOtFjoupdFiU45Ng3SFtTKpdLE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="447056732"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="447056732"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 21:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="828226812"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="828226812"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 21:13:05 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com
Date: Fri, 23 Jun 2023 00:12:57 -0400
Message-Id: <20230623041257.3550266-4-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230623041257.3550266-1-david.kershner@intel.com>
References: <20230623041257.3550266-1-david.kershner@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/3] drm/xe: Introduce Intel Accelerator
 fabric driver
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

Add the Intel accelerated fabric driver infrastructure and driver
framework.

Signed-off-by: David Kershner <david.kershner@intel.com>
---
 drivers/gpu/drm/xe/Kconfig          |   5 +
 drivers/gpu/drm/xe/Makefile         |   1 +
 drivers/gpu/drm/xe/fabric/Kconfig   |  18 +
 drivers/gpu/drm/xe/fabric/Makefile  |  12 +
 drivers/gpu/drm/xe/fabric/csr.h     | 493 ++++++++++++++++++++++
 drivers/gpu/drm/xe/fabric/iaf_drv.h | 278 ++++++++++++
 drivers/gpu/drm/xe/fabric/main.c    | 632 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/fabric/sysfs.c   | 114 +++++
 drivers/gpu/drm/xe/fabric/sysfs.h   |  16 +
 9 files changed, 1569 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/fabric/Kconfig
 create mode 100644 drivers/gpu/drm/xe/fabric/Makefile
 create mode 100644 drivers/gpu/drm/xe/fabric/csr.h
 create mode 100644 drivers/gpu/drm/xe/fabric/iaf_drv.h
 create mode 100644 drivers/gpu/drm/xe/fabric/main.c
 create mode 100644 drivers/gpu/drm/xe/fabric/sysfs.c
 create mode 100644 drivers/gpu/drm/xe/fabric/sysfs.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index e4be3749778a..21a4daa3b6d6 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -84,3 +84,8 @@ depends on DRM_XE
 depends on EXPERT
 source "drivers/gpu/drm/xe/Kconfig.debug"
 endmenu
+
+menu "drm/xe/fabric Intel Fabric Connectivity driver support"
+       depends on DRM_XE
+       source "drivers/gpu/drm/xe/fabric/Kconfig"
+endmenu
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b2a992884c0f..4fa00b9a8f24 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -230,6 +230,7 @@ endif
 
 obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
+obj-$(CONFIG_DRM_XE_INTEL_FABRIC) += fabric/
 
 # header test
 hdrtest_find_args := -not -path xe_rtp_helpers.h
diff --git a/drivers/gpu/drm/xe/fabric/Kconfig b/drivers/gpu/drm/xe/fabric/Kconfig
new file mode 100644
index 000000000000..082df4771545
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DRM_XE_INTEL_FABRIC
+	tristate "Intel Fabric Connectivity driver support"
+	depends on 64BIT
+	depends on NET
+	select LIBCRC32C
+	default m
+	help
+	  This kernel driver provides support for the Intel glueless
+	  fabric adapter. The Intel fabric adapter allows GPUs to share
+	  device memory space in a device specific address space.
+
+config IAF_DEBUG_ENABLE
+	bool "Enable Intel Accelerator Fabric debug configurations"
+	depends on DRM_XE_INTEL_FABRIC
+	default n
+	help
+	  Support Intel Accelerator Fabric debug Kconfig options
diff --git a/drivers/gpu/drm/xe/fabric/Makefile b/drivers/gpu/drm/xe/fabric/Makefile
new file mode 100644
index 000000000000..2f753efffc5d
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright(c) 2020 - 2023 Intel Corporation.
+#
+# Intel Connectivity fabric driver
+#
+#
+
+obj-$(CONFIG_DRM_XE_INTEL_FABRIC) += iaf.o
+
+iaf-y := main.o \
+	 sysfs.o \
diff --git a/drivers/gpu/drm/xe/fabric/csr.h b/drivers/gpu/drm/xe/fabric/csr.h
new file mode 100644
index 000000000000..6c5a831a92bd
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/csr.h
@@ -0,0 +1,493 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019 - 2023 Intel Corporation.
+ *
+ */
+
+#ifndef IAF_CSR_H_INCLUDED
+#define IAF_CSR_H_INCLUDED
+
+#include <linux/types.h>
+
+#define CSR_SIZE sizeof(u64)
+
+/*
+ * TOP CSRs
+ */
+
+#define CP_ADDR_TOP_BASE		(0)
+#define CPORT_INIT_CTRL_ADDR		(CP_ADDR_TOP_BASE + 0)
+#define RISC_RESET_BIT			BIT_ULL(0)
+#define RISC_NMI_BIT			BIT_ULL(2)
+#define RISC_PAUSED_BIT			BIT_ULL(3)
+#define BOOTROM_PARITY_ERROR_BIT	BIT_ULL(4)
+#define WATCHDOG_STATUS_BIT		BIT_ULL(5)
+#define RISC_RESET_CAUSE_BIT		BIT_ULL(7)
+#define DINIT_FSM_STATE_MASK		GENMASK_ULL(31, 8)
+#define CSR_GPIO_CTRL			(CP_ADDR_TOP_BASE + 0x18)
+#define GPIO_CTRL_PIN_LINK_CONFIG	GENMASK_ULL(7, 3)
+#define GPIO_CTRL_OE_LINK_CONFIG	GENMASK_ULL(15, 11)
+#define CSR_ASIC_REV_INFO		(CP_ADDR_TOP_BASE + 0x40)
+#define MASK_ARI_PLATFORM		GENMASK_ULL(55, 40)
+#define MASK_ARI_STEP			GENMASK_ULL(39, 32)
+#define ARB_REG_BASE			(CP_ADDR_TOP_BASE + 0x100)
+#define FW_MIN_SVN_ADDR			(ARB_REG_BASE + 0x0)
+#define FW_UPDATED_SVN_ADDR		(ARB_REG_BASE + 0x8)
+#define FW_SVN_MASK			GENMASK_ULL(15, 0)
+
+#define CSR_ROPTION				0x80000008
+#define ROPTION_FORCE_FEC_HEAVY_ON		BIT(0)
+#define ROPTION_CBUF_MGR_TRACE_XBAR		BIT(1)
+#define ROPTION_CBUF_MGR_TRACE_PCI		BIT(2)
+#define ROPTION_CBUF_MGR_TRACE_ATTRIBUTES	BIT(3)
+#define ROPTION_PD_PHASE			GENMASK(5, 4)
+#define ROPTION_STOP_IN_CONFIGLT_WITH_BCC	BIT(6)
+#define ROPTION_TRACE_ERROR_RECOVERY		BIT(7)
+#define ROPTION_EV_MODE				BIT(8)
+#define ROPTION_TRACE_LNI_DEBUG			BIT(9)
+#define ROPTION_TRACE_SBUS_OPS			BIT(10)
+#define ROPTION_TRACE_STOP_ON_FULL		BIT(11)
+#define ROPTION_12G_ALLOWED			BIT(12)
+#define ROPTION_NO_DLA				BIT(13)
+#define ROPTION_DYNAMIC_SCREEN			BIT(14)
+#define ROPTION_UNUSED15			BIT(15)
+#define ROPTION_LOOP_BANDWIDTH			GENMASK(20, 16)
+#define ROPTION_1D_CODING			BIT(21)
+#define ROPTION_LCB_LOOPBACK			GENMASK(23, 22)
+#define ROPTION_TX_PRBS_GEN			BIT(24)
+#define ROPTION_STOP_IN_DEBOUNCE		BIT(25)
+#define ROPTION_NO_TUNING_IN_DEBOUNCE		BIT(26)
+#define ROPTION_CONFIGLT_NO_HAMMERS		BIT(27)
+#define ROPTION_FORCE_LNI			BIT(28)
+#define ROPTION_ALLOW_MARGINAL_LINKS		BIT(29)
+#define ROPTION_FORCE_FEC_LIGHT_ON		BIT(30)
+#define ROPTION_SERDES_ILB			BIT(31)
+
+/*
+ * PORT CSRs
+ */
+
+#define CSR_PORTS_BASE 0x10000000
+
+/*
+ * Each port is at a 4MB offset from CSR_PORTS_BASE, index by physical port
+ * number.
+ */
+#define CSR_PORT_OFFSET 0x400000
+
+/*
+ * Fabric ports are in memory region 0, while bridge ports are in region 1.
+ *
+ * When referencing bridge port addresses, both when using the raw CSR ops
+ * as well as the LINK_MGR_PORT_CSR ops, you must add this offset to
+ * addresses.
+ */
+#define CSR_REGION1_OFFSET 0x20000000
+
+/**
+ * get_raw_port_base - Calculates the base address of the given port for
+ * use with the CSR_RAW ops.
+ * @ppn: physical port number
+ *
+ * Return: The base address required for the CSR_RAW ops.
+ */
+static inline u32 get_raw_port_base(u8 ppn)
+{
+	return CSR_PORTS_BASE + ((ppn) - 1) * CSR_PORT_OFFSET;
+}
+
+#define CSR_FIDGEN_BASE 0
+
+#define CSR_FIDGEN_MASK_A     (CSR_FIDGEN_BASE + 0x00)
+#define CSR_FIDGEN_SHIFT_A    (CSR_FIDGEN_BASE + 0x08)
+#define CSR_FIDGEN_MASK_B     (CSR_FIDGEN_BASE + 0x10)
+#define CSR_FIDGEN_SHIFT_B    (CSR_FIDGEN_BASE + 0x18)
+#define CSR_FIDGEN_RSVD0      (CSR_FIDGEN_BASE + 0x20)
+#define CSR_FIDGEN_RSVD1      (CSR_FIDGEN_BASE + 0x28)
+#define CSR_FIDGEN_MASK_H     (CSR_FIDGEN_BASE + 0x30)
+#define CSR_FIDGEN_SHIFT_H    (CSR_FIDGEN_BASE + 0x38)
+#define CSR_FIDGEN_MODULO     (CSR_FIDGEN_BASE + 0x40)
+#define CSR_FIDGEN_WHOAMI     (CSR_FIDGEN_BASE + 0x48)
+#define CSR_FIDGEN_MASK_D     (CSR_FIDGEN_BASE + 0x50)
+#define CSR_FIDGEN_STATIC_RND (CSR_FIDGEN_BASE + 0x58)
+
+/*
+ * These apply to all of the shift registers.  Bit 6 is the direction of
+ * shift, while bits 5 through 0 are the amount to shift by.
+ */
+#define MASK_FIDGEN_SHIFT_BY    GENMASK(5, 0)
+#define MASK_FIDGEN_SHIFT_RIGHT GENMASK(6, 6)
+
+/*
+ * The LUT contains 8192 64-bit registers, each mapping a lookup index
+ * to a 20-bit DFID.
+ */
+#define CSR_FIDGEN_LUT_BASE (CSR_FIDGEN_BASE + 0x10000)
+
+#define CSR_FIDGEN_LUT_INDEX_WIDTH 13
+
+#define CSR_BRIDGE_TOP_BASE 0x30000
+
+#define CSR_BT_CTX_TRACKER_CFG CSR_BRIDGE_TOP_BASE
+#define MASK_BT_CTC_ENABLE_SRC          GENMASK(0, 0)
+#define MASK_BT_CTC_ENABLE_DST          GENMASK(1, 1)
+#define MASK_BT_CTC_DISABLE_TIMEOUT_SRC GENMASK(2, 2)
+#define MASK_BT_CTC_DISABLE_TIMEOUT_DST GENMASK(3, 3)
+
+#define CSR_BT_PORT_CTRL (CSR_BRIDGE_TOP_BASE + 0x08)
+#define MASK_BT_POC_DROP_FBRC_REQ     GENMASK(0, 0)
+#define MASK_BT_POC_DROP_FBRC_REQ_ERR GENMASK(1, 1)
+#define MASK_BT_POC_DROP_MDFI_REQ     GENMASK(2, 2)
+#define MASK_BT_POC_DROP_MDFI_REQ_ERR GENMASK(3, 3)
+#define MASK_BT_POC_DROP_FBRC_RSP     GENMASK(4, 4)
+#define MASK_BT_POC_DROP_MDFI_RSP     GENMASK(5, 5)
+
+#define CSR_BT_OUTSTANDING_TX (CSR_BRIDGE_TOP_BASE + 0x10)
+#define MASK_BT_OT_FBRC GENMASK(15,  0)
+#define MASK_BT_OT_MDFI GENMASK(31, 16)
+
+#define CSR_BT_FLUSH_CONTEXT (CSR_BRIDGE_TOP_BASE + 0x18)
+#define MASK_BT_FC_INITIATE    GENMASK(0, 0)
+#define MASK_BT_FC_IN_PROGRESS GENMASK(1, 1)
+
+#define CSR_BT_PAUSE_CTRL (CSR_BRIDGE_TOP_BASE + 0x20)
+#define MASK_BT_PAC_FBRC_REQ GENMASK(0, 0)
+#define MASK_BT_PAC_MDFI_REQ GENMASK(1, 1)
+#define MASK_BT_PAC_FBRC_RSP GENMASK(2, 2)
+#define MASK_BT_PAC_MDFI_RSP GENMASK(3, 3)
+
+#define CSR_BT_PKG_ADDR_RANGE (CSR_BRIDGE_TOP_BASE + 0x28)
+#define MASK_BT_PAR_BASE  GENMASK(18, 1)
+#define MASK_BT_PAR_RANGE GENMASK(29, 20)
+
+/* csr encodes address bits [45:32] in register bits [13:0] */
+#define BT_ADDR_RANGE_SHIFT 32
+
+#define CSR_BT_VC2SC_MAP (CSR_BRIDGE_TOP_BASE + 0x50)
+
+#define CSR_BT_TILE0_RANGE (CSR_BRIDGE_TOP_BASE + 0x58)
+#define MASK_BT_T0_VALID GENMASK(0, 0)
+#define MASK_BT_T0_BASE  GENMASK(7, 1)
+#define MASK_BT_T0_RANGE GENMASK(14, 8)
+
+#define CSR_BT_TILE1_RANGE (CSR_BRIDGE_TOP_BASE + 0x60)
+#define MASK_BT_T1_VALID GENMASK(0, 0)
+#define MASK_BT_T1_BASE  GENMASK(7, 1)
+#define MASK_BT_T1_RANGE GENMASK(14, 8)
+
+/* xmit/recv flit/packet counter register offsets */
+#define O_FPC_PORTRCV_DATA_CNT 0x100490
+#define O_FPC_PORTRCV_PKT_CNT 0x100438
+#define TP_PRF_XMIT_DATA_OFFSET 0x200458
+#define TP_PRF_XMIT_PKTS_OFFSET 0x200400
+
+/* LCB counter offsets */
+#define O_LCB_ERR_INFO_OFFSET 0x308500
+#define O_LCB_STS_RX_CRC_FEC_MODE 0x3087A8
+#define O_LCB_STS_RX_LOGICAL_ID 0x3087B0
+#define O_LCB_PRF_OFFSET 0x308700
+
+#define BRG_PERF_OFFSET 0x34000
+#define BRG_PERF_END (BRG_PERF_OFFSET + 0xB8)
+#define BRG_ERR_OFFSET 0x36000
+#define BRG_ERR_END (BRG_ERR_OFFSET + 0x198)
+#define BRG_1_ERR_OFFSET (BRG_ERR_OFFSET + 0x200)
+#define BRG_1_ERR_END (BRG_ERR_OFFSET + 0x228)
+#define BRG_2_ERR_OFFSET (BRG_ERR_OFFSET + 0x300)
+#define BRG_2_ERR_END (BRG_ERR_OFFSET + 0x328)
+#define BRG_3_ERR_OFFSET (BRG_ERR_OFFSET + 0x400)
+#define BRG_3_ERR_END (BRG_ERR_OFFSET + 0x428)
+#define BRG_RTP_ERR_OFFSET (0x200000 + 0x1000)
+#define BRG_RTP_ERR_END (BRG_RTP_ERR_OFFSET + 0x28)
+#define BRG_RTP_STS_OFFSET (0x200000 + 0x2000)
+#define BRG_RTP_STS_START_1 (BRG_RTP_STS_OFFSET + 0x10)
+#define BRG_RTP_STS_END_1 (BRG_RTP_STS_OFFSET + 0x40)
+#define BRG_RTP_STS_START_2 (BRG_RTP_STS_OFFSET + 0x80)
+#define BRG_RTP_STS_END_2 (BRG_RTP_STS_OFFSET + 0xA0)
+#define TPM_ERR_START (0x100000 + 0x300)
+#define TPM_ERR_END (TPM_ERR_START + 0x108)
+#define TPM_ERR_MBE_START (0x100000 + 0x4A0)
+#define TPM_ERR_MBE_END (TPM_ERR_MBE_START + 0x88)
+#define TPM_PRF_START (0x100000 + 0x840)
+#define TPM_PRF_END (TPM_PRF_START + 0x108)
+
+#define RPM_OFFSET 0x180000
+#define RPM_INQ_ERR_OFFSET (RPM_OFFSET + 0x2000)
+#define RPM_INQ_STS_OFFSET (RPM_OFFSET + 0x2900)
+#define RPM_INQ_PRF_OFFSET (RPM_OFFSET + 0x2D00)
+
+#define RPM_PORT_ERR_COUNTERS_START (RPM_INQ_PRF_OFFSET + 0x100)
+#define RPM_PORT_ERR_COUNTERS_END (RPM_INQ_PRF_OFFSET + 0x7F8)
+
+#define RPM_INQ_PORT0_ERR_START (RPM_INQ_ERR_OFFSET)
+#define RPM_INQ_PORT0_ERR_END (RPM_INQ_ERR_OFFSET + 0x20)
+
+#define RPM_INQ_PORT1_ERR_START (RPM_INQ_ERR_OFFSET + 0x80)
+#define RPM_INQ_PORT1_ERR_END (RPM_INQ_ERR_OFFSET + 0xA0)
+
+#define RPM_INQ_PORT2_ERR_START (RPM_INQ_ERR_OFFSET + 0x100)
+#define RPM_INQ_PORT2_ERR_END (RPM_INQ_ERR_OFFSET + 0x120)
+
+#define RPM_INQ_PORT3_ERR_START (RPM_INQ_ERR_OFFSET + 0x180)
+#define RPM_INQ_PORT3_ERR_END (RPM_INQ_ERR_OFFSET + 0x1A0)
+
+#define RPM_INQ_PORT4_ERR_START (RPM_INQ_ERR_OFFSET + 0x200)
+#define RPM_INQ_PORT4_ERR_END (RPM_INQ_ERR_OFFSET + 0x220)
+
+#define RPM_INQ_PORT5_ERR_START (RPM_INQ_ERR_OFFSET + 0x280)
+#define RPM_INQ_PORT5_ERR_END (RPM_INQ_ERR_OFFSET + 0x2A0)
+
+#define RPM_INQ_PORT6_ERR_START (RPM_INQ_ERR_OFFSET + 0x300)
+#define RPM_INQ_PORT6_ERR_END (RPM_INQ_ERR_OFFSET + 0x320)
+
+#define RPM_INQ_PORT7_ERR_START (RPM_INQ_ERR_OFFSET + 0x380)
+#define RPM_INQ_PORT7_ERR_END (RPM_INQ_ERR_OFFSET + 0x3A0)
+
+#define RPM_INQ_FLSTOR_ERR_START (RPM_INQ_ERR_OFFSET + 0x400)
+#define RPM_INQ_FLSTOR_ERR_END (RPM_INQ_ERR_OFFSET + 0x420)
+
+#define RPM_PORT_STS_START (RPM_INQ_STS_OFFSET + 0x200)
+#define RPM_PORT_STS_END (RPM_INQ_STS_OFFSET + 0x2F8)
+
+#define RPM_SBE_ERR_COUNTERS_START (RPM_INQ_PRF_OFFSET)
+#define RPM_SBE_ERR_COUNTERS_END (RPM_INQ_PRF_OFFSET + 0x78)
+
+#define RPM_MBE_ERR_COUNTERS_START (RPM_INQ_PRF_OFFSET + 0x80)
+#define RPM_MBE_ERR_COUNTERS_END (RPM_INQ_PRF_OFFSET + 0xF8)
+
+#define RPM_ARB_PERF_COUNTERS_START (RPM_INQ_PRF_OFFSET + 0x8C0)
+#define RPM_ARB_PERF_COUNTERS_END (RPM_INQ_PRF_OFFSET + 0x938)
+
+#define RPM_PERF_COUNTERS_START (RPM_INQ_PRF_OFFSET + 0x800)
+#define RPM_PERF_COUNTERS_END (RPM_INQ_PRF_OFFSET + 0x8B8)
+
+#define CRC_MODE GENMASK(1, 0)
+#define FEC_MODE GENMASK(5, 4)
+
+#define PEER_TX_ID_LN0 GENMASK(2, 0)
+#define PEER_TX_ID_LN1 GENMASK(6, 4)
+#define PEER_TX_ID_LN2 GENMASK(10, 8)
+#define PEER_TX_ID_LN3 GENMASK(14, 12)
+
+/* error csrs for sticky error reporting */
+#define O_FPC_ERR_STS                         0x100000
+#define O_FPC_ERR_CLR                         0x100008
+#define O_FPC_ERR_FIRST_HOST                  0x100020
+#define O_FPC_ERR_INFO_PORTRCV                0x100028
+#define O_FPC_ERR_INFO_PORTRCV_HDR0_A         0x100030
+#define O_FPC_ERR_INFO_PORTRCV_HDR0_B         0x100038
+#define O_FPC_ERR_INFO_PORTRCV_HDR1_A         0x100040
+#define O_FPC_ERR_INFO_PORTRCV_HDR1_B         0x100048
+#define O_FPC_ERR_INFO_FMCONFIG               0x100050
+#define O_FPC_ERR_INFO_FLOW_CTRL              0x100058
+#define O_FPC_ERR_INFO_UNCORRECTABLE          0x100060
+#define O_FPC_ERR_INFO_PORTRCVCONSTRAINT      0x100068
+#define O_RTP_ERR_STS                         0x141000
+#define O_RTP_ERR_CLR                         0x141008
+#define O_RTP_ERR_FIRST_HOST                  0x141020
+#define O_RTP_ERR_FIRST_INFO                  0x141028
+#define O_INQ_ERR_STS                         0x182000
+#define O_INQ_ERR_CLR                         0x182008
+#define O_INQ_ERR_EN_HOST                     0x182018
+#define O_INQ_ERR_FIRST_HOST                  0x182020
+#define O_TP_ERR_STS_0                        0x200180
+#define O_TP_ERR_CLR_0                        0x200188
+#define O_TP_ERR_EN_HOST_0                    0x200198
+#define O_TP_ERR_FIRST_HOST_0                 0x2001a0
+#define O_TP_ERR_STS_1                        0x200200
+#define O_TP_ERR_CLR_1                        0x200208
+#define O_TP_ERR_EN_HOST_1                    0x200218
+#define O_TP_ERR_FIRST_HOST_1                 0x200220
+#define O_TP_ERR_ERROR_INFO                   0x200230
+#define O_TP_ERR_PKEY_ERROR_INFO              0x200248
+#define O_TP_ERR_SBE_ERROR_CNT                0x200250
+#define O_TP_ERR_MBE_ERROR_CNT                0x200258
+#define O_TP_PE_ERROR_CNT                     0x200260
+#define O_8051_ERR_STS                        0x300100
+#define O_8051_ERR_CLR                        0x300108
+#define O_8051_FIRST_HOST                     0x300120
+#define O_LCB_ERR_STS                         0x308480
+#define O_LCB_ERR_CLR                         0x308488
+#define O_LCB_ERR_FIRST_HOST                  0x3084a0
+#define O_LCB_ERR_INFO_TOTAL_CRC_ERR          0x308500
+#define O_LCB_ERR_INFO_CRC_ERR_LN0            0x308508
+#define O_LCB_ERR_INFO_CRC_ERR_LN1            0x308510
+#define O_LCB_ERR_INFO_CRC_ERR_LN2            0x308518
+#define O_LCB_ERR_INFO_CRC_ERR_LN3            0x308520
+#define O_LCB_ERR_INFO_CRC_ERR_MULTI_LN       0x308528
+#define O_LCB_ERR_INFO_TX_REPLAY_CNT          0x308530
+#define O_LCB_ERR_INFO_RX_REPLAY_CNT          0x308538
+#define O_LCB_ERR_INFO_SEQ_CRC_CNT            0x308540
+#define O_LCB_ERR_INFO_ESCAPE_0_ONLY_CNT      0x308548
+#define O_LCB_ERR_INFO_ESCAPE_0_PLUS1_CNT     0x308550
+#define O_LCB_ERR_INFO_ESCAPE_0_PLUS2_CNT     0x308558
+#define O_LCB_ERR_INFO_REINIT_FROM_PEER_CNT   0x308560
+#define O_LCB_ERR_INFO_SBE_CNT                0x308568
+#define O_LCB_ERR_INFO_MISC_FLG_CNT           0x308570
+#define O_LCB_ERR_INFO_ECC_INPUT_BUF          0x308578
+#define O_LCB_ERR_INFO_ECC_INPUT_BUF_HGH      0x308580
+#define O_LCB_ERR_INFO_ECC_INPUT_BUF_LOW      0x308588
+#define O_LCB_ERR_INFO_ECC_REPLAY_BUF         0x308590
+#define O_LCB_ERR_INFO_ECC_REPLAY_BUF_HGH     0x308598
+#define O_LCB_ERR_INFO_ECC_REPLAY_BUF_LOW     0x3085A0
+#define O_LCB_ERR_INFO_ECC_PM_TIME            0x3085A8
+#define O_LCB_ERR_INFO_ECC_PM_TIME_HGH        0x3085B0
+#define O_LCB_ERR_INFO_ECC_PM_TIME_LOW        0x3085B8
+#define O_LCB_ERR_INFO_FEC_CERR_CNT_1         0x3085C0
+#define O_LCB_ERR_INFO_FEC_CERR_CNT_2         0x3085C8
+#define O_LCB_ERR_INFO_FEC_CERR_CNT_3         0x3085D0
+#define O_LCB_ERR_INFO_FEC_CERR_CNT_4         0x3085D8
+#define O_LCB_ERR_INFO_FEC_CERR_CNT_5         0x3085E0
+#define O_LCB_ERR_INFO_FEC_CERR_CNT_6         0x3085E8
+#define O_LCB_ERR_INFO_FEC_CERR_CNT_7         0x3085F0
+#define O_LCB_ERR_INFO_FEC_CERR_CNT_8         0x3085F8
+#define O_LCB_ERR_INFO_FEC_UERR_CNT           0x308600
+#define O_LCB_ERR_INFO_FEC_CERR_MASK_0        0x308608
+#define O_LCB_ERR_INFO_FEC_CERR_MASK_1        0x308610
+#define O_LCB_ERR_INFO_FEC_CERR_MASK_2        0x308618
+#define O_LCB_ERR_INFO_FEC_CERR_MASK_3        0x308620
+#define O_LCB_ERR_INFO_FEC_CERR_MASK_4        0x308628
+#define O_LCB_ERR_INFO_FEC_CERR_MASK_VLD      0x308630
+#define O_LCB_ERR_INFO_FEC_CERR_MASK_MISS_CNT 0x308638
+#define O_LCB_ERR_INFO_FEC_ERR_LN0            0x308640
+#define O_LCB_ERR_INFO_FEC_ERR_LN1            0x308648
+#define O_LCB_ERR_INFO_FEC_ERR_LN2            0x308650
+#define O_LCB_ERR_INFO_FEC_ERR_LN3            0x308658
+#define O_LCB_ERR_INFO_FX_RESYNC_CNT          0x308660
+#define O_BRG_CTX_ERR_STS                     0x036000
+#define O_BRG_CTX_ERR_CLR                     0x036008
+#define O_BRG_CTX_ERR_FIRST_HOST              0x036020
+#define O_BRG_CTX_ERR_FIRST_INFO              0x036028
+#define O_SRC_CTXT_SBE_CNT                    0x036040
+#define O_DST_CTXT_SBE_CNT                    0x036048
+#define O_SRC_CTXT_MBE_CNT                    0x036050
+#define O_DST_CTXT_MBE_CNT                    0x036058
+#define O_BRG_INCMD_PKTPAR_ERR                0x036060
+#define O_BRG_INPKT_POISON_SET                0x036068
+#define O_BRG_INRSP_PKTPAR_ERR                0x036070
+#define O_BRG_INDATA_PKTPAR_ERR               0x036078
+#define O_BRG_OUTPKT_POISON_SET               0x036080
+#define O_BRG_RPM_POISON_SET                  0x036088
+#define O_TPM_BRG_POISON_SET                  0x036090
+#define O_BRG_DROP_FABRIC_REQ                 0x036098
+#define O_BRG_DROP_MDFI_REQ                   0x0360a0
+#define O_BRG_DROP_FABRIC_RSP                 0x0360a8
+#define O_BRG_DROP_MDFI_RSP                   0x0360b0
+#define O_BRG_SRCCTXT_TO                      0x0360b8
+#define O_BRG_DSTCTXT_TO                      0x0360c0
+#define O_BRG_FIDMISS                         0x0360c8
+#define O_BRG_FIDMISS_INFO                    0x0360d0
+#define O_BRG_SRCCTXT_DUP_RSP                 0x0360d8
+#define O_BRG_SRCCTXT_DUP_RSPINFO             0x0360e0
+#define O_BRG_DSTCTXT_DUP_RSP                 0x0360e8
+#define O_BRG_DSTCTXT_DUP_RSPINFO             0x0360f0
+#define O_BRG_SFID_FILTER_DROP                0x0360f8
+#define O_BRG_0_ERR_STS                       0x036100
+#define O_BRG_0_ERR_CLR                       0x036108
+#define O_BRG_0_ERR_FIRST_HOST                0x036120
+#define O_BRG_0_ERR_FIRST_INFO                0x036128
+#define O_BRG_SBE_ADDR2FID_ERR                0x036130
+#define O_BRG_SBE_RSPARB_ERR                  0x036138
+#define O_BRG_SBE_EGRQ_ERR                    0x036140
+#define O_BRG_SBE_INGRQ_ERR                   0x036148
+#define O_BRG_SBE_TPMEGRQ_ERR                 0x036150
+#define O_BRG_SBE_TPMINGRQ_ERR                0x036158
+#define O_BRG_MBE_ADDR2FID_ERR                0x036160
+#define O_BRG_MBE_RSPARB_ERR                  0x036168
+#define O_BRG_MBE_EGRQ_ERR                    0x036170
+#define O_BRG_MBE_INGRQ_ERR                   0x036178
+#define O_BRG_MBE_TPMEGRQ_ERR                 0x036180
+#define O_BRG_MBE_TPMINGRQ_ERR                0x036188
+#define O_BRG_SBE_TPMDECAP_ERR                0x036190
+#define O_BRG_MBE_TPMDECAP_ERR                0x036198
+#define O_BRG_1_ERR_STS                       0x036200
+#define O_BRG_1_ERR_CLR                       0x036208
+#define O_BRG_1_ERR_FIRST_HOST                0x036220
+#define O_BRG_1_ERR_FIRST_INFO                0x036228
+#define O_BRG_2_ERR_STS                       0x036300
+#define O_BRG_2_ERR_CLR                       0x036308
+#define O_BRG_2_ERR_FIRST_HOST                0x036320
+#define O_BRG_2_ERR_FIRST_INFO                0x036328
+#define O_TPM_ERR_STS                         0x100300
+#define O_TPM_ERR_CLR                         0x100308
+#define O_TPM_ERR_FIRST_HOST                  0x100320
+#define O_TPM_ERR_RINFO_SBE_COUNT             0x100328
+#define O_TPM_ERR_RINFO_SBE_INFO              0x100330
+#define O_TPM_ERR_RINFO_MBE_COUNT             0x100338
+#define O_TPM_ERR_RINFO_MBE_INFO              0x100340
+#define O_TPM_ERR_QFLITDATA_SBE_COUNT         0x100348
+#define O_TPM_ERR_QFLITDATA_SBE_INFO          0x100350
+#define O_TPM_ERR_QFLITDATA_MBE_COUNT         0x100358
+#define O_TPM_ERR_QFLITDATA_MBE_INFO          0x100360
+#define O_TPM_ERR_RINFO_PE_COUNT              0x100368
+#define O_TPM_ERR_RINFO_PE_INFO               0x100370
+#define O_TPM_ERR_TAILLESS_PKT_CNT            0x100378
+#define O_TPM_ERR_RSVD_VL_CNT                 0x100380
+#define O_TPM_ERR_RSVD_VL_INFO                0x100388
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_0         0x100390
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_1         0x100398
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_2         0x1003a0
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_3         0x1003a8
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_4         0x1003b0
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_5         0x1003b8
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_6         0x1003c0
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_7         0x1003c8
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_8         0x1003d0
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_9         0x1003d8
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_10        0x1003e0
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_11        0x1003e8
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_12        0x1003f0
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_13        0x1003f8
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_14        0x100400
+#define O_TPM_ERR_STORG_SBE_ERR_CNT_15        0x100408
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_0         0x1004a0
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_1         0x1004a8
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_2         0x1004b0
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_3         0x1004b8
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_4         0x1004c0
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_5         0x1004c8
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_6         0x1004d0
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_7         0x1004d8
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_8         0x1004e0
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_9         0x1004e8
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_10        0x1004f0
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_11        0x1004f8
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_12        0x100500
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_13        0x100508
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_14        0x100510
+#define O_TPM_ERR_STORG_MBE_ERR_CNT_15        0x100518
+#define O_TPM_ERR_INQ_SBE_ERR_INFO            0x100520
+#define O_TPM_ERR_INQ_MBE_ERR_INFO            0x100528
+#define O_RPM_INQ_PORT0_ERR_STS               0x182000
+#define O_RPM_INQ_PORT0_ERR_CLR               0x182008
+#define O_RPM_INQ_PORT0_ERR_FIRST_HOST        0x182020
+#define O_RPM_INQ_PORT1_ERR_STS               0x182080
+#define O_RPM_INQ_PORT1_ERR_CLR               0x182088
+#define O_RPM_INQ_PORT1_ERR_FIRST_HOST        0x1820A0
+#define O_RPM_INQ_PORT2_ERR_STS               0x182100
+#define O_RPM_INQ_PORT2_ERR_CLR               0x182108
+#define O_RPM_INQ_PORT2_ERR_FIRST_HOST        0x182120
+#define O_RPM_INQ_PORT3_ERR_STS               0x182180
+#define O_RPM_INQ_PORT3_ERR_CLR               0x182188
+#define O_RPM_INQ_PORT3_ERR_FIRST_HOST        0x1821A0
+#define O_RPM_INQ_PORT4_ERR_STS               0x182200
+#define O_RPM_INQ_PORT4_ERR_CLR               0x182208
+#define O_RPM_INQ_PORT4_ERR_FIRST_HOST        0x182220
+#define O_RPM_INQ_PORT5_ERR_STS               0x182280
+#define O_RPM_INQ_PORT5_ERR_CLR               0x182288
+#define O_RPM_INQ_PORT5_ERR_FIRST_HOST        0x1822A0
+#define O_RPM_INQ_PORT6_ERR_STS               0x182300
+#define O_RPM_INQ_PORT6_ERR_CLR               0x182308
+#define O_RPM_INQ_PORT6_ERR_FIRST_HOST        0x182320
+#define O_RPM_INQ_PORT7_ERR_STS               0x182380
+#define O_RPM_INQ_PORT7_ERR_CLR               0x182388
+#define O_RPM_INQ_PORT7_ERR_FIRST_HOST        0x1823A0
+#define O_RPM_INQ_FLSTOR_ERR_STS              0x182400
+#define O_RPM_INQ_FLSTOR_ERR_CLR              0x182408
+#define O_RPM_INQ_FLSTOR_ERR_FIRST_HOST       0x182420
+#define O_BRG_RTP_ERR_STS                     0x201000
+#define O_BRG_RTP_ERR_CLR                     0x201008
+#define O_BRG_RTP_ERR_FIRST_HOST              0x201020
+#define O_BRG_RTP_ERR_FIRST_INFO              0x201028
+
+#endif /* IAF_CSR_H_INCLUDED */
diff --git a/drivers/gpu/drm/xe/fabric/iaf_drv.h b/drivers/gpu/drm/xe/fabric/iaf_drv.h
new file mode 100644
index 000000000000..0486d4b86b6f
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/iaf_drv.h
@@ -0,0 +1,278 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020 - 2023 Intel Corporation.
+ */
+
+#ifndef IAF_DRV_H_INCLUDED
+#define IAF_DRV_H_INCLUDED
+
+#include <linux/auxiliary_bus.h>
+#include <linux/irqreturn.h>
+#include <linux/slab.h>
+#include <linux/timer.h>
+#include <linux/kref.h>
+
+#include <drm/intel_iaf_platform.h>
+
+#define DRIVER_NAME "iaf"
+
+#undef pr_fmt
+#define pr_fmt(fmt) DRIVER_NAME ": " fmt
+
+/*
+ * The maximum number of tiles for the PVC product type.
+ *
+ * Revisit if future product types or variations are developed that require
+ * a product type table.
+ */
+#define IAF_MAX_SUB_DEVS 2
+
+/*
+ * Recognized discrete socket IDs
+ */
+#define MAX_SOCKET_IDS (32)
+
+/*
+ * Platforms and revisions.
+ *
+ * Note that these conform to the ANR ASIC_REV_INFO (ARI) register values,
+ * not the PCI revision IDs reported by the packaged product.
+ */
+
+#define ANR_ARI_PLATFORM	0x0101
+
+#define ANR_ARI_STEP_A0		0x00
+#define ANR_ARI_STEP_A1		0x01
+#define ANR_ARI_STEP_A_LAST	ANR_ARI_STEP_A1
+#define ANR_ARI_STEP_B0		0x10
+#define ANR_ARI_STEP_B_LAST	ANR_ARI_STEP_B0
+
+#define IS_ANR(sd) \
+	(FIELD_GET(MASK_ARI_PLATFORM, (sd)->asic_rev_info) == ANR_ARI_PLATFORM)
+
+#define IS_ANR_STEP(sd, since, until) (IS_ANR(sd) && \
+	FIELD_GET(MASK_ARI_STEP, (sd)->asic_rev_info) >= (since) && \
+	FIELD_GET(MASK_ARI_STEP, (sd)->asic_rev_info) <= (until))
+
+/*
+ * Device and subdevice message formats
+ *
+ * Device expands dev->name, sd expand relevant indices
+ * ": " separates info. *_FMT ends in ": ", *_ID_FMT does not
+ */
+
+#define DEV_ID_FMT "iaf.%d"
+#define SD_ID_FMT "sd.%d"
+
+#define DEV_FMT DEV_ID_FMT ": "
+#define SD_FMT SD_ID_FMT ": "
+
+#define DEV_SD_FMT DEV_FMT "" SD_FMT
+
+/*
+ * Subdevice-specific messaging
+ */
+
+#define sd_emerg(__sd, _fmt, ...) \
+		do { \
+			struct fsubdev *_sd = (__sd); \
+			dev_emerg(sd_dev(_sd), SD_FMT _fmt, \
+				  sd_index(_sd), ##__VA_ARGS__); \
+		} while (0)
+
+#define sd_alert(__sd, _fmt, ...) \
+		do { \
+			struct fsubdev *_sd = (__sd); \
+			dev_alert(sd_dev(_sd), SD_FMT _fmt, \
+				  sd_index(_sd), ##__VA_ARGS__); \
+		} while (0)
+
+#define sd_crit(__sd, _fmt, ...) \
+		do { \
+			struct fsubdev *_sd = (__sd); \
+			dev_crit(sd_dev(_sd), SD_FMT _fmt, \
+				 sd_index(_sd), ##__VA_ARGS__); \
+		} while (0)
+
+#define sd_err(__sd, _fmt, ...) \
+		do { \
+			struct fsubdev *_sd = (__sd); \
+			dev_err(sd_dev(_sd), SD_FMT _fmt, \
+				sd_index(_sd), ##__VA_ARGS__); \
+		} while (0)
+
+#define sd_warn(__sd, _fmt, ...) \
+		do { \
+			struct fsubdev *_sd = (__sd); \
+			dev_warn(sd_dev(_sd), SD_FMT _fmt, \
+				 sd_index(_sd), ##__VA_ARGS__); \
+		} while (0)
+
+#define sd_notice(__sd, _fmt, ...) \
+		do { \
+			struct fsubdev *_sd = (__sd); \
+			dev_notice(sd_dev(_sd), SD_FMT _fmt, \
+				   sd_index(_sd), ##__VA_ARGS__); \
+		} while (0)
+
+#define sd_info(__sd, _fmt, ...) \
+		do { \
+			struct fsubdev *_sd = (__sd); \
+			dev_info(sd_dev(_sd), SD_FMT _fmt, \
+				 sd_index(_sd), ##__VA_ARGS__); \
+		} while (0)
+
+#define sd_dbg(__sd, _fmt, ...) \
+		do { \
+			struct fsubdev *_sd = (__sd); \
+			dev_dbg(sd_dev(_sd), SD_FMT _fmt, \
+				sd_index(_sd), ##__VA_ARGS__); \
+		} while (0)
+
+enum iaf_startup_mode {
+	STARTUP_MODE_DEFAULT = 0,
+	STARTUP_MODE_PRELOAD = 1,
+};
+
+struct fsubdev; /* from this file */
+
+struct fdev; /* from this file */
+
+/**
+ * enum sd_error - Subdevice error conditions
+ * @SD_ERROR_FAILED: Subdevice has been marked as FAILED
+ * @SD_ERROR_FW: Firmware error
+ * @NUM_SD_ERRORS: Number of error conditions (always last)
+ */
+enum sd_error {
+	SD_ERROR_FAILED,
+	SD_ERROR_FW,
+	NUM_SD_ERRORS
+};
+
+/**
+ * struct fsubdev - Per-subdevice state
+ * @fdev: link to containing device
+ * @csr_base: base address of this subdevice's memory
+ * @irq: assigned interrupt
+ * @name: small string to describe SD
+ * @asic_rev_info: raw contents of the asic rev info register
+ * @kobj: kobject for this sd in the sysfs tree
+ * @sd_failure: attribute for sd_failure sysfs file
+ * @guid: GUID retrieved from firmware
+ * @port_cnt: count of all fabric ports
+ * @errors: bitmap of active error states
+ *
+ * Used throughout the driver to maintain information about a given subdevice.
+ *
+ * Protection mechanisms used outside of init/destroy are documented inline. Sync probe is the
+ * context of the initial probe function. Async probe includes the initialization threads used to
+ * load the firmware and platform configuration before enabling general processing.
+ */
+struct fsubdev {
+	/* pointers const after sync probe, content protection is by object type */
+	struct fdev *fdev;
+	char __iomem *csr_base;
+
+	/* values const after sync probe */
+	int irq;
+	char name[8];
+	u64 asic_rev_info;
+
+	/* values const after async probe */
+	struct kobject *kobj;
+	struct device_attribute sd_failure;
+
+	u64 guid;
+	u8 port_cnt;
+
+	/* atomic, never cleared after sync probe */
+	DECLARE_BITMAP(errors, NUM_SD_ERRORS);
+};
+
+/**
+ * struct fdev - Device structure for IAF/fabric device component
+ * @sd: subdevice structures
+ * @dev_disabled: On a PCIe error, disable access to the PCI bus
+ * @pdev: bus device passed in probe
+ * @pd: platform specific data
+ * @fabric_id: xarray index based on parent index and product type
+ * @mappings_ref.lock: protect the mappings_ref data
+ * @mappings_ref.count: current mapped buffer count
+ * @mappings_ref.remove_in_progress: indicate unmap should show completion
+ * @mappings_ref.complete: completion after all buffers are unmapped
+ * @mappings_ref: Reference count of parent mapped buffers
+ * @refs: references on this instance
+ * @fdev_released: signals fdev has been erased from the xarray
+ * @startup_mode: startup mode
+ *
+ * Used throughout the driver to maintain information about a given device.
+ */
+struct fdev {
+	struct fsubdev sd[IAF_MAX_SUB_DEVS];
+	bool dev_disabled;
+	struct auxiliary_device *pdev;
+	const struct iaf_pdata *pd;
+	u32 fabric_id;
+
+	struct {
+		/* protect the mapping count and remove_in_progress flag */
+		struct mutex lock;
+		int count;
+		bool remove_in_progress;
+		struct completion complete;
+	} mappings_ref;
+
+	struct kref refs;
+	struct completion fdev_released;
+	enum iaf_startup_mode startup_mode;
+};
+
+void fdev_put(struct fdev *dev);
+int fdev_insert(struct fdev *dev);
+
+/*
+ * This is the fdev_process_each callback function signature
+ * Returning 0 indicates continue
+ * Any other return value indicates terminate
+ */
+typedef int (*fdev_process_each_cb_t)(struct fdev *dev, void *args);
+
+int fdev_process_each(fdev_process_each_cb_t cb, void *args);
+
+struct fdev *fdev_find(u32 fabric_id);
+
+/*
+ * Returns the sd index/offset relative to its device.
+ */
+static inline u8 sd_index(struct fsubdev *sd)
+{
+	return sd - sd->fdev->sd;
+}
+
+/*
+ * dev_is_preload - Test for preload startup mode.
+ * @dev: device
+ *
+ * Return: True if the device is in preload startup mode.
+ */
+static inline bool dev_is_preload(struct fdev *dev)
+{
+	return dev && dev->startup_mode == STARTUP_MODE_PRELOAD;
+}
+
+static inline struct device *sd_dev(const struct fsubdev *sd)
+{
+	return &sd->fdev->pdev->dev;
+}
+
+static inline struct device *fdev_dev(const struct fdev *dev)
+{
+	return &dev->pdev->dev;
+}
+
+/* The following two functions increase device reference count: */
+struct fdev *fdev_find_by_sd_guid(u64 guid);
+struct fsubdev *find_sd_id(u32 fabric_id, u8 sd_index);
+
+#endif
diff --git a/drivers/gpu/drm/xe/fabric/main.c b/drivers/gpu/drm/xe/fabric/main.c
new file mode 100644
index 000000000000..2048546712d5
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/main.c
@@ -0,0 +1,632 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020 - 2023 Intel Corporation.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/rwsem.h>
+#include <linux/xarray.h>
+#include <generated/utsrelease.h>
+
+#include <drm/intel_iaf_platform.h>
+
+#include "csr.h"
+#include "iaf_drv.h"
+#include "sysfs.h"
+
+#define MODULEDETAILS "Intel Corp. Intel fabric Driver"
+
+/* xarray of IAF devices */
+static DEFINE_XARRAY_ALLOC(intel_fdevs);
+
+/*
+ * Used for creating unique xarray hash.  Products need to be defined
+ * in the intel_iaf_platform.h file.
+ */
+#define PRODUCT_SHIFT 16
+
+static enum iaf_startup_mode param_startup_mode = STARTUP_MODE_DEFAULT;
+
+static const char *startup_mode_name(enum iaf_startup_mode m)
+{
+	switch (m) {
+	case STARTUP_MODE_DEFAULT: return "default";
+	case STARTUP_MODE_PRELOAD: return "preload";
+	}
+
+	return "(unknown)";
+}
+
+static int mode_set(const char *val, const struct kernel_param *kp)
+{
+	enum iaf_startup_mode new_mode;
+
+	if (sysfs_streq(val, "default"))
+		new_mode = STARTUP_MODE_DEFAULT;
+	else if (sysfs_streq(val, "preload"))
+		new_mode = STARTUP_MODE_PRELOAD;
+	else
+		return -EINVAL;
+
+	param_startup_mode = new_mode;
+
+	return 0;
+}
+
+static int mode_get(char *val, const struct kernel_param *kp)
+{
+	return snprintf(val, PAGE_SIZE, startup_mode_name(param_startup_mode));
+}
+
+static const struct kernel_param_ops startup_mode_ops = {
+	.set = mode_set,
+	.get = mode_get,
+};
+
+module_param_cb(startup_mode, &startup_mode_ops, &param_startup_mode, 0600);
+MODULE_PARM_DESC(startup_mode,
+		 "Operational mode for newly probed devices:\n"
+		 "\t\t - default: Operate normally\n"
+		 "\t\t - preload: Assume firmware/ini has already been loaded"
+		 );
+
+#define RELEASE_TIMEOUT (HZ * 60)
+
+static void fdev_release(struct kref *kref)
+{
+	struct fdev *dev = container_of(kref, typeof(*dev), refs);
+
+	xa_erase(&intel_fdevs, dev->fabric_id);
+	complete(&dev->fdev_released);
+}
+
+void fdev_put(struct fdev *dev)
+{
+	kref_put(&dev->refs, fdev_release);
+}
+
+static struct fdev *fdev_get(struct fdev *dev)
+{
+	if (dev && kref_get_unless_zero(&dev->refs))
+		return dev;
+
+	return NULL;
+}
+
+int fdev_insert(struct fdev *dev)
+{
+	int err;
+
+	kref_init(&dev->refs);
+	init_completion(&dev->fdev_released);
+
+	err = xa_insert(&intel_fdevs, dev->fabric_id, dev, GFP_KERNEL);
+	if (err)
+		dev_warn(fdev_dev(dev), "fabric_id 0x%08x already in use\n",
+			 dev->fabric_id);
+
+	return err;
+}
+
+int fdev_process_each(fdev_process_each_cb_t cb, void *args)
+{
+	struct fdev *dev;
+	unsigned long i;
+
+	xa_lock(&intel_fdevs);
+	xa_for_each(&intel_fdevs, i, dev) {
+		int ret;
+
+		if (!fdev_get(dev))
+			continue;
+
+		xa_unlock(&intel_fdevs);
+		ret = cb(dev, args);
+		fdev_put(dev);
+		if (ret)
+			return ret;
+
+		xa_lock(&intel_fdevs);
+	}
+	xa_unlock(&intel_fdevs);
+
+	return 0;
+}
+
+static void fdev_wait_on_release(struct fdev *dev)
+{
+	fdev_put(dev);
+
+	wait_for_completion_killable_timeout(&dev->fdev_released,
+					     RELEASE_TIMEOUT);
+}
+
+/*
+ * Returns with reference count for the fdev incremented when found.
+ * It is the callers responsibility to decrement the reference count.
+ */
+struct fdev *fdev_find(u32 fabric_id)
+{
+	struct fdev *dev;
+
+	xa_lock(&intel_fdevs);
+	dev = fdev_get(xa_load(&intel_fdevs, fabric_id));
+	xa_unlock(&intel_fdevs);
+
+	return dev;
+}
+
+struct fdev *fdev_find_by_sd_guid(u64 guid)
+{
+	struct fdev *dev, *referenced_dev;
+	unsigned long d;
+	u8 s;
+
+	xa_lock(&intel_fdevs);
+
+	/* dev becomes NULL if xa_for_each() completes */
+	xa_for_each(&intel_fdevs, d, dev)
+		for (s = 0; s < dev->pd->sd_cnt; ++s)
+			if (dev->sd[s].guid == guid)
+				goto end_iteration;
+
+end_iteration:
+
+	referenced_dev = fdev_get(dev);
+
+	xa_unlock(&intel_fdevs);
+
+	return referenced_dev;
+}
+
+struct fsubdev *find_sd_id(u32 fabric_id, u8 sd_index)
+{
+	struct fdev *dev = fdev_find(fabric_id);
+
+	if (!dev)
+		return ERR_PTR(-ENODEV);
+
+	if (sd_index < dev->pd->sd_cnt)
+		return &dev->sd[sd_index];
+
+	fdev_put(dev);
+
+	return ERR_PTR(-EINVAL);
+}
+
+/* configured by request_irq() to refer to corresponding struct fsubdev */
+static irqreturn_t handle_iaf_irq(int irq, void *arg)
+{
+	return IRQ_HANDLED;
+}
+
+static struct query_info *handle_query(void *handle, u32 fabric_id)
+{
+	struct fdev *src, *dst;
+	struct query_info *qi;
+
+	/*
+	 * src fdev is guaranteed to never be removed during this invocation by
+	 * the caller
+	 */
+	src = handle;
+
+	dst = fdev_find(fabric_id);
+	if (!dst)
+		return ERR_PTR(-ENODEV);
+
+	qi = kmalloc(struct_size(qi, sd2sd, src->pd->sd_cnt * dst->pd->sd_cnt),
+		     GFP_KERNEL);
+	if (qi) {
+		qi->src_cnt = src->pd->sd_cnt;
+		qi->dst_cnt = dst->pd->sd_cnt;
+	} else {
+		qi = ERR_PTR(-ENOMEM);
+	}
+
+	fdev_put(dst);
+
+	return qi;
+}
+
+/**
+ * mappings_ref_get - Increment mapping reference count
+ * @dev: pointer to a valid fdev
+ *
+ * Allow the parent to indicate that a buffer has been mapped
+ *
+ * return: -1 reference count failed, do not allow mapping
+ */
+static int mappings_ref_get(struct fdev *dev)
+{
+	mutex_lock(&dev->mappings_ref.lock);
+
+	dev_dbg(fdev_dev(dev), "count: %d\n", dev->mappings_ref.count);
+
+	if (dev->mappings_ref.remove_in_progress) {
+		mutex_unlock(&dev->mappings_ref.lock);
+		return -1;
+	}
+
+	dev->mappings_ref.count++;
+
+	mutex_unlock(&dev->mappings_ref.lock);
+
+	return 0;
+}
+
+/**
+ * mappings_ref_put - Decrement mapping reference count
+ * @dev: pointer to a valid fdev
+ *
+ * Allow the parent to indicate that a buffer has been unmapped
+ *
+ * A negative value allows remove to proceed.
+ *
+ * return: -1 indicate an unbalanced put call
+ */
+static int mappings_ref_put(struct fdev *dev)
+{
+	int ret = 0;
+
+	mutex_lock(&dev->mappings_ref.lock);
+
+	dev_dbg(fdev_dev(dev), "count: %d\n", dev->mappings_ref.count);
+
+	/*
+	 * in the case of device removal, permit an extra decrement, which is
+	 * used to signal completion to the remove context.
+	 */
+	if (dev->mappings_ref.count > 1 ||
+	    dev->mappings_ref.remove_in_progress) {
+		dev->mappings_ref.count--;
+
+		if (dev->mappings_ref.count == 0)
+			complete(&dev->mappings_ref.complete);
+
+	} else {
+		ret = -1;
+	}
+
+	mutex_unlock(&dev->mappings_ref.lock);
+
+	return ret;
+}
+
+/**
+ * mappings_ref_wait - Driver decrement (inited to 1), and wait for zero count
+ * @dev: valid device
+ *
+ */
+static void mappings_ref_wait(struct fdev *dev)
+{
+	mutex_lock(&dev->mappings_ref.lock);
+
+	dev->mappings_ref.remove_in_progress = true;
+	dev->mappings_ref.count--;
+
+	if (dev->mappings_ref.count == 0) {
+		mutex_unlock(&dev->mappings_ref.lock);
+		return;
+	}
+
+	dev_warn(fdev_dev(dev), "mappings_ref_map != 0 (%d) will wait\n",
+		 dev->mappings_ref.count);
+
+	mutex_unlock(&dev->mappings_ref.lock);
+
+	wait_for_completion_killable(&dev->mappings_ref.complete);
+}
+
+static int handle_parent_event(void *handle, enum iaf_parent_event event)
+{
+	struct fdev *dev = handle;
+
+	switch (event) {
+	case IAF_PARENT_PCIE_ERR:
+		dev_err(fdev_dev(dev), "PCIE error received\n");
+		WRITE_ONCE(dev->dev_disabled, true);
+		return 0;
+
+	case IAF_PARENT_MAPPING_GET:
+		return mappings_ref_get(dev);
+
+	case IAF_PARENT_MAPPING_PUT:
+		return mappings_ref_put(dev);
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct iaf_ops iaf_ops = {
+	.connectivity_query = handle_query,
+	.parent_event = handle_parent_event,
+};
+
+static int validate_product(struct fsubdev *sd)
+{
+	if (unlikely(READ_ONCE(sd->fdev->dev_disabled)))
+		return -EIO;
+
+	switch (sd->fdev->pd->product) {
+	case IAF_PONTEVECCHIO:
+		sd->asic_rev_info = readq(sd->csr_base + CSR_ASIC_REV_INFO);
+		if (!IS_ANR(sd)) {
+			sd_err(sd, "Unsupported subdevice revision 0x%016llx\n",
+			       sd->asic_rev_info);
+			return -EINVAL;
+		}
+		sd_dbg(sd, "asic rev info 0x%016llx\n", sd->asic_rev_info);
+		break;
+	default:
+		sd_err(sd, "Unrecognized product type %d for subdevice\n",
+		       sd->fdev->pd->product);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static struct resource *iaf_find_res(struct fdev *dev, unsigned int type,
+				     int index)
+{
+	int i;
+	int offset;
+
+	for (i = 0; i < dev->pd->num_resources; i++) {
+		offset = index * dev->pd->sd_cnt + i;
+		if (resource_type(&dev->pd->resources[offset]) == type)
+			return &dev->pd->resources[offset];
+	}
+
+	return NULL;
+}
+
+static int add_subdevice(struct fsubdev *sd, struct fdev *dev, int index)
+{
+	struct resource *res;
+	int err;
+
+	sd->fdev = dev;
+
+	snprintf(sd->name, sizeof(sd->name), SD_ID_FMT, index);
+
+	res = iaf_find_res(dev, IORESOURCE_MEM, index);
+	if (!res) {
+		sd_err(sd, "No MEM resource available\n");
+		return -ENOMEM;
+	}
+	sd->csr_base = ioremap(res->start, resource_size(res));
+	if (!sd->csr_base) {
+		sd_err(sd, "Unable to map resource %pR to kvirt\n", res);
+		return -ENOMEM;
+	}
+	sd_dbg(sd, "mapped resource %pR to mb_base %p\n", res, sd->csr_base);
+
+	err = validate_product(sd);
+	if (err) {
+		iounmap(sd->csr_base);
+		return err;
+	}
+
+	res = iaf_find_res(dev, IORESOURCE_IRQ, index);
+	if (!res) {
+		sd_err(sd, "No IRQ resource available\n");
+		iounmap(sd->csr_base);
+		return -EINVAL;
+	}
+	sd_dbg(sd, "IRQ resource %pR\n", res);
+
+	sd->irq = res->start;
+	err = request_irq(sd->irq, handle_iaf_irq, 0, "intel_sd_irq", sd);
+	if (err) {
+		sd_err(sd, "failed to request_irq %d  err: %d\n", sd->irq, err);
+		iounmap(sd->csr_base);
+		return err;
+	}
+
+	sd_dbg(sd, "Adding IAF subdevice: %d\n", index);
+
+	return 0;
+}
+
+static void remove_subdevice(struct fsubdev *sd)
+{
+	free_irq(sd->irq, sd);
+	iounmap(sd->csr_base);
+	sd_dbg(sd, "Removed IAF resource: %p\n", sd->csr_base);
+	sd->csr_base = NULL;
+}
+
+static void iaf_remove(struct auxiliary_device *pdev)
+{
+	struct iaf_pdata *pd = container_of(pdev, struct iaf_pdata, aux_dev);
+	struct fdev *dev = dev_get_drvdata(&pdev->dev);
+	u8 i;
+
+	dev_dbg(&pdev->dev, "Removing %s\n", dev_name(&pdev->dev));
+
+	mappings_ref_wait(dev);
+
+	iaf_sysfs_remove(dev);
+
+	pd->unregister_dev(pd->parent, dev);
+
+	fdev_wait_on_release(dev);
+
+	for (i = 0; i < pd->sd_cnt; i++)
+		remove_subdevice(&dev->sd[i]);
+
+	pm_runtime_put(fdev_dev(dev));
+	pm_runtime_allow(fdev_dev(dev));
+	pm_runtime_disable(fdev_dev(dev));
+
+	WARN(kref_read(&dev->refs), "fabric_id 0x%08x has %u references",
+	     dev->fabric_id, kref_read(&dev->refs));
+
+	kfree(dev);
+}
+
+static u32 dev_fabric_id(struct iaf_pdata *pd)
+{
+	return pd->product << PRODUCT_SHIFT | pd->index;
+}
+
+static int iaf_probe(struct auxiliary_device *pdev, const struct auxiliary_device_id *id)
+{
+	struct iaf_pdata *pd = container_of(pdev, struct iaf_pdata, aux_dev);
+	struct device *dev_parent = pdev->dev.parent;
+	struct fdev *dev;
+	u8 sds_added = 0;
+	int err;
+	u8 i;
+
+	dev_info(&pdev->dev,
+		 "Probing %s, connection point for %s, fabric_id 0x%08x socket_id 0x%02x, sd_cnt %u\n",
+		 dev_name(&pdev->dev),
+		 dev_parent ? dev_name(dev_parent) : "UNKNOWN SOURCE",
+		 dev_fabric_id(pd), pd->socket_id, pd->sd_cnt);
+
+	if (pd->version != IAF_VERSION)
+		return -EPERM;
+
+	if (!pd->register_dev || !pd->unregister_dev)
+		return -EINVAL;
+
+	if (pd->socket_id >= MAX_SOCKET_IDS)
+		return -EINVAL;
+
+	if (!pd->sd_cnt || pd->sd_cnt > IAF_MAX_SUB_DEVS)
+		return -EINVAL;
+
+	if (!pd->dpa.pkg_size)
+		return -EINVAL;
+
+	dev_dbg(&pdev->dev, "DPA offset: %dGB  size: %dGB\n",
+		pd->dpa.pkg_offset, pd->dpa.pkg_size);
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	kernel_param_lock(THIS_MODULE);
+	dev->startup_mode = param_startup_mode;
+	kernel_param_unlock(THIS_MODULE);
+
+	if (dev->startup_mode != STARTUP_MODE_DEFAULT)
+		dev_info(&pdev->dev, "startup_mode: %s",
+			 startup_mode_name(dev->startup_mode));
+
+	dev->fabric_id = dev_fabric_id(pd);
+	dev->pd = pd;
+	dev->pdev = pdev;
+
+	dev_set_drvdata(&pdev->dev, dev);
+
+	err = fdev_insert(dev);
+	if (err) {
+		kfree(dev);
+		return err;
+	}
+
+	err = iaf_sysfs_probe(dev);
+	if (err)
+		goto sysfs_error;
+
+	dev->mappings_ref.count = 1;
+	mutex_init(&dev->mappings_ref.lock);
+	init_completion(&dev->mappings_ref.complete);
+
+	/*
+	 * The IAF cannot be suspended via runtime, but the parent could have
+	 * the capability.  Set runtime to forbid to be explicit about what
+	 * the requirement is.  Do a get to make sure that suspend cannot be
+	 * started externally (i.e. sysfs), to keep the parent from going to
+	 * sleep.
+	 * If the parent is asleep at this time, pm_runtime_forbid will cause
+	 * it to resume.
+	 */
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_forbid(&pdev->dev);
+	pm_runtime_get(&pdev->dev);
+
+	err = pd->register_dev(pd->parent, dev, dev->fabric_id, &iaf_ops);
+	if (err) {
+		iaf_sysfs_remove(dev);
+		goto sysfs_error;
+	}
+
+	for (sds_added = 0; sds_added < pd->sd_cnt; ++sds_added) {
+		err = add_subdevice(&dev->sd[sds_added], dev, sds_added);
+		if (err)
+			goto add_error;
+	}
+
+	return 0;
+
+add_error:
+	iaf_sysfs_remove(dev);
+	for (i = 0; i < sds_added; ++i)
+		remove_subdevice(&dev->sd[i]);
+
+	pd->unregister_dev(pd->parent, dev);
+
+sysfs_error:
+	fdev_wait_on_release(dev);
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	kfree(dev);
+	return err;
+}
+
+static const struct auxiliary_device_id iaf_id_table[] = {
+	{ .name = "xe.iaf", },
+	{},
+};
+
+static struct auxiliary_driver iaf_driver = {
+	.probe = iaf_probe,
+	.remove = iaf_remove,
+	.id_table = iaf_id_table,
+};
+
+static void __exit iaf_unload_module(void)
+{
+	pr_notice("Unloading %s\n", MODULEDETAILS);
+
+	auxiliary_driver_unregister(&iaf_driver);
+	pr_notice("%s Unloaded\n", MODULEDETAILS);
+}
+module_exit(iaf_unload_module);
+
+/*
+ * \brief Loads the module into kernel space and does global initializations.
+ * Called by insmod or modprobe.
+ */
+static int __init iaf_load_module(void)
+{
+	int err;
+
+	pr_notice("Initializing %s\n", MODULEDETAILS);
+	pr_debug("Built for Linux Kernel %s\n", UTS_RELEASE);
+
+	err = auxiliary_driver_register(&iaf_driver);
+	if (err)
+		pr_err("Cannot register with auxiliary bus\n");
+
+	return err;
+}
+module_init(iaf_load_module);
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_DESCRIPTION(MODULEDETAILS);
+MODULE_LICENSE("GPL and additional rights");
+MODULE_ALIAS("auxiliary:xe.iaf");
diff --git a/drivers/gpu/drm/xe/fabric/sysfs.c b/drivers/gpu/drm/xe/fabric/sysfs.c
new file mode 100644
index 000000000000..b7af3fdace1a
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/sysfs.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020 - 2023 Intel Corporation.
+ *
+ */
+
+#include <linux/device.h>
+#include "csr.h"
+#include "iaf_drv.h"
+#include "sysfs.h"
+
+static ssize_t sd_failure_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct fsubdev *sd;
+
+	sd = container_of(attr, struct fsubdev, sd_failure);
+
+	return sysfs_emit(buf, "%u\n", test_bit(SD_ERROR_FAILED, sd->errors));
+}
+
+static ssize_t iaf_fabric_id_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct fdev *fdev = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "0x%x\n", fdev->fabric_id);
+}
+
+static DEVICE_ATTR_RO(iaf_fabric_id);
+
+static const struct attribute *iaf_attrs[] = {
+	&dev_attr_iaf_fabric_id.attr,
+	NULL,
+};
+
+static void iaf_sysfs_cleanup(struct fsubdev *sd)
+{
+	kobject_put(sd->kobj);
+	sd->kobj = NULL;
+}
+
+typedef ssize_t (*show_fn)(struct device *dev, struct device_attribute *attr, char *buf);
+
+static int iaf_sysfs_add_node(const char *name, umode_t mode, show_fn show,
+			      struct device_attribute *attr, struct kobject *parent)
+{
+	sysfs_attr_init(&attr->attr);
+	attr->attr.name = name;
+	attr->attr.mode = mode;
+	attr->show = show;
+
+	return sysfs_create_file(parent, &attr->attr);
+}
+
+static int iaf_sysfs_add_sd_nodes(struct fsubdev *sd)
+{
+	int err;
+
+	err = iaf_sysfs_add_node("sd_failure", 0400, sd_failure_show, &sd->sd_failure, sd->kobj);
+	if (err)
+		sd_warn(sd, "Failed to add sysfs node %s for %s\n", "sd_failure", sd->name);
+
+	return err;
+}
+
+static void iaf_sysfs_sd_init(struct fsubdev *sd)
+{
+	int err;
+
+	sd->kobj = kobject_create_and_add(sd->name, &sd->fdev->pdev->dev.kobj);
+	if (!sd->kobj) {
+		sd_warn(sd, "Failed to add sysfs directory %s\n", sd->name);
+		return;
+	}
+
+	err = iaf_sysfs_add_sd_nodes(sd);
+	if (err)
+		goto error_return;
+
+	return;
+
+error_return:
+	iaf_sysfs_cleanup(sd);
+}
+
+void iaf_sysfs_init(struct fdev *fdev)
+{
+	u8 i;
+
+	for (i = 0; i < fdev->pd->sd_cnt; i++)
+		iaf_sysfs_sd_init(&fdev->sd[i]);
+}
+
+void iaf_sysfs_remove(struct fdev *fdev)
+{
+	u8 i;
+
+	for (i = 0; i < fdev->pd->sd_cnt; i++)
+		iaf_sysfs_cleanup(&fdev->sd[i]);
+
+	sysfs_remove_files(&fdev->pdev->dev.kobj, iaf_attrs);
+}
+
+int iaf_sysfs_probe(struct fdev *fdev)
+{
+	int err;
+
+	err = sysfs_create_files(&fdev->pdev->dev.kobj, iaf_attrs);
+	if (err) {
+		dev_err(&fdev->pdev->dev, "Failed to add sysfs\n");
+		return err;
+	}
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/fabric/sysfs.h b/drivers/gpu/drm/xe/fabric/sysfs.h
new file mode 100644
index 000000000000..e42ccdd5b0fd
--- /dev/null
+++ b/drivers/gpu/drm/xe/fabric/sysfs.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020 - 2023 Intel Corporation.
+ *
+ */
+
+#ifndef SYSFS_H_INCLUDED
+#define SYSFS_H_INCLUDED
+
+#include "iaf_drv.h"
+
+void iaf_sysfs_init(struct fdev *fdev);
+void iaf_sysfs_remove(struct fdev *fdev);
+int iaf_sysfs_probe(struct fdev *fdev);
+
+#endif
-- 
2.35.1

