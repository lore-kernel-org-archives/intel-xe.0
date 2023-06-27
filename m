Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6144EB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 23:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA46A10E023;
	Tue, 27 Jun 2023 23:37:08 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917C510E023
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 23:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687909027; x=1719445027;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5AmtLSwqxoN6FDMhlqJ5UOyqfsAFoNaUu1ShgSSDY+0=;
 b=aV+ElF9uD19kYt5UE0f74MIzxWGFPOch5Pq8Hs4nBjslIGhJL2dP4rFw
 ZVkKFlaOWL2Ceqiyne6RXJoHYdk+y6aJ+KnGpKKvvxH/8znYao26g+vAe
 jIo3Cyeb1SXw0IZ/tnaJG+CT6XCS8O/9kg92KxLvIFXuvmIH9LzoF6yzK
 CsSpoGeFUKqqZJs4T1hP6EueuFHLzpqeibCe237OrnVctV5oRa/rcL4ye
 XEjkmqh71xCGab9d9Y4fSDmuNyI0WgJHfnx0hG8bBxkf+SZAmmPjpG8Hy
 awk9I8eg1TD8dJvwVss6ruWXFyCfxrwqXteBIwKXwvyALHiR+ceZ7fNzk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="351489879"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="351489879"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 16:37:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="782053337"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="782053337"
Received: from lzhiguno-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.165])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 16:37:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <mrvl5amrsemu2nqk3btjxskligvhk5hdpm7c3uzqww23pyo6w6@d5riz6lr2w4r>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230627102223.260893-1-jani.nikula@intel.com>
 <20230627102223.260893-5-jani.nikula@intel.com>
 <mrvl5amrsemu2nqk3btjxskligvhk5hdpm7c3uzqww23pyo6w6@d5riz6lr2w4r>
Date: Wed, 28 Jun 2023 02:36:45 +0300
Message-ID: <87y1k4scj6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 4/5] fixup! drm/xe/display: Implement display
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 27 Jun 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Tue, Jun 27, 2023 at 01:22:22PM +0300, Jani Nikula wrote:
>>Add raw_reg_* accessors and use them.
>>
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>---
>> .../drm/xe/compat-i915-headers/intel_uncore.h | 24 +++++++++++++++++++
>> drivers/gpu/drm/xe/display/ext/i915_irq.c     | 15 ++----------
>> 2 files changed, 26 insertions(+), 13 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>>index 652654b5481d..a46dca558366 100644
>>--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>>+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>>@@ -140,4 +140,28 @@ static inline void intel_uncore_write_notrace(struct intel_uncore *uncore,
>> 	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
>> }
>>
>>+static inline void __iomem *intel_uncore_regs(struct intel_uncore *uncore)
>>+{
>>+	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
>>+
>>+	return xe_device_get_root_tile(xe)->mmio.regs;
>>+}
>>+
>>+/*
>>+ * The raw_reg_{read,write} macros are intended as a micro-optimization for
>>+ * interrupt handlers so that the pointer indirection on uncore->regs can
>>+ * be computed once (and presumably cached in a register) instead of generating
>>+ * extra load instructions for each MMIO access.
>>+ *
>>+ * Given that these macros are only intended for non-GSI interrupt registers
>>+ * (and the goal is to avoid extra instructions generated by the compiler),
>>+ * these macros do not account for uncore->gsi_offset.  Any caller that needs
>>+ * to use these macros on a GSI register is responsible for adding the
>>+ * appropriate GSI offset to the 'base' parameter.
>>+ */
>>+#define raw_reg_read(base, reg) \
>
> it's more a "map" rather than a "base". Currently it bypasses any
> forcewake, gsi and it's also hidden from tracing.
>
> As a micro-optimization I wonder if there are numbers anywhere to
> justify them.  As for the *move* being done here from
> xe/display/ext/i915_irq.c to xe/compat-i915-headers/intel_uncore.h, I'm
> ok with it. But why are we converting it to a macro rather than the
> inline function?  That would mean it also silently ignores any steering
> needed, adding to the list above of things ignored, since there is no
> type check anymore.

100% copy-paste from i915.

BR,
Jani.


>
> Lucas De Marchi
>
>>+	readl(base + i915_mmio_reg_offset(reg))
>>+#define raw_reg_write(base, reg, value) \
>>+	writel(value, base + i915_mmio_reg_offset(reg))
>>+
>> #endif /* __INTEL_UNCORE_H__ */
>>diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
>>index 6235ff9dec36..157403d1d8fe 100644
>>--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
>>+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
>>@@ -35,8 +35,10 @@
>> #include <drm/drm_drv.h>
>>
>> #include "i915_drv.h"
>>+#include "i915_irq.h"
>> #include "i915_reg.h"
>> #include "icl_dsi_regs.h"
>>+#include "intel_clock_gating.h"
>> #include "intel_display_trace.h"
>> #include "intel_display_types.h"
>> #include "intel_dp_aux.h"
>>@@ -48,19 +50,6 @@
>> #include "intel_psr_regs.h"
>> #include "intel_uncore.h"
>>
>>-static u32 raw_reg_read(void __iomem *base, i915_reg_t reg)
>>-{
>>-	return readl(base + reg.reg);
>>-}
>>-
>>-static void raw_reg_write(void __iomem *base, i915_reg_t reg, u32 value)
>>-{
>>-	writel(value, base + reg.reg);
>>-}
>>-
>>-#include "i915_irq.h"
>>-#include "intel_clock_gating.h"
>>-
>> static void gen3_irq_reset(struct xe_device *dev_priv, i915_reg_t imr,
>> 		    i915_reg_t iir, i915_reg_t ier)
>> {
>>-- 
>>2.39.2
>>

-- 
Jani Nikula, Intel Open Source Graphics Center
