Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8133BC87FDD
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 23:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E9A10E06E;
	Tue,  6 Jun 2023 23:53:14 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B41710E3EC
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 23:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686095590; x=1717631590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GZThB0DTSga98qyn5pZjduWZBs+b3fcdIp/RC2ghYCQ=;
 b=ip+StdslU5Bf+dbXzSNT8TfG/LGltIcbH9JNA/zU6DNAoRoNYnW1KOnU
 2/TMzJZzJtYCbnU3JF5GPCOrZd3OL/F5P35Tg1H+llTwJWaDi478g2s1W
 uGO4F5HPTKxTzm8y7gkKCiuImSG/xWTTz+czWBRAS1mrXnaW2EA1Ix6/X
 OoH72757H2hmisVS0RE7j8BjZEy14Dk+WeTow/8FvtDL72aJG+ta5yrRe
 7hgnRye5OeBMSSrCHhaGHMu/qTFyzK8aOtmZGnO9YEJbDjd6b3nftHvtS
 ZpGuBJ91NbhKwyzfXqOakbvxBanU6FoyHFaYccGV7gi+F+0dbBljrDfi8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="341481326"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="341481326"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 16:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="703385582"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="703385582"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 16:52:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 16:52:38 -0700
Message-Id: <20230606235242.1895643-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606235242.1895643-1-matthew.d.roper@intel.com>
References: <20230606235242.1895643-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 06/10] drm/i915/display: Move feature test
 macros to intel_display_device.h
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
Cc: matthew.d.roper@intel.com, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It makes sense to keep the display feature test macros centralized
within the display code.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230523195609.73627-7-matthew.d.roper@intel.com
(cherry picked from commit 95c08508e237ba2444786581bfcc7df1ff54c35b)
---
 .../drm/i915/display/intel_display_device.h   | 39 ++++++++++++
 drivers/gpu/drm/i915/i915_drv.h               | 61 -------------------
 2 files changed, 39 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index d1d11581d85d..2aa82cbdf1c5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -31,6 +31,45 @@ struct drm_i915_private;
 	func(overlay_needs_physical); \
 	func(supports_tv);
 
+#define HAS_ASYNC_FLIPS(i915)		(DISPLAY_VER(i915) >= 5)
+#define HAS_CDCLK_CRAWL(i915)		(DISPLAY_INFO(i915)->has_cdclk_crawl)
+#define HAS_CDCLK_SQUASH(i915)		(DISPLAY_INFO(i915)->has_cdclk_squash)
+#define HAS_CUR_FBC(i915)		(!HAS_GMCH(i915) && DISPLAY_VER(i915) >= 7)
+#define HAS_D12_PLANE_MINIMIZATION(i915) (IS_ROCKETLAKE(i915) || IS_ALDERLAKE_S(i915))
+#define HAS_DDI(i915)			(DISPLAY_INFO(i915)->has_ddi)
+#define HAS_DISPLAY(i915)		(DISPLAY_RUNTIME_INFO(i915)->pipe_mask != 0)
+#define HAS_DMC(i915)			(DISPLAY_RUNTIME_INFO(i915)->has_dmc)
+#define HAS_DOUBLE_BUFFERED_M_N(i915)	(DISPLAY_VER(i915) >= 9 || IS_BROADWELL(i915))
+#define HAS_DP_MST(i915)		(DISPLAY_INFO(i915)->has_dp_mst)
+#define HAS_DP20(i915)			(IS_DG2(i915) || DISPLAY_VER(i915) >= 14)
+#define HAS_DPT(i915)			(DISPLAY_VER(i915) >= 13)
+#define HAS_DSB(i915)			(DISPLAY_INFO(i915)->has_dsb)
+#define HAS_DSC(__i915)			(DISPLAY_RUNTIME_INFO(__i915)->has_dsc)
+#define HAS_FBC(i915)			(DISPLAY_RUNTIME_INFO(i915)->fbc_mask != 0)
+#define HAS_FPGA_DBG_UNCLAIMED(i915)	(DISPLAY_INFO(i915)->has_fpga_dbg)
+#define HAS_FW_BLC(i915)		(DISPLAY_VER(i915) > 2)
+#define HAS_GMBUS_IRQ(i915)		(DISPLAY_VER(i915) >= 4)
+#define HAS_GMBUS_BURST_READ(i915)	(DISPLAY_VER(i915) >= 10 || IS_KABYLAKE(i915))
+#define HAS_GMCH(i915)			(DISPLAY_INFO(i915)->has_gmch)
+#define HAS_HW_SAGV_WM(i915)		(DISPLAY_VER(i915) >= 13 && !IS_DGFX(i915))
+#define HAS_IPC(i915)			(DISPLAY_INFO(i915)->has_ipc)
+#define HAS_IPS(i915)			(IS_HSW_ULT(i915) || IS_BROADWELL(i915))
+#define HAS_LSPCON(i915)		(IS_DISPLAY_VER(i915, 9, 10))
+#define HAS_MBUS_JOINING(i915)		(IS_ALDERLAKE_P(i915) || DISPLAY_VER(i915) >= 14)
+#define HAS_MSO(i915)			(DISPLAY_VER(i915) >= 12)
+#define HAS_OVERLAY(i915)		(DISPLAY_INFO(i915)->has_overlay)
+#define HAS_PSR(i915)			(DISPLAY_INFO(i915)->has_psr)
+#define HAS_PSR_HW_TRACKING(i915)	(DISPLAY_INFO(i915)->has_psr_hw_tracking)
+#define HAS_PSR2_SEL_FETCH(i915)	(DISPLAY_VER(i915) >= 12)
+#define HAS_SAGV(i915)			(DISPLAY_VER(i915) >= 9 && !IS_LP(i915))
+#define HAS_TRANSCODER(i915, trans)	((DISPLAY_RUNTIME_INFO(i915)->cpu_transcoder_mask & \
+					  BIT(trans)) != 0)
+#define HAS_VRR(i915)			(DISPLAY_VER(i915) >= 11)
+#define INTEL_NUM_PIPES(i915)		(hweight8(DISPLAY_RUNTIME_INFO(i915)->pipe_mask))
+#define I915_HAS_HOTPLUG(i915)		(DISPLAY_INFO(i915)->has_hotplug)
+#define OVERLAY_NEEDS_PHYSICAL(i915)	(DISPLAY_INFO(i915)->overlay_needs_physical)
+#define SUPPORTS_TV(i915)		(DISPLAY_INFO(i915)->supports_tv)
+
 struct intel_display_runtime_info {
 	struct {
 		u16 ver;
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 4d982fa4d6b5..f1205ed3ba71 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -785,10 +785,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 	((sizes) & ~RUNTIME_INFO(i915)->page_sizes) == 0; \
 })
 
-#define HAS_OVERLAY(i915)		 (DISPLAY_INFO(i915)->has_overlay)
-#define OVERLAY_NEEDS_PHYSICAL(i915) \
-		(DISPLAY_INFO(i915)->overlay_needs_physical)
-
 /* Early gen2 have a totally busted CS tlb and require pinned batches. */
 #define HAS_BROKEN_CS_TLB(i915)	(IS_I830(i915) || IS_I845G(i915))
 
@@ -799,41 +795,11 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define NEEDS_WaRsDisableCoarsePowerGating(i915)			\
 	(IS_SKL_GT3(i915) || IS_SKL_GT4(i915))
 
-#define HAS_GMBUS_IRQ(i915) (DISPLAY_VER(i915) >= 4)
-#define HAS_GMBUS_BURST_READ(i915) (DISPLAY_VER(i915) >= 11 || \
-					IS_GEMINILAKE(i915) || \
-					IS_KABYLAKE(i915))
-
 /* With the 945 and later, Y tiling got adjusted so that it was 32 128-byte
  * rows, which changed the alignment requirements and fence programming.
  */
 #define HAS_128_BYTE_Y_TILING(i915) (GRAPHICS_VER(i915) != 2 && \
 					 !(IS_I915G(i915) || IS_I915GM(i915)))
-#define SUPPORTS_TV(i915)		(DISPLAY_INFO(i915)->supports_tv)
-#define I915_HAS_HOTPLUG(i915)	(DISPLAY_INFO(i915)->has_hotplug)
-
-#define HAS_FW_BLC(i915)	(DISPLAY_VER(i915) > 2)
-#define HAS_FBC(i915)		(DISPLAY_RUNTIME_INFO(i915)->fbc_mask != 0)
-#define HAS_CUR_FBC(i915)	(!HAS_GMCH(i915) && DISPLAY_VER(i915) >= 7)
-
-#define HAS_DPT(i915)	(DISPLAY_VER(i915) >= 13)
-
-#define HAS_IPS(i915)	(IS_HSW_ULT(i915) || IS_BROADWELL(i915))
-
-#define HAS_DP_MST(i915)	(DISPLAY_INFO(i915)->has_dp_mst)
-#define HAS_DP20(i915)	(IS_DG2(i915) || DISPLAY_VER(i915) >= 14)
-
-#define HAS_DOUBLE_BUFFERED_M_N(i915)	(DISPLAY_VER(i915) >= 9 || IS_BROADWELL(i915))
-
-#define HAS_CDCLK_CRAWL(i915)	 (DISPLAY_INFO(i915)->has_cdclk_crawl)
-#define HAS_CDCLK_SQUASH(i915)	 (DISPLAY_INFO(i915)->has_cdclk_squash)
-#define HAS_DDI(i915)		 (DISPLAY_INFO(i915)->has_ddi)
-#define HAS_FPGA_DBG_UNCLAIMED(i915) (DISPLAY_INFO(i915)->has_fpga_dbg)
-#define HAS_PSR(i915)		 (DISPLAY_INFO(i915)->has_psr)
-#define HAS_PSR_HW_TRACKING(i915) \
-	(DISPLAY_INFO(i915)->has_psr_hw_tracking)
-#define HAS_PSR2_SEL_FETCH(i915)	 (DISPLAY_VER(i915) >= 12)
-#define HAS_TRANSCODER(i915, trans)	 ((DISPLAY_RUNTIME_INFO(i915)->cpu_transcoder_mask & BIT(trans)) != 0)
 
 #define HAS_RC6(i915)		 (INTEL_INFO(i915)->has_rc6)
 #define HAS_RC6p(i915)		 (INTEL_INFO(i915)->has_rc6p)
@@ -841,11 +807,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_RPS(i915)	(INTEL_INFO(i915)->has_rps)
 
-#define HAS_DMC(i915)		(DISPLAY_RUNTIME_INFO(i915)->has_dmc)
-#define HAS_DSB(i915)		(DISPLAY_INFO(i915)->has_dsb)
-#define HAS_DSC(__i915)		(DISPLAY_RUNTIME_INFO(__i915)->has_dsc)
-#define HAS_HW_SAGV_WM(i915) (DISPLAY_VER(i915) >= 13 && !IS_DGFX(i915))
-
 #define HAS_HECI_PXP(i915) \
 	(INTEL_INFO(i915)->has_heci_pxp)
 
@@ -854,8 +815,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_HECI_GSC(i915) (HAS_HECI_PXP(i915) || HAS_HECI_GSCFI(i915))
 
-#define HAS_MSO(i915)		(DISPLAY_VER(i915) >= 12)
-
 #define HAS_RUNTIME_PM(i915) (INTEL_INFO(i915)->has_runtime_pm)
 #define HAS_64BIT_RELOC(i915) (INTEL_INFO(i915)->has_64bit_reloc)
 
@@ -872,9 +831,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
  */
 #define HAS_64K_PAGES(i915) (INTEL_INFO(i915)->has_64k_pages)
 
-#define HAS_IPC(i915)		(DISPLAY_INFO(i915)->has_ipc)
-#define HAS_SAGV(i915)		(DISPLAY_VER(i915) >= 9 && !IS_LP(i915))
-
 #define HAS_REGION(i915, i) (RUNTIME_INFO(i915)->memory_regions & (i))
 #define HAS_LMEM(i915) HAS_REGION(i915, REGION_LMEM)
 
@@ -892,12 +848,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 
 #define HAS_GLOBAL_MOCS_REGISTERS(i915)	(INTEL_INFO(i915)->has_global_mocs)
 
-#define HAS_GMCH(i915) (DISPLAY_INFO(i915)->has_gmch)
-
 #define HAS_GMD_ID(i915)	(INTEL_INFO(i915)->has_gmd_id)
 
-#define HAS_LSPCON(i915) (IS_DISPLAY_VER(i915, 9, 10))
-
 #define HAS_L3_CCS_READ(i915) (INTEL_INFO(i915)->has_l3_ccs_read)
 
 /* DPF == dynamic parity feature */
@@ -905,14 +857,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define NUM_L3_SLICES(i915) (IS_HSW_GT3(i915) ? \
 				 2 : HAS_L3_DPF(i915))
 
-#define INTEL_NUM_PIPES(i915) (hweight8(DISPLAY_RUNTIME_INFO(i915)->pipe_mask))
-
-#define HAS_DISPLAY(i915) (DISPLAY_RUNTIME_INFO(i915)->pipe_mask != 0)
-
-#define HAS_VRR(i915)	(DISPLAY_VER(i915) >= 11)
-
-#define HAS_ASYNC_FLIPS(i915)		(DISPLAY_VER(i915) >= 5)
-
 /* Only valid when HAS_DISPLAY() is true */
 #define INTEL_DISPLAY_ENABLED(i915) \
 	(drm_WARN_ON(&(i915)->drm, !HAS_DISPLAY(i915)),		\
@@ -922,11 +866,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_GUC_DEPRIVILEGE(i915) \
 	(INTEL_INFO(i915)->has_guc_deprivilege)
 
-#define HAS_D12_PLANE_MINIMIZATION(i915) (IS_ROCKETLAKE(i915) || \
-					      IS_ALDERLAKE_S(i915))
-
-#define HAS_MBUS_JOINING(i915) (IS_ALDERLAKE_P(i915) || DISPLAY_VER(i915) >= 14)
-
 #define HAS_3D_PIPELINE(i915)	(INTEL_INFO(i915)->has_3d_pipeline)
 
 #define HAS_ONE_EU_PER_FUSE_BIT(i915)	(INTEL_INFO(i915)->has_one_eu_per_fuse_bit)
-- 
2.40.1

