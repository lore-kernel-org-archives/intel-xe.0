Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E346EC5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 22:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BAE10EA85;
	Thu,  5 Jun 2025 22:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eT5valR+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B71F10EA35
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 22:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749162186; x=1780698186;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8fOZ/5pBMRGCMJ4Nn1xgUvfCfF7jHbmMintNYzGBA9E=;
 b=eT5valR+dgWW690JVYPwgC7pUcw/3ho0aPIqg1DEX4e7TRyeWQ7Vrc4j
 1VIW8RgS8TPzPunN9ZInqXiE1va8VfwCQKjodFl6JvK4gcPvdVYZvjPM+
 saBHSScRUfxJQznd6WLWuedK+XFdhNDNYMCobB8zkSyO7bX0FGVU8lMGS
 fDZk1Y+Pnh/KrsdZO/2QDeLevzu1D5qYy8yIxCDLtGDaxb0dv7+4G90Gq
 eUk/6ab/5IC4zrpOOgcYfTFxFQLC1k3TCN2SMTpOywvYHsGPr5GS9P7AR
 PWcjGTHYcQEgRYvgrAwp8a3/wwMhVr+pACvuBNSlkNsKhBMB96xT8r8az g==;
X-CSE-ConnectionGUID: NReCBCrHSb2cSI14J4E7sg==
X-CSE-MsgGUID: I5rlVZyVQYe00sFJsXf/kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51212419"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="51212419"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 15:23:06 -0700
X-CSE-ConnectionGUID: +pbzq1IiQR27nk1Hm0UmVg==
X-CSE-MsgGUID: JecnUU2EQMa3/yBxgB8Gvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="150795528"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 15:23:05 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH] drm/xe: Fix early wedge on GuC load failure
Date: Thu,  5 Jun 2025 15:22:57 -0700
Message-ID: <20250605222256.804888-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

When the GuC fails to load we declare the device wedged. However, the
very first GuC load attempt on GT0 (from xe_gt_init_hwconfig) is done
before the GT1 GuC objects are initialized, so things go bad when the
wedge code attempts to cleanup GT1. To fix this, check the initialization
status in the functions called during wedge.

Fixes: 7dbe8af13c18 ("drm/xe: Wedge the entire device")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
---

Note that this patch depends on another fix in the same area:
	1e1981b16bb1 ("drm/xe: Fix taking invalid lock on wedge")

which however was merged without a fixes tag. Not sure if we need to
propagate that one through fixes manually before this one, or if we can
just fix it when this one fails to build in the fixes tree.

 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c              | 7 +++++--
 drivers/gpu/drm/xe/xe_guc_ct.h              | 5 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c          | 3 +++
 4 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 084cbdeba8ea..e1362e608146 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -137,6 +137,14 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
 	int pending_seqno;
 
+	/*
+	 * we can get here before the CTs are even initialized if we're wedging
+	 * very early, in which case there are not going to be any pending
+	 * fences so we can bail immediately.
+	 */
+	if (!xe_guc_ct_initialized(&gt->uc.guc.ct))
+		return;
+
 	/*
 	 * CT channel is already disabled at this point. No new TLB requests can
 	 * appear.
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 822f4c33f730..e303fec18174 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -517,6 +517,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct)
  */
 void xe_guc_ct_stop(struct xe_guc_ct *ct)
 {
+	if (!xe_guc_ct_initialized(ct))
+		return;
+
 	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
 	stop_g2h_handler(ct);
 }
@@ -788,7 +791,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	u16 seqno;
 	int ret;
 
-	xe_gt_assert(gt, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
+	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
 	xe_gt_assert(gt, !g2h_len || !g2h_fence);
 	xe_gt_assert(gt, !num_g2h || !g2h_fence);
 	xe_gt_assert(gt, !g2h_len || num_g2h);
@@ -1424,7 +1427,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	u32 action;
 	u32 *hxg;
 
-	xe_gt_assert(gt, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
+	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
 	lockdep_assert_held(&ct->fast_lock);
 
 	if (ct->state == XE_GUC_CT_STATE_DISABLED)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 5649bda82823..99c5dec446f2 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -24,6 +24,11 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 
 void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
 
+static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
+{
+	return ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED;
+}
+
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
 	return ct->state == XE_GUC_CT_STATE_ENABLED;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 26acc3d91e68..408eeeb78a0b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1765,6 +1765,9 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 {
 	int ret;
 
+	if (!guc->submission_state.initialized)
+		return 0;
+
 	/*
 	 * Using an atomic here rather than submission_state.lock as this
 	 * function can be called while holding the CT lock (engine reset
-- 
2.43.0

