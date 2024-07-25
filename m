Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BDCC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 10:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EDD10E27C;
	Thu, 25 Jul 2024 10:22:48 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740CB10E27C
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 10:22:47 +0000 (UTC)
Received: internal info suppressed
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 46PAMDbY2182929; Thu, 25 Jul 2024 13:22:34 +0300
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, dliberman@habana.ai,
 niranjana.vishwanathapura@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v4 03/11] drm/xe: add irq offset of engine instance 0 to hw
 engine properties
Date: Thu, 25 Jul 2024 13:22:05 +0300
Message-ID: <20240725102213.2182896-4-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240725102213.2182896-1-ilia.levi@intel.com>
References: <20240725102213.2182896-1-ilia.levi@intel.com>
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

This is needed for accessing memirq interrupt status and source for
MSI-X devices.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c       | 28 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 07ed9fd28f19..4d1715ad25a1 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -40,6 +40,7 @@ struct engine_info {
 	unsigned int class : 8;
 	unsigned int instance : 8;
 	unsigned int irq_offset : 8;
+	unsigned int e0_irq_offset : 8;
 	enum xe_force_wake_domains domain;
 	u32 mmio_base;
 };
@@ -50,6 +51,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_RENDER,
 		.instance = 0,
 		.irq_offset = ilog2(INTR_RCS0),
+		.e0_irq_offset = ilog2(INTR_RCS0),
 		.domain = XE_FW_RENDER,
 		.mmio_base = RENDER_RING_BASE,
 	},
@@ -58,6 +60,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 0,
 		.irq_offset = ilog2(INTR_BCS(0)),
+		.e0_irq_offset = ilog2(INTR_BCS(0)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = BLT_RING_BASE,
 	},
@@ -66,6 +69,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 1,
 		.irq_offset = ilog2(INTR_BCS(1)),
+		.e0_irq_offset = ilog2(INTR_BCS(0)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = XEHPC_BCS1_RING_BASE,
 	},
@@ -74,6 +78,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 2,
 		.irq_offset = ilog2(INTR_BCS(2)),
+		.e0_irq_offset = ilog2(INTR_BCS(0)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = XEHPC_BCS2_RING_BASE,
 	},
@@ -82,6 +87,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 3,
 		.irq_offset = ilog2(INTR_BCS(3)),
+		.e0_irq_offset = ilog2(INTR_BCS(0)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = XEHPC_BCS3_RING_BASE,
 	},
@@ -90,6 +96,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 4,
 		.irq_offset = ilog2(INTR_BCS(4)),
+		.e0_irq_offset = ilog2(INTR_BCS(0)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = XEHPC_BCS4_RING_BASE,
 	},
@@ -98,6 +105,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 5,
 		.irq_offset = ilog2(INTR_BCS(5)),
+		.e0_irq_offset = ilog2(INTR_BCS(0)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = XEHPC_BCS5_RING_BASE,
 	},
@@ -106,6 +114,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 6,
 		.irq_offset = ilog2(INTR_BCS(6)),
+		.e0_irq_offset = ilog2(INTR_BCS(0)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = XEHPC_BCS6_RING_BASE,
 	},
@@ -113,6 +122,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "bcs7",
 		.class = XE_ENGINE_CLASS_COPY,
 		.irq_offset = ilog2(INTR_BCS(7)),
+		.e0_irq_offset = ilog2(INTR_BCS(0)),
 		.instance = 7,
 		.domain = XE_FW_RENDER,
 		.mmio_base = XEHPC_BCS7_RING_BASE,
@@ -122,6 +132,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 8,
 		.irq_offset = ilog2(INTR_BCS8),
+		.e0_irq_offset = ilog2(INTR_BCS(0)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = XEHPC_BCS8_RING_BASE,
 	},
@@ -131,6 +142,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 0,
 		.irq_offset = 32 + ilog2(INTR_VCS(0)),
+		.e0_irq_offset = 32 + ilog2(INTR_VCS(0)),
 		.domain = XE_FW_MEDIA_VDBOX0,
 		.mmio_base = BSD_RING_BASE,
 	},
@@ -139,6 +151,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 1,
 		.irq_offset = 32 + ilog2(INTR_VCS(1)),
+		.e0_irq_offset = 32 + ilog2(INTR_VCS(0)),
 		.domain = XE_FW_MEDIA_VDBOX1,
 		.mmio_base = BSD2_RING_BASE,
 	},
@@ -147,6 +160,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 2,
 		.irq_offset = 32 + ilog2(INTR_VCS(2)),
+		.e0_irq_offset = 32 + ilog2(INTR_VCS(0)),
 		.domain = XE_FW_MEDIA_VDBOX2,
 		.mmio_base = BSD3_RING_BASE,
 	},
@@ -155,6 +169,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 3,
 		.irq_offset = 32 + ilog2(INTR_VCS(3)),
+		.e0_irq_offset = 32 + ilog2(INTR_VCS(0)),
 		.domain = XE_FW_MEDIA_VDBOX3,
 		.mmio_base = BSD4_RING_BASE,
 	},
@@ -163,6 +178,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 4,
 		.irq_offset = 32 + ilog2(INTR_VCS(4)),
+		.e0_irq_offset = 32 + ilog2(INTR_VCS(0)),
 		.domain = XE_FW_MEDIA_VDBOX4,
 		.mmio_base = XEHP_BSD5_RING_BASE,
 	},
@@ -171,6 +187,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 5,
 		.irq_offset = 32 + ilog2(INTR_VCS(5)),
+		.e0_irq_offset = 32 + ilog2(INTR_VCS(0)),
 		.domain = XE_FW_MEDIA_VDBOX5,
 		.mmio_base = XEHP_BSD6_RING_BASE,
 	},
@@ -179,6 +196,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 6,
 		.irq_offset = 32 + ilog2(INTR_VCS(6)),
+		.e0_irq_offset = 32 + ilog2(INTR_VCS(0)),
 		.domain = XE_FW_MEDIA_VDBOX6,
 		.mmio_base = XEHP_BSD7_RING_BASE,
 	},
@@ -187,6 +205,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 7,
 		.irq_offset = 32 + ilog2(INTR_VCS(7)),
+		.e0_irq_offset = 32 + ilog2(INTR_VCS(0)),
 		.domain = XE_FW_MEDIA_VDBOX7,
 		.mmio_base = XEHP_BSD8_RING_BASE,
 	},
@@ -195,6 +214,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
 		.instance = 0,
 		.irq_offset = 32 + ilog2(INTR_VECS(0)),
+		.e0_irq_offset = 32 + ilog2(INTR_VECS(0)),
 		.domain = XE_FW_MEDIA_VEBOX0,
 		.mmio_base = VEBOX_RING_BASE,
 	},
@@ -203,6 +223,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
 		.instance = 1,
 		.irq_offset = 32 + ilog2(INTR_VECS(1)),
+		.e0_irq_offset = 32 + ilog2(INTR_VECS(0)),
 		.domain = XE_FW_MEDIA_VEBOX1,
 		.mmio_base = VEBOX2_RING_BASE,
 	},
@@ -211,6 +232,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
 		.instance = 2,
 		.irq_offset = 32 + ilog2(INTR_VECS(2)),
+		.e0_irq_offset = 32 + ilog2(INTR_VECS(0)),
 		.domain = XE_FW_MEDIA_VEBOX2,
 		.mmio_base = XEHP_VEBOX3_RING_BASE,
 	},
@@ -219,6 +241,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
 		.instance = 3,
 		.irq_offset = 32 + ilog2(INTR_VECS(3)),
+		.e0_irq_offset = 32 + ilog2(INTR_VECS(0)),
 		.domain = XE_FW_MEDIA_VEBOX3,
 		.mmio_base = XEHP_VEBOX4_RING_BASE,
 	},
@@ -227,6 +250,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COMPUTE,
 		.instance = 0,
 		.irq_offset = ilog2(INTR_CCS(0)),
+		.e0_irq_offset = ilog2(INTR_CCS(0)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = COMPUTE0_RING_BASE,
 	},
@@ -235,6 +259,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COMPUTE,
 		.instance = 1,
 		.irq_offset = ilog2(INTR_CCS(1)),
+		.e0_irq_offset = ilog2(INTR_CCS(0)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = COMPUTE1_RING_BASE,
 	},
@@ -243,6 +268,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COMPUTE,
 		.instance = 2,
 		.irq_offset = ilog2(INTR_CCS(2)),
+		.e0_irq_offset = ilog2(INTR_CCS(0)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = COMPUTE2_RING_BASE,
 	},
@@ -251,6 +277,7 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_COMPUTE,
 		.instance = 3,
 		.irq_offset = ilog2(INTR_CCS(3)),
+		.e0_irq_offset = ilog2(INTR_CCS(0)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = COMPUTE3_RING_BASE,
 	},
@@ -451,6 +478,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	hwe->instance = info->instance;
 	hwe->mmio_base = info->mmio_base;
 	hwe->irq_offset = info->irq_offset;
+	hwe->e0_irq_offset = info->e0_irq_offset;
 	hwe->domain = info->domain;
 	hwe->name = info->name;
 	hwe->fence_irq = &gt->fence_irq[info->class];
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 70e6434f150d..f6cb425ebab0 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -118,6 +118,8 @@ struct xe_hw_engine {
 	u16 logical_instance;
 	/** @irq_offset: IRQ offset of this hw engine */
 	u16 irq_offset;
+	/** @e0_irq_offset: IRQ offset of engine instance 0 (of that class) */
+	u16 e0_irq_offset;
 	/** @mmio_base: MMIO base address of this hw engine*/
 	u32 mmio_base;
 	/**
-- 
2.43.2

