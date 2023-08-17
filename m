Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6670C6FD22
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 23:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0F110E27E;
	Thu, 17 Aug 2023 23:04:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CA110E27E
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 23:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692313456; x=1723849456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wFgWq+dNjUeVsfu32eTQNh6y/yZJO9eDUN516JfG+PU=;
 b=L4V8keVaoOdW+Gj1xGjT/EiLKHYC9H4TRQsL+8bDBiS632HB8Sq0SMgY
 iRnYmlXi8Hp6zb5idm4oqeOma85BS7No/K4OYVwP2G13cQrPRV080PTYN
 eLRoQ5Md2ELK5eQrYUSqtFYQLh+Gv07sZ12Z81T2sgHA/CazrvcStk2aV
 dUZ5DaU0aHaf5FPHa4XKNG5xpMj1n4HukTh/c8vPpimQmQFcg+kCEPegR
 Qf1DYofeFv6QgPI+mJsYl4k0aOnrBzxv2iTUA5aG3pyTPN/2mvDagvhZG
 r6TdUzOUkYvA3tLgXWJRfYSGAm40BAn6Xrae+Vj9CzPckUW/5TLTRyBzo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="375736160"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="375736160"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 16:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="734827919"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="734827919"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 16:04:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 16:04:10 -0700
Message-ID: <20230817230407.909816-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817230407.909816-6-matthew.d.roper@intel.com>
References: <20230817230407.909816-6-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/i915: Eliminate has_4tile feature flag
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

We don't really need a feature flag for has_4tile since there's a
well-defined cutover point (DG2) at which all new platforms started
using Tile4 as their Y-major tiling layout.  The GT side of the code
already handles Tile4 vs legacy TileY with checks on the IP version
rather than looking at the feature flag, and we can simplify the display
code similarly (which will also make it more self-contained for re-use
in the Xe driver).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230810234618.3738870-4-matthew.d.roper@intel.com
(cherry picked from commit 4ebf43d0488f65f50fffa35e16b60fcede3f477c)
---
 drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
 drivers/gpu/drm/i915/i915_drv.h                     | 1 -
 drivers/gpu/drm/i915/i915_pci.c                     | 1 -
 drivers/gpu/drm/i915/intel_device_info.h            | 1 -
 4 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 5b8a46114439..dd60ff44bce6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -31,6 +31,7 @@ struct drm_i915_private;
 	func(overlay_needs_physical); \
 	func(supports_tv);
 
+#define HAS_4TILE(i915)			(IS_DG2(i915) || DISPLAY_VER(i915) >= 14)
 #define HAS_ASYNC_FLIPS(i915)		(DISPLAY_VER(i915) >= 5)
 #define HAS_CDCLK_CRAWL(i915)		(DISPLAY_INFO(i915)->has_cdclk_crawl)
 #define HAS_CDCLK_SQUASH(i915)		(DISPLAY_INFO(i915)->has_cdclk_squash)
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index b4cf6f0f636d..07f79b1028e1 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -767,7 +767,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define CMDPARSER_USES_GGTT(i915) (GRAPHICS_VER(i915) == 7)
 
 #define HAS_LLC(i915)	(INTEL_INFO(i915)->has_llc)
-#define HAS_4TILE(i915)	(INTEL_INFO(i915)->has_4tile)
 #define HAS_SNOOP(i915)	(INTEL_INFO(i915)->has_snoop)
 #define HAS_EDRAM(i915)	((i915)->edram_size_mb)
 #define HAS_SECURE_BATCHES(i915) (GRAPHICS_VER(i915) < 6)
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 3d7a5db9833b..8ae997951fbb 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -716,7 +716,6 @@ static const struct intel_device_info adl_p_info = {
 	.has_3d_pipeline = 1, \
 	.has_64bit_reloc = 1, \
 	.has_flat_ccs = 1, \
-	.has_4tile = 1, \
 	.has_global_mocs = 1, \
 	.has_gt_uc = 1, \
 	.has_llc = 1, \
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 069291b3bd37..84a9c5d78028 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -152,7 +152,6 @@ enum intel_ppgtt_type {
 	func(gpu_reset_clobbers_display); \
 	func(has_reset_engine); \
 	func(has_3d_pipeline); \
-	func(has_4tile); \
 	func(has_flat_ccs); \
 	func(has_global_mocs); \
 	func(has_gmd_id); \
-- 
2.41.0

