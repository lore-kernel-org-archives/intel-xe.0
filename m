Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786F2C87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 22:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C7E10E156;
	Wed,  6 Aug 2025 22:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIWkKE9b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A2910E31E
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 22:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754519047; x=1786055047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hShGc15C5N3wUovK1ZjFnHYDhDYiKDO6Mp/RTrLExy4=;
 b=JIWkKE9bqBbhHro/0A4tueaUaCmEvIgZSW+ndCWaLgpiMwr5tU+NUfMK
 609VRwGSOJ6c5DMfW+mG0C1ibbbG2PD8HpcwqOLpJqAQrw7Cuy3614Zix
 lQg3NX7KyMEgj4qrY+SdpSmpAEgbPn4OnRbYw9yOHZ8WvyFDSocXkSgrN
 XDemG5NhPrqcQ9v5SgL3MOA8fLZCD00lsuy8JvObL1QtH8bYGFflaatbP
 8Oc+8ImBp2x61eVnNKoevi7KHCAz91VhfEX5ZqBgs2ZVaCrQUmndnNLRw
 HsEhjK1JXxgmt9ioJOfZBrP4qigyX7jDc58s2L+VtFi2cwynbZA8Gxm24 w==;
X-CSE-ConnectionGUID: FYGYwobMTOGmHl1mrpwmAw==
X-CSE-MsgGUID: LzlkDZdmSBakgvb8IB0ucA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56928150"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56928150"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 15:24:07 -0700
X-CSE-ConnectionGUID: sKDEjn4QRXWmLxR0fNxWNw==
X-CSE-MsgGUID: nQxcq+ntRi+BLLGJL/NvFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="188560819"
Received: from dut136arlu.fm.intel.com ([10.105.23.73])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 15:24:06 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, farah.kassabri@intel.com,
 intel-xe@lists.freedesktop.org, stuartsummers <stuart.summers@intel.com>
Subject: [PATCH 1/8] drm/xe: Move explicit CT lock in TLB invalidation sequence
Date: Wed,  6 Aug 2025 22:23:57 +0000
Message-Id: <20250806222404.30333-2-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806222404.30333-1-stuart.summers@intel.com>
References: <20250806222404.30333-1-stuart.summers@intel.com>
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

We already have a lock tracking the fences/sequence numbers
here (pending_lock). And the GuC CT code already has an
implicit version of this lock in the ct_send routine.
Prepare the way for future optimizations in TLB invalidation
flow by moving the mutex lock down into the GuC CT send
routine rather than in the upper TLB invalidation layer.

Signed-off-by: stuartsummers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 02f0bb92d6e0..230f30161395 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -158,7 +158,6 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 	 * appear.
 	 */
 
-	mutex_lock(&gt->uc.guc.ct.lock);
 	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
 	/*
@@ -178,7 +177,6 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 				 &gt->tlb_invalidation.pending_fences, link)
 		invalidation_fence_signal(gt_to_xe(gt), fence);
 	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
-	mutex_unlock(&gt->uc.guc.ct.lock);
 }
 
 static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
@@ -211,13 +209,12 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	 * need to be updated.
 	 */
 
-	mutex_lock(&guc->ct.lock);
 	seqno = gt->tlb_invalidation.seqno;
 	fence->seqno = seqno;
 	trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
 	action[1] = seqno;
-	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
-				    G2H_LEN_DW_TLB_INVALIDATE, 1);
+	ret = xe_guc_ct_send(&guc->ct, action, len,
+			     G2H_LEN_DW_TLB_INVALIDATE, 1);
 	if (!ret) {
 		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 		/*
@@ -248,7 +245,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 		if (!gt->tlb_invalidation.seqno)
 			gt->tlb_invalidation.seqno = 1;
 	}
-	mutex_unlock(&guc->ct.lock);
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
 
 	return ret;
-- 
2.34.1

