Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C30606A331
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=niFBTo/p
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC6111255C;
	Fri, 13 Nov 2026 13:44:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B5C11255C;
 Fri, 13 Nov 2026 13:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794577443; x=1826113443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kYHJyDIRPX6geMbnmXHPIG8ByyD+a/krxFxFQdw/i7k=;
 b=niFBTo/pEby/hE3WmToHb09R7aMkeQHnR0gK+p+TF9KNKVD8VDESQygI
 PcIMSsH5EmWBn8iHKr8kUq+OdzRaLo3xL45iqoeCm7Hya8jZK3vJYJvTT
 rvSSRRaRLGEhAH5nkmPXQxxPeZc4ghaTMVonomAsMHV7ocz70svG+Egl3
 USE6lRvwZ7GC4tKKMnGrphCMSE7LC49/ftJ2VP+QZphJvjmjbxYqs/XF6
 OGdi6t7MSkKMTSKiNT4IksfBnegBCdPe0Ey3xErJqALJH+1KgmuXZ9qS8
 bffiuVPJgCIvu0gDtyQkpKF36ulb1CmB8QZZP4e7EOHcNHfAWwcGpIyTr A==;
X-CSE-ConnectionGUID: ptb+XncXQKSFK7EHqKEfdw==
X-CSE-MsgGUID: DdkmicEYSZW5e1CvMhJFFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3382523"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3382523"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:44:03 -0800
X-CSE-ConnectionGUID: exHZ/6lfSui8DECY/XpfIQ==
X-CSE-MsgGUID: hG9iWMd/SXOJPs+tTFP9mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9345273"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:44:03 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/8] drm/i915/de: Uninline intel_de_{read,write}_fw()
Date: Fri, 13 Nov 2026 15:43:48 +0200
Message-ID: <20261113134355.14579-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
References: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

One might think that inlining intel_de_{read,write}_fw() would
be a good idea for performance reasons, and if these were just
the raw readl()/writel() then that would be true. But they
also contain the tracepoint, which actually translates to
surprising amount of code. The register accessors are used in
so many places that the extra code really adds up.

So making these non-inline functions seems like the better
choice here. This also lets the compiler again combine the
dsb vs. not branches from multiple back to back
intel_de_write_dsb() calls into a single branch. The
inlined tracepoint bloated the code so much that the
compiler generally just gave up on that, emitting funkier
code as a result.

I do want the inline versions inside intel_de.c to keep
the overhead minimal inside the vfuncs. gcc refuses to
inline any of these on its own for whatever reason.

Note that for xe we are now doing two function calls for
each of these since xe_mmio_{read,write}32() are also real
non-inline functions. But once we get rid of the uncore
stuff completely xe will again lose the second level of
function calls.

This shrinks the final i915.ko by 800 KiB without lockdep,
and 1200 KiB with lockdep enabled.

bloat-o-meter highlights:
add/remove: 25/34 grow/shrink: 30/150 up/down: 208667/-253907 (-45240)
Function                                     old     new   delta
...
do_gmbus_xfer                               2342    1392    -950
skl_write_plane_wm                          2199    1212    -987
skl_plane_update_arm                        1997     976   -1021
ilk_update_pipe_csc                         1752     723   -1029
i9xx_plane_update_arm                       1670     621   -1049
chv_load_luts                               2043     912   -1131
vlv_atomic_update_fifo                      2177     895   -1282
icl_color_commit_noarm                      2329     931   -1398
g4x_sprite_update_arm                       2138     737   -1401
ilk_read_pipe_csc                           1807     337   -1470
icl_read_csc                                1987     439   -1548
ivb_sprite_update_arm                       2324     730   -1594
i9xx_cursor_update_arm                      4513    2817   -1696
gen8_de_irq_handler                         5037    2816   -2221
vlv_sprite_update_arm                       4627    1225   -3402
icl_plane_update_noarm                      7885    3143   -4742
Total: Before=39595300, After=39550060, chg -0.11%

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c | 47 +++++++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_de.h | 26 ++------------
 2 files changed, 43 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index 9ca5b27eb768..8a94f3f1d3ee 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -10,6 +10,13 @@
 #include "intel_de.h"
 #include "intel_display_regs.h"
 #include "intel_display_rpm.h"
+#include "intel_uncore.h"
+#include "intel_uncore_trace.h"
+
+static inline struct intel_uncore *__to_uncore(struct intel_display *display)
+{
+	return display->mmio.uncore;
+}
 
 static int intel_de_wait_for_register(struct intel_display *display,
 				      intel_reg_t reg, u32 mask, u32 value,
@@ -165,11 +172,39 @@ u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
 	return intel_uncore_read16(__to_uncore(display), reg);
 }
 
+static __always_inline u32
+__intel_de_read_fw(struct intel_display *display, intel_reg_t reg)
+{
+	u32 val;
+
+	val = intel_uncore_read_fw(__to_uncore(display), reg);
+	trace_i915_reg_rw(false, reg, val, sizeof(val), true);
+
+	return val;
+}
+
+static __always_inline void
+__intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u32 val)
+{
+	trace_i915_reg_rw(true, reg, val, sizeof(val), true);
+	intel_uncore_write_fw(__to_uncore(display), reg, val);
+}
+
+u32 intel_de_read_fw(struct intel_display *display, intel_reg_t reg)
+{
+	return __intel_de_read_fw(display, reg);
+}
+
+void intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u32 val)
+{
+	__intel_de_write_fw(display, reg, val);
+}
+
 static bool hsw_check_for_unclaimed_mmio(struct intel_display *display)
 {
 	u32 dbg;
 
-	dbg = intel_de_read_fw(display, FPGA_DBG);
+	dbg = __intel_de_read_fw(display, FPGA_DBG);
 	if (likely(!(dbg & FPGA_DBG_RM_NOCLAIM)))
 		return false;
 
@@ -189,7 +224,7 @@ static bool hsw_check_for_unclaimed_mmio(struct intel_display *display)
 		drm_err(display->drm,
 			"Lost access to MMIO BAR; all registers now read back as 0xFFFFFFFF!\n");
 
-	intel_de_write_fw(display, FPGA_DBG, FPGA_DBG_RM_NOCLAIM);
+	__intel_de_write_fw(display, FPGA_DBG, FPGA_DBG_RM_NOCLAIM);
 
 	return true;
 }
@@ -198,11 +233,11 @@ static bool vlv_check_for_unclaimed_mmio(struct intel_display *display)
 {
 	u32 cer;
 
-	cer = intel_de_read_fw(display, CLAIM_ER);
+	cer = __intel_de_read_fw(display, CLAIM_ER);
 	if (likely(!(cer & (CLAIM_ER_OVERFLOW | CLAIM_ER_CTR_MASK))))
 		return false;
 
-	intel_de_write_fw(display, CLAIM_ER, CLAIM_ER_CLR);
+	__intel_de_write_fw(display, CLAIM_ER, CLAIM_ER_CLR);
 
 	return true;
 }
@@ -348,7 +383,7 @@ __intel_de_read(struct intel_display *display, intel_reg_t reg,
 	__mmio_lock_pre(display, &irqflags, mmio_flags);
 	__mmio_unclaimed_pre(display, reg, false, mmio_flags);
 
-	val = intel_de_read_fw(display, reg);
+	val = __intel_de_read_fw(display, reg);
 
 	__mmio_unclaimed_post(display, reg, false, mmio_flags);
 	__mmio_lock_post(display, irqflags, mmio_flags);
@@ -369,7 +404,7 @@ __intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val,
 	__mmio_lock_pre(display, &irqflags, mmio_flags);
 	__mmio_unclaimed_pre(display, reg, true, mmio_flags);
 
-	intel_de_write_fw(display, reg, val);
+	__intel_de_write_fw(display, reg, val);
 
 	__mmio_unclaimed_post(display, reg, true, mmio_flags);
 	__mmio_lock_post(display, irqflags, mmio_flags);
diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 310f81edc09d..a6dcb91b36f2 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -8,8 +8,6 @@
 
 #include "intel_display_core.h"
 #include "intel_dsb.h"
-#include "intel_uncore.h"
-#include "intel_uncore_trace.h"
 
 struct intel_mmio_funcs {
 	u32 (*read)(struct intel_display *display, intel_reg_t reg);
@@ -17,11 +15,6 @@ struct intel_mmio_funcs {
 	bool (*check_for_unclaimed_mmio)(struct intel_display *display);
 };
 
-static inline struct intel_uncore *__to_uncore(struct intel_display *display)
-{
-	return display->mmio.uncore;
-}
-
 void intel_de_init(struct intel_display *display);
 bool intel_de_unclaimed_mmio_detected(struct intel_display *display);
 bool intel_de_arm_unclaimed_mmio_detection(struct intel_display *display);
@@ -101,23 +94,8 @@ int intel_de_wait_for_clear_ms(struct intel_display *display, intel_reg_t reg,
  * therefore generally be serialised, by either the dev_priv->uncore.lock or
  * a more localised lock guarding all access to that bank of registers.
  */
-static inline u32
-intel_de_read_fw(struct intel_display *display, intel_reg_t reg)
-{
-	u32 val;
-
-	val = intel_uncore_read_fw(__to_uncore(display), reg);
-	trace_i915_reg_rw(false, reg, val, sizeof(val), true);
-
-	return val;
-}
-
-static inline void
-intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u32 val)
-{
-	trace_i915_reg_rw(true, reg, val, sizeof(val), true);
-	intel_uncore_write_fw(__to_uncore(display), reg, val);
-}
+u32 intel_de_read_fw(struct intel_display *display, intel_reg_t reg);
+void intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u32 val);
 
 static inline u32
 intel_de_rmw_fw(struct intel_display *display, intel_reg_t reg, u32 clear, u32 set)
-- 
2.56.0

