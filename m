Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1951CEE34B
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 19:08:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E75510E1E9;
	Tue, 18 Nov 2025 19:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YhkQF+4L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0515B10E1D3
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 19:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763492933; x=1795028933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=flqbWivdgd2zwQ6YZ+iEcWq8YzWw0O3oyXo08vKR9xE=;
 b=YhkQF+4L5joEb9aKBKxApFTsl3h7ZDRQ7Eb802txNMgVBxsGCwRuYx92
 /4s2A2x9/PeuEKhrRrgSYUqxu7frR5oaTFPO1+8peRTZHNp8ltHHgfKRU
 gvxFv43jSaslpXZhbC20BWelw5ACEK93Mr8fljHV3KOytepmunkH/d1lc
 GjlbCFNAykWJP3XZCPTXkcMJL0B/QmzlMz6yuxCH8et2duGyNwrv8IqwN
 xztk/jyd3inRedIw2vE54WUcl15++OxKEja/iA6esHDqo4CDKZ32TmFO8
 aEvP1KkA/O5Ufljs6ny9AhVX9OsyDeFYSL3VCsZ434/AG91M1GthmkdZ7 A==;
X-CSE-ConnectionGUID: xAxCSSLuTvO11YBxsCLnDA==
X-CSE-MsgGUID: 3ugWnLvyRj2ehi4exs40uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="68132374"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="68132374"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 11:08:52 -0800
X-CSE-ConnectionGUID: ZcJEBCXRTjCC81q76mNnoQ==
X-CSE-MsgGUID: OQnmlWmdT6y22NtW6vW9Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="191627283"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 11:08:52 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Sagar Ghuge <sagar.ghuge@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 2/2] drm/xe/guc_ct: Cleanup ifdef'ry
Date: Tue, 18 Nov 2025 11:08:12 -0800
Message-ID: <20251118-fix-debug-guc-v1-2-9f780c6bedf8@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118-fix-debug-guc-v1-0-9f780c6bedf8@intel.com>
References: <20251118-fix-debug-guc-v1-0-9f780c6bedf8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-50d74
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
 drivers/gpu/drm/xe/xe_guc_ct.c | 207 +++++++++++++++++++++--------------------
 1 file changed, 107 insertions(+), 100 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 07ae0d601910e..3362b1b14f179 100644
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
+static void ct_dead_fini(struct xe_dead_ct *dead)
+{
+	cancel_work_sync(&dead->worker);
+}
+
+static void ct_dead_init(struct xe_dead_ct *dead)
+{
+	spin_lock_init(&dead->lock);
+	INIT_WORK(&dead->worker, ct_dead_worker_func);
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
+static void ct_dead_fini(struct xe_dead_ct *dead) { }
+static void ct_dead_init(struct xe_dead_ct *dead) { }
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
@@ -199,9 +283,8 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_ct *ct = arg;
 
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
-	cancel_work_sync(&ct->dead.worker);
-#endif
+
+	ct_dead_fini(&ct->dead);
 	ct_exit_safe_mode(ct);
 	destroy_workqueue(ct->g2h_wq);
 	xa_destroy(&ct->fence_lookup);
@@ -233,13 +316,8 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
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
+	ct_dead_init(&ct->dead);
 	init_waitqueue_head(&ct->wq);
 	init_waitqueue_head(&ct->g2h_fence_wq);
 
@@ -747,28 +825,6 @@ static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
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
@@ -1338,55 +1394,6 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
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

