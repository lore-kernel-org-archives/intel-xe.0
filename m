Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C91C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5DF10E88D;
	Thu,  7 Dec 2023 13:01:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A9310E88D
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701954082; x=1733490082;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NKjoMCL1TNtwtzvinS8s2qHT4l+Y1POE89GBKpWgnkE=;
 b=kyg3Q0DEhJD7jzZBZ2+I79CAa9IS7qokExVQz2kirZwuDOPU39BOKHrp
 U0pOI55MBXAECbzfL6rMCzOU9vaQL9idCFV61q9TNFVygWhRNR8Z+q/Pp
 nDTAXqg9eGbqeVkgVmSZ3BnWAHrCAK8URC1v1lMaVkNXJlAUowl2iTSj/
 R0CoXPGz+DtYlkquooNu/Wq2YXh6mSJXkwWZvFPKK7etx5hqrQ54KV/Nz
 A9WrvbnEBI7IdEyUcYdfobkj0WRSsp/uGQ1JkdmkT+NGnfVe32Hy4rnQT
 M4vrDBz0OGP5jTAzx1pqSG8Y7BH08M6VD5xquVXyfqvISURwjZsX5PmlU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="397017077"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="397017077"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:01:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837706782"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="837706782"
Received: from ajbyrne1-mobl1.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.252.63.42])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:01:19 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] Revert "FIXME: drm/i915: avoid taking the uncore lock for
 xe"
Date: Thu,  7 Dec 2023 15:01:05 +0200
Message-Id: <20231207130106.1676807-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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

This reverts commit 54cbd07bd1d15cb6c8d28375dce6d6b70df6d252.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vblank.c | 24 +++++----------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 6a0d51823655..2cec2abf9746 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -306,11 +306,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 	 * register reads, potentially with preemption disabled, so the
 	 * following code must not block on uncore.lock.
 	 */
-#ifdef I915
 	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
-#else
-	local_irq_save(irqflags);
-#endif
+
 	/* preempt_disable_rt() should go right here in PREEMPT_RT patchset. */
 
 	/* Get optional system timestamp before query. */
@@ -377,11 +374,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 
 	/* preempt_enable_rt() should go right here in PREEMPT_RT patchset. */
 
-#ifdef I915
 	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
-#else
-	local_irq_restore(irqflags);
-#endif
+
 	/*
 	 * While in vblank, position will be negative
 	 * counting up towards 0 at vbl_end. And outside
@@ -414,19 +408,14 @@ bool intel_crtc_get_vblank_timestamp(struct drm_crtc *crtc, int *max_error,
 
 int intel_get_crtc_scanline(struct intel_crtc *crtc)
 {
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	unsigned long irqflags;
 	int position;
-#ifdef I915
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 
 	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
 	position = __intel_get_crtc_scanline(crtc);
 	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
-#else
-	local_irq_save(irqflags);
-	position = __intel_get_crtc_scanline(crtc);
-	local_irq_restore(irqflags);
-#endif
+
 	return position;
 }
 
@@ -548,9 +537,7 @@ void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
 	 * Need to audit everything to make sure it's safe.
 	 */
 	spin_lock_irqsave(&i915->drm.vblank_time_lock, irqflags);
-#ifdef I915
 	spin_lock(&i915->uncore.lock);
-#endif
 
 	drm_calc_timestamping_constants(&crtc->base, &adjusted_mode);
 
@@ -559,8 +546,7 @@ void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
 	crtc->mode_flags = mode_flags;
 
 	crtc->scanline_offset = intel_crtc_scanline_offset(crtc_state);
-#ifdef I915
+
 	spin_unlock(&i915->uncore.lock);
-#endif
 	spin_unlock_irqrestore(&i915->drm.vblank_time_lock, irqflags);
 }
-- 
2.39.2

