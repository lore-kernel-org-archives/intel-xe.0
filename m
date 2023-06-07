Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CEDC7EE2F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 16:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61B010E53B;
	Wed,  7 Jun 2023 16:05:11 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B59A10E531
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686153907; x=1717689907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vZQ+t5xnc5PooVDY0k2tUP7a/tkNwjyNJEarq7BtmYE=;
 b=kWYvytsiv9+Tasikl20dn4nthw5upqOCJR2xxkiEo4RdyEcSBcYX4T62
 FmJLqVMRBewDZRneXfIXlDsVKbkkJKzDYG2eEgMXRUubu9esaqpkvvx3a
 06BNGr38zXhBekT2qcBo2eUFvDuuJJPFErryrXqUycnIUMGZK+SUWfQPX
 uRpg/BGCOks5GMlbMVNsoVirMsF8AYXszafPf527AKpYohZTdA3ENwiyY
 El9zfsyOjUTk0W17DeGRKUl0VAnajnleKMvRogcJxPWhHualqAi+jnq2B
 ZeatEFfozCxPywxmAtqoQI1YeYDmEmoTJ9EqcvLiQt9LKH2DBEBs0KZGt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="336660340"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="336660340"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 09:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="822216346"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="822216346"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 09:03:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  7 Jun 2023 09:03:30 -0700
Message-Id: <20230607160334.4111289-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230607160334.4111289-1-matthew.brost@intel.com>
References: <20230607160334.4111289-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 4/8] drm/xe: Use
 DRM_SCHED_POLICY_SINGLE_ENTITY mode
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

We create 1 GPU scheduler per entity in Xe, use
DRM_SCHED_POLICY_SINGLE_ENTITY scheduling which is designed for that
paradigm.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c   | 3 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c | 3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 944dad79a037..46293c9bb6a8 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -339,7 +339,8 @@ static int execlist_engine_init(struct xe_engine *e)
 	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL,
 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
-			     NULL, NULL, e->hwe->name, DRM_SCHED_POLICY_DEFAULT,
+			     NULL, NULL, e->hwe->name,
+			     DRM_SCHED_POLICY_SINGLE_ENTITY,
 			     gt_to_xe(e->gt)->drm.dev);
 	if (err)
 		goto err_free;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c147b17690dd..a7a0d9f806bd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1067,7 +1067,7 @@ static int guc_engine_init(struct xe_engine *e)
 	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
-			     e->name, DRM_SCHED_POLICY_DEFAULT,
+			     e->name, DRM_SCHED_POLICY_SINGLE_ENTITY,
 			     gt_to_xe(e->gt)->drm.dev);
 	if (err)
 		goto err_free;
@@ -1168,7 +1168,6 @@ static int guc_engine_set_priority(struct xe_engine *e,
 	if (!msg)
 		return -ENOMEM;
 
-	drm_sched_entity_set_priority(e->entity, priority);
 	guc_engine_add_msg(e, msg, SET_SCHED_PROPS);
 
 	return 0;
-- 
2.34.1

