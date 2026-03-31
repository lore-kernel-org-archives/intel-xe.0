Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7842E109B492
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 15:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355AA10EA68;
	Tue, 31 Mar 2026 15:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3h6lzv/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B32010EA67;
 Tue, 31 Mar 2026 15:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774971800; x=1806507800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o8QVYChtzhvV7B6cTLGEvgDUEXL4j/d2P/+2gR97RNk=;
 b=J3h6lzv/wBCulx5jfXGfkNppGnqFAHuWbvUFXQYRtB1hZV1z+q2G/P2z
 tpRJ5zAcUjdHpMiZWTCA+TEJBS+ud5oppwP6nA0D0NA6LdfEm+KGl3cFi
 LshF4rNJeXmjqLdQEDl1Gm+Bst1xFMtJT6upbGmiW7QXLXU7SrrvqSzab
 lqkhU5TYompLtS4lJhgcuvA32mKi671l9rsYcIGDYkCjHW/p4SLCyIQ8p
 D+0ErDGd//mTH2/8YGkCTyDrZqgOgj4r2XGKr5zx41E/bx2j7u4Ytl9mo
 rBON/wd3JIdyV7p+V6ZxR9aKyvz5xq1sRggqmoh1qyJxXjHCMEU41rGUR w==;
X-CSE-ConnectionGUID: 1ZHkk1wKSjWgADrkbLu2Rw==
X-CSE-MsgGUID: ++J2Kf/UQYCSpxTEOJ1DXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75884131"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75884131"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:43:20 -0700
X-CSE-ConnectionGUID: draEgCL5Rk+qCW40wID2bg==
X-CSE-MsgGUID: 9hO8NNP0Rpq1FzVtsrknCg==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:43:18 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 04/12] drm/i915/mchbar: WARN when accessing non-MCHBAR
 registers via intel_mchbar_read*()
Date: Tue, 31 Mar 2026 18:42:51 +0300
Message-ID: <20260331154259.24600-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260331154259.24600-1-ville.syrjala@linux.intel.com>
References: <20260331154259.24600-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The intel_mchbar_read*() functions should only be used for
accessing MCHBAR registers. Warn if someone tries to use
them for other registers.

I suppose we could even have a dedicated type for MCHBAR
registers. But that is true for many other special register
types as well, and so far we haven't bothered adding any
special types apart from i915_mcr_reg_t.

v2: Print the register offset (Jani)
    Mention i915_mcr_reg_t (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com> #v1
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_mchbar.c | 56 +++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_mchbar.c b/drivers/gpu/drm/i915/display/intel_mchbar.c
index 2636fe60ef37..a404fa38c9bd 100644
--- a/drivers/gpu/drm/i915/display/intel_mchbar.c
+++ b/drivers/gpu/drm/i915/display/intel_mchbar.c
@@ -3,14 +3,66 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include <linux/minmax.h>
+
+#include <drm/drm_print.h>
+
 #include "intel_display_core.h"
 #include "intel_mchbar.h"
+#include "intel_mchbar_regs.h"
 #include "intel_uncore.h"
 
+static bool has_mchbar_mirror(struct intel_display *display)
+{
+	return DISPLAY_VER(display) < 14;
+}
+
+static u32 mchbar_mirror_base(struct intel_display *display)
+{
+	if (DISPLAY_VER(display) >= 6)
+		return MCHBAR_MIRROR_BASE_SNB;
+	else
+		return MCHBAR_MIRROR_BASE;
+}
+
+static u32 mchbar_mirror_end(struct intel_display *display)
+{
+	if (DISPLAY_VER(display) >= 12 && !display->platform.rocketlake)
+		return MCHBAR_MIRROR_END_TGL;
+	else if (DISPLAY_VER(display) >= 11)
+		return MCHBAR_MIRROR_END_ICL_RKL;
+	else if (DISPLAY_VER(display) >= 6)
+		return MCHBAR_MIRROR_END_SNB;
+	else
+		return MCHBAR_MIRROR_END;
+}
+
+static u32 mchbar_mirror_len(struct intel_display *display)
+{
+	return mchbar_mirror_end(display) - mchbar_mirror_base(display) + 1;
+}
+
+static bool is_mchbar_reg(struct intel_display *display, i915_reg_t reg)
+{
+	return has_mchbar_mirror(display) &&
+		in_range32(i915_mmio_reg_offset(reg),
+			   mchbar_mirror_base(display),
+			   mchbar_mirror_len(display));
+}
+
+static void assert_is_mchbar_reg(struct intel_display *display, i915_reg_t reg)
+{
+	drm_WARN(display->drm, !is_mchbar_reg(display, reg),
+		 "Reading non-MCHBAR register 0x%x\n",
+		 i915_mmio_reg_offset(reg));
+}
+
 u16 intel_mchbar_read16(struct intel_display *display, i915_reg_t reg)
 {
 	struct intel_uncore *uncore = to_intel_uncore(display->drm);
 
+	assert_is_mchbar_reg(display, reg);
+
 	return intel_uncore_read16(uncore, reg);
 }
 
@@ -18,6 +70,8 @@ u32 intel_mchbar_read(struct intel_display *display, i915_reg_t reg)
 {
 	struct intel_uncore *uncore = to_intel_uncore(display->drm);
 
+	assert_is_mchbar_reg(display, reg);
+
 	return intel_uncore_read(uncore, reg);
 }
 
@@ -26,5 +80,7 @@ u64 intel_mchbar_read64_2x32(struct intel_display *display, i915_reg_t reg)
 	struct intel_uncore *uncore = to_intel_uncore(display->drm);
 	i915_reg_t upper_reg = _MMIO(i915_mmio_reg_offset(reg) + 4);
 
+	assert_is_mchbar_reg(display, reg);
+
 	return intel_uncore_read64_2x32(uncore, reg, upper_reg);
 }
-- 
2.52.0

