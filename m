Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224CC606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 18:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nccsYYQl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C939610E144;
	Tue, 10 Nov 2026 18:46:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FEB10EE74;
 Tue, 10 Nov 2026 18:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794336409; x=1825872409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=id8Vg7BALHSSFZbCOnmAnbK9c9KmXI4Vd5mv0aXQZfc=;
 b=nccsYYQlAEL47jgDXnyj/FvBmSOmIWkwbvloyC6QKOWY7twhwnc/o4XG
 57t6H2Hj/KI38jt8tye8inrZBH9pG79Sg7zaoadqJMZYoMK6W6lcIpCVo
 9xiYSPKLoiPOoPrLI/y5MuMY1QAu815fjcNFUv11rf36Uz/gpWzqoc2UZ
 QGzRio0O3s3xCv6/P1Ca3yr1roZpoNNyPfrct+sHuxh2SeWetiXyoH8Sc
 /u4EZkLNa9US/udZUTq70Vrg9anHcy9a+Xl/rkO7qtqnM1YRhHjCFezX5
 8cRmlvTmCN5nNIVADupXK20ldHvXp6G0+mxQJE7h9ntfIyySnNxHgBJr8 Q==;
X-CSE-ConnectionGUID: s77kboETQB2GAwVgoEqVNA==
X-CSE-MsgGUID: 4CFDfYDdTmGLa5prOOLFcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2975309"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2975309"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:46:48 -0800
X-CSE-ConnectionGUID: e/nAtCU4Sc6vUHX5cDDBsw==
X-CSE-MsgGUID: OFhJxDM2SomT8HmJdLE4ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; d="scan'208";a="10007686"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:46:47 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 05/10] drm/i915/de: Introduce display->mmio.lock
Date: Tue, 10 Nov 2026 20:46:16 +0200
Message-ID: <20261110184622.1721-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110184622.1721-1-ville.syrjala@linux.intel.com>
References: <20261110184622.1721-1-ville.syrjala@linux.intel.com>
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

The driver_is_i915() anachromism will disappear when we
figure out how to enable the (upcoming) unclaimed register
detection for xe, ideally without relying on mmio.lock.

v2: Highlight the driver_is_i915() stuff (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_wm.c        |  9 +--
 drivers/gpu/drm/i915/display/intel_de.c       | 74 ++++++++++++++++++-
 .../gpu/drm/i915/display/intel_display_core.h |  9 +++
 drivers/gpu/drm/i915/display/intel_vblank.c   | 16 ++--
 4 files changed, 88 insertions(+), 20 deletions(-)

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
index 66de0d6be569..5a1ea696247c 100644
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
@@ -245,12 +288,35 @@ static const struct intel_mmio_funcs lnl_mmio_funcs = {
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
+	/*
+	 * TODO: enable unclaimed register detection
+	 * (ideally without the lock) for xe and get
+	 * rid of driver_is_i915().
+	 */
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

