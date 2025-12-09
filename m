Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CC9D3B996
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 20:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF55110E625;
	Tue,  9 Dec 2025 20:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YB2MLB6Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CFF10E625
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 20:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765310903; x=1796846903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=an7wbbdwjrC642b0+1VURTgkkvhnFv03Bd3HG0zG3bw=;
 b=YB2MLB6Y5rtVoj56a/TFrZLw3ZeTUBBKQClfZ3fMWl5ZPS1oVlA32JEq
 XFQZJOd5zZ1wLjgvSkcjLZD4OnOV+xh+27BNP7eUbI6btqVVkVAzyq2RU
 720BMK7mAc7el28cYeXOAcUyt0M4ty4NvE//AgGXUZDdBn86vMc7PwnZv
 9jkdDG/2bpZWS067WNKl31Eo6Q3vRWYvlmqEaMGM+hbvVR6BRGaJKZfpH
 vR7uzTTSsB8/uEGGtRKHI3N/UWBlMm+rEjrcyh6EZk9JoaT9txHb2V7b7
 S9unwVbzKMoGBS0moAaCKM5OITK6mhsdClSpCquRHegWhU5B/t8xw7+sw w==;
X-CSE-ConnectionGUID: Pn6EeREdRwCFAqCLJJkBcQ==
X-CSE-MsgGUID: xk+e4O2gT/Ka6mE9q9C5XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67328702"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67328702"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:08:23 -0800
X-CSE-ConnectionGUID: Y7MWlf33S+u5kmfDewUE0Q==
X-CSE-MsgGUID: gSZoOOvpQS+W9QbAuNQ24w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="195563880"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa010.jf.intel.com with ESMTP; 09 Dec 2025 12:08:21 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com
Subject: [PATCH v4 01/10] drm/xe: Do not forward invalid TLB invalidation
 seqnos to upper layers
Date: Wed, 10 Dec 2025 04:08:17 +0800
Message-ID: <20251209200815.2570770-13-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209200815.2570770-12-brian3.nguyen@intel.com>
References: <20251209200815.2570770-12-brian3.nguyen@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Certain TLB invalidation operations send multiple H2G messages per seqno
with only the final H2G containing the valid seqno - the others carry an
invalid seqno. The G2H handler drops these invalid seqno to aovid
prematurely signaling a TLB invalidation fence.

With TLB_INVALIDATION_SEQNO_INVALID used to indicate in progress
multi-step TLB invalidations, reset tdr to ensure that timeout
won't prematurely trigger when G2H actions are still ongoing.

v2: Remove lock from xe_tlb_inval_reset_timeout. (Matthew B)

v3: Squash with dependent patch from Matthew Brost' series.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval_types.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 918a59e686ea..a122fbb9fc4a 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -199,6 +199,20 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval)
 	mutex_unlock(&tlb_inval->seqno_lock);
 }
 
+/**
+ * xe_tlb_inval_reset_timeout() - Reset TLB inval fence timeout
+ * @tlb_inval: TLB invalidation client
+ *
+ * Reset the TLB invalidation timeout timer.
+ */
+static void xe_tlb_inval_reset_timeout(struct xe_tlb_inval *tlb_inval)
+{
+	lockdep_assert_held(&tlb_inval->pending_lock);
+
+	mod_delayed_work(system_wq, &tlb_inval->fence_tdr,
+			 tlb_inval->ops->timeout_delay(tlb_inval));
+}
+
 static bool xe_tlb_inval_seqno_past(struct xe_tlb_inval *tlb_inval, int seqno)
 {
 	int seqno_recv = READ_ONCE(tlb_inval->seqno_recv);
@@ -360,6 +374,12 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno)
 	 * process_g2h_msg().
 	 */
 	spin_lock_irqsave(&tlb_inval->pending_lock, flags);
+	if (seqno == TLB_INVALIDATION_SEQNO_INVALID) {
+		xe_tlb_inval_reset_timeout(tlb_inval);
+		spin_unlock_irqrestore(&tlb_inval->pending_lock, flags);
+		return;
+	}
+
 	if (xe_tlb_inval_seqno_past(tlb_inval, seqno)) {
 		spin_unlock_irqrestore(&tlb_inval->pending_lock, flags);
 		return;
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 8f8b060e9005..7a6967ce3b76 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -80,6 +80,7 @@ struct xe_tlb_inval {
 	const struct xe_tlb_inval_ops *ops;
 	/** @tlb_inval.seqno: TLB invalidation seqno, protected by CT lock */
 #define TLB_INVALIDATION_SEQNO_MAX	0x100000
+#define TLB_INVALIDATION_SEQNO_INVALID	TLB_INVALIDATION_SEQNO_MAX
 	int seqno;
 	/** @tlb_invalidation.seqno_lock: protects @tlb_invalidation.seqno */
 	struct mutex seqno_lock;
-- 
2.52.0

