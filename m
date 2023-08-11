Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C96DC0015E
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 13:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5564C10E1E0;
	Fri, 11 Aug 2023 13:56:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE3910E1E0
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 13:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691762180; x=1723298180;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1FJt08/t7kX0w+qUn9TK869FsQHZJS+UsqN9fx0yptA=;
 b=G/lTFR7y32YnIoYzWTPBCQBYxhR9hxoluJW3M7msNKJ3X6nF6byNlMHC
 aITXpROxPNSurkFUsc6L+XLXEJ87FBB7hIcJnLkM83s56KxYZSoulugEY
 Dj/vwDAZNtKt04jD8Uc1RizKFjwz0wZuiLrHWsk/RGfCxLm1ftPL2AYjN
 xLj+JVOKRqZGA0cK70c/MfxyEUBScTF63UJ1U3885X2OFpVDefrb5KL2V
 edgMyuCBOiR2CnxFHEukght8sMxmVbyHJBvxj288TcJ0AjaEVv6cOBlZ4
 JonOqyDjUnfyyNcdPbnEYlD9U8TvpPsMeiUUTs4zfjczlRykmvkGxc1aC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="361820853"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="361820853"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 06:56:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="822670056"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="822670056"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 06:56:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 11 Aug 2023 06:56:16 -0700
Message-Id: <20230811135616.671971-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Call __guc_exec_queue_fini_async direct
 for KERNEL exec_queues
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Usually we call __guc_exec_queue_fini_async via a worker as the
exec_queue fini can be done from within the GPU scheduler which creates
a circular dependency without a worker. Kernel exec_queues are fini'd at
driver unload (not from within the GPU scheduler) so it is safe to
directly call __guc_exec_queue_fini_async.

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f80cf7d7b800..a1e1f2c86912 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -956,27 +956,19 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 	drm_sched_entity_fini(&ge->entity);
 	drm_sched_fini(&ge->sched);
 
-	if (!(q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
-		kfree(ge);
-		xe_exec_queue_fini(q);
-	}
+	kfree(ge);
+	xe_exec_queue_fini(q);
 }
 
 static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
 {
-	bool kernel = q->flags & EXEC_QUEUE_FLAG_KERNEL;
-
 	INIT_WORK(&q->guc->fini_async, __guc_exec_queue_fini_async);
-	queue_work(system_wq, &q->guc->fini_async);
 
 	/* We must block on kernel engines so slabs are empty on driver unload */
-	if (kernel) {
-		struct xe_guc_exec_queue *ge = q->guc;
-
-		flush_work(&ge->fini_async);
-		kfree(ge);
-		xe_exec_queue_fini(q);
-	}
+	if (q->flags & EXEC_QUEUE_FLAG_KERNEL)
+		__guc_exec_queue_fini_async(&q->guc->fini_async);
+	else
+		queue_work(system_wq, &q->guc->fini_async);
 }
 
 static void __guc_exec_queue_fini(struct xe_guc *guc, struct xe_exec_queue *q)
-- 
2.34.1

