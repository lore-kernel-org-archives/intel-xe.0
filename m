Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F87C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C754610E899;
	Thu,  7 Dec 2023 13:01:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A7A10E88D
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701954083; x=1733490083;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=c7XkN5kBiYDAset6kh5yhY43RtWPEY6sajD2zG+in4g=;
 b=IGT17hxY/Leyc/lX5x3ptd24FwGFScuItyOBBkR1qifaaK63yzoRmVkC
 KKcMNg28rWzyQ3MkzBuc+plarU1efzvB2akemjuFQm+0Xc06Fpg8kKQYq
 0z2PUeQe7TdhzHS8rUKpn6qhdy3vBXH2ZgsSs6/0tMj9PprPBWhPxhB/W
 hwNidKUy5CFy+h0nu+I0SD1cgPMUDxrTubdTWrywRSuF3xaN0nOq8Wy/b
 vtN2BqrlXxJnJRv8JDK+hMp069t1oUvVfH9H1pSZC9DVzYGAwPV50d9ZC
 IE1BIrwul35rlu4cb6YSd4g/8Krwf1f25BVNnCWSCEAnrOfpYRUqteUuz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="397017086"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="397017086"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:01:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837706796"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="837706796"
Received: from ajbyrne1-mobl1.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.252.63.42])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:01:21 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: handle uncore spinlock when not available
Date: Thu,  7 Dec 2023 15:01:06 +0200
Message-Id: <20231207130106.1676807-2-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207130106.1676807-1-luciano.coelho@intel.com>
References: <20231207130106.1676807-1-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Cc: Tvrtko Ursulin <tvrto.ursulin@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231201100032.1367589-1-luciano.coelho@intel.com
(cherry picked from commit dcdf1bbe82f4b2a301a3692a0b1942c3fda70644)
---
 drivers/gpu/drm/i915/display/intel_vblank.c | 51 +++++++++++++++++----
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 2cec2abf9746..fe256bf7b485 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -265,6 +265,32 @@ int intel_crtc_scanline_to_hw(struct intel_crtc *crtc, int scanline)
 	return (scanline + vtotal - crtc->scanline_offset) % vtotal;
 }
 
+/*
+ * The uncore version of the spin lock functions is used to decide
+ * whether we need to lock the uncore lock or not.  This is only
+ * needed in i915, not in Xe.
+ *
+ * This lock in i915 is needed because some old platforms (at least
+ * IVB and possibly HSW as well), which are not supported in Xe, need
+ * all register accesses to the same cacheline to be serialized,
+ * otherwise they may hang.
+ */
+static void intel_vblank_section_enter(struct drm_i915_private *i915)
+	__acquires(i915->uncore.lock)
+{
+#ifdef I915
+	spin_lock(&i915->uncore.lock);
+#endif
+}
+
+static void intel_vblank_section_exit(struct drm_i915_private *i915)
+	__releases(i915->uncore.lock)
+{
+#ifdef I915
+	spin_unlock(&i915->uncore.lock);
+#endif
+}
+
 static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 				     bool in_vblank_irq,
 				     int *vpos, int *hpos,
@@ -302,11 +328,12 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 	}
 
 	/*
-	 * Lock uncore.lock, as we will do multiple timing critical raw
-	 * register reads, potentially with preemption disabled, so the
-	 * following code must not block on uncore.lock.
+	 * Enter vblank critical section, as we will do multiple
+	 * timing critical raw register reads, potentially with
+	 * preemption disabled, so the following code must not block.
 	 */
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	local_irq_save(irqflags);
+	intel_vblank_section_enter(dev_priv);
 
 	/* preempt_disable_rt() should go right here in PREEMPT_RT patchset. */
 
@@ -374,7 +401,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 
 	/* preempt_enable_rt() should go right here in PREEMPT_RT patchset. */
 
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+	intel_vblank_section_exit(dev_priv);
+	local_irq_restore(irqflags);
 
 	/*
 	 * While in vblank, position will be negative
@@ -412,9 +440,13 @@ int intel_get_crtc_scanline(struct intel_crtc *crtc)
 	unsigned long irqflags;
 	int position;
 
-	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
+	local_irq_save(irqflags);
+	intel_vblank_section_enter(dev_priv);
+
 	position = __intel_get_crtc_scanline(crtc);
-	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
+
+	intel_vblank_section_exit(dev_priv);
+	local_irq_restore(irqflags);
 
 	return position;
 }
@@ -537,7 +569,7 @@ void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
 	 * Need to audit everything to make sure it's safe.
 	 */
 	spin_lock_irqsave(&i915->drm.vblank_time_lock, irqflags);
-	spin_lock(&i915->uncore.lock);
+	intel_vblank_section_enter(i915);
 
 	drm_calc_timestamping_constants(&crtc->base, &adjusted_mode);
 
@@ -546,7 +578,6 @@ void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
 	crtc->mode_flags = mode_flags;
 
 	crtc->scanline_offset = intel_crtc_scanline_offset(crtc_state);
-
-	spin_unlock(&i915->uncore.lock);
+	intel_vblank_section_exit(i915);
 	spin_unlock_irqrestore(&i915->drm.vblank_time_lock, irqflags);
 }
-- 
2.39.2

