Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B99606A330
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 13:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ga/+d8Kn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98ACC112580;
	Fri, 13 Nov 2026 13:44:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361F411257C;
 Fri, 13 Nov 2026 13:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794577455; x=1826113455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uknnxXq93gt3tcchp8bpbntntOFhqkuo4KYdDj/cvGU=;
 b=Ga/+d8KnijVinkgPgNIbuBEdrQU8/hvVlNjUsjexa22Vy42/vX3jVx4/
 EQ1atIBqmQg9FB7yvtk3KZJycDOZBdXKF4ttwe6epxy/lFh9atp2msBEK
 cYT/jcxdpDAkoZomq2R7QUs+Px7bjBd3e9oUxFFYyg3oUlx/UyzL2rsNW
 q6IkhHNWYHcNs7QNTo9gN3/fFqRZBICO3cc9Z3X0MZTEv2fa78DVU9rzv
 FA5EVwqFHmMMXPzN/32DusYZ59/Mt3n6uyQiGarMHbdzzQf3LIyDUjpD+
 EFNlnnjAnQcgsZEX/lEPDmV6LVXT17wEMbv9hfdB8t6XbM5Qq5rtJ5ye2 w==;
X-CSE-ConnectionGUID: EZUhli+tRqS84ang2OE3AQ==
X-CSE-MsgGUID: GCINFub5TVKi79a/ljnozA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3391329"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3391329"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:44:14 -0800
X-CSE-ConnectionGUID: Ag5E8WtwQqOyKMAGzpJAvQ==
X-CSE-MsgGUID: yTVo9wcgTJeYRNwHWsfCWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9245468"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:44:14 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/8] drm/i915/de: Make mmio_debug lockless
Date: Fri, 13 Nov 2026 15:43:51 +0200
Message-ID: <20261113134355.14579-5-ville.syrjala@linux.intel.com>
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

Currently we protect the mmio_debug state using mmio.lock.
We can't just drop the locks or we risk the read-modify-writes
to the modparam to get out of whack. But if we get rid of the
read-modify-writes and just switch to simple booleans all
we need are loads and stores which are naturally atomic.

This is of course racy, but quite harmlessly so. Perhaps the
worst thing that can happen is that we mistake which register
caused the unclaimed access, but that can already happen since
we use the completely lockless intel_de_{read,write}_fw() in
many places. And a pair of threads getting a bit confused
about the state of the booleans should also be harmless. Perhaps
we end up doing a few extra unclaimed mmio debug checks while the
first thread is already about to disable the thing. No big deal.

And for good measure, let's annotate the booleans with
READ_ONCE()/WRITE_ONCE() to highlight the lockless nature,
though I don't think we need those for correctness.

With the booleans we do lose the capability to set mmio_debug
to a specific value, and then automagically disable it once
that many unclaimed register accesses have been detected.
With the boolean it's mmio_debug all the time or none of
the time. Not sure if anyone actually used that feature
anyway, so doesn't seem like a big loss to me.

I do want to preserve the oneshot detection thing automagically
armed by intel_de_arm_unclaimed_mmio_detection(). So we need a
second boolean for that.

And the third boolean will be mmio.unclaimed_mmio_check. That
was already effectively a boolean, but still being adjusted
with rmw.

The FPGA_DBG/CLAIM_ER accesses done from the read/write vfuncs
will still be conditionally protected by the mmio.lock, based
on mmio_flags. But the accesses from intel_de_unclaimed_mmio_detected()
and intel_de_arm_unclaimed_mmio_detection() need another
solution. For that I'm just adding another boolean into the
mmio funcs that tells us whether the lock should be taken
there or not. Calls to these functions are exceedingly rare
so no need to come up with any clever solution here.

Note that the modparam will now refuse any non-0/1 value, so
if anyone has left this enabled accidentally the module will
fail to load. But reminding people to turn this off in
production is probably a good thing :P

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/Kconfig.debug            |  2 +-
 drivers/gpu/drm/i915/display/intel_de.c       | 58 +++++++++----------
 drivers/gpu/drm/i915/display/intel_de.h       |  1 +
 .../gpu/drm/i915/display/intel_display_core.h |  7 +--
 .../drm/i915/display/intel_display_params.c   |  4 +-
 .../drm/i915/display/intel_display_params.h   |  2 +-
 6 files changed, 34 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index dc43dcfbadb6..6a020adc43ee 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -76,7 +76,7 @@ config DRM_I915_DEBUG_MMIO
 	help
 	  By default, always enables the extra sanity checks (extra register
 	  reads) around every mmio (register) access that will slow the system
-	  down. This sets the default value of i915.mmio_debug to -1 and can
+	  down. This sets the default value of i915.mmio_debug to Y and can
 	  be overridden at module load.
 
 	  Recommended for driver developers only.
diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index 06d91570bee2..5a74cf173cb8 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -242,12 +242,16 @@ static bool vlv_check_for_unclaimed_mmio(struct intel_display *display)
 	return true;
 }
 
+static bool mmio_debug_is_enabled(struct intel_display *display)
+{
+	return READ_ONCE(display->params.mmio_debug) ||
+		READ_ONCE(display->mmio.mmio_debug_oneshot);
+}
+
 static void check_unclaimed_mmio_pre(struct intel_display *display,
 				     intel_reg_t reg, bool write)
 {
-	lockdep_assert_held(&display->mmio.lock);
-
-	if (!display->params.mmio_debug)
+	if (!mmio_debug_is_enabled(display))
 		return;
 
 	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
@@ -262,9 +266,7 @@ static void check_unclaimed_mmio_pre(struct intel_display *display,
 static void check_unclaimed_mmio_post(struct intel_display *display,
 				      intel_reg_t reg, bool write)
 {
-	lockdep_assert_held(&display->mmio.lock);
-
-	if (!display->params.mmio_debug)
+	if (!mmio_debug_is_enabled(display))
 		return;
 
 	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
@@ -275,8 +277,7 @@ static void check_unclaimed_mmio_post(struct intel_display *display,
 		 write ? "write to" : "read from",
 		 i915_mmio_reg_offset(reg));
 
-	/* Only report the first N failures */
-	display->params.mmio_debug--;
+	WRITE_ONCE(display->mmio.mmio_debug_oneshot, false);
 }
 
 bool intel_de_unclaimed_mmio_detected(struct intel_display *display)
@@ -286,43 +287,36 @@ bool intel_de_unclaimed_mmio_detected(struct intel_display *display)
 	if (!display->mmio.funcs->check_for_unclaimed_mmio)
 		return false;
 
-	spin_lock_irq(&display->mmio.lock);
-	ret = display->mmio.funcs->check_for_unclaimed_mmio(display);
-	spin_unlock_irq(&display->mmio.lock);
+	if (display->mmio.funcs->check_for_unclaimed_mmio_needs_lock) {
+		spin_lock_irq(&display->mmio.lock);
+		ret = display->mmio.funcs->check_for_unclaimed_mmio(display);
+		spin_unlock_irq(&display->mmio.lock);
+	} else {
+		ret = display->mmio.funcs->check_for_unclaimed_mmio(display);
+	}
 
 	return ret;
 }
 
 bool intel_de_arm_unclaimed_mmio_detection(struct intel_display *display)
 {
-	bool ret = false;
-
-	if (!display->mmio.funcs->check_for_unclaimed_mmio)
+	if (!READ_ONCE(display->mmio.unclaimed_mmio_check))
 		return false;
 
-	spin_lock_irq(&display->mmio.lock);
-
-	if (display->mmio.unclaimed_mmio_check <= 0)
-		goto out;
-
-	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
-		goto out;
+	if (!intel_de_unclaimed_mmio_detected(display))
+		return false;
 
-	if (!display->params.mmio_debug) {
+	if (!READ_ONCE(display->params.mmio_debug)) {
 		drm_dbg_kms(display->drm,
 			    "Unclaimed register detected, "
 			    "enabling oneshot unclaimed register reporting. "
-			    "Please use i915.mmio_debug=N for more information.\n");
-		display->params.mmio_debug++;
+			    "Please use i915.mmio_debug=Y for more information.\n");
+		WRITE_ONCE(display->mmio.mmio_debug_oneshot, true);
 	}
 
-	display->mmio.unclaimed_mmio_check--;
-	ret = true;
+	WRITE_ONCE(display->mmio.unclaimed_mmio_check, false);
 
-out:
-	spin_unlock_irq(&display->mmio.lock);
-
-	return ret;
+	return true;
 }
 
 #define __MMIO_WAKELOCK		BIT(0)
@@ -474,12 +468,14 @@ static const struct intel_mmio_funcs hsw_mmio_funcs = {
 	.read = hsw_mmio_read,
 	.write = hsw_mmio_write,
 	.check_for_unclaimed_mmio = hsw_check_for_unclaimed_mmio,
+	.check_for_unclaimed_mmio_needs_lock = true,
 };
 
 static const struct intel_mmio_funcs vlv_mmio_funcs = {
 	.read = hsw_mmio_read,
 	.write = hsw_mmio_write,
 	.check_for_unclaimed_mmio = vlv_check_for_unclaimed_mmio,
+	.check_for_unclaimed_mmio_needs_lock = true,
 };
 
 #define LNL_MMIO_FLAGS __MMIO_WAKELOCK
@@ -539,7 +535,7 @@ void intel_de_init(struct intel_display *display)
 	}
 
 	if (display->mmio.funcs->check_for_unclaimed_mmio)
-		display->mmio.unclaimed_mmio_check = 1;
+		WRITE_ONCE(display->mmio.unclaimed_mmio_check, true);
 
 	/* clear out unclaimed reg detection bit someone else left behind */
 	if (intel_de_unclaimed_mmio_detected(display))
diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 2c469a2d6a20..cbf44975dced 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -13,6 +13,7 @@ struct intel_mmio_funcs {
 	u32 (*read)(struct intel_display *display, intel_reg_t reg);
 	void (*write)(struct intel_display *display, intel_reg_t reg, u32 val);
 	bool (*check_for_unclaimed_mmio)(struct intel_display *display);
+	bool check_for_unclaimed_mmio_needs_lock;
 };
 
 void intel_de_init(struct intel_display *display);
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index d68ecc19b8a8..92a3ce4247b1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -539,17 +539,14 @@ struct intel_display {
 		 * serializes all display register accesses done
 		 * using intel_de_{read,write}(), but not those
 		 * done using intel_de_{read,write}_fw().
-		 *
-		 * The lock also protects mmio.unclaimed_mmio_check
-		 * and read-modify-write of display->params.mmio_debug.
 		 */
 		spinlock_t lock;
 
 		struct intel_uncore *uncore;
 		const struct intel_mmio_funcs *funcs;
 
-		/* protected by mmio.lock */
-		int unclaimed_mmio_check;
+		bool mmio_debug_oneshot;
+		bool unclaimed_mmio_check;
 	} mmio;
 
 	struct {
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
index ace3081461de..7ef974861c8e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.c
+++ b/drivers/gpu/drm/i915/display/intel_display_params.c
@@ -143,8 +143,8 @@ intel_display_param_named_unsafe(enable_dmc_wl, int, 0400,
 	"(-1=use per-chip default, 0=disabled, 1=enabled, 2=match any register, 3=always locked) "
 	"Default: -1");
 
-intel_display_param_named(mmio_debug, int, 0400,
-	"Enable the MMIO debug code for the first N failures (default: off). "
+intel_display_param_named(mmio_debug, bool, 0400,
+	"Enable MMIO debug code (default: false). "
 	"This may negatively affect performance.");
 
 __maybe_unused
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index bcbca95318d6..f6b9c294840c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -51,7 +51,7 @@ struct drm_printer;
 	param(bool, psr_safest_params, false, 0400) \
 	param(bool, enable_psr2_sel_fetch, true, 0400) \
 	param(int, enable_dmc_wl, -1, 0400) \
-	param(int, mmio_debug, -IS_ENABLED(CONFIG_DRM_I915_DEBUG_MMIO), 0600) \
+	param(bool, mmio_debug, IS_ENABLED(CONFIG_DRM_I915_DEBUG_MMIO), 0600) \
 	/*
 	 * Debugfs-only knob (per-device): no matching module_param is registered
 	 * in intel_display_params.c on purpose. Runtime-toggle via debugfs.
-- 
2.56.0

