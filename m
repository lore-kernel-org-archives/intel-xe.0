Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BB5C7EE2D
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 01:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D570310E23C;
	Mon, 22 May 2023 01:50:36 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E52810E231
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 01:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684720232; x=1716256232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vZQ+t5xnc5PooVDY0k2tUP7a/tkNwjyNJEarq7BtmYE=;
 b=DNNVIMagiraM36NPwsDTPY2tXQgUbSDMmZNWaPZGQHvGxbVAb84llgfA
 Fu0013rJPN2tIhHg/6PA0IijX/xiDgmQgOhx/t7sHAEwg17Gwrv0Ih44H
 6y8uV0JUFDl3XjBRAc66nx0NCyHG70402RD/BpSLjUoyQe78JG+uhVGu9
 S25uCJrKNBBMn5A1+c38Z60oyKLI+fuI77e67qsNdD/sUVsxh8ZHddlbn
 d2ReZEnICIq8yMDN05nBOU3+C+PmePGKE9OOdc5h6JPztjs8AD37AwTg2
 CZf1weQtplMH8HRDULaqeGkOMoFURkyM9OCe7JCPI9ba3RxEAJqxiSccy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="381030417"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; d="scan'208";a="381030417"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2023 18:50:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="697471406"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; d="scan'208";a="697471406"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2023 18:50:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Sun, 21 May 2023 18:50:36 -0700
Message-Id: <20230522015040.3849776-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522015040.3849776-1-matthew.brost@intel.com>
References: <20230522015040.3849776-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/8] drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY
 mode
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

