Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF42CEBF92
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 09:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4237910E466;
	Tue, 18 Nov 2025 09:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMSQK6fX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AED410E45B
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 09:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456759; x=1794992759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i2Q0pt0uSzHIW1GY7gmhpiLEKucIxMjvU9jEW8Hl7L4=;
 b=mMSQK6fX01eHzuG0PSFYvQKuerYjdPa+va/HgnVXi32vCVm04fKxLN0w
 tZoP8TShOsTz4sGWWLTqHfuo/MzpoJDfOccwTHQKB0x2XgRo+fyQWE4Gc
 RGxwv5hnD8FJqrv1NNqJKK+09Tg1M+8vuZ5iejg9dNeCar6CSkGJmfCjc
 Bj1dp8v2jm87OKB7d4ensZPqv72qQvpkw6dxkmwt+tfkwfFgpo07t6BfG
 akpbbnQsAtJVoCZ7WcRGC/8knWt4Vbyef77lrhltpcVblQiPsmlDIATrB
 y4Ufhig6NTs7f9noyKYI5Xm3/fQTtLmeJmJGcVelJZrRU5M5aX0aM/nl4 Q==;
X-CSE-ConnectionGUID: au3kRklQStemks0cPoJLgQ==
X-CSE-MsgGUID: qypUJicORtOMYU6vwxSHNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="83097755"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="83097755"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:05:58 -0800
X-CSE-ConnectionGUID: iHv5r2X+TFeI57U4mZ1lkQ==
X-CSE-MsgGUID: aiM76RyKRNGH8J2PEF1QJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190500836"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa009.jf.intel.com with ESMTP; 18 Nov 2025 01:05:57 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 02/11] drm/xe: Reset tlb fence timeout on invalid seqno
 received
Date: Tue, 18 Nov 2025 17:05:43 +0800
Message-ID: <20251118090552.246243-3-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118090552.246243-1-brian3.nguyen@intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
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

TLB_INVALIDATION_SEQNO_INVALID are now used to indicate in progress
multi-step TLB invalidations, so reset tdr to ensure that action
won't prematurely trigger when G2H actions are still ongoing.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c |  2 ++
 drivers/gpu/drm/xe/xe_tlb_inval.c     | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h     |  1 +
 3 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index f1fd2dd90742..cd126c53faab 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -238,6 +238,8 @@ int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	if (msg[0] != TLB_INVALIDATION_SEQNO_INVALID)
 		xe_tlb_inval_done_handler(&gt->tlb_inval, msg[0]);
+	else
+		xe_tlb_inval_reset_timeout(&gt->tlb_inval);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 918a59e686ea..50f05d6b5672 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -199,6 +199,22 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval)
 	mutex_unlock(&tlb_inval->seqno_lock);
 }
 
+/**
+ * xe_tlb_inval_reset_timeout() - Reset TLB inval fence timeout
+ * @tlb_inval: TLB invalidation client
+ *
+ * Reset the TLB invalidation timeout timer.
+ */
+void xe_tlb_inval_reset_timeout(struct xe_tlb_inval *tlb_inval)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&tlb_inval->pending_lock, flags);
+	mod_delayed_work(system_wq, &tlb_inval->fence_tdr,
+			 tlb_inval->ops->timeout_delay(tlb_inval));
+	spin_unlock_irqrestore(&tlb_inval->pending_lock, flags);
+}
+
 static bool xe_tlb_inval_seqno_past(struct xe_tlb_inval *tlb_inval, int seqno)
 {
 	int seqno_recv = READ_ONCE(tlb_inval->seqno_recv);
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
index 05614915463a..9dbddc310eb9 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
@@ -17,6 +17,7 @@ struct xe_vm;
 int xe_gt_tlb_inval_init_early(struct xe_gt *gt);
 
 void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
+void xe_tlb_inval_reset_timeout(struct xe_tlb_inval *tlb_inval);
 int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
 		     struct xe_tlb_inval_fence *fence);
 int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
-- 
2.51.2

