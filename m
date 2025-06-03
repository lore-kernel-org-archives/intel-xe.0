Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2430EC5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 19:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9F310E02E;
	Tue,  3 Jun 2025 19:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IH1Sx9P5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87FC10E02E
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 19:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748978550; x=1780514550;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0YrSZN7gSdzgPB5VzXMKCnSu0R0/noZtbP+hg7h8Ifc=;
 b=IH1Sx9P5D7bdWRlMXLqCa4LsJMyFkwyx7sovNrBi/0XJR8j8878Bf4Ol
 f99CN5JvIwlp2ym1NCO/y3obXAQAAQDPwV3TfaIG4dnbNNUGjh5JTEjs9
 0iZh4/vinHGk3FguURSzHnX+9eVGaU2lDejUPzWMqZntveVaFOk2K3Gbo
 3PK/oeQJZKnIyubcIWpQpH0pbFgUWdojdIsbw941hDYoxpuJ5EoeY2O4I
 zMQf8iyLOyABi3DLHb1P0SzS0tTkAzspsBFUVx34kN/usOhPDGpLHBA7P
 mOeQxz3YOwtE7YmZ7Dct0OAF2bf46eU2Zt9WKfz0w03/A63kA1qPN7/6L A==;
X-CSE-ConnectionGUID: jJ+UDmN9QmGl3lHTD22xBA==
X-CSE-MsgGUID: 0M36iaxHSICyEE7ZCuxQmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="53662225"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="53662225"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:22:30 -0700
X-CSE-ConnectionGUID: 04d2sIIHTLGvDHN9+EBdnQ==
X-CSE-MsgGUID: jIDoTTwbRESvPocBokAcvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="150001335"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:22:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe: Make force_reset attributes write-only
Date: Tue,  3 Jun 2025 21:22:18 +0200
Message-Id: <20250603192218.637-1-michal.wajdeczko@intel.com>
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

Stop supporting triggering GT resets from readoperations, as main
user of this feature (IGT) already switched to use write operation.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 848618acdca8..3afd0d58fa6b 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -349,9 +349,6 @@ static ssize_t force_reset_write(struct file *file,
 
 static int force_reset_show(struct seq_file *s, void *unused)
 {
-	struct xe_gt *gt = s->private;
-
-	force_reset(gt); /* to be deprecated! */
 	return 0;
 }
 DEFINE_SHOW_STORE_ATTRIBUTE(force_reset);
@@ -377,9 +374,6 @@ static ssize_t force_reset_sync_write(struct file *file,
 
 static int force_reset_sync_show(struct seq_file *s, void *unused)
 {
-	struct xe_gt *gt = s->private;
-
-	force_reset_sync(gt); /* to be deprecated! */
 	return 0;
 }
 DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
@@ -408,8 +402,8 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	root->d_inode->i_private = gt;
 
 	/* VF safe */
-	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
-	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
+	debugfs_create_file("force_reset", 0200, root, gt, &force_reset_fops);
+	debugfs_create_file("force_reset_sync", 0200, root, gt, &force_reset_sync_fops);
 
 	drm_debugfs_create_files(vf_safe_debugfs_list,
 				 ARRAY_SIZE(vf_safe_debugfs_list),
-- 
2.47.1

