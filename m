Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C39D29DC5
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 02:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD2910E457;
	Tue, 13 Jan 2026 02:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJbTXZG8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416B210E307
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 02:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768272759; x=1799808759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wn2c2UQBMRYL5KxyX/z7YPf579vwRFL6Bd/Q2KCPd+0=;
 b=eJbTXZG8loFqirXFtjhiBPRD4SN5i+J9ZNsHMV3njF4jibAVGCCJFcLl
 7MbFbuhZfRNLsXZv7FPsiOpo67sa6wIPmif7j2qTrmgCqPi1S+w5whlL4
 5qk1bBBYPEeu1Rhp4otTzDrZp2F1G2EctcZxj2ltJ2jhFlrXj+4jx1954
 TBDvB3YXK6h5GkB512Wi/N31V/mehCnV3xKo/91iYwFapb2OvnRMKotXH
 MItvJWu7LyZxJYvufTLPsPAL3fztieChdXvi9WVTJXKTzTSUv0MPDPPFa
 QfOptstkaUlWefhr3qWYE7KNBKTDD0HzeRICSntdCJTw2TuG9hMvBp65E w==;
X-CSE-ConnectionGUID: X2WrSLKlQJypjYqWTnJt7g==
X-CSE-MsgGUID: bWp3hR3kTCWdJ0aLb6KDOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69714532"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69714532"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:38 -0800
X-CSE-ConnectionGUID: 68KQzHWMTk6PPPzK7sBOhw==
X-CSE-MsgGUID: yAF1hhB/TxOMZeGz5jwWwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204070333"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v4 09/12] drm/xe: Add xe_tlb_inval_idle helper
Date: Mon, 12 Jan 2026 18:52:29 -0800
Message-Id: <20260113025232.3504648-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113025232.3504648-1-matthew.brost@intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
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

Introduce the xe_tlb_inval_idle helper to detect whether any TLB
invalidations are currently in flight. This is used in context-based TLB
invalidations to determine whether dummy TLB invalidations need to be
sent to maintain proper TLB invalidation fence ordering..

v2:
 - Implement xe_tlb_inval_idle based on pending list

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 014a78502fe5..daabc9370510 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -44,11 +44,14 @@ static void xe_tlb_inval_fence_fini(struct xe_tlb_inval_fence *fence)
 static void
 xe_tlb_inval_fence_signal(struct xe_tlb_inval_fence *fence)
 {
+	struct xe_tlb_inval *tlb_inval = fence->tlb_inval;
 	bool stack = test_bit(FENCE_STACK_BIT, &fence->base.flags);
 
 	lockdep_assert_held(&fence->tlb_inval->pending_lock);
 
 	list_del(&fence->link);
+	if (list_empty(&tlb_inval->pending_fences))
+		cancel_delayed_work(&tlb_inval->fence_tdr);
 	trace_xe_tlb_inval_fence_signal(fence->tlb_inval->xe, fence);
 	xe_tlb_inval_fence_fini(fence);
 	dma_fence_signal(&fence->base);
@@ -464,3 +467,21 @@ void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
 		dma_fence_get(&fence->base);
 	fence->tlb_inval = tlb_inval;
 }
+
+/**
+ * xe_tlb_inval_idle() - Initialize TLB invalidation is idle
+ * @tlb_inval: TLB invalidation client
+ *
+ * Check the TLB invalidation seqno to determine if it is idle (i.e., no TLB
+ * invalidations are in flight). Expected to be called in the backend after the
+ * fence has been added to the pending list, and takes this into account.
+ *
+ * Return: True if TLB invalidation client is idle, False otherwise
+ */
+bool xe_tlb_inval_idle(struct xe_tlb_inval *tlb_inval)
+{
+	lockdep_assert_held(&tlb_inval->seqno_lock);
+
+	guard(spinlock_irq)(&tlb_inval->pending_lock);
+	return list_is_singular(&tlb_inval->pending_fences);
+}
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
index 858d0690f995..62089254fa23 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
@@ -43,4 +43,6 @@ xe_tlb_inval_fence_wait(struct xe_tlb_inval_fence *fence)
 
 void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno);
 
+bool xe_tlb_inval_idle(struct xe_tlb_inval *tlb_inval);
+
 #endif	/* _XE_TLB_INVAL_ */
-- 
2.34.1

