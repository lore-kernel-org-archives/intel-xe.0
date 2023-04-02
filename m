Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD4FC77B62
	for <intel-xe@archiver.kernel.org>; Sun,  2 Apr 2023 02:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D8110E1D1;
	Sun,  2 Apr 2023 02:41:44 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE23810E236
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Apr 2023 02:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680403301; x=1711939301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yVOFZMmaTEWrqRi7GJ3wPdfH/vBBw5JyZmsiaidZq1g=;
 b=bJLc9UAwl3BftuBjxVU2ThoGZjnhomUpE8ZnG8hIwCa3yJQ4bK2sLGLp
 zHr7aOaGH4WgdLsMGWAF9NwNBpO4M5apLfwIQv9rj7jb+QzD8uo4ZbsiG
 +Q3ZGp37lVrIyZp6KL0X/AGZ2InSf93mONoJpvjOi57hxT/qIYrGSbjRV
 xnLS5t68Eog+EnyypOQGCwSIIuN9ptDjeIyidi/4e/vqiWQeW7ACoZX/I
 i4Ds/AVGMJxygFdlQwxKHiJYYpthpKvVNPV3loqRYB6PXlZH+14DxsjGO
 kv2/x1n5g52AW6qHjKdM+2o3XX0f6j0JPfi2HlDCFgMmcJTeG94uN4hdv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="341715414"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; d="scan'208";a="341715414"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 19:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="715869814"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; d="scan'208";a="715869814"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 19:41:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Sat,  1 Apr 2023 19:41:45 -0700
Message-Id: <20230402024145.2572923-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230402024145.2572923-1-matthew.brost@intel.com>
References: <20230402024145.2572923-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 3/3] drm/xe: Use
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
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 10899eceb9a4..459470ce49cd 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -339,7 +339,8 @@ static int execlist_engine_init(struct xe_engine *e)
 	err = drm_sched_init(&exl->sched, &drm_sched_ops,
 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
-			     NULL, NULL, e->hwe->name, DRM_SCHED_POLICY_DEFAULT,
+			     NULL, NULL, e->hwe->name,
+			     DRM_SCHED_POLICY_SINGLE_ENTITY,
 			     gt_to_xe(e->gt)->drm.dev);
 	if (err)
 		goto err_free;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c6ae1529de83..99504f6c20f4 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1084,7 +1084,7 @@ static int guc_engine_init(struct xe_engine *e)
 	err = drm_sched_init(&ge->sched, &drm_sched_ops,
 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
-			     e->name, DRM_SCHED_POLICY_DEFAULT,
+			     e->name, DRM_SCHED_POLICY_SINGLE_ENTITY,
 			     gt_to_xe(e->gt)->drm.dev);
 	if (err)
 		goto err_free;
-- 
2.34.1

