Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED61C00528
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 17:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF1110E5D8;
	Thu, 27 Jul 2023 17:41:12 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BED210E5D8
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 17:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690479671; x=1722015671;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qwaFxSkr/JN22IJUosJ8jbh7o8ZTF5TNsjcCeBdjbIQ=;
 b=AFdvlzV/y5FAl9SLX/szT8alIXek5F3tTO5jH8kzFWhRINpUruKufq1I
 xAj3/asdsfCThTTLrnn0G9ocJhkpQtzX/aL96rKeLWmEWWBfk37r3sB2U
 O99INNWaIpi51Gl31Rl+a4/xKdQhSyHvvoXjOhqgt8UcpPg1WXyt+V4YO
 SyC12JDWmRFw06jR2/JNl2sUGDDt1NvSGuZiu9bsyEwH3834emAOPszAw
 D1HQEvlMI7gYD/mgKDvNG75L9Y3aODXef8cgVQZGj2qEHXc+O895UfpFE
 15pdwiA8UmVP0UHV43o0ZEvOn7OUuA+9SsC9WAkybeELUFEsJoNt8JxPs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="358405718"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="358405718"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 10:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="1057798170"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="1057798170"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 10:41:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 27 Jul 2023 10:41:07 -0700
Message-Id: <20230727174107.532275-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Call __guc_engine_fini_async direct for
 KERNEL engines
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

Usually we call __guc_engine_fini_async via a worker as the engine fini
can be done from within the GPU scheduler which creates a circular
dependency without a worker. Kernel engines are fini'd at driver unload
(not from within the GPU scheduler) so it is safe to directly call
__guc_engine_fini_async.

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 911d4965c27c..6cb64a097297 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -943,27 +943,19 @@ static void __guc_engine_fini_async(struct work_struct *w)
 	drm_sched_entity_fini(&ge->entity);
 	drm_sched_fini(&ge->sched);
 
-	if (!(e->flags & ENGINE_FLAG_KERNEL)) {
-		kfree(ge);
-		xe_engine_fini(e);
-	}
+	kfree(ge);
+	xe_engine_fini(e);
 }
 
 static void guc_engine_fini_async(struct xe_engine *e)
 {
-	bool kernel = e->flags & ENGINE_FLAG_KERNEL;
-
 	INIT_WORK(&e->guc->fini_async, __guc_engine_fini_async);
-	queue_work(system_wq, &e->guc->fini_async);
 
 	/* We must block on kernel engines so slabs are empty on driver unload */
-	if (kernel) {
-		struct xe_guc_engine *ge = e->guc;
-
-		flush_work(&ge->fini_async);
-		kfree(ge);
-		xe_engine_fini(e);
-	}
+	if (e->flags & ENGINE_FLAG_KERNEL)
+		__guc_engine_fini_async(&e->guc->fini_async);
+	else
+		queue_work(system_wq, &e->guc->fini_async);
 }
 
 static void __guc_engine_fini(struct xe_guc *guc, struct xe_engine *e)
-- 
2.34.1

