Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9BC606AC0E
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 22:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nxctt2q4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D12210E27D;
	Wed,  4 Nov 2026 22:19:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9715A10FF73;
 Wed,  4 Nov 2026 22:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793830751; x=1825366751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/MbI0hI7PwBm2oWQmYdJWrTuCUe5A8tB19YxIZ2w/MI=;
 b=nxctt2q42FFNUWQkUV/FeKwJAJCOMEvMLpoaBPKjOpmsmXPEDEgMhoXj
 qbU/yEyCmE5gxC3E9jVC1SrrfqzBtNj/93nGp8GQV6MBVCYNB8h6cWRo+
 Q9hMyNpntXdajtfTfratxE8W/Lk2FbYGMYQWaJS2i8IpA3b8z3a6vkSg1
 gXa2DEuFieEyQdkJpaJygKVSm9JaK7V/eBm6T0sM/hUb+LGwbiITyIjsr
 cCKG5fnWhAuy5zU8qsGNhCv2p2BLJIkRFCAjqMKmAuezfQEi/F0FMPPCS
 DLVMckwr5xSQdqw33pydQyfWAHqR1WP6wac1kRtA9qtpceVtQ1mhi/fKa w==;
X-CSE-ConnectionGUID: i6x+4ZYdTguHKL5yhXURFQ==
X-CSE-MsgGUID: BQzJt/cKTfikyMn8qRj5Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2510044"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2510044"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 14:19:11 -0800
X-CSE-ConnectionGUID: U2ATj8mcTy2L+EjKqDg3xQ==
X-CSE-MsgGUID: ZCoSPT6dQIqvVFMfVlQBWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6994093"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 14:19:09 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/9] drm/i915/de: Introduce display->mmio.lock
Date: Thu,  5 Nov 2026 00:18:38 +0200
Message-ID: <20261104221842.18799-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
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

Introduce our own display specific mmio.lock, and wrap
the more expensive non-fw register accesses with it. And
everything that explicitly takes the uncore.lock currently,
switch over to mmio.lock as well.

This will preserve the same serialization behavior between
display registers as the uncore.lock is currently providing.
Once uncore.lock has actually been eliminated from display
registers (not the case yet) display vs. non-display
register accesses could happen in parallel. But that should
be fine since generally the registers for different hardware
units don't live on the same cacheline, so even concerns
about parallel accesses to the same cacheline potentially
hanging the machine (on IVB/HSW) should be assuaged.

Currently uncore.lock usage is limited to SNB+ on i915.
The xe driver, and older platforms on the i915 driver
don't use uncore.lock. Follow the same rule for the mmio.lock
initially.

With this we now end up with a double lock, or even a
triple lock due to i915's mmio debug lock. But we'll eliminate
the extra locks shortly. The end goal is either just mmio.lock
or no locks whatsoever. Well, ignoring the DMC wakelock stuff
that uses an additional lock as well.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_wm.c        |  9 ++-
 drivers/gpu/drm/i915/display/intel_de.c       | 69 +++++++++++++++++--
 .../gpu/drm/i915/display/intel_display_core.h |  9 +++
 drivers/gpu/drm/i915/display/intel_vblank.c   | 16 ++---
 4 files changed, 83 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index 0233f5053d95..46bfada7c060 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -1863,7 +1863,6 @@ static void vlv_atomic_update_fifo(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(crtc);
-	struct intel_uncore *uncore = to_intel_uncore(display->drm);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct vlv_fifo_state *fifo_state =
@@ -1884,15 +1883,15 @@ static void vlv_atomic_update_fifo(struct intel_atomic_state *state,
 	trace_vlv_fifo_size(crtc, sprite0_start, sprite1_start, fifo_size);
 
 	/*
-	 * uncore.lock serves a double purpose here. It allows us to
-	 * use the less expensive I915_{READ,WRITE}_FW() functions, and
+	 * display->mmio.lock serves a double purpose here. It allows us to
+	 * use the less expensive intel_de_{read,write}_fw() functions, and
 	 * it protects the DSPARB registers from getting clobbered by
 	 * parallel updates from multiple pipes.
 	 *
 	 * intel_pipe_update_start() has already disabled interrupts
 	 * for us, so a plain spin_lock() is sufficient here.
 	 */
-	spin_lock(&uncore->lock);
+	spin_lock(&display->mmio.lock);
 
 	switch (crtc->pipe) {
 	case PIPE_A:
@@ -1952,7 +1951,7 @@ static void vlv_atomic_update_fifo(struct intel_atomic_state *state,
 
 	intel_de_read_fw(display, DSPARB(display));
 
-	spin_unlock(&uncore->lock);
+	spin_unlock(&display->mmio.lock);
 }
 
 #undef VLV_FIFO
diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index 66de0d6be569..8b7a4e696ff9 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -164,6 +164,7 @@ u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
 }
 
 #define __MMIO_WAKELOCK		BIT(0)
+#define __MMIO_LOCK		BIT(1)
 
 static __always_inline void
 __mmio_wakelock_pre(struct intel_display *display, intel_reg_t reg,
@@ -181,16 +182,35 @@ __mmio_wakelock_post(struct intel_display *display, intel_reg_t reg,
 		intel_dmc_wl_put(display, reg);
 }
 
+static __always_inline void
+__mmio_lock_pre(struct intel_display *display, unsigned long *irqflags,
+		const unsigned int mmio_flags)
+{
+	if (mmio_flags & __MMIO_LOCK)
+		spin_lock_irqsave(&display->mmio.lock, *irqflags);
+}
+
+static __always_inline void
+__mmio_lock_post(struct intel_display *display, unsigned long irqflags,
+		 const unsigned int mmio_flags)
+{
+	if (mmio_flags & __MMIO_LOCK)
+		spin_unlock_irqrestore(&display->mmio.lock, irqflags);
+}
+
 static __always_inline u32
 __intel_de_read(struct intel_display *display, intel_reg_t reg,
 		const unsigned int mmio_flags)
 {
+	unsigned long irqflags;
 	u32 val;
 
 	__mmio_wakelock_pre(display, reg, mmio_flags);
+	__mmio_lock_pre(display, &irqflags, mmio_flags);
 
 	val = intel_uncore_read(__to_uncore(display), reg);
 
+	__mmio_lock_post(display, irqflags, mmio_flags);
 	__mmio_wakelock_post(display, reg, mmio_flags);
 
 	return val;
@@ -200,10 +220,14 @@ static __always_inline void
 __intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val,
 		 const unsigned int mmio_flags)
 {
+	unsigned long irqflags;
+
 	__mmio_wakelock_pre(display, reg, mmio_flags);
+	__mmio_lock_pre(display, &irqflags, mmio_flags);
 
 	intel_uncore_write(__to_uncore(display), reg, val);
 
+	__mmio_lock_post(display, irqflags, mmio_flags);
 	__mmio_wakelock_post(display, reg, mmio_flags);
 }
 
@@ -226,6 +250,25 @@ static const struct intel_mmio_funcs i9xx_mmio_funcs = {
 	.write = i9xx_mmio_write,
 };
 
+#define SNB_MMIO_FLAGS __MMIO_LOCK
+
+static u32 snb_mmio_read(struct intel_display *display, intel_reg_t reg)
+{
+	return __intel_de_read(display, reg, SNB_MMIO_FLAGS);
+}
+
+static void snb_mmio_write(struct intel_display *display, intel_reg_t reg, u32 val)
+{
+	__intel_de_write(display, reg, val, SNB_MMIO_FLAGS);
+}
+
+#undef SNB_MMIO_FLAGS
+
+static const struct intel_mmio_funcs snb_mmio_funcs = {
+	.read = snb_mmio_read,
+	.write = snb_mmio_write,
+};
+
 #define LNL_MMIO_FLAGS __MMIO_WAKELOCK
 
 static u32 lnl_mmio_read(struct intel_display *display, intel_reg_t reg)
@@ -245,12 +288,30 @@ static const struct intel_mmio_funcs lnl_mmio_funcs = {
 	.write = lnl_mmio_write,
 };
 
+static bool driver_is_i915(void)
+{
+#ifdef I915
+	return true;
+#else
+	return false;
+#endif
+}
+
 void intel_de_init(struct intel_display *display)
 {
 	display->mmio.uncore = to_intel_uncore(display->drm);
 
-	if (DISPLAY_VER(display) >= 20)
-		display->mmio.funcs = &lnl_mmio_funcs;
-	else
-		display->mmio.funcs = &i9xx_mmio_funcs;
+	spin_lock_init(&display->mmio.lock);
+
+	if (driver_is_i915()) {
+		if (DISPLAY_VER(display) >= 6)
+			display->mmio.funcs = &snb_mmio_funcs;
+		else
+			display->mmio.funcs = &i9xx_mmio_funcs;
+	} else {
+		if (DISPLAY_VER(display) >= 20)
+			display->mmio.funcs = &lnl_mmio_funcs;
+		else
+			display->mmio.funcs = &i9xx_mmio_funcs;
+	}
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index 3a48119f7890..aded2af8c92a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -533,6 +533,15 @@ struct intel_display {
 	} modeset;
 
 	struct {
+		/*
+		 * Simultaneous accesses to the same cacheline of
+		 * registers may hang IVB/HSW systems. This lock
+		 * serializes all display register accesses done
+		 * using intel_de_{read,write}(), but not those
+		 * done using intel_de_{read,write}_fw().
+		 */
+		spinlock_t lock;
+
 		struct intel_uncore *uncore;
 		const struct intel_mmio_funcs *funcs;
 	} mmio;
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 1d4753605675..fc9d1e14ec87 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -281,10 +281,6 @@ static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
 }
 
 /*
- * The uncore version of the spin lock functions is used to decide
- * whether we need to lock the uncore lock or not.  This is only
- * needed in i915, not in Xe.
- *
  * This lock in i915 is needed because some old platforms (at least
  * IVB and possibly HSW as well), which are not supported in Xe, need
  * all register accesses to the same cacheline to be serialized,
@@ -292,17 +288,15 @@ static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
  */
 #ifdef I915
 static void intel_vblank_section_enter(struct intel_display *display)
-	__acquires(uncore->lock)
+	__acquires(display->mmio.lock)
 {
-	struct intel_uncore *uncore = to_intel_uncore(display->drm);
-	spin_lock(&uncore->lock);
+	spin_lock(&display->mmio.lock);
 }
 
 static void intel_vblank_section_exit(struct intel_display *display)
-	__releases(uncore->lock)
+	__releases(display->mmio.lock)
 {
-	struct intel_uncore *uncore = to_intel_uncore(display->drm);
-	spin_unlock(&uncore->lock);
+	spin_unlock(&display->mmio.lock);
 }
 #else
 static void intel_vblank_section_enter(struct intel_display *display)
@@ -550,7 +544,7 @@ void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
 	 * consistent state during fastset seamless refresh rate changes.
 	 *
 	 * vblank_time_lock takes care of all drm_vblank.c stuff, and
-	 * uncore.lock takes care of __intel_get_crtc_scanline() which
+	 * display->mmio.lock takes care of __intel_get_crtc_scanline() which
 	 * may get called elsewhere as well.
 	 *
 	 * TODO maybe just protect everything (including
-- 
2.56.0

