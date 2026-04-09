Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B2310FC456
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 00:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4C210E6F7;
	Thu,  9 Apr 2026 00:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMMeOu/g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321C710E6F7
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 00:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775695134; x=1807231134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p/wbuiQBzQfQP96Kde1jvviRQk3OjHc7BXvX/UvmUXk=;
 b=RMMeOu/gHmhUS65Wa8/u36X30ew9KjEf7Phw9KH2zrQ0+FkS2SQIodqz
 PVYPER2w50Jsj3dOpclS8Tt++LBM1agQ+pIjs7j+Rw6fLcypAOa3RgL0l
 49hQkEtUOwdwLFPazEzuMTz8p/xIoNURUecODUxhZTRyteYr+rxxXGBY6
 h1MOEJ0EYg8d38uQFoJTKHwz45LoeSC4CXSGuoICfq+WxYVNHP0LeQRkT
 sCWtFlmAJ3bOwMWDwbwyP7H/mNkS5omlGX951OSEyTWrtItbK9aU85OIF
 fZVThq4F6iyZsI15gS+jwt8cX2pE3DHkCVMW2LTueBJIYayfosm34wF4u A==;
X-CSE-ConnectionGUID: N1KbAo63Rqq5NegCO8zyDg==
X-CSE-MsgGUID: W/LN1QVARxuRlpy1+NHYqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="88143339"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="88143339"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 17:38:54 -0700
X-CSE-ConnectionGUID: oFlRD3KtT/+JCuhqaUzOMg==
X-CSE-MsgGUID: JHmfSsxwQ6+BGMMTDaHNxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="225847081"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 08 Apr 2026 17:38:52 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix potential NULL deref in
 xe_exec_queue_tlb_inval_last_fence_put_unlocked
Date: Thu,  9 Apr 2026 00:34:49 +0000
Message-ID: <20260409003449.3405767-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

xe_exec_queue_tlb_inval_last_fence_put_unlocked() uses q->vm->xe as the
first argument to xe_assert(). This function is called unconditionally
from xe_exec_queue_destroy() for all queues, including kernel queues
that have q->vm == NULL (e.g., queues created during GT init in
xe_gt_record_default_lrcs() with vm=NULL).

While current compilers optimize away the q->vm->xe dereference (even
in CONFIG_DRM_XE_DEBUG=y builds, the compiler pushes the dereference
into the WARN branch that is only taken when the assert condition is
false), the code is semantically incorrect and constitutes undefined
behavior in the C abstract machine for the NULL pointer case.

Use gt_to_xe(q->gt) instead, which is always valid for any exec queue.
This is consistent with how xe_exec_queue_destroy() itself obtains the
xe_device pointer in its own xe_assert at the top of the function.

Fixes: b2d7ec41f2a3 ("drm/xe: Attach last fence to TLB invalidation job queues")
Cc: Matthew Brost <matthew.brost@intel.com>
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 4603ff08d860..071b8c41df43 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1763,7 +1763,7 @@ void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q,
 void xe_exec_queue_tlb_inval_last_fence_put_unlocked(struct xe_exec_queue *q,
 						     unsigned int type)
 {
-	xe_assert(q->vm->xe, type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
+	xe_assert(gt_to_xe(q->gt), type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
 		  type == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
 
 	dma_fence_put(q->tlb_inval[type].last_fence);
-- 
2.43.0

