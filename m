Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E032AC5516D
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8105810EF05;
	Thu, 30 Jul 2026 11:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MrExI4Zn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B541C10EED8;
 Thu, 30 Jul 2026 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409784; x=1816945784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v6yKF+s3mXgOHwOaTGp673zcL6LnccozRjSBi4+ufCY=;
 b=MrExI4ZnXOls8GJ5q1gnS+giUBxlYO1xNcWpZAblUO7fVUB4heasdLrp
 3blE8bRt7KHXsuyWnk5T+SLSg9Cn3/vjw5NNz3z2YgBfvt8yK63ImBZ9Q
 WylM9/CD3squY9IKVBEC1vKXuqO1KiK4TCQwTSj44/Fz1+MHVtff6xz/N
 FvjCv1n8mL0GKvorDKpp3GSUTSReQE6qek3NmJn+9MombCkNisZWetrwQ
 qnBYUttPdM8vp9IPLsWvUVuMVDI89aq6nVSkJA7CeJ3TIOiPOpBzxVriW
 HHFelibVEcDKrSX0vgW1qifkwl43JwBgOwAco7DuGPnXnjE40onB6JsgN Q==;
X-CSE-ConnectionGUID: Q3KTWLbfTYu1vH7Za8hisQ==
X-CSE-MsgGUID: +1I3B915SKie4si0npjuTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86217237"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="86217237"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:44 -0700
X-CSE-ConnectionGUID: Ge0VGxrXT++KqXhd0+x1Mg==
X-CSE-MsgGUID: JTWvzXgbS4Gou/VmK0aNpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="298482301"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa001.jf.intel.com with ESMTP; 30 Jul 2026 04:09:42 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v8 07/10] drm/i915/vrr: Latch CMRR ratio via atomic commit on
 debugfs write
Date: Thu, 30 Jul 2026 16:29:14 +0530
Message-ID: <20260730105919.3913412-8-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
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

Writing the per-CRTC "intel_vrr_target_refresh_rate" debugfs file only
updates crtc->force_cmrr, a side channel that is not tracked by the
atomic state. The requested ratio therefore does not reach the hardware
until some unrelated commit recomputes the pipe config.

Kick an internal atomic commit for the CRTC from the debugfs write and
mark the CRTC mode as changed so the pipe config is recomputed.

Note that this commit may or may not be downgraded to a fastset,
depending on whether the computed vblank value (with LRR disabled)
changes, so it is not characterised as a fastset.

If the commit fails, restore the previous numerator/denominator so that
force_cmrr does not hold on to bad values, which would otherwise make
all subsequent commits fail.

--v2:
- Commit message and code comment update (Chaitanya)
- Commit header update
- Restore to old known debugfs values when commit fails
(Chaitanya)

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 77 ++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index f406f34b816e..3463533b1ea1 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -8,10 +8,12 @@
 #include <linux/seq_file.h>
 #include <linux/string.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_print.h>
 #include <drm/intel/step.h>
 
 #include "intel_alpm.h"
+#include "intel_atomic.h"
 #include "intel_cmtg.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
@@ -1304,12 +1306,67 @@ static int intel_vrr_debugfs_target_rr_open(struct inode *inode, struct file *fi
 	return single_open(file, intel_vrr_debugfs_target_rr_show, inode->i_private);
 }
 
+/*
+ * Force an internal commit on @crtc so that a CMRR ratio programmed
+ * via debugfs gets recomputed and latched into hardware.
+ *
+ * CMRR only alters the (average) vtotal. Depending on whether the
+ * computed vblank value (with LRR disabled) changes, this commit may or
+ * may not be downgraded to a fastset.
+ */
+static int intel_vrr_cmrr_commit_force(struct intel_crtc *crtc)
+{
+	struct intel_display *display = to_intel_display(crtc);
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_commit *state;
+	struct intel_crtc_state *crtc_state;
+	int ret = 0;
+
+	state = drm_atomic_commit_alloc(display->drm);
+	if (!state)
+		return -ENOMEM;
+
+	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
+
+	state->acquire_ctx = &ctx;
+	to_intel_atomic_state(state)->internal = true;
+
+retry:
+	crtc_state = intel_atomic_get_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state)) {
+		ret = PTR_ERR(crtc_state);
+		goto out;
+	}
+
+	if (!crtc_state->hw.active)
+		goto out;
+
+	/* Mark mode as changed to trigger a pipe recompute + update() */
+	crtc_state->uapi.mode_changed = true;
+
+	ret = drm_atomic_commit(state);
+out:
+	if (ret == -EDEADLK) {
+		drm_atomic_commit_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry;
+	}
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+	drm_atomic_commit_put(state);
+
+	return ret;
+}
+
 static ssize_t intel_vrr_debugfs_target_rr_write(struct file *file, const char __user *ubuf,
 						 size_t len, loff_t *offp)
 {
 	struct seq_file *m = file->private_data;
 	struct intel_crtc *crtc = m->private;
 	u32 numerator, denominator;
+	u32 old_numerator, old_denominator;
 	char kbuf[32];
 	int ret;
 
@@ -1329,9 +1386,29 @@ static ssize_t intel_vrr_debugfs_target_rr_write(struct file *file, const char _
 	    crtc->force_cmrr.denominator == denominator)
 		return len;
 
+	old_numerator = crtc->force_cmrr.numerator;
+	old_denominator = crtc->force_cmrr.denominator;
+
 	crtc->force_cmrr.numerator = numerator;
 	crtc->force_cmrr.denominator = denominator;
 
+	/*
+	 * The debugfs value is a side channel that is not tracked by the atomic
+	 * state, so kick an internal commit to recompute and latch the
+	 * new CMRR parameters.
+	 */
+	ret = intel_vrr_cmrr_commit_force(crtc);
+	if (ret) {
+		/*
+		 * Restore the last known good ratio so that force_cmrr does not
+		 * hold on to bad values, which would make all subsequent commits
+		 * fail.
+		 */
+		crtc->force_cmrr.numerator = old_numerator;
+		crtc->force_cmrr.denominator = old_denominator;
+		return ret;
+	}
+
 	return len;
 }
 
-- 
2.48.1

