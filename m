Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63F2C7EE21
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 00:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B0710E48F;
	Tue,  2 May 2023 00:17:33 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69ECA10E34B
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 00:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682986648; x=1714522648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GIKX6E6ddCDB0Akl2TBjonE56v7VKxAqjFITDnvXsuI=;
 b=iCmHwhDrJ8UJng6Tqpbw23nDd8UTI++e0p9GXE1c7JGvh9qpfSd4uIJ1
 cTgRzvQjbXbqRlIdFOhskoHkIcyZ0OO4wTQQFIGROgOPdFqvIGclGrOSY
 ac3zK0OTX8FlriLygp/nvPFRb1bbK/Sn6nA0udvEY9lwbU8STMhvd542V
 0gJDpyWr+wJFbKsaaqPeyr/zAyKNrhqSCpeGZM4etHY0H2iTsFvTZbHOR
 F3j1BMrdCwJC+OtWRqmQS8TO6RA5DTPPaHW/OqQPzrli8/usrm7ChQNX/
 9egMHCfn478afRQ3O8apooGG/yWTckAhoYL5sRut0CQu+dHNwzleD2QPW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332619564"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="332619564"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765541672"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="765541672"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 17:17:00 -0700
Message-Id: <20230502001727.3211096-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502001727.3211096-1-matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 04/31] drm/xe: Use
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
---
 drivers/gpu/drm/xe/xe_execlist.c   | 3 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c | 3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 48060d14547a..79fb951c2965 100644
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
index 9d3fadca43be..68d09e7a4cc0 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1084,7 +1084,7 @@ static int guc_engine_init(struct xe_engine *e)
 	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
-			     e->name, DRM_SCHED_POLICY_DEFAULT,
+			     e->name, DRM_SCHED_POLICY_SINGLE_ENTITY,
 			     gt_to_xe(e->gt)->drm.dev);
 	if (err)
 		goto err_free;
@@ -1185,7 +1185,6 @@ static int guc_engine_set_priority(struct xe_engine *e,
 	if (!msg)
 		return -ENOMEM;
 
-	drm_sched_entity_set_priority(e->entity, priority);
 	guc_engine_add_msg(e, msg, SET_SCHED_PROPS);
 
 	return 0;
-- 
2.34.1

