Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8419C41513
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jul 2024 00:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B4510E162;
	Sat,  6 Jul 2024 00:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/0xMmJv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1831A10E0E4
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jul 2024 00:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720224137; x=1751760137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/fEiBIASVaj8vuc7DpjHafCM/EJYK4ZkyHIEJL61iYU=;
 b=R/0xMmJvCiDDlaV1VGds90guNydPcz7AvUFm8fgntL8QiJbaKmdkV8Ll
 neSC+HHXhCEe8X3XI19tEkRfoemZBU79GIOJ0jxJlVzvlOpbLpFByB5Sf
 OnBSJvYAiPWE8eY5S5X6TdyE2W6UAEY0fecQf5KWmR06ZEY6kcNLxLiq8
 z9gUm2Ep/dzdK/cRhXLqDDh8OG/Fy1sAyS6RMor+2arW+4xyOjLu/i0iw
 zoILoaIoK9v8CaTBXwwbbiE2+skTIOEoINl1gxSPirEQzcixunrJMAP1p
 0U9y342hYkI5sXKXg79jTAQz1j1ZmR6hKSHaPTuBwqDFGRp2tF3aZp6La A==;
X-CSE-ConnectionGUID: l6B5rj06SMq2JnxF4i0SRA==
X-CSE-MsgGUID: AOU8CxejSUa4LTP58BMDIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17464656"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="17464656"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:14 -0700
X-CSE-ConnectionGUID: co9wF6j0Qc6rWogg4tPuXg==
X-CSE-MsgGUID: yJNrxmurSVKvmc8OypbewA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="78128242"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: farah.kassabri@intel.com,
	michal.wajdeczko@intel.com
Subject: [PATCH 03/11] drm/xe:
 s/tlb_invalidation.lock/tlb_invalidation.fence_lock
Date: Fri,  5 Jul 2024 17:02:44 -0700
Message-Id: <20240706000252.702044-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240706000252.702044-1-matthew.brost@intel.com>
References: <20240706000252.702044-1-matthew.brost@intel.com>
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

tlb_invalidation.lock is the lock for GT TLB invalidation fences, name
this accurately.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++----
 drivers/gpu/drm/xe/xe_gt_types.h            | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 687214d07ac7..147840b66ba9 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -80,7 +80,7 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 	gt->tlb_invalidation.seqno = 1;
 	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
 	spin_lock_init(&gt->tlb_invalidation.pending_lock);
-	spin_lock_init(&gt->tlb_invalidation.lock);
+	spin_lock_init(&gt->tlb_invalidation.fence_lock);
 	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
 			  xe_gt_tlb_fence_timeout);
 
@@ -491,11 +491,11 @@ static const struct dma_fence_ops invalidation_fence_ops = {
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 				       struct xe_gt_tlb_invalidation_fence *fence)
 {
-	spin_lock_irq(&gt->tlb_invalidation.lock);
+	spin_lock_irq(&gt->tlb_invalidation.fence_lock);
 	dma_fence_init(&fence->base, &invalidation_fence_ops,
-		       &gt->tlb_invalidation.lock,
+		       &gt->tlb_invalidation.fence_lock,
 		       dma_fence_context_alloc(1), 1);
-	spin_unlock_irq(&gt->tlb_invalidation.lock);
+	spin_unlock_irq(&gt->tlb_invalidation.fence_lock);
 	INIT_LIST_HEAD(&fence->link);
 	dma_fence_get(&fence->base);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 6b5e0b45efb0..d190a66514c0 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -192,8 +192,8 @@ struct xe_gt {
 		 * xe_gt_tlb_fence_timeout after the timeut interval is over.
 		 */
 		struct delayed_work fence_tdr;
-		/** @tlb_invalidation.lock: protects TLB invalidation fences */
-		spinlock_t lock;
+		/** @tlb_invalidation.fence_lock: protects TLB invalidation fences */
+		spinlock_t fence_lock;
 	} tlb_invalidation;
 
 	/**
-- 
2.34.1

