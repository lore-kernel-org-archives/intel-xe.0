Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1D1C7EE2D
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 22:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AD110E31E;
	Mon,  8 May 2023 22:54:11 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E422610E314
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 22:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683586446; x=1715122446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7mYfN1fSTWxK/fk0nBTc9Kj+ray8S08HvG5Y+VtSO3Y=;
 b=g08WzkS4F+1yofIRK6IKUpg+orE75wJJn2/sl2CWE7IRH72yno0lvE4W
 frPVg/xrECc7YNns+HucvssTQ4J5Vv6/tlusmbjv7X/aJmADfZG+BUypz
 5Ap95bF0bkyv9TpikP5jsbWh+utqnvHd4CDHIEaeGWWwqjw9ntscfaKZS
 /GTvoLZ+y8vnFFmwV6Y346RGBr/ihYitBIi7RM4SEgM6iiigWjoik6i2V
 gGnbPykjVuQJe4LgeFwOkTjhzesKtbSeYR/51Ncti8mKuyDkzBHVyNd1O
 9itPqNVGZpZSXIeXGRKgq4Fs3PzwFE7uqWDdMdEbV01Y28IKBG9Ubh9R/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="330130315"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="330130315"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 15:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="768232372"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="768232372"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 15:54:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 15:53:20 -0700
Message-Id: <20230508225322.2692066-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230508225322.2692066-1-lucas.demarchi@intel.com>
References: <20230508225322.2692066-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/4] fixup! drm/xe/display: Implement display
 support
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

WARNING: This should only be squashed when the display implementation
moves above commit "drm/xe/mmio: Use struct xe_reg".

With the move of display above xe_reg conversion in xe_mmio,
it should use the new types everywhere.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../drm/xe/compat-i915-headers/intel_uncore.h | 103 +++++++++++++-----
 1 file changed, 74 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
index 90d79290a211..14f195fe275d 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
@@ -17,82 +17,127 @@ static inline struct xe_gt *__fake_uncore_to_gt(struct fake_uncore *uncore)
 	return to_gt(xe);
 }
 
-static inline u32 intel_uncore_read(struct fake_uncore *uncore, i915_reg_t reg)
+static inline u32 intel_uncore_read(struct fake_uncore *uncore,
+				    i915_reg_t i915_reg)
 {
-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
 }
 
-static inline u32 intel_uncore_read8(struct fake_uncore *uncore, i915_reg_t reg)
+static inline u32 intel_uncore_read8(struct fake_uncore *uncore,
+				     i915_reg_t i915_reg)
 {
-	return xe_mmio_read8(__fake_uncore_to_gt(uncore), reg.reg);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	return xe_mmio_read8(__fake_uncore_to_gt(uncore), reg);
 }
 
-static inline u64 intel_uncore_read64_2x32(struct fake_uncore *uncore, i915_reg_t lower_reg, i915_reg_t upper_reg)
+static inline u64
+intel_uncore_read64_2x32(struct fake_uncore *uncore,
+			 i915_reg_t i915_lower_reg, i915_reg_t i915_upper_reg)
 {
+	struct xe_reg lower_reg = XE_REG(i915_mmio_reg_offset(i915_lower_reg));
+	struct xe_reg upper_reg = XE_REG(i915_mmio_reg_offset(i915_upper_reg));
 	u32 upper, lower, old_upper;
 	int loop = 0;
 
-	upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg.reg);
+	upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg);
 	do {
 		old_upper = upper;
-		lower = xe_mmio_read32(__fake_uncore_to_gt(uncore), lower_reg.reg);
-		upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg.reg);
+		lower = xe_mmio_read32(__fake_uncore_to_gt(uncore), lower_reg);
+		upper = xe_mmio_read32(__fake_uncore_to_gt(uncore), upper_reg);
 	} while (upper != old_upper && loop++ < 2);
 
 	return (u64)upper << 32 | lower;
 }
 
-static inline void intel_uncore_posting_read(struct fake_uncore *uncore, i915_reg_t reg)
+static inline void intel_uncore_posting_read(struct fake_uncore *uncore,
+					     i915_reg_t i915_reg)
 {
-	xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
 }
 
-static inline void intel_uncore_write(struct fake_uncore *uncore, i915_reg_t reg, u32 val)
+static inline void intel_uncore_write(struct fake_uncore *uncore,
+				      i915_reg_t i915_reg, u32 val)
 {
-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg.reg, val);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
 }
 
-static inline u32 intel_uncore_rmw(struct fake_uncore *uncore, i915_reg_t reg, u32 clear, u32 set)
+static inline u32 intel_uncore_rmw(struct fake_uncore *uncore,
+				   i915_reg_t i915_reg, u32 clear, u32 set)
 {
-	return xe_mmio_rmw32(__fake_uncore_to_gt(uncore), reg.reg, clear, set);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	return xe_mmio_rmw32(__fake_uncore_to_gt(uncore), reg, clear, set);
 }
 
-static inline int intel_wait_for_register(struct fake_uncore *uncore, i915_reg_t reg, u32 mask, u32 value, unsigned int timeout)
+static inline int intel_wait_for_register(struct fake_uncore *uncore,
+					  i915_reg_t i915_reg, u32 mask,
+					  u32 value, unsigned int timeout)
 {
-	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL, false);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg, value, mask,
+			      timeout * USEC_PER_MSEC, NULL, false);
 }
 
-static inline int intel_wait_for_register_fw(struct fake_uncore *uncore, i915_reg_t reg, u32 mask, u32 value, unsigned int timeout)
+static inline int intel_wait_for_register_fw(struct fake_uncore *uncore,
+					     i915_reg_t i915_reg, u32 mask,
+					     u32 value, unsigned int timeout)
 {
-	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL, false);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg, value, mask,
+			      timeout * USEC_PER_MSEC, NULL, false);
 }
 
-static inline int __intel_wait_for_register(struct fake_uncore *uncore, i915_reg_t reg, u32 mask, u32 value,
-					    unsigned int fast_timeout_us, unsigned int slow_timeout_ms, u32 *out_value)
+static inline int
+__intel_wait_for_register(struct fake_uncore *uncore, i915_reg_t i915_reg,
+			  u32 mask, u32 value, unsigned int fast_timeout_us,
+			  unsigned int slow_timeout_ms, u32 *out_value)
 {
-	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg.reg, value, mask,
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	return xe_mmio_wait32(__fake_uncore_to_gt(uncore), reg, value, mask,
 			      fast_timeout_us + 1000 * slow_timeout_ms,
 			      out_value, false);
 }
 
-static inline u32 intel_uncore_read_fw(struct fake_uncore *uncore, i915_reg_t reg)
+static inline u32 intel_uncore_read_fw(struct fake_uncore *uncore,
+				       i915_reg_t i915_reg)
 {
-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
 }
 
-static inline void intel_uncore_write_fw(struct fake_uncore *uncore, i915_reg_t reg, u32 val)
+static inline void intel_uncore_write_fw(struct fake_uncore *uncore,
+					 i915_reg_t i915_reg, u32 val)
 {
-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg.reg, val);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
 }
 
-static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore, i915_reg_t reg)
+static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore,
+					    i915_reg_t i915_reg)
 {
-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
 }
 
-static inline void intel_uncore_write_notrace(struct fake_uncore *uncore, i915_reg_t reg, u32 val)
+static inline void intel_uncore_write_notrace(struct fake_uncore *uncore,
+					      i915_reg_t i915_reg, u32 val)
 {
-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg.reg, val);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
 }
 
 #endif /* __INTEL_UNCORE_H__ */
-- 
2.40.1

