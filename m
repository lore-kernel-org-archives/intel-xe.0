Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C602606AC0E
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 22:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eQuop1kT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8E910FF59;
	Wed,  4 Nov 2026 22:19:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B653910FF59;
 Wed,  4 Nov 2026 22:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793830755; x=1825366755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eCZSFmNcHWD7Wyj29MGPP+N2X1iE6fJ6v6aEF44cZG4=;
 b=eQuop1kTgvJm6plnqJMvZvxKk4oglUtNk6hXaxVgmWq6u5YQwpGC6K7D
 yyxdjmAbssKWHocnz8FEZkxvykcL2hGtSTE7KzVb6I/Dpa/sY2IO8nrki
 vpD++DhffZ5F1b8X7lh/JiSSBF+6xOUP5wgA72haAR8UStC7P7MOGOMEi
 oVr71ZtGmMVvPHRQiK1OkN6c4ht/mPG+TPaOvFuse0ziVe48e+ZPZtkFX
 jhNl+vraTHUVZxzlDqcCcsl+frTamBRNF0RFIDaI03fT88Ln/JcHd+4UB
 cBmWW0Y8lXf4t16Al19BteKI6hOU0w0KsQNSDvzt0/XrM1zXiTt2g/vCm w==;
X-CSE-ConnectionGUID: hWSsuGi8RxWT4l6q0Qg87g==
X-CSE-MsgGUID: 2EyOH3k0Twmbpu8K7Te86Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2510049"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2510049"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 14:19:15 -0800
X-CSE-ConnectionGUID: m1e4AEpIR5ygIOGcS6QFAg==
X-CSE-MsgGUID: aq9xojRtSj+6tRDCYKeMpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6994110"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 14:19:13 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/9] drm/i915/uncore: Don't meddle with mmio debug upon user
 forcewake
Date: Thu,  5 Nov 2026 00:18:39 +0200
Message-ID: <20261104221842.18799-7-ville.syrjala@linux.intel.com>
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

Currently when userspace takes the forcewake via debugfs, the
kernel will stop looking for unclaimed mmio accesses. That link
is kinda weird since forcewake is for GT stuff and unclaimed
mmio detection is for display stuff.

Just kill the mmio debug suspend/resume upon user forcewake.
One should almost always use IGT_NO_FORCEWAKE=1 when poking
at display register from userspace anyway so as to not
perturb the rest of the system.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 46 ++---------------------------
 drivers/gpu/drm/i915/intel_uncore.h |  2 --
 2 files changed, 2 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index e360e4f9d9a2..abd695e880c1 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -65,41 +65,6 @@ intel_uncore_mmio_debug_init_early(struct drm_i915_private *i915)
 	i915->uncore.debug = &i915->mmio_debug;
 }
 
-static void mmio_debug_suspend(struct intel_uncore *uncore)
-{
-	if (!uncore->debug)
-		return;
-
-	spin_lock(&uncore->debug->lock);
-
-	/* Save and disable mmio debugging for the user bypass */
-	if (!uncore->debug->suspend_count++) {
-		uncore->debug->saved_mmio_check = uncore->debug->unclaimed_mmio_check;
-		uncore->debug->unclaimed_mmio_check = 0;
-	}
-
-	spin_unlock(&uncore->debug->lock);
-}
-
-static bool check_for_unclaimed_mmio(struct intel_uncore *uncore);
-
-static void mmio_debug_resume(struct intel_uncore *uncore)
-{
-	if (!uncore->debug)
-		return;
-
-	spin_lock(&uncore->debug->lock);
-
-	if (!--uncore->debug->suspend_count)
-		uncore->debug->unclaimed_mmio_check = uncore->debug->saved_mmio_check;
-
-	if (check_for_unclaimed_mmio(uncore))
-		drm_info(&uncore->i915->drm,
-			 "Invalid mmio detected during user access\n");
-
-	spin_unlock(&uncore->debug->lock);
-}
-
 static const char * const forcewake_domain_names[] = {
 	"render",
 	"gt",
@@ -598,9 +563,6 @@ check_for_unclaimed_mmio(struct intel_uncore *uncore)
 
 	lockdep_assert_held(&uncore->debug->lock);
 
-	if (uncore->debug->suspend_count)
-		return false;
-
 	if (intel_uncore_has_fpga_dbg_unclaimed(uncore))
 		ret |= fpga_check_for_unclaimed_mmio(uncore);
 
@@ -733,10 +695,8 @@ void intel_uncore_forcewake_get(struct intel_uncore *uncore,
 void intel_uncore_forcewake_user_get(struct intel_uncore *uncore)
 {
 	spin_lock_irq(&uncore->lock);
-	if (!uncore->user_forcewake_count++) {
+	if (!uncore->user_forcewake_count++)
 		intel_uncore_forcewake_get__locked(uncore, FORCEWAKE_ALL);
-		mmio_debug_suspend(uncore);
-	}
 	spin_unlock_irq(&uncore->lock);
 }
 
@@ -750,10 +710,8 @@ void intel_uncore_forcewake_user_get(struct intel_uncore *uncore)
 void intel_uncore_forcewake_user_put(struct intel_uncore *uncore)
 {
 	spin_lock_irq(&uncore->lock);
-	if (!--uncore->user_forcewake_count) {
-		mmio_debug_resume(uncore);
+	if (!--uncore->user_forcewake_count)
 		intel_uncore_forcewake_put__locked(uncore, FORCEWAKE_ALL);
-	}
 	spin_unlock_irq(&uncore->lock);
 }
 
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index fafc2ca9a237..4ec7c545d04e 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -42,8 +42,6 @@ struct intel_gt;
 struct intel_uncore_mmio_debug {
 	spinlock_t lock; /** lock is also taken in irq contexts. */
 	int unclaimed_mmio_check;
-	int saved_mmio_check;
-	u32 suspend_count;
 };
 
 enum forcewake_domain_id {
-- 
2.56.0

