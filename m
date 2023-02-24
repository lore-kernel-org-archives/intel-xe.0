Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA95BC7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 19:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55C310ED07;
	Fri, 24 Feb 2023 19:08:23 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3D610ECE5
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 19:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677265701; x=1708801701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=02ldPpJ6G6EKOxU9LGF1KWZcL2aLyTssWR7JDoECJr0=;
 b=PAERcZBPq4MDOqZf8vdYX9SWwIA71vnhziHtjIaVr2yBQYIzOFmKlowP
 JonQD9Giq7fL6XOwrt4DNw3NKdcqcPls48D31wGCWQKbInOTpkZaqiKtL
 i3NUx2sQwvkERZu2z2dNzKINbsIDWbI2qmH+ia3qYOmqJLp7iHSnMqe05
 F/6QH9fB5maGY6gHUGtwzCNBaHeYnTeoK8uTJF6ILcYic9FfI98p+Bqw0
 6lw9iYooBmlAgwkjffEAXElPT+TpnG3epIt66mWcQLlSprjG7YJuew4f7
 v5f2ae2VgTHnXCzb050Uq1BBstR6pR6ODimSL0yh6XtbZQk4m+r9D9DLb g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="396068863"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="396068863"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 11:08:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="650459098"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="650459098"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 11:08:20 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Feb 2023 11:08:14 -0800
Message-Id: <20230224190814.3956563-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Remove gen-based mmio offsets from hw
 engine init
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

During early generations of Intel GPUs, hardware engines would sometimes
move to new MMIO offsets from one platform/generation to the next.
These days engines the hardware teams put more effort into ensuring that
engines stay at consistent locations; even major design changes (like
the introduction of standalone media) keep the MMIO locations of the
engines constant.

Since all platforms supported by the Xe driver are new enough to have a
single MMIO offset for each engine (and since our crystal ball says that
these offsets are very unlikely to change again in the foreseeable
future), we can simplify the driver's engine definitions and remove the
gen-based MMIO bases.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 131 +++++++-----------------------
 1 file changed, 28 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index fd89dd90131c..f0d6de245549 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -31,11 +31,7 @@ struct engine_info {
 	unsigned int class : 8;
 	unsigned int instance : 8;
 	enum xe_force_wake_domains domain;
-	/* mmio bases table *must* be sorted in reverse graphics_ver order */
-	struct engine_mmio_base {
-		unsigned int graphics_ver : 8;
-		unsigned int base : 24;
-	} mmio_bases[MAX_MMIO_BASES];
+	u32 mmio_base;
 };
 
 static const struct engine_info engine_infos[] = {
@@ -44,90 +40,70 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_RENDER,
 		.instance = 0,
 		.domain = XE_FW_RENDER,
-		.mmio_bases = {
-			{ .graphics_ver = 1, .base = RENDER_RING_BASE }
-		},
+		.mmio_base = RENDER_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS0] = {
 		.name = "bcs0",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 0,
 		.domain = XE_FW_RENDER,
-		.mmio_bases = {
-			{ .graphics_ver = 6, .base = BLT_RING_BASE }
-		},
+		.mmio_base = BLT_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS1] = {
 		.name = "bcs1",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 1,
 		.domain = XE_FW_RENDER,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = XEHPC_BCS1_RING_BASE }
-		},
+		.mmio_base = XEHPC_BCS1_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS2] = {
 		.name = "bcs2",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 2,
 		.domain = XE_FW_RENDER,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = XEHPC_BCS2_RING_BASE }
-		},
+		.mmio_base = XEHPC_BCS2_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS3] = {
 		.name = "bcs3",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 3,
 		.domain = XE_FW_RENDER,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = XEHPC_BCS3_RING_BASE }
-		},
+		.mmio_base = XEHPC_BCS3_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS4] = {
 		.name = "bcs4",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 4,
 		.domain = XE_FW_RENDER,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = XEHPC_BCS4_RING_BASE }
-		},
+		.mmio_base = XEHPC_BCS4_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS5] = {
 		.name = "bcs5",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 5,
 		.domain = XE_FW_RENDER,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = XEHPC_BCS5_RING_BASE }
-		},
+		.mmio_base = XEHPC_BCS5_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS6] = {
 		.name = "bcs6",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 6,
 		.domain = XE_FW_RENDER,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = XEHPC_BCS6_RING_BASE }
-		},
+		.mmio_base = XEHPC_BCS6_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS7] = {
 		.name = "bcs7",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 7,
 		.domain = XE_FW_RENDER,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = XEHPC_BCS7_RING_BASE }
-		},
+		.mmio_base = XEHPC_BCS7_RING_BASE,
 	},
 	[XE_HW_ENGINE_BCS8] = {
 		.name = "bcs8",
 		.class = XE_ENGINE_CLASS_COPY,
 		.instance = 8,
 		.domain = XE_FW_RENDER,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = XEHPC_BCS8_RING_BASE }
-		},
+		.mmio_base = XEHPC_BCS8_RING_BASE,
 	},
 
 	[XE_HW_ENGINE_VCS0] = {
@@ -135,166 +111,115 @@ static const struct engine_info engine_infos[] = {
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 0,
 		.domain = XE_FW_MEDIA_VDBOX0,
-		.mmio_bases = {
-			{ .graphics_ver = 11, .base = GEN11_BSD_RING_BASE },
-			{ .graphics_ver = 6, .base = GEN6_BSD_RING_BASE },
-			{ .graphics_ver = 4, .base = BSD_RING_BASE }
-		},
+		.mmio_base = GEN11_BSD_RING_BASE,
 	},
 	[XE_HW_ENGINE_VCS1] = {
 		.name = "vcs1",
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 1,
 		.domain = XE_FW_MEDIA_VDBOX1,
-		.mmio_bases = {
-			{ .graphics_ver = 11, .base = GEN11_BSD2_RING_BASE },
-			{ .graphics_ver = 8, .base = GEN8_BSD2_RING_BASE }
-		},
+		.mmio_base = GEN11_BSD2_RING_BASE,
 	},
 	[XE_HW_ENGINE_VCS2] = {
 		.name = "vcs2",
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 2,
 		.domain = XE_FW_MEDIA_VDBOX2,
-		.mmio_bases = {
-			{ .graphics_ver = 11, .base = GEN11_BSD3_RING_BASE }
-		},
+		.mmio_base = GEN11_BSD3_RING_BASE,
 	},
 	[XE_HW_ENGINE_VCS3] = {
 		.name = "vcs3",
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 3,
 		.domain = XE_FW_MEDIA_VDBOX3,
-		.mmio_bases = {
-			{ .graphics_ver = 11, .base = GEN11_BSD4_RING_BASE }
-		},
+		.mmio_base = GEN11_BSD4_RING_BASE,
 	},
 	[XE_HW_ENGINE_VCS4] = {
 		.name = "vcs4",
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 4,
 		.domain = XE_FW_MEDIA_VDBOX4,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = XEHP_BSD5_RING_BASE }
-		},
+		.mmio_base = XEHP_BSD5_RING_BASE,
 	},
 	[XE_HW_ENGINE_VCS5] = {
 		.name = "vcs5",
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 5,
 		.domain = XE_FW_MEDIA_VDBOX5,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = XEHP_BSD6_RING_BASE }
-		},
+		.mmio_base = XEHP_BSD6_RING_BASE,
 	},
 	[XE_HW_ENGINE_VCS6] = {
 		.name = "vcs6",
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 6,
 		.domain = XE_FW_MEDIA_VDBOX6,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = XEHP_BSD7_RING_BASE }
-		},
+		.mmio_base = XEHP_BSD7_RING_BASE,
 	},
 	[XE_HW_ENGINE_VCS7] = {
 		.name = "vcs7",
 		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
 		.instance = 7,
 		.domain = XE_FW_MEDIA_VDBOX7,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = XEHP_BSD8_RING_BASE }
-		},
+		.mmio_base = XEHP_BSD8_RING_BASE,
 	},
 	[XE_HW_ENGINE_VECS0] = {
 		.name = "vecs0",
 		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
 		.instance = 0,
 		.domain = XE_FW_MEDIA_VEBOX0,
-		.mmio_bases = {
-			{ .graphics_ver = 11, .base = GEN11_VEBOX_RING_BASE },
-			{ .graphics_ver = 7, .base = VEBOX_RING_BASE }
-		},
+		.mmio_base = GEN11_VEBOX_RING_BASE,
 	},
 	[XE_HW_ENGINE_VECS1] = {
 		.name = "vecs1",
 		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
 		.instance = 1,
 		.domain = XE_FW_MEDIA_VEBOX1,
-		.mmio_bases = {
-			{ .graphics_ver = 11, .base = GEN11_VEBOX2_RING_BASE }
-		},
+		.mmio_base = GEN11_VEBOX2_RING_BASE,
 	},
 	[XE_HW_ENGINE_VECS2] = {
 		.name = "vecs2",
 		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
 		.instance = 2,
 		.domain = XE_FW_MEDIA_VEBOX2,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = XEHP_VEBOX3_RING_BASE }
-		},
+		.mmio_base = XEHP_VEBOX3_RING_BASE,
 	},
 	[XE_HW_ENGINE_VECS3] = {
 		.name = "vecs3",
 		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
 		.instance = 3,
 		.domain = XE_FW_MEDIA_VEBOX3,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = XEHP_VEBOX4_RING_BASE }
-		},
+		.mmio_base = XEHP_VEBOX4_RING_BASE,
 	},
 	[XE_HW_ENGINE_CCS0] = {
 		.name = "ccs0",
 		.class = XE_ENGINE_CLASS_COMPUTE,
 		.instance = 0,
 		.domain = XE_FW_RENDER,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = GEN12_COMPUTE0_RING_BASE },
-		},
+		.mmio_base = GEN12_COMPUTE0_RING_BASE,
 	},
 	[XE_HW_ENGINE_CCS1] = {
 		.name = "ccs1",
 		.class = XE_ENGINE_CLASS_COMPUTE,
 		.instance = 1,
 		.domain = XE_FW_RENDER,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = GEN12_COMPUTE1_RING_BASE },
-		},
+		.mmio_base = GEN12_COMPUTE1_RING_BASE,
 	},
 	[XE_HW_ENGINE_CCS2] = {
 		.name = "ccs2",
 		.class = XE_ENGINE_CLASS_COMPUTE,
 		.instance = 2,
 		.domain = XE_FW_RENDER,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = GEN12_COMPUTE2_RING_BASE },
-		},
+		.mmio_base = GEN12_COMPUTE2_RING_BASE,
 	},
 	[XE_HW_ENGINE_CCS3] = {
 		.name = "ccs3",
 		.class = XE_ENGINE_CLASS_COMPUTE,
 		.instance = 3,
 		.domain = XE_FW_RENDER,
-		.mmio_bases = {
-			{ .graphics_ver = 12, .base = GEN12_COMPUTE3_RING_BASE },
-		},
+		.mmio_base = GEN12_COMPUTE3_RING_BASE,
 	},
 };
 
-static u32 engine_info_mmio_base(const struct engine_info *info,
-				 unsigned int graphics_ver)
-{
-	int i;
-
-	for (i = 0; i < MAX_MMIO_BASES; i++)
-		if (graphics_ver >= info->mmio_bases[i].graphics_ver)
-			break;
-
-	XE_BUG_ON(i == MAX_MMIO_BASES);
-	XE_BUG_ON(!info->mmio_bases[i].base);
-
-	return info->mmio_bases[i].base;
-}
-
 static void hw_engine_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_hw_engine *hwe = arg;
@@ -362,7 +287,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	hwe->gt = gt;
 	hwe->class = info->class;
 	hwe->instance = info->instance;
-	hwe->mmio_base = engine_info_mmio_base(info, GRAPHICS_VER(xe));
+	hwe->mmio_base = info->mmio_base;
 	hwe->domain = info->domain;
 	hwe->name = info->name;
 	hwe->fence_irq = &gt->fence_irq[info->class];
-- 
2.39.1

