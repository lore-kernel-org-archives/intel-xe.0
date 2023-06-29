Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C9BC001B1
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 18:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB30B10E150;
	Thu, 29 Jun 2023 18:30:24 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916E210E150
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 18:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688063423; x=1719599423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zU29b8YLluAVz5s+ZxwPDe1xFnXP6Bj7ImCaiaS/bQA=;
 b=E1rCemfxO1PAvFhCoE3qauZnF+Jm9HoKEy2ECEj+E+AhjA+YFS9uMNAp
 GVwRo87WGIQ5xCKQ94+StGIyeyN4ksa3SB4IITqHimGortGI0h9oc3ZgU
 Ekkby9E/MGCCc5it8xSy5efBaylGDOWDGtRr4YR2EDcrNMxX6OIUmWtC7
 95Amw1Wq+kXr0k08JnsR4beM2Jbp+VqE4wMbzKdE8Ak/stwrz7mOItyb/
 xlMkC4p09DUOvwgoGENnPqkfgNcGQJI+pob4vnvyxcHal//fC/UzOWmns
 v2hSHMmfRzqVhqWMsMd3BLdCSwOsni4BAFBQYkzsdqoAr5f0+ooltAqEc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="448572593"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="448572593"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 11:30:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711549551"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="711549551"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 11:30:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 29 Jun 2023 11:30:33 -0700
Message-Id: <20230629183034.930121-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230629183034.930121-1-matthew.brost@intel.com>
References: <20230629183034.930121-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 7/8] drm/xe: Remove __xe_vm_bind forward
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

