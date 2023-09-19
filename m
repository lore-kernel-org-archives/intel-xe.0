Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF3ACD54AB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 09:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED4010E362;
	Tue, 19 Sep 2023 09:48:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14F210E261
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695116879; x=1726652879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IoU3LefYFNMEjG8KaBkNvd4eBzVVtLNSNV1K5UpGOPw=;
 b=KgZw9xFEnLznZTVvinde9OdBoMqgDMADACcv06MwUtCtdJZ5w3jsMWtq
 E6v+Nn4lsOha1GVpnqnLU9nfe6eKGM4pfSVp9+RYHGjlOMT9gpQA7rCat
 toVknjM2k+M8QGVUJ+rl+XR8uPlL9MOTN0GxWAgZZ6DcZxK3Ege3/odnS
 SzHRRrhn+6xtZhyaX/NaIFT8rU/nUklpEudq5vD1AysFeIiJH5odwvmGe
 kDs39cI3YqGSHSANeAm1CoGTRMWI6jPpt6PkVYx7kDsPlvMSZPjOm8yb+
 Kk6NdZsHr7AhAxvogXcp49u0rFzvDNpZMtPAAF33fw4woXTX6wmm8Z+Y/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466225456"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466225456"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:47:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="739621371"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="739621371"
Received: from danilova-mobl.ger.corp.intel.com (HELO hazy.ger.corp.intel.com)
 ([10.251.219.3])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:47:58 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 12:47:37 +0300
Message-Id: <20230919094737.743358-3-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919094737.743358-1-luciano.coelho@intel.com>
References: <20230919094737.743358-1-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/i915: handle uncore spinlock when not
 available
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

The uncore code may not always be available (e.g. when we build the
display code with Xe), so we can't always rely on having the uncore's
spinlock.

To handle this, split the spin_lock/unlock_irqsave/restore() into
spin_lock/unlock() followed by a call to local_irq_save/restore() and
create wrapper functions for locking and unlocking the uncore's
spinlock.  In these functions, we have a condition check and only
actually try to lock/unlock the spinlock when I915 is defined, and
thus uncore is available.

This keeps the ifdefs contained in these new functions and all such
logic inside the display code.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.h | 20 +++++++++++++
 drivers/gpu/drm/i915/display/intel_vblank.c  | 31 +++++++-------------
 2 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 51eb65109d39..fdf9ff68a8a6 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -565,4 +565,24 @@ bool assert_port_valid(struct drm_i915_private *i915, enum port port);
 
 bool intel_scanout_needs_vtd_wa(struct drm_i915_private *i915);
 
+/*
+ * The uncore version of the spin lock functions is used to decide
+ * whether we need to lock the uncore lock or not.  This is only
+ * needed in i915, not in Xe.  Keep the decision-making centralized
+ * here.
+ */
+static inline void uncore_spin_lock(spinlock_t *lock)
+{
+#ifdef I915
+	spin_lock(lock);
+#endif
+}
+
+static inline void uncore_spin_unlock(spinlock_t *lock)
+{
+#ifdef I915
+	spin_unlock(lock);
+#endif
+}
+
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 416aa6749eaf..97841fcf5b0f 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -292,11 +292,9 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 	 * register reads, potentially with preemption disabled, so the
 	 * following code must not block on uncore.lock.
 	 */
-#ifdef I915
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
-#else
+	uncore_spin_lock(&dev_priv->uncore.lock);
 	local_irq_save(irqflags);
-#endif
+
 	/* preempt_disable_rt() should go right here in PREEMPT_RT patchset. */
 
 	/* Get optional system timestamp before query. */
@@ -363,11 +361,9 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 
 	/* preempt_enable_rt() should go right here in PREEMPT_RT patchset. */
 
-#ifdef I915
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
-#else
+	uncore_spin_unlock(&dev_priv->uncore.lock);
 	local_irq_restore(irqflags);
-#endif
+
 	/*
 	 * While in vblank, position will be negative
 	 * counting up towards 0 at vbl_end. And outside
@@ -402,17 +398,14 @@ int intel_get_crtc_scanline(struct intel_crtc *crtc)
 {
 	unsigned long irqflags;
 	int position;
-#ifdef I915
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
-	position = __intel_get_crtc_scanline(crtc);
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
-#else
+	uncore_spin_lock(&to_i915(crtc->base.dev)->uncore.lock);
 	local_irq_save(irqflags);
 	position = __intel_get_crtc_scanline(crtc);
 	local_irq_restore(irqflags);
-#endif
+
+	uncore_spin_unlock(&to_i915(crtc->base.dev)->uncore.lock);
+
 	return position;
 }
 
@@ -534,9 +527,7 @@ void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
 	 * Need to audit everything to make sure it's safe.
 	 */
 	spin_lock_irqsave(&i915->drm.vblank_time_lock, irqflags);
-#ifdef I915
-	spin_lock(&i915->uncore.lock);
-#endif
+	uncore_spin_lock(&i915->uncore.lock);
 
 	drm_calc_timestamping_constants(&crtc->base, &adjusted_mode);
 
@@ -545,8 +536,6 @@ void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
 	crtc->mode_flags = mode_flags;
 
 	crtc->scanline_offset = intel_crtc_scanline_offset(crtc_state);
-#ifdef I915
-	spin_unlock(&i915->uncore.lock);
-#endif
+	uncore_spin_unlock(&i915->uncore.lock);
 	spin_unlock_irqrestore(&i915->drm.vblank_time_lock, irqflags);
 }
-- 
2.39.2

