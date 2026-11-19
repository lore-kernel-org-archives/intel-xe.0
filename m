Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3F3606A337
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 20:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pomdc2mR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B1810E1BF;
	Thu, 19 Nov 2026 20:50:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C05B10E765;
 Thu, 19 Nov 2026 20:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795121451; x=1826657451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j/CeAF/cROUhSY8CIL72uiuzna0pwwdPkpMDzBbqt4Y=;
 b=Pomdc2mRBgwFMl9m4c9VCC3zUcjvx7EkFGTZBG5QmylLZWtlZracTOPI
 bFyV7XfE1A93eDIAR0vJ9oSmNXo8h3SpQ5jMQNvUJ1SLgWnCOCvCpJj7O
 de3oV++GvIZWDP6NA0W+WbD6QwIOnRUuvaialWtjAb4sQAktiViqbxSJq
 /tAxrIg5ENhTAc1b6JnG4pVshpWVOEzQVUOFuZUmSv3zSzvFrIEcwf97O
 /ag9WV1UOKJYUZiWmAenNCvdfd0C777Y4GmSmpbbHakzF4LtOSRkRPuRD
 po6sqEtAIjDQ27UhyIvrA2HcdA1SWGPuSwZInDssoki4XJT6P6WpIzUL4 Q==;
X-CSE-ConnectionGUID: dkdA6xEtRUm0+WQ3orT0vQ==
X-CSE-MsgGUID: JjQ/HSfJR6Wuf7+bJhdNEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3884341"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3884341"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 12:50:50 -0800
X-CSE-ConnectionGUID: +vKX1EoUSiW/xJGVi4dhyw==
X-CSE-MsgGUID: E85+AWP0SjaCn4gdX6o7LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10524825"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 12:50:48 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 1/6] drm/i915/de: Uninline intel_de_{read,write}_fw()
Date: Thu, 19 Nov 2026 22:50:35 +0200
Message-ID: <20261119205040.31935-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119205040.31935-1-ville.syrjala@linux.intel.com>
References: <20261119205040.31935-1-ville.syrjala@linux.intel.com>
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

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c | 47 +++++++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_de.h | 26 ++------------
 2 files changed, 43 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index 08a0027e7930..799ca57bac65 100644
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

