Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F934CCFA17
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 19:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E796A10E66D;
	Tue,  4 Nov 2025 19:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGzCT3ad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56DA10E666
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 19:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762286183; x=1793822183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wVoHKPen9dDFkV+TX5Tq9P2AgzMI9mRw6bPqXaohbGw=;
 b=oGzCT3ad+yV0EVcrbdcUJJz6xk3kDw9C2kv3hw+m1erW0OfBdkzuMYHb
 8/uI782z5M3ndzydESZyTJTI2KXhS70V22C1BViGDwpnE6cR/ykHP32w0
 70Sf6XFrs1ml7ZZoQuvLZxw/Y63JxcFtjhTSD+RbIrAvU5VjPTugX4hsq
 4A3yG0hF52fVQAFJF/uYD0sALl4vARYGuGb+BkIxXpUuyFuX2SKRjC+i6
 mBhfzisB8GwY5sU2bv2lN5xARvLnv4ZqEt8pyu2Jb6zunI0mBV/8z7ynw
 SFHrE9FF6ENvx9Bz7RgnSOaRr/sdqMlPBmgG+Y0AV04fdNPWv2qRpX/Wv A==;
X-CSE-ConnectionGUID: M1KeXd3YTZeHIU1MzCFU3g==
X-CSE-MsgGUID: 6mJj+cDyTc62ujqxflPmUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74686114"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="74686114"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:56:22 -0800
X-CSE-ConnectionGUID: nHbEfEzqRk2XpazVZYtcUQ==
X-CSE-MsgGUID: E8pDAA2oQaO1MUZLrlveKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="218051149"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:56:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH v2 09/12] drm/xe: Add xe_tlb_inval_idle helper
Date: Tue,  4 Nov 2025 11:56:13 -0800
Message-Id: <20251104195616.3339137-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104195616.3339137-1-matthew.brost@intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 7ee081b94f90..7ae6b9f884e9 100644
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
@@ -443,3 +446,21 @@ void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
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
index 05614915463a..44a6d9177489 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
@@ -43,4 +43,6 @@ xe_tlb_inval_fence_wait(struct xe_tlb_inval_fence *fence)
 
 void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno);
 
+bool xe_tlb_inval_idle(struct xe_tlb_inval *tlb_inval);
+
 #endif	/* _XE_TLB_INVAL_ */
-- 
2.34.1

