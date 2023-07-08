Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D41EB64DD
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jul 2023 06:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64E910E657;
	Sat,  8 Jul 2023 06:43:53 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2366910E653
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Jul 2023 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688798627; x=1720334627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y86hGMt1UASQQcmXnLJotlXBg1l7xKqWbmgB8ncsvVg=;
 b=P7tDO0OfdIzy9Ft0gQgI6rySFW8JpyeB+rLIt9TQD8sSVb7zJYFlKo+C
 fDn0RC49PCbWT42m61t40ToxcclE8ow/nnWGwxDMHzsEyueVf4KBJZU6O
 XoSbDXzkg/aswZ/U95zkCT1FoL3Jxn2JAHqo7yAMJp+9+KF5YwjFYc2oD
 xetkwOrv8dJVDTzbDAGzQ/rwlbzziuGCBs27FwYZp/9E6nRK0O0e3QiAo
 MLDOz3Lhr+KNweiACmrq2yp+S2p6INFgCOL+NSeTdZkcFIvQow1mgjR/7
 WEx8U0n8AGxUMPrIo1JCXHQZki7fzKBDCyNjS3q1COOX24Qbz4I5gIrMG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="348834111"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="348834111"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 23:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="714240229"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="714240229"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 23:43:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri,  7 Jul 2023 23:43:58 -0700
Message-Id: <20230708064359.1743796-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230708064359.1743796-1-matthew.brost@intel.com>
References: <20230708064359.1743796-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 5/6] drm/xe: Remove __xe_vm_bind forward
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

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ccc4c870260c..23619ea873ac 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -696,11 +696,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
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

