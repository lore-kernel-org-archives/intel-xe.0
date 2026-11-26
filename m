Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EA9606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 21:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nCnfRYk6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FACE11271E;
	Thu, 26 Nov 2026 21:27:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E5B112724;
 Thu, 26 Nov 2026 21:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795728472; x=1827264472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MWWHMu5+rgSRYFVtl1Rz318I3iD3YeioQO2b42lLsec=;
 b=nCnfRYk64lCUQzyKNvA2lgurI6j24Rk2yBI92j/GRbr/Vu/COkMEVvFw
 bNfskLZXwBKG2qVRiWZy6hAnqSRlvB2462STzNXbWbA/Z89w6EN2iv7Kk
 XblZTDMtoLR0J/EZrhfiCb1fO2Lh5mWuuYoq/e2c7ribvUupyl8TDQ0GM
 ZYizXc/ia4mV0zx20kvt8a+Vb4mIbKLawL+9i+82rpzTXsENBZIHybGYs
 RN13PGW6f1tAXVRZCY2G0xNpALvsPy76+KSF5GgQD+3IFORQqAvWOQy3+
 jigJazfoaKFI6FGTO9O5dOIAYb0e4FWHp/ymFRZrRQxuoenRknAygFVAS A==;
X-CSE-ConnectionGUID: acCQpQ6ETsKzVctvV8ArTQ==
X-CSE-MsgGUID: 0FRnuKYkSKiIpPNVQWFGdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4537098"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4537098"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 13:27:52 -0800
X-CSE-ConnectionGUID: QHPCy3c1Q6u/yJFb8919qQ==
X-CSE-MsgGUID: MGmDsWxGTQO8tbUTAoRHqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="13933833"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 13:27:51 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/7] drm/i915/de: Use raw readl()/writel()/etc for register
 access in display
Date: Thu, 26 Nov 2026 23:27:25 +0200
Message-ID: <20261126212728.9034-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
References: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Eliminate the remaining intel_uncore_{read,write}*() usage
from the display code by implementing the MMIO accessors
directly with readl()/writel()/etc. The one remaining
i915 vs. xe uncore ifdef will be dealt with shortly.

This also eliminates the extra function call step
on xe (due to xe_mmio_read32() being a real function).
And all the runtime checks inside xe_mmio_read32()
we don't need are gone as well of course. So perhaps
this is marginally faster as well.

On i915 we now skip the pointless runtime gsi_offset
handling. Otherwise the i915 _fw() stuff was already
a thin wrapper around readl()/writel()/etc.

The one slightly annoying thing is that we have to
implement the LNL posted write flush workaround
15015404425 as well. Otherwise we could risk non-posted
reads jumping ahead of posted writes already in the
queue.

The LNL issue doesn't seem to be super easy to hit, but
I did confirm that it's real by writing and reading
the same register in a tight loop and verifying the read
gets back the same value that was written. IIRC it took
about 15 minutes to get the first failure. I also double
checked MTL and PTL using the same test, just to be sure
it really is limited to LNL, and looks like that is
indeed the case.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c       | 89 ++++++++++++++++---
 .../gpu/drm/i915/display/intel_display_core.h |  3 +-
 2 files changed, 76 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index 658380cb8973..f02df9be3807 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -13,11 +13,6 @@
 #include "intel_display_trace.h"
 #include "intel_uncore.h"
 
-static inline struct intel_uncore *__to_uncore(struct intel_display *display)
-{
-	return display->mmio.uncore;
-}
-
 static int intel_de_wait_for_register(struct intel_display *display,
 				      intel_reg_t reg, u32 mask, u32 value,
 				      unsigned int timeout_us,
@@ -149,6 +144,12 @@ int intel_de_wait_for_clear_ms(struct intel_display *display, intel_reg_t reg,
 	return intel_de_wait_ms(display, reg, mask, 0, timeout_ms, NULL);
 }
 
+static __always_inline void __iomem *
+__intel_de_mmio_for_reg(struct intel_display *display, intel_reg_t reg)
+{
+	return display->mmio.regs + intel_reg_offset(reg);
+}
+
 u8 intel_de_read8(struct intel_display *display, intel_reg_t reg)
 {
 	u8 val;
@@ -156,7 +157,7 @@ u8 intel_de_read8(struct intel_display *display, intel_reg_t reg)
 	/* this is only used on VGA registers (possible on pre-g4x) */
 	drm_WARN_ON(display->drm, DISPLAY_VER(display) >= 5 || display->platform.g4x);
 
-	val = intel_uncore_read8(__to_uncore(display), reg);
+	val = readb(__intel_de_mmio_for_reg(display, reg));
 	trace_intel_reg_rw(false, reg, val, sizeof(val));
 
 	return val;
@@ -167,7 +168,7 @@ void intel_de_write8(struct intel_display *display, intel_reg_t reg, u8 val)
 	drm_WARN_ON(display->drm, DISPLAY_VER(display) >= 5 || display->platform.g4x);
 
 	trace_intel_reg_rw(true, reg, val, sizeof(val));
-	intel_uncore_write8(__to_uncore(display), reg, val);
+	writeb(val, __intel_de_mmio_for_reg(display, reg));
 }
 
 u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
@@ -177,7 +178,7 @@ u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
 	/* this is only used on MCHBAR registers on pre-SNB */
 	drm_WARN_ON(display->drm, DISPLAY_VER(display) >= 6);
 
-	val = intel_uncore_read16(__to_uncore(display), reg);
+	val = readw(__intel_de_mmio_for_reg(display, reg));
 	trace_intel_reg_rw(false, reg, val, sizeof(val));
 
 	return val;
@@ -188,7 +189,7 @@ __intel_de_read_fw(struct intel_display *display, intel_reg_t reg)
 {
 	u32 val;
 
-	val = intel_uncore_read_fw(__to_uncore(display), reg);
+	val = readl(__intel_de_mmio_for_reg(display, reg));
 	trace_intel_reg_rw(false, reg, val, sizeof(val));
 
 	return val;
@@ -198,7 +199,7 @@ static __always_inline void
 __intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u32 val)
 {
 	trace_intel_reg_rw(true, reg, val, sizeof(val));
-	intel_uncore_write_fw(__to_uncore(display), reg, val);
+	writel(val, __intel_de_mmio_for_reg(display, reg));
 }
 
 void intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u32 val)
@@ -316,6 +317,7 @@ bool intel_de_arm_unclaimed_mmio_detection(struct intel_display *display)
 #define __MMIO_WAKELOCK		BIT(0)
 #define __MMIO_LOCK		BIT(1)
 #define __MMIO_UNCLAIMED	BIT(2)
+#define __MMIO_READ_AFTER_WRITE_WA	BIT(3)
 
 static __always_inline void
 __mmio_wakelock_pre(struct intel_display *display, intel_reg_t reg,
@@ -375,6 +377,30 @@ __mmio_unclaimed_post(struct intel_display *display, intel_reg_t reg,
 		check_unclaimed_mmio_post(display, reg, write);
 }
 
+static __always_inline void
+__mmio_read_after_write_wa(struct intel_display *display,
+			   const unsigned int mmio_flags)
+{
+#define DUMMY_REG _MMIO(0x130030)
+	if (mmio_flags & __MMIO_READ_AFTER_WRITE_WA) {
+		void __iomem *dummy = __intel_de_mmio_for_reg(display, DUMMY_REG);
+
+		/*
+		 * w/a 15015404425
+		 *
+		 * Non-posted reads may incorrectly overtake posted
+		 * writes in the queue. Flush the real writes out
+		 * from the queue with four dummy writes so that
+		 * the read cannot overtake any real writes.
+		 */
+		writel(0, dummy);
+		writel(0, dummy);
+		writel(0, dummy);
+		writel(0, dummy);
+	}
+#undef DUMMY_REG
+}
+
 static __always_inline u32
 __intel_de_read(struct intel_display *display, intel_reg_t reg,
 		const unsigned int mmio_flags)
@@ -390,6 +416,8 @@ __intel_de_read(struct intel_display *display, intel_reg_t reg,
 	__mmio_unclaimed_pre(display, reg, false,
 			     mmio_debug_is_enabled, mmio_flags);
 
+	__mmio_read_after_write_wa(display, mmio_flags);
+
 	val = __intel_de_read_fw(display, reg);
 
 	__mmio_unclaimed_post(display, reg, false,
@@ -518,7 +546,14 @@ static const struct intel_mmio_funcs tgl_mmio_funcs = {
 	.check_for_unclaimed_mmio = hsw_check_for_unclaimed_mmio,
 };
 
-#define LNL_MMIO_FLAGS __MMIO_WAKELOCK
+#define LNL_MMIO_FLAGS (__MMIO_WAKELOCK | __MMIO_READ_AFTER_WRITE_WA)
+
+static u32 lnl_mmio_read_fw(struct intel_display *display, intel_reg_t reg)
+{
+	__mmio_read_after_write_wa(display, LNL_MMIO_FLAGS);
+
+	return __intel_de_read_fw(display, reg);
+}
 
 static u32 lnl_mmio_read(struct intel_display *display, intel_reg_t reg)
 {
@@ -533,11 +568,31 @@ static void lnl_mmio_write(struct intel_display *display, intel_reg_t reg, u32 v
 #undef LNL_MMIO_FLAGS
 
 static const struct intel_mmio_funcs lnl_mmio_funcs = {
-	.read_fw = i9xx_mmio_read_fw,
+	.read_fw = lnl_mmio_read_fw,
 	.read = lnl_mmio_read,
 	.write = lnl_mmio_write,
 };
 
+#define PTL_MMIO_FLAGS __MMIO_WAKELOCK
+
+static u32 ptl_mmio_read(struct intel_display *display, intel_reg_t reg)
+{
+	return __intel_de_read(display, reg, PTL_MMIO_FLAGS);
+}
+
+static void ptl_mmio_write(struct intel_display *display, intel_reg_t reg, u32 val)
+{
+	__intel_de_write(display, reg, val, PTL_MMIO_FLAGS);
+}
+
+#undef PTL_MMIO_FLAGS
+
+static const struct intel_mmio_funcs ptl_mmio_funcs = {
+	.read_fw = i9xx_mmio_read_fw,
+	.read = ptl_mmio_read,
+	.write = ptl_mmio_write,
+};
+
 static bool driver_is_i915(void)
 {
 #ifdef I915
@@ -549,7 +604,11 @@ static bool driver_is_i915(void)
 
 void intel_de_init(struct intel_display *display)
 {
-	display->mmio.uncore = to_intel_uncore(display->drm);
+#ifdef I915
+	display->mmio.regs = to_intel_uncore(display->drm)->regs;
+#else
+	display->mmio.regs = __compat_uncore_to_mmio(to_intel_uncore(display->drm))->regs;
+#endif
 
 	spin_lock_init(&display->mmio.lock);
 
@@ -571,7 +630,9 @@ void intel_de_init(struct intel_display *display)
 		else
 			display->mmio.funcs = &i9xx_mmio_funcs;
 	} else {
-		if (DISPLAY_VER(display) >= 20)
+		if (DISPLAY_VER(display) >= 30)
+			display->mmio.funcs = &ptl_mmio_funcs;
+		else if (DISPLAY_VER(display) >= 20)
 			display->mmio.funcs = &lnl_mmio_funcs;
 		else
 			display->mmio.funcs = &i9xx_mmio_funcs;
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index b422d24e21b2..99fda50b0d1f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -52,7 +52,6 @@ struct intel_initial_plane_config;
 struct intel_mmio_funcs;
 struct intel_opregion;
 struct intel_overlay;
-struct intel_uncore;
 struct task_struct;
 
 /* Amount of SAGV/QGV points, BSpec precisely defines this */
@@ -542,7 +541,7 @@ struct intel_display {
 		 */
 		spinlock_t lock;
 
-		struct intel_uncore *uncore;
+		void __iomem *regs;
 		const struct intel_mmio_funcs *funcs;
 
 		/*
-- 
2.56.1

