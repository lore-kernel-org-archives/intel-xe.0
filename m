Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54823C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 17:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC8F10E5B8;
	Tue,  3 Jun 2025 17:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7Sqg43t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BD410E05D
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 17:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748972652; x=1780508652;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gkU+QWlpAX+NBjL3w7KK5c2bREwP/6LUPDPozrAIHrM=;
 b=I7Sqg43tKenwasNi03gz4Pxs1du7wOO4AC/n28YsQYQ3Ottrx/XWS1kE
 CTFo6T8KemzMY28UEzv7Nqk/nJBv3FV/r05O3zbh2uZ4HuNA261Yix/DU
 g8Z346YsgIAHG83aOGsM300P9/VsxK4YCJUtB028f2HJOG2C7pRWCnumY
 s55rIY7lV15DxlE6wE6DDNnUK0FQipxtzqc0wQRiWVEsANPjhr5CooWlR
 8MWQToD+V3nTa1WLB+vBYiVMDiPVX8CizKjCU2sKciFCmPXDnKwMn7lk2
 gpLs8Zkuw4jGfoDVUGzO7jaKI9TuXsb4bBEJQxaa7tB5NW/vkYG1hvH8U w==;
X-CSE-ConnectionGUID: LG2f050ST5GH8pU0M66Vrg==
X-CSE-MsgGUID: Vt5F2sqWTGSmv4wwu19sng==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51127052"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="51127052"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 10:44:12 -0700
X-CSE-ConnectionGUID: WTAvGLAeQmOkpz/uDGXYVw==
X-CSE-MsgGUID: ePQKOApARAWCxB24b+HwHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="144901291"
Received: from opintica-mobl1 (HELO mwauld-desk.intel.com) ([10.245.244.166])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 10:44:11 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe/guc_submit: add back fix
Date: Tue,  3 Jun 2025 18:42:14 +0100
Message-ID: <20250603174213.1543579-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Daniele noticed that the fix in commit 2d2be279f1ca ("drm/xe: fix UAF
around queue destruction") looks to have been unintentionally removed as
part of handling a conflict in some past merge commit. Add it back.

Fixes: ac44ff7cec33 ("Merge tag 'drm-xe-fixes-2024-10-10' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes")
Reported-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.12+
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 80f748baad3f..2b61d017eeca 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -229,6 +229,17 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 static void guc_submit_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc *guc = arg;
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
+	int ret;
+
+	ret = wait_event_timeout(guc->submission_state.fini_wq,
+				 xa_empty(&guc->submission_state.exec_queue_lookup),
+				 HZ * 5);
+
+	drain_workqueue(xe->destroy_wq);
+
+	xe_gt_assert(gt, ret);
 
 	xa_destroy(&guc->submission_state.exec_queue_lookup);
 }
-- 
2.49.0

