Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E26ECF34C3
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 15:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0258C10E660;
	Wed, 19 Nov 2025 15:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FPZ/NUKX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B2E10E660
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 15:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763565785; x=1795101785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y9wNR7SexBY3ergQCK31HLDdPpQ3XUVw+ugNgapumXI=;
 b=FPZ/NUKXCOvIhBogDdgjiEHljyH/4myT3D09drzAjGofxM1tnD3nQWoz
 nrlNXwZ2ub2FRmEHgcVnEGihI0IHYD/Ko5H596Chia86Sgxr4t5qtMrzx
 vR9MznOeA0sGrAXVZEmhbAOUm2flLCpmQ2hxuwZA28PuY09RmsZ3ErNYq
 zc8+7/U0Zs8AB0sjvacFmN+0D0ajuK0a+4AFks18MudIBPqVdTJx+XFNh
 VfT0ELl6jVJuHfEOrzVzXvpqFuapVtSfVWubqliptPrEh8Bz7ULe67Gur
 mg0JH4Uacjf569kyYaCGPmFc8pzgN28XtgrIVVHsWGaicZqyawf4Jjb3X g==;
X-CSE-ConnectionGUID: 0gnZ1wsySbG5yykWsPZSJw==
X-CSE-MsgGUID: GL3Pum2JSmmS0KAwfwFjgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68217459"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="68217459"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 07:23:04 -0800
X-CSE-ConnectionGUID: m5/DS03XS4mTWmPm/aIFKA==
X-CSE-MsgGUID: UIAG3fxyR3iPSvWfxnL3Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="191207339"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 07:23:04 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Sagar Ghuge <sagar.ghuge@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/guc_ct: Cleanup ifdef'ry
Date: Wed, 19 Nov 2025 07:21:57 -0800
Message-ID: <20251119152157.1675188-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118-fix-debug-guc-v1-2-9f780c6bedf8@intel.com>
References: <20251118-fix-debug-guc-v1-2-9f780c6bedf8@intel.com>
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

Better split CONFIG_DRM_XE_DEBUG and CONFIG_DRM_XE_DEBUG_GUC optional
parts from the main code, creating smaller ct_dead_* and fast_req_*
interfaces.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: Fix build with CONFIG_DRM_XE_DEBUG=n
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 206 +++++++++++++++++----------------
 1 file changed, 106 insertions(+), 100 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 07ae0d601910e..ccacf3a5da829 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -42,6 +42,21 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct);
 static void guc_ct_change_state(struct xe_guc_ct *ct,
 				enum xe_guc_ct_state state);
 
+static struct xe_guc *ct_to_guc(struct xe_guc_ct *ct)
+{
+	return container_of(ct, struct xe_guc, ct);
+}
+
+static struct xe_gt *ct_to_gt(struct xe_guc_ct *ct)
+{
+	return container_of(ct, struct xe_gt, uc.guc.ct);
+}
+
+static struct xe_device *ct_to_xe(struct xe_guc_ct *ct)
+{
+	return gt_to_xe(ct_to_gt(ct));
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 enum {
 	/* Internal states, not error conditions */
@@ -68,14 +83,101 @@ enum {
 static void ct_dead_worker_func(struct work_struct *w);
 static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code);
 
-#define CT_DEAD(ct, ctb, reason_code)		ct_dead_capture((ct), (ctb), CT_DEAD_##reason_code)
+static void ct_dead_fini(struct xe_guc_ct *ct)
+{
+	cancel_work_sync(&ct->dead.worker);
+}
+
+static void ct_dead_init(struct xe_guc_ct *ct)
+{
+	spin_lock_init(&ct->dead.lock);
+	INIT_WORK(&ct->dead.worker, ct_dead_worker_func);
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
+	stack_depot_init();
+#endif
+}
+
+static void fast_req_stack_save(struct xe_guc_ct *ct, unsigned int slot)
+{
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
+	unsigned long entries[SZ_32];
+	unsigned int n;
+
+	n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
+	/* May be called under spinlock, so avoid sleeping */
+	ct->fast_req[slot].stack = stack_depot_save(entries, n, GFP_NOWAIT);
+#endif
+}
+
+static void fast_req_dump(struct xe_guc_ct *ct, u16 fence, unsigned int slot)
+{
+	struct xe_gt *gt = ct_to_gt(ct);
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
+	char *buf __cleanup(kfree) = kmalloc(SZ_4K, GFP_NOWAIT);
+
+	if (buf && stack_depot_snprint(ct->fast_req[slot].stack, buf, SZ_4K, 0))
+		xe_gt_err(gt, "Fence 0x%x was used by action %#04x sent at:\n%s\n",
+			  fence, ct->fast_req[slot].action, buf);
+	else
+		xe_gt_err(gt, "Fence 0x%x was used by action %#04x [failed to retrieve stack]\n",
+			  fence, ct->fast_req[slot].action);
 #else
+	xe_gt_err(gt, "Fence 0x%x was used by action %#04x\n",
+		  fence, ct->fast_req[slot].action);
+#endif
+}
+
+static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
+{
+	u16 fence_min = U16_MAX, fence_max = 0;
+	struct xe_gt *gt = ct_to_gt(ct);
+	unsigned int n;
+
+	lockdep_assert_held(&ct->lock);
+
+	for (n = 0; n < ARRAY_SIZE(ct->fast_req); n++) {
+		if (ct->fast_req[n].fence < fence_min)
+			fence_min = ct->fast_req[n].fence;
+		if (ct->fast_req[n].fence > fence_max)
+			fence_max = ct->fast_req[n].fence;
+
+		if (ct->fast_req[n].fence != fence)
+			continue;
+
+		return fast_req_dump(ct, fence, n);
+	}
+
+	xe_gt_warn(gt, "Fence 0x%x not found - tracking buffer wrapped? [range = 0x%x -> 0x%x, next = 0x%X]\n",
+		   fence, fence_min, fence_max, ct->fence_seqno);
+}
+
+static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
+{
+	unsigned int slot = fence % ARRAY_SIZE(ct->fast_req);
+
+	fast_req_stack_save(ct, slot);
+	ct->fast_req[slot].fence = fence;
+	ct->fast_req[slot].action = action;
+}
+
+#define CT_DEAD(ct, ctb, reason_code)	ct_dead_capture((ct), (ctb), CT_DEAD_##reason_code)
+
+#else
+
+static void ct_dead_fini(struct xe_guc_ct *ct) { }
+static void ct_dead_init(struct xe_guc_ct *ct) { }
+
+static void fast_req_report(struct xe_guc_ct *ct, u16 fence) { }
+static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action) { }
+
 #define CT_DEAD(ct, ctb, reason)			\
 	do {						\
 		struct guc_ctb *_ctb = (ctb);		\
 		if (_ctb)				\
 			_ctb->info.broken = true;	\
 	} while (0)
+
 #endif
 
 /* Used when a CT send wants to block and / or receive data */
@@ -112,24 +214,6 @@ static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
 	return g2h_fence->seqno == ~0x0;
 }
 
-static struct xe_guc *
-ct_to_guc(struct xe_guc_ct *ct)
-{
-	return container_of(ct, struct xe_guc, ct);
-}
-
-static struct xe_gt *
-ct_to_gt(struct xe_guc_ct *ct)
-{
-	return container_of(ct, struct xe_gt, uc.guc.ct);
-}
-
-static struct xe_device *
-ct_to_xe(struct xe_guc_ct *ct)
-{
-	return gt_to_xe(ct_to_gt(ct));
-}
-
 /**
  * DOC: GuC CTB Blob
  *
@@ -199,9 +283,7 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_ct *ct = arg;
 
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
-	cancel_work_sync(&ct->dead.worker);
-#endif
+	ct_dead_fini(ct);
 	ct_exit_safe_mode(ct);
 	destroy_workqueue(ct->g2h_wq);
 	xa_destroy(&ct->fence_lookup);
@@ -233,13 +315,8 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
 	xa_init(&ct->fence_lookup);
 	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
 	INIT_DELAYED_WORK(&ct->safe_mode_worker, safe_mode_worker_func);
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
-	spin_lock_init(&ct->dead.lock);
-	INIT_WORK(&ct->dead.worker, ct_dead_worker_func);
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
-	stack_depot_init();
-#endif
-#endif
+
+	ct_dead_init(ct);
 	init_waitqueue_head(&ct->wq);
 	init_waitqueue_head(&ct->g2h_fence_wq);
 
@@ -747,28 +824,6 @@ static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 	spin_unlock_irq(&ct->fast_lock);
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
-static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
-{
-	unsigned int slot = fence % ARRAY_SIZE(ct->fast_req);
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
-	unsigned long entries[SZ_32];
-	unsigned int n;
-
-	n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
-
-	/* May be called under spinlock, so avoid sleeping */
-	ct->fast_req[slot].stack = stack_depot_save(entries, n, GFP_NOWAIT);
-#endif
-	ct->fast_req[slot].fence = fence;
-	ct->fast_req[slot].action = action;
-}
-#else
-static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
-{
-}
-#endif
-
 /*
  * The CT protocol accepts a 16 bits fence. This field is fully owned by the
  * driver, the GuC will just copy it to the reply message. Since we need to
@@ -1338,55 +1393,6 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
-static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
-{
-	u16 fence_min = U16_MAX, fence_max = 0;
-	struct xe_gt *gt = ct_to_gt(ct);
-	bool found = false;
-	unsigned int n;
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
-	char *buf;
-#endif
-
-	lockdep_assert_held(&ct->lock);
-
-	for (n = 0; n < ARRAY_SIZE(ct->fast_req); n++) {
-		if (ct->fast_req[n].fence < fence_min)
-			fence_min = ct->fast_req[n].fence;
-		if (ct->fast_req[n].fence > fence_max)
-			fence_max = ct->fast_req[n].fence;
-
-		if (ct->fast_req[n].fence != fence)
-			continue;
-		found = true;
-
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
-		buf = kmalloc(SZ_4K, GFP_NOWAIT);
-		if (buf && stack_depot_snprint(ct->fast_req[n].stack, buf, SZ_4K, 0))
-			xe_gt_err(gt, "Fence 0x%x was used by action %#04x sent at:\n%s",
-				  fence, ct->fast_req[n].action, buf);
-		else
-			xe_gt_err(gt, "Fence 0x%x was used by action %#04x [failed to retrieve stack]\n",
-				  fence, ct->fast_req[n].action);
-		kfree(buf);
-#else
-		xe_gt_err(gt, "Fence 0x%x was used by action %#04x\n",
-			  fence, ct->fast_req[n].action);
-#endif
-		break;
-	}
-
-	if (!found)
-		xe_gt_warn(gt, "Fence 0x%x not found - tracking buffer wrapped? [range = 0x%x -> 0x%x, next = 0x%X]\n",
-			   fence, fence_min, fence_max, ct->fence_seqno);
-}
-#else
-static void fast_req_report(struct xe_guc_ct *ct, u16 fence)
-{
-}
-#endif
-
 static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
 	struct xe_gt *gt =  ct_to_gt(ct);
-- 
2.51.2

