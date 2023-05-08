Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC95C77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 14:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F9310E2DB;
	Mon,  8 May 2023 14:47:23 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E62210E2C2
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 14:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683557239; x=1715093239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I+tqfUiK0fCaRNcEUOWa3p9BdRxDS5f4sp17Xh15z3U=;
 b=kZEYhNMEzIVgOjQJADpVoyC0c4mNdOmNXQVdChqqfP2zvWZpMfsI/yi7
 EVKdhnEDu8zbpyWSCGW1xveXoiC1Q6KTrp2ZHuvHT1RCD86aY68Eyi3tS
 rwCs+TC3mGwaIyezFFKOKsk4QhlLJFgmSUmrqMeIfGJHRbtSglgdLooaj
 TOOezmohYbOGdfJ/JY5vdTacWaUa3+yy2kktaq447A50EHm1ldJ62Y/I7
 +2M9EgObKkiKOAMP+FPExIJ55t9q7aIuITgnl6gCNY9dRVfhpGhWW4ehx
 lA3F+A8zIhH4JrjXwqt0wzWVvARxcWXxAeFKdVya6fYfeQfvcZPxx14wF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="347130011"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="347130011"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 07:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="1028433546"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="1028433546"
Received: from heid-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.78])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 07:46:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 17:46:05 +0300
Message-Id: <20230508144618.162140-6-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508144618.162140-1-jani.nikula@intel.com>
References: <20230508144618.162140-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 05/18] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove intel_de.h completely in favour of having i915/display/intel_de.h
route to the uncore glue layer.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/intel_de.h | 163 --------------------------
 1 file changed, 163 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/display/intel_de.h

diff --git a/drivers/gpu/drm/xe/display/intel_de.h b/drivers/gpu/drm/xe/display/intel_de.h
deleted file mode 100644
index 31322cf5e7af..000000000000
--- a/drivers/gpu/drm/xe/display/intel_de.h
+++ /dev/null
@@ -1,163 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2019 Intel Corporation
- */
-
-#ifndef __INTEL_DE_H__
-#define __INTEL_DE_H__
-
-#include "i915_drv.h"
-#include "xe_mmio.h"
-#include "xe_pcode.h"
-
-/* This was included from i915_trace.h -> i915_irq.h -> i915_reg.h, kept for compat */
-#include "i915_reg.h"
-
-static inline u32
-intel_de_read(struct drm_i915_private *i915, i915_reg_t reg)
-{
-	return xe_mmio_read32(to_gt(i915), reg.reg);
-}
-
-static inline u64
-intel_de_read64_2x32(struct drm_i915_private *i915,
-		     i915_reg_t lower_reg, i915_reg_t upper_reg)
-{
-	u32 upper, lower;
-
-	lower = xe_mmio_read32(to_gt(i915), lower_reg.reg);
-	upper = xe_mmio_read32(to_gt(i915), upper_reg.reg);
-	return (u64)upper << 32 | lower;
-}
-
-static inline void
-intel_de_posting_read(struct drm_i915_private *i915, i915_reg_t reg)
-{
-	xe_mmio_read32(to_gt(i915), reg.reg);
-}
-
-static inline void
-intel_de_write(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
-{
-	xe_mmio_write32(to_gt(i915), reg.reg, val);
-}
-
-static inline u32
-intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, u32 set)
-{
-	return xe_mmio_rmw32(to_gt(i915), reg.reg, clear, set);
-}
-
-static inline int
-intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
-			   u32 mask, u32 value, unsigned int timeout)
-{
-	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL,
-			      false);
-}
-
-static inline int
-intel_de_wait_for_register_fw(struct drm_i915_private *i915, i915_reg_t reg,
-			      u32 mask, u32 value, unsigned int timeout)
-{
-	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL,
-			      false);
-}
-
-static inline int
-__intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
-			     u32 mask, u32 value,
-			     unsigned int fast_timeout_us,
-			     unsigned int slow_timeout_ms, u32 *out_value)
-{
-	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask,
-			      fast_timeout_us + 1000 * slow_timeout_ms,
-			      out_value, false);
-}
-
-static inline int
-intel_de_wait_for_set(struct drm_i915_private *i915, i915_reg_t reg,
-		      u32 mask, unsigned int timeout)
-{
-	return intel_de_wait_for_register(i915, reg, mask, mask, timeout);
-}
-
-static inline int
-intel_de_wait_for_clear(struct drm_i915_private *i915, i915_reg_t reg,
-			u32 mask, unsigned int timeout)
-{
-	return intel_de_wait_for_register(i915, reg, mask, 0, timeout);
-}
-
-/*
- * Unlocked mmio-accessors, think carefully before using these.
- *
- * Certain architectures will die if the same cacheline is concurrently accessed
- * by different clients (e.g. on Ivybridge). Access to registers should
- * therefore generally be serialised, by either the dev_priv->uncore.lock or
- * a more localised lock guarding all access to that bank of registers.
- */
-static inline u32
-intel_de_read_fw(struct drm_i915_private *i915, i915_reg_t reg)
-{
-	return xe_mmio_read32(to_gt(i915), reg.reg);
-}
-
-static inline void
-intel_de_write_fw(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
-{
-	xe_mmio_write32(to_gt(i915), reg.reg, val);
-}
-
-static inline void
-intel_de_write_samevalue(struct drm_i915_private *i915, i915_reg_t reg)
-{
-	/*
-	 * Not implemented, requires lock on all reads/writes.
-	 * only required for really old FBC. Not ever going to be needed.
-	 */
-	XE_BUG_ON(1);
-}
-
-static inline u32
-intel_de_read_notrace(struct drm_i915_private *i915, i915_reg_t reg)
-{
-	return xe_mmio_read32(to_gt(i915), reg.reg);
-}
-
-static inline void
-intel_de_write_notrace(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
-{
-	xe_mmio_write32(to_gt(i915), reg.reg, val);
-}
-
-static inline int
-intel_de_pcode_write_timeout(struct drm_i915_private *i915, u32 mbox, u32 val,
-			    int fast_timeout_us, int slow_timeout_ms)
-{
-	return xe_pcode_write_timeout(to_gt(i915), mbox, val,
-				       slow_timeout_ms ?: 1);
-}
-
-static inline int
-intel_de_pcode_write(struct drm_i915_private *i915, u32 mbox, u32 val)
-{
-
-	return xe_pcode_write(to_gt(i915), mbox, val);
-}
-
-static inline int
-intel_de_pcode_read(struct drm_i915_private *i915, u32 mbox, u32 *val, u32 *val1)
-{
-	return xe_pcode_read(to_gt(i915), mbox, val, val1);
-}
-
-static inline int intel_de_pcode_request(struct drm_i915_private *i915, u32 mbox,
-					 u32 request, u32 reply_mask, u32 reply,
-					 int timeout_base_ms)
-{
-	return xe_pcode_request(to_gt(i915), mbox, request, reply_mask, reply,
-				timeout_base_ms);
-}
-
-#endif /* __INTEL_DE_H__ */
-- 
2.39.2

