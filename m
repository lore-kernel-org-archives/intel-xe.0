Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38083C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 14:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8BA113D23;
	Thu, 18 Apr 2024 14:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EnY5Fp/u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2991C113D23
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 14:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713451599; x=1744987599;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z3mTEkxt9ohd/kK18SRZGGElRcKpIen9Ijq5NXo+bKw=;
 b=EnY5Fp/uGmsmHF4B6Gq/awYKBEMDdlyLXtIuLDi0jCzJrVY3yDAq646V
 Jt1Gs3sRrlN9zP2UGEFO6RFthwSf6Kd7fkyFrCyjGdkTBun8dc5+p4vUr
 hvjLU0vSuSV0fuhJWkOq8pf0HAvU5OHaP0Jn7vp433CCrqBARRl/XECgD
 xmRjzH2TtLBjhUTCO843VJijusTPW5eY0jRh/mw3OqMOIIfpCWfpvOfvl
 v0VOAdNmqRkaza0zLXJuonMkrD8IPMx699xoeBaXEW4qU8T2wCjPIdA96
 CCcEFrCwWS0fF0L613ofn8iBNQ1V8WWJl1AHoeC8U9L04E1vHpdaizH4K w==;
X-CSE-ConnectionGUID: zkdE2/TCRVerxjQAueyX3Q==
X-CSE-MsgGUID: t3IqJDNPSEmfer396/SG6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8876390"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8876390"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 07:46:39 -0700
X-CSE-ConnectionGUID: J6N33UdMQACRmQtiDz3cJA==
X-CSE-MsgGUID: IMgKAoICQ3GWTLq1NVgsTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="27666319"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.92])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 07:46:37 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/preempt_fence: enlarge the fence critical section
Date: Thu, 18 Apr 2024 15:46:31 +0100
Message-ID: <20240418144630.299531-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
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

It is really easy to introduce subtle deadlocks in
preempt_fence_work_func() since we operate on single global ordered-wq
for signalling our preempt fences behind the scenes, so even though we
signal a particular fence, everything in the callback should be in the
fence critical section, since blocking in the callback will prevent
other published fences from signalling. If we enlarge the fence critical
section to cover the entire callback, then lockdep should be able to
understand this better, and complain if we grab a sensitive lock like
vm->lock, which is also held when waiting on preempt fences.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_preempt_fence.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index 7d50c6e89d8e..5b243b7feb59 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -23,11 +23,19 @@ static void preempt_fence_work_func(struct work_struct *w)
 		q->ops->suspend_wait(q);
 
 	dma_fence_signal(&pfence->base);
-	dma_fence_end_signalling(cookie);
-
+	/*
+	 * Opt for keep everything in the fence critical section. This looks really strange since we
+	 * have just signalled the fence, however the preempt fences are all signalled via single
+	 * global ordered-wq, therefore anything that happens in this callback can easily block
+	 * progress on the entire wq, which itself may prevent other published preempt fences from
+	 * ever signalling.  Therefore try to keep everything here in the callback in the fence
+	 * critical section. For example if something below grabs a scary lock like vm->lock,
+	 * lockdep should complain since we also hold that lock whilst waiting on preempt fences to
+	 * complete.
+	 */
 	xe_vm_queue_rebind_worker(q->vm);
-
 	xe_exec_queue_put(q);
+	dma_fence_end_signalling(cookie);
 }
 
 static const char *
-- 
2.44.0

