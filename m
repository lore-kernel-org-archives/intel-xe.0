Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2156C54F4D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 15:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CB210E957;
	Tue, 28 Jul 2026 15:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmmCmuiX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999D210E6BC;
 Tue, 28 Jul 2026 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785251483; x=1816787483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lLrMSYCxeCJGriTtQanpU4bYcB/OT0GhKF60+Va8Msw=;
 b=VmmCmuiXc+eiGwPStXKa95FJUaSx6VcXXsDD9e2+QG1GyGsfTlwSQ05C
 Fi7JL0IkyzRA7U0ByN+WcVWaE2zGPLqW6LiiaWMKBdY0rcX/pk8Go6/iB
 laTMVrIF9zZxSwALxAZ3W6FzLFiHti5SwFqDawm3O92uK3iS5BrAMOAIP
 gVsFgUA/qp/25hQXNOV/IxF0pVQ7X0g9QZnSzmixbvU8uICqSYGvaj+cC
 8C9TnLW/tEkT6zLfx7FwBL8eR7DcEU2JCGzVV0kBjDuJPXR8Yyi261/Ct
 c4AyfCGOMUCReJpuQgBE+tM/K1CYp9ftFQhe6mTI+SmsyxTEYIwXmDjPk g==;
X-CSE-ConnectionGUID: BZsC0TMwSjKXhaok1+Zkjw==
X-CSE-MsgGUID: q72rpC3GSwS8QbP54Wjj/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88376946"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="88376946"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 08:10:10 -0700
X-CSE-ConnectionGUID: IybFtWoATIGHJLhKZyscrA==
X-CSE-MsgGUID: 8V1N3zktSaCJddpnxPukqQ==
X-ExtLoop1: 1
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa003.fm.intel.com with ESMTP; 28 Jul 2026 08:10:08 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v7 07/10] drm/i915/vrr: Latch CMRR ratio via fastset on
 debugfs write
Date: Tue, 28 Jul 2026 20:29:39 +0530
Message-ID: <20260728145943.3848704-8-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
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

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 63 ++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 7746b2ead7d1..056d513ab637 100644
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
@@ -1312,6 +1314,58 @@ static int intel_vrr_debugfs_target_rr_open(struct inode *inode, struct file *fi
 	return single_open(file, intel_vrr_debugfs_target_rr_show, inode->i_private);
 }
 
+/*
+ * Force an internal fastset commit on @crtc so that a CMRR ratio programmed
+ * via debugfs gets recomputed and latched into hardware. CMRR only alters the
+ * (average) vtotal, which is handled by the LRR fastset path, so this does not
+ * trigger a full modeset (no blank out).
+ */
+static int intel_vrr_cmrr_fastset_force(struct intel_crtc *crtc)
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
@@ -1340,6 +1394,15 @@ static ssize_t intel_vrr_debugfs_target_rr_write(struct file *file, const char _
 	crtc->force_cmrr.numerator = numerator;
 	crtc->force_cmrr.denominator = denominator;
 
+	/*
+	 * The debugfs value is a side channel that is not tracked by the atomic
+	 * state, so kick an internal fastset commit to recompute and latch the
+	 * new CMRR parameters without a full modeset.
+	 */
+	ret = intel_vrr_cmrr_fastset_force(crtc);
+	if (ret)
+		return ret;
+
 	return len;
 }
 
-- 
2.48.1

