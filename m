Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF62CDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 12:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC9A10E0D4;
	Wed, 18 Oct 2023 12:45:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41E010E0D4
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 12:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697633119; x=1729169119;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L0sYGD3LpDuwS6bhTKwnBLNtPpeZ6ssDg4hJB0nvzHo=;
 b=Xr0MRovd945JBnMEnt0E7iy9+oiKoDfAITjP0TxZ1A8YKyYyBgfZLVTn
 sA12rMHLpZxdZ7l9MJhdrSyTjwpfLaKSJRzdev6bGsR63rO/NVJ5RcBGS
 xoHvKQyfuVtah05LQfCWlRTjsf96/RBf18On0gSa50NU28kUrBpqxCju2
 fiO4FoLJHQy39337ejfiRIwQtgQFosZ+pqlf6biH9G28bikXdviWG8RQ7
 B/lyrXjonfiNRmijrvvrWzmbvSfBjddgLMgu3JC7NlD+XbFfhloRLdQOi
 nlQkFGeadrvB7DQKBh+qPWAPTQ6YKrOo0PyGdkuVxHWX6hpt1nrtMXo5G g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384886174"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="384886174"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 05:45:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="791604889"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="791604889"
Received: from amilburn-mobl.ger.corp.intel.com (HELO hazy.ger.corp.intel.com)
 ([10.252.61.137])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 05:45:16 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 18 Oct 2023 15:45:00 +0300
Message-Id: <20231018124500.1309994-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/i915: handle uncore spinlock when not
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
Cc: rodrigo.vivi@intel.com
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
 drivers/gpu/drm/i915/display/intel_display.h | 20 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vblank.c  | 18 +++++++++++-------
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 0e5dffe8f018..07acf5d414f6 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -559,4 +559,24 @@ bool assert_port_valid(struct drm_i915_private *i915, enum port port);
 
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
index 2cec2abf9746..0e8b71063353 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -306,7 +306,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 	 * register reads, potentially with preemption disabled, so the
 	 * following code must not block on uncore.lock.
 	 */
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	uncore_spin_lock(&dev_priv->uncore.lock);
+	local_irq_save(irqflags);
 
 	/* preempt_disable_rt() should go right here in PREEMPT_RT patchset. */
 
@@ -374,7 +375,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 
 	/* preempt_enable_rt() should go right here in PREEMPT_RT patchset. */
 
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	uncore_spin_unlock(&dev_priv->uncore.lock);
+	local_irq_restore(irqflags);
 
 	/*
 	 * While in vblank, position will be negative
@@ -412,9 +414,12 @@ int intel_get_crtc_scanline(struct intel_crtc *crtc)
 	unsigned long irqflags;
 	int position;
 
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	uncore_spin_lock(&dev_priv->uncore.lock);
+	local_irq_save(irqflags);
 	position = __intel_get_crtc_scanline(crtc);
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	local_irq_restore(irqflags);
+
+	uncore_spin_unlock(&dev_priv->uncore.lock);
 
 	return position;
 }
@@ -537,7 +542,7 @@ void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
 	 * Need to audit everything to make sure it's safe.
 	 */
 	spin_lock_irqsave(&i915->drm.vblank_time_lock, irqflags);
-	spin_lock(&i915->uncore.lock);
+	uncore_spin_lock(&i915->uncore.lock);
 
 	drm_calc_timestamping_constants(&crtc->base, &adjusted_mode);
 
@@ -546,7 +551,6 @@ void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
 	crtc->mode_flags = mode_flags;
 
 	crtc->scanline_offset = intel_crtc_scanline_offset(crtc_state);
-
-	spin_unlock(&i915->uncore.lock);
+	uncore_spin_unlock(&i915->uncore.lock);
 	spin_unlock_irqrestore(&i915->drm.vblank_time_lock, irqflags);
 }
-- 
2.39.2

