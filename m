Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999A7EE01FE
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C592C10E953;
	Tue, 10 Sep 2024 23:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeaV9oR5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C0210E93F
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012047; x=1757548047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p+Qn8uLdNxtzAvXAYNgYBVWjywXXpB/BhAwW3aYDPpM=;
 b=JeaV9oR5tKzfU87aruLg9ZfmAdebLcLoqqUZD/MewrGvzUyLgX1eD1e/
 iEpzQseEITZQD6ikqENgQzDhZwMvec7z1ZqaSxaWyOQrV2YNlTxvP66/k
 BqMrvie4E9KZeCiplsKt1A9A5L8EDXKs39/XVAI+PVcEgTx7boUfu2cC6
 IcTOSmONshLDRJdzUs8kUKg2RnSDWTxP2oR5XxRVLeJYP2pQgVdOLZtGO
 Bxcio+PdU/LF1wgCLxgtJLFsDYwqwMZ7F6rZME+Hh9pKs3Jd+YwaYtRbJ
 MgF8FPpdKJnQrxp5Yh2/+HnjEiQCH/Ayq0atP+7Zk3K8VJJZuWQfLZCsX g==;
X-CSE-ConnectionGUID: JfqqDTWUSaCqlXIsgeEOaA==
X-CSE-MsgGUID: o+wdq6ZlRCa2ZQsVgAc8aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144305"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144305"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:27 -0700
X-CSE-ConnectionGUID: Qc3GJOcQQX+huWcsnNe/lQ==
X-CSE-MsgGUID: BkMaqnpRTWGmiSZG+Ir7Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989580"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 14/43] drm/xe/compat-i915: Convert register access to use
 xe_mmio
Date: Tue, 10 Sep 2024 16:47:34 -0700
Message-ID: <20240910234719.3335472-59-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

v2:
 - Don't remove _Generic wrappers for 8/16-bit yet; save that for the
   last patch of the series.  (Rodrigo)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 .../drm/xe/compat-i915-headers/intel_uncore.h | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

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
-- 
2.45.2

