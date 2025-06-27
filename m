Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA98FC7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 18:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDD810E062;
	Fri, 27 Jun 2025 18:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQw2OSAL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED0D10E062
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 18:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751049716; x=1782585716;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LfDvIAcSSdKO7IXG6KVNLa+ZXofUfEuOAUBig9DBk2k=;
 b=AQw2OSALCQlg1Og/vQagZaMMmlgTBlK4ufdgd9Vio3l5UP+mbbsEiwiN
 kK0qHLzDoAwWlealmomtFVJllgvQs/GHSl0pnHnWZl41+PXjhoN2gE3YU
 7youb0MxVwNxvwCh1qHFP4N1oxC2Crlr9C3sSuoHJpMrMbeKjOZ0Ddg3b
 EkEEPvW171TPmiI98vv7PMxDLjXA7KFh9tRSpxIrkc+rLpYaUp2PRXxs9
 2MQ+u7BAKDxi/8XNXwNDrmbpmi8BEQ3cpbU4QJGf08BtWePH0ThnBwMwo
 evwA3+TeGEK/onK4ogfsxfBWPAJuUGlQllm1Rwfw0BlcWQJEBFPQtvUE/ w==;
X-CSE-ConnectionGUID: gIsOMt1pTqagwcyfumN0Cg==
X-CSE-MsgGUID: v1Nmkoy4TQ6o4EdR39srQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57054504"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="57054504"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 11:41:53 -0700
X-CSE-ConnectionGUID: U1nJV/KaTuuTbE42L+x9nw==
X-CSE-MsgGUID: kBfZHYEIQzWUmzqe5zTjTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="153179972"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 11:41:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/hw_engine_group: Fix potential leak
Date: Fri, 27 Jun 2025 20:41:43 +0200
Message-Id: <20250627184143.1480-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

If we fail to allocate a workqueue we will leak kzalloc'ed group
object since it was designed to be kfree'ed in the drmm cleanup
action, but we didn't have a chance to register this action yet.

To avoid this leak allocate a group object using drmm_kzalloc()
and start using predefined drmm action to release the workqueue.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 2d68c5b5262a..87a6dcb1b4b5 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -12,15 +12,6 @@
 #include "xe_hw_engine_group.h"
 #include "xe_vm.h"
 
-static void
-hw_engine_group_free(struct drm_device *drm, void *arg)
-{
-	struct xe_hw_engine_group *group = arg;
-
-	destroy_workqueue(group->resume_wq);
-	kfree(group);
-}
-
 static void
 hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
 {
@@ -53,7 +44,7 @@ hw_engine_group_alloc(struct xe_device *xe)
 	struct xe_hw_engine_group *group;
 	int err;
 
-	group = kzalloc(sizeof(*group), GFP_KERNEL);
+	group = drmm_kzalloc(&xe->drm, sizeof(*group), GFP_KERNEL);
 	if (!group)
 		return ERR_PTR(-ENOMEM);
 
@@ -61,14 +52,14 @@ hw_engine_group_alloc(struct xe_device *xe)
 	if (!group->resume_wq)
 		return ERR_PTR(-ENOMEM);
 
+	err = drmm_add_action_or_reset(&xe->drm, __drmm_workqueue_release, group->resume_wq);
+	if (err)
+		return ERR_PTR(err);
+
 	init_rwsem(&group->mode_sem);
 	INIT_WORK(&group->resume_work, hw_engine_group_resume_lr_jobs_func);
 	INIT_LIST_HEAD(&group->exec_queue_list);
 
-	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
-	if (err)
-		return ERR_PTR(err);
-
 	return group;
 }
 
-- 
2.47.1

