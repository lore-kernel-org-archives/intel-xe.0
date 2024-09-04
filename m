Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2BDCD4841
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187F610E648;
	Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCKRWucT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F035810E63A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409276; x=1756945276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8dUYYl1+m9c65K5X6HQ+ZsrtcqqQvPCbRcYtOUKuSM0=;
 b=OCKRWucTPQ2YP/h6ecOPYGOC+OfpvFhV4R9OTF+epCRO5Bxxntn/fPmT
 NI0+1VWQ12gIRHZfsRXDRPSImVqUZbR1jpCrEYseNV3pREEE3+ev4C+PF
 WzLdYb/EpSL2J3UJL55o0MkgK2CdiCofcMFTJidWZDrPx3Iq76pX+ubUm
 F3w5RCrvovFbv1ZxneE412EYCp5umJ6tPeGorVcaHSlFQl67mb5roa5f5
 IycqFIC+krYo2JCNhDRi6EdWU0Al2G8kk2RjWwRz5B4bpH3XgYAaSi3YK
 zHQ1Uuo1xGz2Ac7JR88daOPWdWYsyQauPlcb1N64lbob87cM9vDO8Sj7J Q==;
X-CSE-ConnectionGUID: yjjfWiTIQ76+u7vZyG+Uig==
X-CSE-MsgGUID: uD3NjCZ/S9KtA7puoOpsLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904802"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904802"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:15 -0700
X-CSE-ConnectionGUID: 4H2e9IvdSQa/fFFSMtP5iQ==
X-CSE-MsgGUID: CKAPc0GMTTqdTnVmCA1s3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944241"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 14/43] drm/xe/compat-i915: Convert register access to use
 xe_mmio
Date: Tue,  3 Sep 2024 17:21:15 -0700
Message-ID: <20240904002100.2023834-59-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Since display (via compat-i915) was the only part of the driver doing
8-bit and 16-bit register reads, this also allows us to drop the
_Generic wrapper macro on these two functions.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 .../drm/xe/compat-i915-headers/intel_uncore.h | 36 +++++++++----------
 drivers/gpu/drm/xe/xe_mmio.c                  |  4 +--
 drivers/gpu/drm/xe/xe_mmio.h                  |  7 ++--
 3 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index eb5b5f0e4bd9..ee3469d4ae73 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -10,11 +10,11 @@
 #include "xe_device_types.h"
 #include "xe_mmio.h"
 
-static inline struct xe_gt *__compat_uncore_to_gt(struct intel_uncore *uncore)
+static inline struct xe_mmio *__compat_uncore_to_mmio(struct intel_uncore *uncore)
 {
 	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
 
-	return xe_root_mmio_gt(xe);
+	return xe_root_tile_mmio(xe);
 }
 
 static inline struct xe_tile *__compat_uncore_to_tile(struct intel_uncore *uncore)
@@ -29,7 +29,7 @@ static inline u32 intel_uncore_read(struct intel_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
+	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
 }
 
 static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
@@ -37,7 +37,7 @@ static inline u8 intel_uncore_read8(struct intel_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_read8(__compat_uncore_to_gt(uncore), reg);
+	return xe_mmio_read8(__compat_uncore_to_mmio(uncore), reg);
 }
 
 static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
@@ -45,7 +45,7 @@ static inline u16 intel_uncore_read16(struct intel_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_read16(__compat_uncore_to_gt(uncore), reg);
+	return xe_mmio_read16(__compat_uncore_to_mmio(uncore), reg);
 }
 
 static inline u64
@@ -57,11 +57,11 @@ intel_uncore_read64_2x32(struct intel_uncore *uncore,
 	u32 upper, lower, old_upper;
 	int loop = 0;
 
-	upper = xe_mmio_read32(__compat_uncore_to_gt(uncore), upper_reg);
+	upper = xe_mmio_read32(__compat_uncore_to_mmio(uncore), upper_reg);
 	do {
 		old_upper = upper;
-		lower = xe_mmio_read32(__compat_uncore_to_gt(uncore), lower_reg);
-		upper = xe_mmio_read32(__compat_uncore_to_gt(uncore), upper_reg);
+		lower = xe_mmio_read32(__compat_uncore_to_mmio(uncore), lower_reg);
+		upper = xe_mmio_read32(__compat_uncore_to_mmio(uncore), upper_reg);
 	} while (upper != old_upper && loop++ < 2);
 
 	return (u64)upper << 32 | lower;
@@ -72,7 +72,7 @@ static inline void intel_uncore_posting_read(struct intel_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
+	xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
 }
 
 static inline void intel_uncore_write(struct intel_uncore *uncore,
@@ -80,7 +80,7 @@ static inline void intel_uncore_write(struct intel_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
+	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
 }
 
 static inline u32 intel_uncore_rmw(struct intel_uncore *uncore,
@@ -88,7 +88,7 @@ static inline u32 intel_uncore_rmw(struct intel_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_rmw32(__compat_uncore_to_gt(uncore), reg, clear, set);
+	return xe_mmio_rmw32(__compat_uncore_to_mmio(uncore), reg, clear, set);
 }
 
 static inline int intel_wait_for_register(struct intel_uncore *uncore,
@@ -97,7 +97,7 @@ static inline int intel_wait_for_register(struct intel_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
+	return xe_mmio_wait32(__compat_uncore_to_mmio(uncore), reg, mask, value,
 			      timeout * USEC_PER_MSEC, NULL, false);
 }
 
@@ -107,7 +107,7 @@ static inline int intel_wait_for_register_fw(struct intel_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
+	return xe_mmio_wait32(__compat_uncore_to_mmio(uncore), reg, mask, value,
 			      timeout * USEC_PER_MSEC, NULL, false);
 }
 
@@ -118,7 +118,7 @@ __intel_wait_for_register(struct intel_uncore *uncore, i915_reg_t i915_reg,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_wait32(__compat_uncore_to_gt(uncore), reg, mask, value,
+	return xe_mmio_wait32(__compat_uncore_to_mmio(uncore), reg, mask, value,
 			      fast_timeout_us + 1000 * slow_timeout_ms,
 			      out_value, false);
 }
@@ -128,7 +128,7 @@ static inline u32 intel_uncore_read_fw(struct intel_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
+	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
 }
 
 static inline void intel_uncore_write_fw(struct intel_uncore *uncore,
@@ -136,7 +136,7 @@ static inline void intel_uncore_write_fw(struct intel_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
+	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
 }
 
 static inline u32 intel_uncore_read_notrace(struct intel_uncore *uncore,
@@ -144,7 +144,7 @@ static inline u32 intel_uncore_read_notrace(struct intel_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	return xe_mmio_read32(__compat_uncore_to_gt(uncore), reg);
+	return xe_mmio_read32(__compat_uncore_to_mmio(uncore), reg);
 }
 
 static inline void intel_uncore_write_notrace(struct intel_uncore *uncore,
@@ -152,7 +152,7 @@ static inline void intel_uncore_write_notrace(struct intel_uncore *uncore,
 {
 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
 
-	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
+	xe_mmio_write32(__compat_uncore_to_mmio(uncore), reg, val);
 }
 
 static inline void __iomem *intel_uncore_regs(struct intel_uncore *uncore)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 92f0bda0ae30..dbede6056bee 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -200,7 +200,7 @@ static void mmio_flush_pending_writes(struct xe_mmio *mmio)
 		writel(0, mmio->regs + DUMMY_REG_OFFSET);
 }
 
-u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
+u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
 {
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u8 val;
@@ -214,7 +214,7 @@ u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
 	return val;
 }
 
-u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
+u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg)
 {
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u16 val;
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index ac6846447c52..99e3b58c9bb2 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -27,11 +27,8 @@ int xe_mmio_probe_tiles(struct xe_device *xe);
 		 const struct xe_mmio *: (ptr), \
 		 struct xe_mmio *: (ptr))
 
-u8 __xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
-#define xe_mmio_read8(p, reg) __xe_mmio_read8(__to_xe_mmio(p), reg)
-
-u16 __xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
-#define xe_mmio_read16(p, reg) __xe_mmio_read16(__to_xe_mmio(p), reg)
+u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
+u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
 
 void __xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);
 #define xe_mmio_write32(p, reg, val) __xe_mmio_write32(__to_xe_mmio(p), reg, val)
-- 
2.45.2

