Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DD3EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jun 2023 17:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD0710E4DE;
	Fri, 30 Jun 2023 17:58:01 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB2A10E4DC
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jun 2023 17:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688147879; x=1719683879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RBSJKZVBLoKiTysuztJjtBO9r3RLMNvF1jmUC/hCSnk=;
 b=dNCANTDZx/87zDB56+QCCnzhUHhJQDQnmhrlbmhjM9Lsa0kjdaFlTt5f
 St3PcY/o8qWA9aTuj5hkeOoxmA+kExh2EKpELvi/ujA7vki4X8Sjxh4OM
 mApYmQFRrMcm9U5jaXT9RJDJXC/QTr2/VrWvdssHz2Yz+BXDw09BgkSnQ
 Kv6qiUQ15AGz+FbwLAn4mmzIwOeLnEJy+trmao19NiDL8rf6MudykpGYn
 9QWHyz5uPWNuFF74ECmeY2pKjNJtUvlxAEVvPyASD42RBqzux+ALESFAT
 xTVYNT4Jyq/mqfUo9Xs0on+yhXaKn6EhOz6C9xmpO0GvYnl0rep85uWVJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="365942729"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="365942729"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="841925451"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="841925451"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:57:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 30 Jun 2023 10:58:02 -0700
Message-Id: <20230630175804.1096370-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230630175804.1096370-1-matthew.brost@intel.com>
References: <20230630175804.1096370-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 7/9] drm/xe: Remove __xe_vm_bind forward
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
index 7be4436272f7..3ea872857b9e 100644
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

