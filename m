Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAB3C83F0A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 17:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C5F10E35F;
	Wed,  9 Jul 2025 17:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTyLWS2F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F29A10E35F
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 17:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752082853; x=1783618853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gWabakRjt7ISq6EZwykcHufFdKay7JUQAktneRTZff8=;
 b=CTyLWS2FV2bd+EW5dk1Rsd1e4Il6qVlWNcts2cVilEIRf6KIHgXD69WA
 7QQitVofOdLVfx7LGDErdzA3q5JLCahU3nGGmndaHGS/icO7xAEvDcC20
 Qk4CuW5dfuXb7mbW8968b+xhkm12ARapYf5glqiEM7ZrBA0T4NFX+IE1F
 Qx2JFYzO/d6OZSJ59fg4x8cFNWxLYvW1qLfGneYk6BaY+mSHO4yfvFBpP
 bMBBhN7HTOJL1LhG3CwrEeeieH/15RgG3Np3tisTJBzBNFbIHyUEuUOZM
 DG6Xj8yYHhsyDzSqy+QTDLUpjY6SHQVVyOi33WjU9cqtyQgGsliuUcC5Q g==;
X-CSE-ConnectionGUID: CXKBO9RTQ0qWSQsSXluFCA==
X-CSE-MsgGUID: eg/HHpL9SoWuNDRjC+xPDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="64932182"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="64932182"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 10:40:53 -0700
X-CSE-ConnectionGUID: 9Mv2Ix6sQoCGvkhHTo6zqQ==
X-CSE-MsgGUID: nz3LcImDSveZ6yzjWxzSQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="159863334"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 10:40:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 3/3] drm/xe/guc: Cancel ongoing H2G requests when stopping CT
Date: Wed,  9 Jul 2025 19:40:38 +0200
Message-Id: <20250709174038.1876-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250709174038.1876-1-michal.wajdeczko@intel.com>
References: <20250709174038.1876-1-michal.wajdeczko@intel.com>
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

Once we have started a GT reset sequence, which includes stopping
GuC CTB communication, we should also cancel all onging H2G send-
recv requests, as either GuC is already dead, or due to imminent
reset GuC will not be able to reply, or due to internal cleanup
we will loose pending fences. With this we will report dedicated
-ECANCELED error instead of misleading -ETIME.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 17e5870baf33..b6acccfcd351 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -85,6 +85,7 @@ struct g2h_fence {
 	u16 error;
 	u16 hint;
 	u16 reason;
+	bool cancel;
 	bool retry;
 	bool fail;
 	bool done;
@@ -103,6 +104,13 @@ static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
 	g2h_fence->seqno = ~0x0;
 }
 
+static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
+{
+	g2h_fence->cancel = true;
+	g2h_fence->fail = true;
+	g2h_fence->done = true;
+}
+
 static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
 {
 	return g2h_fence->seqno == ~0x0;
@@ -388,6 +396,8 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
 				enum xe_guc_ct_state state)
 {
 	struct xe_gt *gt = ct_to_gt(ct);
+	struct g2h_fence *g2h_fence;
+	unsigned long idx;
 
 	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
 	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
@@ -406,6 +416,14 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
 
 	spin_unlock_irq(&ct->fast_lock);
 
+	/* cancel all in-flight send-recv requests */
+	xa_for_each(&ct->fence_lookup, idx, g2h_fence)
+		g2h_fence_cancel(g2h_fence);
+
+	/* make sure guc_ct_send_recv() will see g2h_fence changes */
+	smp_mb();
+	wake_up_all(&ct->g2h_fence_wq);
+
 	/*
 	 * Lockdep doesn't like this under the fast lock and he destroy only
 	 * needs to be serialized with the send path which ct lock provides.
@@ -1098,6 +1116,11 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		goto retry;
 	}
 	if (g2h_fence.fail) {
+		if (g2h_fence.cancel) {
+			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
+			ret = -ECANCELED;
+			goto unlock;
+		}
 		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
 			  action[0], g2h_fence.error, g2h_fence.hint);
 		ret = -EIO;
@@ -1106,6 +1129,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	if (ret > 0)
 		ret = response_buffer ? g2h_fence.response_len : g2h_fence.response_data;
 
+unlock:
 	mutex_unlock(&ct->lock);
 
 	return ret;
-- 
2.47.1

