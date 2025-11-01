Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51CFCCFA08
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 01:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51D610E30A;
	Sat,  1 Nov 2025 01:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="favu5tqL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912FF10E110
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 01:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761958954; x=1793494954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Be7wAjpMZ0ecdqw4B5w9Ma6L1ntmbjJla6i/GqV2GVE=;
 b=favu5tqLcJ+RqG0s/brrEHDMjFsYf5s60KPRVtBuJnXIG4eknACV8JNf
 ZCTpr5RemFhwwPw3hWiRDPnNXZajpz33xOWHUcpIhEP3iwXD5Idd182q2
 QbHzE8u+CRwQqnM5P5Ha2fWadcdEAVq/bbXfB6r9HlaNNPpsUL4iVrQXy
 5Z6EX6fVENTmMr/cvBEOfzR/zoYyLVdgH/8u7pRKXW8OicHxE4hf9aqIA
 zMivCmYJSVxvVmTUycYPrGVlum2kp+tXxfAzYe/ly3aC4yj0f1SMjNrWj
 vlJiT+0byqZjOqzESNSBijl7vMzTly/yX1BA/BZQvnGZPrdWYfzGKhfmQ A==;
X-CSE-ConnectionGUID: AaHf6ZDzS4etk6bedwhtjQ==
X-CSE-MsgGUID: DTveVE0VTLGJHHeUuHkZ5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75575700"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="75575700"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:32 -0700
X-CSE-ConnectionGUID: n+0dcyF6S62EWp3tuiSr4w==
X-CSE-MsgGUID: xczGGFpNSZq/GZYsi5xB/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="217020191"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH 09/12] drm/xe: Add xe_tlb_inval_idle helper
Date: Fri, 31 Oct 2025 18:02:22 -0700
Message-Id: <20251101010225.3095457-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251101010225.3095457-1-matthew.brost@intel.com>
References: <20251101010225.3095457-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 7ee081b94f90..32a0a882343b 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -141,6 +141,7 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
 
 	tlb_inval->xe = xe;
 	tlb_inval->seqno = 1;
+	tlb_inval->seqno_recv = TLB_INVALIDATION_SEQNO_MAX - 1;
 	INIT_LIST_HEAD(&tlb_inval->pending_fences);
 	spin_lock_init(&tlb_inval->pending_lock);
 	spin_lock_init(&tlb_inval->lock);
@@ -443,3 +444,28 @@ void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
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
+ * seqno has been bumped, and takes this into account.
+ *
+ * Return: True if TLB invalidation client is idle, False otherwise
+ */
+bool xe_tlb_inval_idle(struct xe_tlb_inval *tlb_inval)
+{
+	int next_recv;
+
+	lockdep_assert_held(&tlb_inval->seqno_lock);
+
+	guard(spinlock_irq)(&tlb_inval->pending_lock);
+
+	next_recv = (tlb_inval->seqno_recv + 2) % TLB_INVALIDATION_SEQNO_MAX;
+	if (!next_recv)
+		next_recv = 1;
+
+	return next_recv == tlb_inval->seqno;
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

