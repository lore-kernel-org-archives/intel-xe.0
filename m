Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB19ECA5FED
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 21:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A45B10E0A2;
	Tue,  6 Oct 2026 21:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKa5/ute";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523FC10E467
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 21:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791322172; x=1822858172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9vnuN6JAp1PwA7HnWfLXuomXqSizqDAPkX/DoyP0hJQ=;
 b=jKa5/utebIXYsNjSa9KoEVFguIyJ4wXilKNqgX9kVIvvgp3vOX3XLrM+
 I2i69lki1wHh7h4EwOqNlNdB8v96ss7wuPX0SjGlCV2ugDsFy8yFp94eF
 Wk0Ck/Yn8qh5NgCvhRmkIIrAahVmku8hpc6pkg+jsW6vTy9SRngm1M537
 FDXEb3z93fgHcDApdVR6HfiXjgRjNgbjdAQEZrAf8UMnnlWXcaT5p+ra0
 qt9w+Xwz0rTm9BCrcMuZuCEuT2UgoZ44AFy8+wXeQCH0VlKeFvaQiPTRN
 1qLVc/D31aViuw7WTAIlFbfA4FiXaVbADYJxD8zz/JbL01fOxApbWIvwE A==;
X-CSE-ConnectionGUID: BN/9jamaS/WHEzVaI8wfCg==
X-CSE-MsgGUID: Hxe+I2bmQQCmGNGMjZofNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="65930"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="65930"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 14:29:31 -0700
X-CSE-ConnectionGUID: l5sUqIECTCecKD4yLa+iig==
X-CSE-MsgGUID: HW1AqbzPSr6dJrqNldGVxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="306728925"
Received: from fyang16-desk.jf.intel.com ([10.24.81.66])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 14:29:31 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Fei Yang <fei.yang@intel.com>
Subject: [PATCH 1/1] drm/xe: fixing endless PF range response
Date: Tue,  6 Oct 2026 14:34:48 -0700
Message-ID: <20261006213449.4027749-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006213449.4027749-1-fei.yang@intel.com>
References: <20261006213449.4027749-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

[334.635636] PF range response: start=0x80200000  end=0xc0200000 pages=262144 (more ranges pending)
...
[519.065737] PF range response: start=0x5ca140200000 ...  (still going, 94888 messages logged)

SVM handler narrows the serviced range through functions
xe_pagefault_set_[start|end]_addr, which updates only the
consumer.[page|end]_addr. However a different field is used
for "immediate ack" cache, xe4_guc_ack_fault_range() reads
vma_info. This causes the ack fault to loop through the
whole address space with 1G pages, and that is wrong and
the loop takes a long while to complete.

VLK-99796

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 7 ++++++-
 drivers/gpu/drm/xe/xe_pagefault.h | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 5247321c805ec..72dfe27025736 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -694,6 +694,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 		/* Last fault same address, ack immediately */
 		if (xe_pagefault_match(pf, cache_start, cache_end, cache_asid)) {
 			xe_gt_stats_incr(gt, XE_GT_STATS_ID_LAST_PAGEFAULT_COUNT, 1);
+			xe_pagefault_set_start_addr(pf, cache_start);
+			xe_pagefault_set_end_addr(pf, cache_end);
 			goto ack_fault;
 		}
 
@@ -751,9 +753,12 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 				pf = xe_pagefault_queue_unchain_requeue(pf_queue, pf, gt);
 
 			/* Ensure resets are safe */
-			if (pf)
+			if (pf) {
 				pf->consumer.alloc_state =
 					XE_PAGEFAULT_ALLOC_STATE_ACTIVE;
+				xe_pagefault_set_start_addr(pf, cache_start);
+				xe_pagefault_set_end_addr(pf, cache_end);
+			}
 
 			spin_unlock_irq(&pf_queue->lock);
 		}
diff --git a/drivers/gpu/drm/xe/xe_pagefault.h b/drivers/gpu/drm/xe/xe_pagefault.h
index 799c984dee84f..5ce2f6ed10c56 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.h
+++ b/drivers/gpu/drm/xe/xe_pagefault.h
@@ -98,6 +98,7 @@ xe_pagefault_set_end_addr(struct xe_pagefault *pf, u64 end_addr)
 {
 	pf->consumer.end_addr &= ~XE_PAGEFAULT_END_ADDR_MASK;
 	pf->consumer.end_addr |= end_addr;
+	pf->consumer.vma_info.end_addr = end_addr;
 }
 
 /**
@@ -137,6 +138,7 @@ xe_pagefault_set_start_addr(struct xe_pagefault *pf, u64 start_addr)
 {
 	pf->consumer.page_addr &= XE_PAGEFAULT_ERROR_MASK;
 	pf->consumer.page_addr |= (start_addr & ~XE_PAGEFAULT_ERROR_MASK);
+	pf->consumer.vma_info.start_addr = start_addr;
 }
 
 /**
-- 
2.43.0

