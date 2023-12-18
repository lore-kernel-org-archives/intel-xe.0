Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C83C46CA2
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D75A10E3E7;
	Mon, 18 Dec 2023 19:01:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5B710E3AF
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926047; x=1734462047;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hUWOZi/QC7Ow28vYkAgPcRk3MJ5PvrkPHioBnyd9yvA=;
 b=dqu4zx6HjftmkqrX57+HE5M7I/mC2w8W5zlY1J2urWNKa/ixqCLrHt31
 vwlIaTvqaREEERtor8E+xZAOqohxZSQZJkQr8yfm49JzqMgA9i96wGNQW
 II+TvXncI6iksdCSY4oTu2grOHLb6Q1XqqQH6ob/qKWL0qXTyrcgj+wi7
 pipag9VSLUesMoIgarpojIeHSbM3MhC24mSPh3+ALls9RJ48jP56LABqz
 P9lr+PEMKxcGZm7E6w+JQO6YNn8tw5SN/wirdPSgu2MnMJd9WmOPIri3q
 vmBxSVWB+EQKdTfxZHrGWqoqq5otCaQvQcQWro9vdljdm7EucDvtxmA4n g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="461984332"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="461984332"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:53:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="779157435"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="779157435"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.130.107])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:53:55 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 05/10] drm/xe: Define IRQ offsets used by HW engines
Date: Mon, 18 Dec 2023 17:53:39 +0100
Message-Id: <20231218165344.458-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231218165344.458-1-michal.wajdeczko@intel.com>
References: <20231218165344.458-1-michal.wajdeczko@intel.com>
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

When interrupts are delivered using memory based mechanism, engines
will write status to the report page at the offset (in bytes) that
corresponds to their interrupt bit from the GT_INTR_DW register.

Add engine interrupt offset definitions to engine info as we will
need this to process memory based interrupts.

Bspec: 46149, 50829, 50844
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://lore.kernel.org/r/20231214185955.1791-6-michal.wajdeczko@intel.com
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c       | 28 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1fa5cf5eea97..832989c83a25 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -34,6 +34,7 @@ struct engine_info {
 	const char *name;
 	unsigned int class : 8;
 	unsigned int instance : 8;
+	unsigned int irq_offset : 8;
 	enum xe_force_wake_domains domain;
 	u32 mmio_base;
 };
@@ -43,6 +44,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "rcs0",
 		.class = XE_ENGINE_CLASS_RENDER,
 		.instance = 0,
+		.irq_offset = ilog2(INTR_RCS0),
 		.domain = XE_FW_RENDER,
 		.mmio_base = RENDER_RING_BASE,
 	},
@@ -50,6 +52,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "bcs0",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 0,
+		.irq_offset = ilog2(INTR_BCS(0)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = BLT_RING_BASE,
 	},
@@ -57,6 +60,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "bcs1",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 1,
+		.irq_offset = ilog2(INTR_BCS(1)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = XEHPC_BCS1_RING_BASE,
 	},
@@ -64,6 +68,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "bcs2",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 2,
+		.irq_offset = ilog2(INTR_BCS(2)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = XEHPC_BCS2_RING_BASE,
 	},
@@ -71,6 +76,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "bcs3",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 3,
+		.irq_offset = ilog2(INTR_BCS(3)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = XEHPC_BCS3_RING_BASE,
 	},
@@ -78,6 +84,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "bcs4",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 4,
+		.irq_offset = ilog2(INTR_BCS(4)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = XEHPC_BCS4_RING_BASE,
 	},
@@ -85,6 +92,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "bcs5",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 5,
+		.irq_offset = ilog2(INTR_BCS(5)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = XEHPC_BCS5_RING_BASE,
 	},
@@ -92,12 +100,14 @@ static const struct engine_info engine_infos[] = {
 		.name = "bcs6",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 6,
+		.irq_offset = ilog2(INTR_BCS(6)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = XEHPC_BCS6_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS7] = {
 		.name = "bcs7",
 		.class = XE_ENGINE_CLASS_COPY,
+		.irq_offset = ilog2(INTR_BCS(7)),
 		.instance = 7,
 		.domain = XE_FW_RENDER,
 		.mmio_base = XEHPC_BCS7_RING_BASE,
@@ -106,6 +116,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "bcs8",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 8,
+		.irq_offset = ilog2(INTR_BCS8),
 		.domain = XE_FW_RENDER,
 		.mmio_base = XEHPC_BCS8_RING_BASE,
 	},
@@ -114,6 +125,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "vcs0",
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 0,
+		.irq_offset = 32 + ilog2(INTR_VCS(0)),
 		.domain = XE_FW_MEDIA_VDBOX0,
 		.mmio_base = BSD_RING_BASE,
 	},
@@ -121,6 +133,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "vcs1",
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 1,
+		.irq_offset = 32 + ilog2(INTR_VCS(1)),
 		.domain = XE_FW_MEDIA_VDBOX1,
 		.mmio_base = BSD2_RING_BASE,
 	},
@@ -128,6 +141,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "vcs2",
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 2,
+		.irq_offset = 32 + ilog2(INTR_VCS(2)),
 		.domain = XE_FW_MEDIA_VDBOX2,
 		.mmio_base = BSD3_RING_BASE,
 	},
@@ -135,6 +149,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "vcs3",
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 3,
+		.irq_offset = 32 + ilog2(INTR_VCS(3)),
 		.domain = XE_FW_MEDIA_VDBOX3,
 		.mmio_base = BSD4_RING_BASE,
 	},
@@ -142,6 +157,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "vcs4",
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 4,
+		.irq_offset = 32 + ilog2(INTR_VCS(4)),
 		.domain = XE_FW_MEDIA_VDBOX4,
 		.mmio_base = XEHP_BSD5_RING_BASE,
 	},
@@ -149,6 +165,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "vcs5",
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 5,
+		.irq_offset = 32 + ilog2(INTR_VCS(5)),
 		.domain = XE_FW_MEDIA_VDBOX5,
 		.mmio_base = XEHP_BSD6_RING_BASE,
 	},
@@ -156,6 +173,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "vcs6",
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 6,
+		.irq_offset = 32 + ilog2(INTR_VCS(6)),
 		.domain = XE_FW_MEDIA_VDBOX6,
 		.mmio_base = XEHP_BSD7_RING_BASE,
 	},
@@ -163,6 +181,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "vcs7",
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 7,
+		.irq_offset = 32 + ilog2(INTR_VCS(7)),
 		.domain = XE_FW_MEDIA_VDBOX7,
 		.mmio_base = XEHP_BSD8_RING_BASE,
 	},
@@ -170,6 +189,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "vecs0",
 		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
 		.instance = 0,
+		.irq_offset = 32 + ilog2(INTR_VECS(0)),
 		.domain = XE_FW_MEDIA_VEBOX0,
 		.mmio_base = VEBOX_RING_BASE,
 	},
@@ -177,6 +197,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "vecs1",
 		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
 		.instance = 1,
+		.irq_offset = 32 + ilog2(INTR_VECS(1)),
 		.domain = XE_FW_MEDIA_VEBOX1,
 		.mmio_base = VEBOX2_RING_BASE,
 	},
@@ -184,6 +205,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "vecs2",
 		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
 		.instance = 2,
+		.irq_offset = 32 + ilog2(INTR_VECS(2)),
 		.domain = XE_FW_MEDIA_VEBOX2,
 		.mmio_base = XEHP_VEBOX3_RING_BASE,
 	},
@@ -191,6 +213,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "vecs3",
 		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
 		.instance = 3,
+		.irq_offset = 32 + ilog2(INTR_VECS(3)),
 		.domain = XE_FW_MEDIA_VEBOX3,
 		.mmio_base = XEHP_VEBOX4_RING_BASE,
 	},
@@ -198,6 +221,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "ccs0",
 		.class = XE_ENGINE_CLASS_COMPUTE,
 		.instance = 0,
+		.irq_offset = ilog2(INTR_CCS(0)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = COMPUTE0_RING_BASE,
 	},
@@ -205,6 +229,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "ccs1",
 		.class = XE_ENGINE_CLASS_COMPUTE,
 		.instance = 1,
+		.irq_offset = ilog2(INTR_CCS(1)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = COMPUTE1_RING_BASE,
 	},
@@ -212,6 +237,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "ccs2",
 		.class = XE_ENGINE_CLASS_COMPUTE,
 		.instance = 2,
+		.irq_offset = ilog2(INTR_CCS(2)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = COMPUTE2_RING_BASE,
 	},
@@ -219,6 +245,7 @@ static const struct engine_info engine_infos[] = {
 		.name = "ccs3",
 		.class = XE_ENGINE_CLASS_COMPUTE,
 		.instance = 3,
+		.irq_offset = ilog2(INTR_CCS(3)),
 		.domain = XE_FW_RENDER,
 		.mmio_base = COMPUTE3_RING_BASE,
 	},
@@ -397,6 +424,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	hwe->class = info->class;
 	hwe->instance = info->instance;
 	hwe->mmio_base = info->mmio_base;
+	hwe->irq_offset = info->irq_offset;
 	hwe->domain = info->domain;
 	hwe->name = info->name;
 	hwe->fence_irq = &gt->fence_irq[info->class];
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 39908dec042a..dfeaaac08b7f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -116,6 +116,8 @@ struct xe_hw_engine {
 	u16 instance;
 	/** @logical_instance: logical instance of this hw engine */
 	u16 logical_instance;
+	/** @irq_offset: IRQ offset of this hw engine */
+	u16 irq_offset;
 	/** @mmio_base: MMIO base address of this hw engine*/
 	u32 mmio_base;
 	/**
-- 
2.25.1

