Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3922D68BCE
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 16:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739F910E8A0;
	Fri, 15 Nov 2024 16:33:11 +0000 (UTC)
X-Greylist: delayed 366 seconds by postgrey-1.36 at gabe;
 Thu, 14 Nov 2024 06:46:04 UTC
Received: from mail.nfschina.com (unknown [42.101.60.213])
 by gabe.freedesktop.org (Postfix) with SMTP id 1C47110E126;
 Thu, 14 Nov 2024 06:46:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
 by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id E0C01610C36C1; 
 Thu, 14 Nov 2024 14:39:47 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 morbo@google.com, justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>, matthew.brost@intel.com,
 francois.dugast@intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/xe/hw_engine_group: Fix bad free in
 xe_hw_engine_setup_groups()
Date: Thu, 14 Nov 2024 14:39:43 +0800
Message-Id: <20241114063942.3448607-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 15 Nov 2024 16:33:10 +0000
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

Clang static checker(scan-build) warning：
drivers/gpu/drm/xe/xe_hw_engine_group.c: line 134, column 2
Argument to kfree() is a constant address (18446744073709551604), which
is not memory allocated by malloc().

There are some problems in hw_engine_group_alloc() and
xe_hw_engine_setup_groups(). First, kfree() can only handle NULL
pointers instead of negitave error codes. When hw_engine_group_alloc()
failed, there is a bad kfree call for negitave error codes in
xe_hw_engine_setup_groups(). Second, when drmm_add_action_or_reset()
failed, destroy_workqueue() should be called to free 'group->resume_wq'.

Free 'group' and destroy 'group->resume_wq' when hw_engine_group_alloc()
failed to fix these problems.

Fixes: d16ef1a18e39 ("drm/xe/exec: Switch hw engine group execution mode upon job submission")
Fixes: f784750c670f ("drm/xe/hw_engine_group: Introduce xe_hw_engine_group")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 31 ++++++++++++++-----------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 82750520a90a..ee2cb32817fa 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -51,7 +51,7 @@ static struct xe_hw_engine_group *
 hw_engine_group_alloc(struct xe_device *xe)
 {
 	struct xe_hw_engine_group *group;
-	int err;
+	int err = -ENOMEM;
 
 	group = kzalloc(sizeof(*group), GFP_KERNEL);
 	if (!group)
@@ -59,7 +59,7 @@ hw_engine_group_alloc(struct xe_device *xe)
 
 	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", 0, 0);
 	if (!group->resume_wq)
-		return ERR_PTR(-ENOMEM);
+		goto free_group;
 
 	init_rwsem(&group->mode_sem);
 	INIT_WORK(&group->resume_work, hw_engine_group_resume_lr_jobs_func);
@@ -67,9 +67,15 @@ hw_engine_group_alloc(struct xe_device *xe)
 
 	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
 	if (err)
-		return ERR_PTR(err);
+		goto destroy_wq;
 
 	return group;
+
+destroy_wq:
+	destroy_workqueue(group->resume_wq);
+free_group:
+	kfree(group);
+	return ERR_PTR(err);
 }
 
 /**
@@ -87,21 +93,19 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
 	int err;
 
 	group_rcs_ccs = hw_engine_group_alloc(xe);
-	if (IS_ERR(group_rcs_ccs)) {
-		err = PTR_ERR(group_rcs_ccs);
-		goto err_group_rcs_ccs;
-	}
+	if (IS_ERR(group_rcs_ccs))
+		return PTR_ERR(group_rcs_ccs);
 
 	group_bcs = hw_engine_group_alloc(xe);
 	if (IS_ERR(group_bcs)) {
 		err = PTR_ERR(group_bcs);
-		goto err_group_bcs;
+		goto free_group_rcs_ccs;
 	}
 
 	group_vcs_vecs = hw_engine_group_alloc(xe);
 	if (IS_ERR(group_vcs_vecs)) {
 		err = PTR_ERR(group_vcs_vecs);
-		goto err_group_vcs_vecs;
+		goto free_group_bcs;
 	}
 
 	for_each_hw_engine(hwe, gt, id) {
@@ -126,13 +130,12 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
 
 	return 0;
 
-err_group_vcs_vecs:
-	kfree(group_vcs_vecs);
-err_group_bcs:
+free_group_bcs:
+	destroy_workqueue(group_bcs->resume_wq);
 	kfree(group_bcs);
-err_group_rcs_ccs:
+free_group_rcs_ccs:
+	destroy_workqueue(group_rcs_ccs->resume_wq);
 	kfree(group_rcs_ccs);
-
 	return err;
 }
 
-- 
2.30.2

