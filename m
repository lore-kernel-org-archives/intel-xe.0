Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C29EB64DC
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 21:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A25C10E3A0;
	Wed, 28 Jun 2023 21:41:45 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71DE10E0F5
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 21:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687988498; x=1719524498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zU29b8YLluAVz5s+ZxwPDe1xFnXP6Bj7ImCaiaS/bQA=;
 b=dM0bx0BC6bN4kM/252v+ge3n9RrdBLPXTQBqPgAtbAoXiw6sc+Q8KCy9
 TswhgKwRzFNMFwKwqwJCLiaspfPWGIvjB7vDNGmfDEf6msMo1KRR8kvDG
 bR1w+Axj0G65u3qrJ24F4a9qBYzPBs+hoeCg+mL2ADzdK+k1Wxt1S/YmA
 x0UHxrVI52QuS7tZic/tHNYqg/5RPNcGoBzMGYutriWjCN1V9aroPmvfC
 eeLVixaN8TRQ0cR6ocIXADq+pQ1Q5cFQP7IEm7SKTIpjwFHhW0m5FF3gs
 y4GwVWT6Cs6Kep64BPZUxafQUq/HmkTWeBlZfG1FhB1+YfAMZ+RKMBKVW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="351760095"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="351760095"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 14:41:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="711183696"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="711183696"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 14:41:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 28 Jun 2023 14:41:25 -0700
Message-Id: <20230628214127.870717-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230628214127.870717-1-matthew.brost@intel.com>
References: <20230628214127.870717-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/9] drm/xe: Remove __xe_vm_bind forward
 declaration
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

Not needed so remove it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0fd200b3b810..c7a6fcc05948 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -694,11 +694,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	trace_xe_vm_rebind_worker_exit(vm);
 }
 
-struct async_op_fence;
-static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
-			struct xe_engine *e, struct xe_sync_entry *syncs,
-			u32 num_syncs, struct async_op_fence *afence);
-
 static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 				   const struct mmu_notifier_range *range,
 				   unsigned long cur_seq)
-- 
2.34.1

