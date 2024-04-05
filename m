Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BF9C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 21:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DA510E576;
	Fri,  5 Apr 2024 21:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ErO+lvO9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4500810E9EF
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 21:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712352443; x=1743888443;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dU4V08GK2Ima8DGs1VERea9hn3fBeoPEHPB3DscC5ng=;
 b=ErO+lvO921mVwUI5uDrlYtC0eUi5mp/ofM1NSFGHqB0lezsX56baiT2o
 yrSMPn/dR1YPJoqaHFNS1OIqtqGNs31y/uBkF8HqlOZ5DG5HrzB8YtS45
 TZDFyfIssE/PZ5SJRFpU5uoMtvY/RU8UilkYsKE9Y0TwO5RZ0trSxNzsX
 Qh5g1Q8Mn53NwCyNme4whQnpclcBv3ZmpOfdV4AR7xMmCjFhbbsOUzPBy
 g1eda65mpbHe2G3r7arDzFqOZIMR87eIHIPJkpCTGiWQzePML/0gXCO8R
 b1l2342EKfIixtCz8sv0t98nWgKNfFKUvEhjcY5IQrymAGXc5utikOpEZ Q==;
X-CSE-ConnectionGUID: NsSlR7nfQ1Wid5cIa6I0IQ==
X-CSE-MsgGUID: s3JvrUXlSfmUFk33goFNqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="11523011"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="11523011"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 14:27:23 -0700
X-CSE-ConnectionGUID: 4KkFwnXySaO85FH9nsyy4Q==
X-CSE-MsgGUID: 2122VBtzTIu/aV8KOCT/vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="19353835"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 14:27:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Initialize GuC ID mgr before registering
 guc_submit_fini
Date: Fri,  5 Apr 2024 14:27:47 -0700
Message-Id: <20240405212747.226263-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

It reasonable to assume that guc_submit_fini may rely on GuC ID mgr
being available. With that, register guc_submit_fini after initializing
the GuC ID mgr. This will ensure the GuC ID mgr is available in
guc_submit_fini due the reverse execution order of
drmm_add_action_or_reset.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9c30bd9ac8c0..148c5dc2c1ac 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -232,15 +232,20 @@ static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
 }
 #endif
 
-static void guc_submit_fini(struct drm_device *drm, void *arg)
+static void __guc_submit_fini(struct xe_guc *guc)
 {
-	struct xe_guc *guc = arg;
-
 	xa_destroy(&guc->submission_state.exec_queue_lookup);
 	free_submit_wq(guc);
 	mutex_destroy(&guc->submission_state.lock);
 }
 
+static void guc_submit_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_guc *guc = arg;
+
+	__guc_submit_fini(guc);
+}
+
 static const struct xe_exec_queue_ops guc_exec_queue_ops;
 
 static void primelockdep(struct xe_guc *guc)
@@ -277,11 +282,13 @@ int xe_guc_submit_init(struct xe_guc *guc)
 
 	primelockdep(guc);
 
-	err = drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
-	if (err)
+	err = xe_guc_id_mgr_init(&guc->submission_state.idm, ~0);
+	if (err) {
+		__guc_submit_fini(guc);
 		return err;
+	}
 
-	err = xe_guc_id_mgr_init(&guc->submission_state.idm, ~0);
+	err = drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
 	if (err)
 		return err;
 
-- 
2.34.1

