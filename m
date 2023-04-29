Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3891C7618E
	for <intel-xe@archiver.kernel.org>; Sat, 29 Apr 2023 06:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23C610E074;
	Sat, 29 Apr 2023 06:24:27 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB62110E0D2
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Apr 2023 06:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682749458; x=1714285458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8pwesWDt52o1DeJptmIDNxtP58TKFAxRa2ay3DO7+w0=;
 b=LKvd5t64q8ezgntl5H1RlF3SzWvUu0WcNGZicU3BmdJYm3bj+Ziau8dr
 7Hy84WnOGishuCYpQW6Nh8WGR1DoiSU1Cl5D3N7wLwm/sWVxHcDZz2ewX
 LFt9459speSIw0p+qPRsJJpH+bXws0vxkE0C0xa97mU8RI6A4ji07l6iA
 iD2XSnS1vS7mgT57fagza08W1X1kToRlPF2nKLXDofUo8Oi/5ZEccWF9C
 CB/F2sJxtdCY5LmAKzKGf99a64hMMxoN7sp+mk0v+s8tAwe9Z70RRpvW8
 dcOaBUsRoQwZf6jihCrPaOcIyfR/JSBziU393uFhLoaRV8guA7GSq7Tf1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="375928429"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; d="scan'208";a="375928429"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 23:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="697829094"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; d="scan'208";a="697829094"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 23:24:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 28 Apr 2023 23:23:30 -0700
Message-Id: <20230429062332.354139-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230429062332.354139-1-lucas.demarchi@intel.com>
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/7] fixup! drm/xe/display: Implement display
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With the move of display above xe_reg conversion in xe_mmio,
it should use the new types everywhere.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_de.h | 89 +++++++++++++++++++-----------
 1 file changed, 57 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_de.h b/drivers/gpu/drm/xe/display/xe_de.h
index 0c76b0d24d96..e6021f6d031d 100644
--- a/drivers/gpu/drm/xe/display/xe_de.h
+++ b/drivers/gpu/drm/xe/display/xe_de.h
@@ -14,79 +14,95 @@
 #include "i915_reg.h"
 
 static inline u32
-intel_de_read(struct drm_i915_private *i915, i915_reg_t reg)
+intel_de_read(struct drm_i915_private *i915, i915_reg_t i915_reg)
 {
-	return xe_mmio_read32(to_gt(i915), reg.reg);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	return xe_mmio_read32(to_gt(i915), reg);
 }
 
 static inline u64
 intel_de_read64_2x32(struct drm_i915_private *i915,
-		     i915_reg_t lower_reg, i915_reg_t upper_reg)
+		     i915_reg_t i915_lower_reg, i915_reg_t i915_upper_reg)
 {
+	struct xe_reg lower_reg = XE_REG(i915_mmio_reg_offset(i915_lower_reg));
+	struct xe_reg upper_reg = XE_REG(i915_mmio_reg_offset(i915_upper_reg));
 	u32 upper, lower;
 
-	lower = xe_mmio_read32(to_gt(i915), lower_reg.reg);
-	upper = xe_mmio_read32(to_gt(i915), upper_reg.reg);
+	lower = xe_mmio_read32(to_gt(i915), lower_reg);
+	upper = xe_mmio_read32(to_gt(i915), upper_reg);
 	return (u64)upper << 32 | lower;
 }
 
 static inline void
-intel_de_posting_read(struct drm_i915_private *i915, i915_reg_t reg)
+intel_de_posting_read(struct drm_i915_private *i915, i915_reg_t i915_reg)
 {
-	xe_mmio_read32(to_gt(i915), reg.reg);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	xe_mmio_read32(to_gt(i915), reg);
 }
 
 static inline void
-intel_de_write(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
+intel_de_write(struct drm_i915_private *i915, i915_reg_t i915_reg, u32 val)
 {
-	xe_mmio_write32(to_gt(i915), reg.reg, val);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	xe_mmio_write32(to_gt(i915), reg, val);
 }
 
 static inline u32
-intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, u32 set)
+intel_de_rmw(struct drm_i915_private *i915, i915_reg_t i915_reg, u32 clear, u32 set)
 {
-	return xe_mmio_rmw32(to_gt(i915), reg.reg, clear, set);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	return xe_mmio_rmw32(to_gt(i915), reg, clear, set);
 }
 
 static inline int
-intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
+intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t i915_reg,
 			   u32 mask, u32 value, unsigned int timeout)
 {
-	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL,
-			      false);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	return xe_mmio_wait32(to_gt(i915), reg, value, mask,
+			      timeout * USEC_PER_MSEC, NULL, false);
 }
 
 static inline int
-intel_de_wait_for_register_fw(struct drm_i915_private *i915, i915_reg_t reg,
+intel_de_wait_for_register_fw(struct drm_i915_private *i915, i915_reg_t i915_reg,
 			      u32 mask, u32 value, unsigned int timeout)
 {
-	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL,
-			      false);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	return xe_mmio_wait32(to_gt(i915), reg, value, mask,
+			      timeout * USEC_PER_MSEC, NULL, false);
 }
 
 static inline int
-__intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
+__intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t i915_reg,
 			     u32 mask, u32 value,
 			     unsigned int fast_timeout_us,
 			     unsigned int slow_timeout_ms, u32 *out_value)
 {
-	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask,
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	return xe_mmio_wait32(to_gt(i915), reg, value, mask,
 			      fast_timeout_us + 1000 * slow_timeout_ms,
 			      out_value, false);
 }
 
 static inline int
-intel_de_wait_for_set(struct drm_i915_private *i915, i915_reg_t reg,
+intel_de_wait_for_set(struct drm_i915_private *i915, i915_reg_t i915_reg,
 		      u32 mask, unsigned int timeout)
 {
-	return intel_de_wait_for_register(i915, reg, mask, mask, timeout);
+	return intel_de_wait_for_register(i915, i915_reg, mask, mask, timeout);
 }
 
 static inline int
-intel_de_wait_for_clear(struct drm_i915_private *i915, i915_reg_t reg,
+intel_de_wait_for_clear(struct drm_i915_private *i915, i915_reg_t i915_reg,
 			u32 mask, unsigned int timeout)
 {
-	return intel_de_wait_for_register(i915, reg, mask, 0, timeout);
+	return intel_de_wait_for_register(i915, i915_reg, mask, 0, timeout);
 }
 
 /*
@@ -98,19 +114,23 @@ intel_de_wait_for_clear(struct drm_i915_private *i915, i915_reg_t reg,
  * a more localised lock guarding all access to that bank of registers.
  */
 static inline u32
-intel_de_read_fw(struct drm_i915_private *i915, i915_reg_t reg)
+intel_de_read_fw(struct drm_i915_private *i915, i915_reg_t i915_reg)
 {
-	return xe_mmio_read32(to_gt(i915), reg.reg);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	return xe_mmio_read32(to_gt(i915), reg);
 }
 
 static inline void
-intel_de_write_fw(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
+intel_de_write_fw(struct drm_i915_private *i915, i915_reg_t i915_reg, u32 val)
 {
-	xe_mmio_write32(to_gt(i915), reg.reg, val);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	xe_mmio_write32(to_gt(i915), reg, val);
 }
 
 static inline void
-intel_de_write_samevalue(struct drm_i915_private *i915, i915_reg_t reg)
+intel_de_write_samevalue(struct drm_i915_private *i915, i915_reg_t i915_reg)
 {
 	/*
 	 * Not implemented, requires lock on all reads/writes.
@@ -120,15 +140,20 @@ intel_de_write_samevalue(struct drm_i915_private *i915, i915_reg_t reg)
 }
 
 static inline u32
-intel_de_read_notrace(struct drm_i915_private *i915, i915_reg_t reg)
+intel_de_read_notrace(struct drm_i915_private *i915, i915_reg_t i915_reg)
 {
-	return xe_mmio_read32(to_gt(i915), reg.reg);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	return xe_mmio_read32(to_gt(i915), reg);
 }
 
 static inline void
-intel_de_write_notrace(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
+intel_de_write_notrace(struct drm_i915_private *i915, i915_reg_t i915_reg,
+		       u32 val)
 {
-	xe_mmio_write32(to_gt(i915), reg.reg, val);
+	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
+
+	xe_mmio_write32(to_gt(i915), reg, val);
 }
 
 static inline int
-- 
2.40.1

