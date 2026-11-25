Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665F7606A692
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=baWplgxz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288DD10E934;
	Wed, 25 Nov 2026 16:29:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A4310E16C;
 Wed, 25 Nov 2026 16:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795624177; x=1827160177;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eJho5MIO3KexRozeqPl6PYH5We9wslmeST5RaT9hs3I=;
 b=baWplgxzJ9WgU9pO99K0/u1PCT99jxPAreWW4hVvTjK+8UN4ioQm1XO/
 j91yclHUdlLGPlNYkAarrIiSZCT/Ku75hFMuXmUw0/JENTFMb7oRhxeMe
 pIVKmaE1IuTMIY+CF5hGnWSJB5OH33IbdLbfzIfMOwdU16i76X/WJJhto
 H93dSg+YXBEKcqJndasX/7pTfLwgl7nCNlVIEjVqYfumMygE4uutddcOX
 z02WNkSP6qJHHXndb2Gns0dOt6HlqkE/FCfNYrrGlYYZDAF93hi0gS8/J
 8GM6nODPpLxBFePJJw0GpSzwrh/TFGr9CTaMXqz+7zbumCCFpiig0t79a Q==;
X-CSE-ConnectionGUID: iYZWxHiTTrCeJs825KSKDA==
X-CSE-MsgGUID: Drrxltg0Sg+gNMGx/D7m0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4422851"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4422851"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 07:58:36 -0800
X-CSE-ConnectionGUID: tyZSuKV2TCKVXAYp1D+1Dg==
X-CSE-MsgGUID: yySdCbfzRPmc3KBLXsSyZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="11786955"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 07:58:35 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/i915/de: Convert mmio.lock to raw spinlock
Date: Wed, 25 Nov 2026 17:58:31 +0200
Message-ID: <20261125155831.17395-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.1
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

On PREEMPT_RT normal spinlocks turn into sleeping mutexes.
We want to be able to read registers inside tracepoints
(which still aren't allowed to sleep on PREEMPT_RT), so
convert our mmio.lock into a raw spinlock.

The display specific mmio.lock (unlike the old device
wide uncore.lock) is not held across forcewake waits and
whatnot, so the lock hold times should be very short.
Thus a raw spinlock is a good fit here.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_wm.c            |  6 +++---
 drivers/gpu/drm/i915/display/intel_de.c           | 10 +++++-----
 drivers/gpu/drm/i915/display/intel_display_core.h |  2 +-
 drivers/gpu/drm/i915/display/intel_vblank.c       |  4 ++--
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index 46bfada7c060..1c8aaa1ec58f 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -1889,9 +1889,9 @@ static void vlv_atomic_update_fifo(struct intel_atomic_state *state,
 	 * parallel updates from multiple pipes.
 	 *
 	 * intel_pipe_update_start() has already disabled interrupts
-	 * for us, so a plain spin_lock() is sufficient here.
+	 * for us, so a plain raw_spin_lock() is sufficient here.
 	 */
-	spin_lock(&display->mmio.lock);
+	raw_spin_lock(&display->mmio.lock);
 
 	switch (crtc->pipe) {
 	case PIPE_A:
@@ -1951,7 +1951,7 @@ static void vlv_atomic_update_fifo(struct intel_atomic_state *state,
 
 	intel_de_read_fw(display, DSPARB(display));
 
-	spin_unlock(&display->mmio.lock);
+	raw_spin_unlock(&display->mmio.lock);
 }
 
 #undef VLV_FIFO
diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index bb008e1ee8fd..5cf8f681c3c8 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -276,9 +276,9 @@ bool intel_de_unclaimed_mmio_detected(struct intel_display *display)
 		return false;
 
 	if (display->mmio.funcs->check_for_unclaimed_mmio_needs_lock) {
-		spin_lock_irq(&display->mmio.lock);
+		raw_spin_lock_irq(&display->mmio.lock);
 		ret = display->mmio.funcs->check_for_unclaimed_mmio(display);
-		spin_unlock_irq(&display->mmio.lock);
+		raw_spin_unlock_irq(&display->mmio.lock);
 	} else {
 		ret = display->mmio.funcs->check_for_unclaimed_mmio(display);
 	}
@@ -332,7 +332,7 @@ __mmio_lock_pre(struct intel_display *display, unsigned long *irqflags,
 		const unsigned int mmio_flags)
 {
 	if (mmio_flags & __MMIO_LOCK)
-		spin_lock_irqsave(&display->mmio.lock, *irqflags);
+		raw_spin_lock_irqsave(&display->mmio.lock, *irqflags);
 }
 
 static __always_inline void
@@ -340,7 +340,7 @@ __mmio_lock_post(struct intel_display *display, unsigned long irqflags,
 		 const unsigned int mmio_flags)
 {
 	if (mmio_flags & __MMIO_LOCK)
-		spin_unlock_irqrestore(&display->mmio.lock, irqflags);
+		raw_spin_unlock_irqrestore(&display->mmio.lock, irqflags);
 }
 
 static __always_inline bool
@@ -534,7 +534,7 @@ void intel_de_init(struct intel_display *display)
 {
 	display->mmio.uncore = to_intel_uncore(display->drm);
 
-	spin_lock_init(&display->mmio.lock);
+	raw_spin_lock_init(&display->mmio.lock);
 
 	/*
 	 * TODO: enable unclaimed register detection
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index b422d24e21b2..bc00860c10f1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -540,7 +540,7 @@ struct intel_display {
 		 * using intel_de_{read,write}(), but not those
 		 * done using intel_de_{read,write}_fw().
 		 */
-		spinlock_t lock;
+		raw_spinlock_t lock;
 
 		struct intel_uncore *uncore;
 		const struct intel_mmio_funcs *funcs;
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 114ff43381b5..a9be8d4ad2df 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -290,13 +290,13 @@ static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
 static void intel_vblank_section_enter(struct intel_display *display)
 	__acquires(display->mmio.lock)
 {
-	spin_lock(&display->mmio.lock);
+	raw_spin_lock(&display->mmio.lock);
 }
 
 static void intel_vblank_section_exit(struct intel_display *display)
 	__releases(display->mmio.lock)
 {
-	spin_unlock(&display->mmio.lock);
+	raw_spin_unlock(&display->mmio.lock);
 }
 #else
 static void intel_vblank_section_enter(struct intel_display *display)
-- 
2.56.1

