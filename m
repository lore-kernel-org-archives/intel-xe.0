Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA4CCCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 17:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BB310EAC4;
	Thu,  9 Oct 2025 17:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4//rZTv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E9810EAC4
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760029663; x=1791565663;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+GK33m9nFSU+D3arOV+7Ymbg4hYWTbS0jYm1wbFaFD0=;
 b=G4//rZTvqZT1U0CKh9BDPeagzhDmS41FrfhGsyMcNaoozbCNo4Vb3c4C
 18+mUkg9BBL7Wx3iztrh/UxOUEd1SZtxKrhmVjCgv+k3mcbB/7Y5SpMtP
 RwvRcEVR9kF4Twl2fgds/mY9aoH6DrCP/ofDs4elswJ/r8RJaEms44ZiJ
 r0jeG88oxrnFpq4KZqX6j7A7KtqZAXV4m5BdXKcXTEGPazLGjhXDcHLhX
 XugJATGf45EYwOw5SvPjkhqjRpk6HPPhikLjLcXw9rh8vuzTQv2q14sm4
 izpN7Qkz2tlPvK9NWy8n6R61oerpSgMjAGaKhG2rK3Uy2Xp+xypUGTA0u w==;
X-CSE-ConnectionGUID: arjcRvcoRh+eSqmAgxOL3g==
X-CSE-MsgGUID: JYevKH6wS0SuSMXMERx6Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="79687935"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="79687935"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 10:07:42 -0700
X-CSE-ConnectionGUID: gwQZOa1nQemZpMVsl/SfOw==
X-CSE-MsgGUID: nDOL+3D/T/yDlGMTy0QozQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="180007917"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa010.jf.intel.com with ESMTP; 09 Oct 2025 10:07:40 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v1] drm/xe/ct: Separate waiting for retry from ct send function
Date: Thu,  9 Oct 2025 19:08:44 +0200
Message-Id: <20251009170844.178199-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
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

The function `guc_ct_send_locked()` is really quite simple, but still
looks complex due to exposed internals. It is sending a message,
and in case of lack of space, waiting for a proper moment to send
a retry.

Clear separation of send function and wait function will help with
readability. This is a cosmetic change only, no functional difference
is expected.

This patch introduces `guc_ct_send_wait_for_retry()`, and uses it to
greatly simplify `guc_ct_send_locked()`.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 64 +++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 3ae1e8db143a..e68953ef3a00 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -991,22 +991,15 @@ static void kick_reset(struct xe_guc_ct *ct)
 
 static int dequeue_one_g2h(struct xe_guc_ct *ct);
 
-static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
-			      u32 g2h_len, u32 num_g2h,
-			      struct g2h_fence *g2h_fence)
+/*
+ * wait before retry of sending h2g message
+ * Return: true if ready for retry, false if the wait timeouted
+ */
+static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
+				       u32 g2h_len, struct g2h_fence *g2h_fence,
+				       unsigned int *sleep_period_ms)
 {
 	struct xe_device *xe = ct_to_xe(ct);
-	struct xe_gt *gt = ct_to_gt(ct);
-	unsigned int sleep_period_ms = 1;
-	int ret;
-
-	xe_gt_assert(gt, !g2h_len || !g2h_fence);
-	lockdep_assert_held(&ct->lock);
-	xe_device_assert_mem_access(ct_to_xe(ct));
-
-try_again:
-	ret = __guc_ct_send_locked(ct, action, len, g2h_len, num_g2h,
-				   g2h_fence);
 
 	/*
 	 * We wait to try to restore credits for about 1 second before bailing.
@@ -1015,24 +1008,22 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	 * the case of G2H we process any G2H in the channel, hopefully freeing
 	 * credits as we consume the G2H messages.
 	 */
-	if (unlikely(ret == -EBUSY &&
-		     !h2g_has_room(ct, len + GUC_CTB_HDR_LEN))) {
+	if (!h2g_has_room(ct, len + GUC_CTB_HDR_LEN)) {
 		struct guc_ctb *h2g = &ct->ctbs.h2g;
 
-		if (sleep_period_ms == 1024)
-			goto broken;
+		if (*sleep_period_ms == 1024)
+			return false;
 
 		trace_xe_guc_ct_h2g_flow_control(xe, h2g->info.head, h2g->info.tail,
 						 h2g->info.size,
 						 h2g->info.space,
 						 len + GUC_CTB_HDR_LEN);
-		msleep(sleep_period_ms);
-		sleep_period_ms <<= 1;
-
-		goto try_again;
-	} else if (unlikely(ret == -EBUSY)) {
+		msleep(*sleep_period_ms);
+		*sleep_period_ms <<= 1;
+	} else {
 		struct xe_device *xe = ct_to_xe(ct);
 		struct guc_ctb *g2h = &ct->ctbs.g2h;
+		int ret;
 
 		trace_xe_guc_ct_g2h_flow_control(xe, g2h->info.head,
 						 desc_read(xe, g2h, tail),
@@ -1046,7 +1037,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	(desc_read(ct_to_xe(ct), (&ct->ctbs.g2h), tail) != ct->ctbs.g2h.info.head)
 		if (!wait_event_timeout(ct->wq, !ct->g2h_outstanding ||
 					g2h_avail(ct), HZ))
-			goto broken;
+			return false;
 #undef g2h_avail
 
 		ret = dequeue_one_g2h(ct);
@@ -1054,9 +1045,32 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			if (ret != -ECANCELED)
 				xe_gt_err(ct_to_gt(ct), "CTB receive failed (%pe)",
 					  ERR_PTR(ret));
-			goto broken;
+			return false;
 		}
+	}
+	return true;
+}
+
+static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
+			      u32 g2h_len, u32 num_g2h,
+			      struct g2h_fence *g2h_fence)
+{
+	struct xe_gt *gt = ct_to_gt(ct);
+	unsigned int sleep_period_ms = 1;
+	int ret;
+
+	xe_gt_assert(gt, !g2h_len || !g2h_fence);
+	lockdep_assert_held(&ct->lock);
+	xe_device_assert_mem_access(ct_to_xe(ct));
 
+try_again:
+	ret = __guc_ct_send_locked(ct, action, len, g2h_len, num_g2h,
+				   g2h_fence);
+
+	if (unlikely(ret == -EBUSY)) {
+		if (!guc_ct_send_wait_for_retry(ct, len, g2h_len, g2h_fence,
+						&sleep_period_ms))
+			goto broken;
 		goto try_again;
 	}
 
-- 
2.25.1

