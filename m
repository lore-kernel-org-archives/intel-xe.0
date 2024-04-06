Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0387CD1284
	for <intel-xe@archiver.kernel.org>; Sat,  6 Apr 2024 14:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818AD10F1A1;
	Sat,  6 Apr 2024 14:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gX3vElmN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5BD10F1A1
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Apr 2024 14:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712414406; x=1743950406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2LYsyuDw7ct9//CrLxhJx1ir7XaOHrve5fmz/VBvoMY=;
 b=gX3vElmNqDsMAQeq6bhZ9QRGdCK9N9udXmSpZxoM2HQ5Fq2iPouCQl/e
 kbRMp6YWydCluq3PLC5ijC79kl/JEfRSLgmf7PG+MwS0eTpZWZnCzj1hk
 otqq2wudr+YI1mSP71a+g7hXgLvqO0SfBB7UCOiAzfB339IwjO/nEEmP2
 DmoodS9yGXkpayM/y5Sx1FkRrsRgeXh9qg1IYppE0QvieioueGqQznYMK
 BHp7463lbxttsF84x6KmZ7UaBfSkruIZ8OPK2nsHmm/E4Y/DxTJL9ZEdD
 GztpxWTuqCqb7NdkzGTFIi2xhcJgfl3stsX4e35dQQaUSGSNjZrn7QF1i A==;
X-CSE-ConnectionGUID: 7Wf6NKsBTWuXlMp4OqWf2g==
X-CSE-MsgGUID: 4fXjjfq9RN2rQtVoUp3U5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7593632"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="7593632"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2024 07:40:06 -0700
X-CSE-ConnectionGUID: Y5zg63dERi+nBwoTwgGh7Q==
X-CSE-MsgGUID: BfjQN1TWRtO53RgANwpOew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; d="scan'208";a="19876622"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.192])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2024 07:40:05 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Initialize GuC ID manager sooner
Date: Sat,  6 Apr 2024 16:39:46 +0200
Message-Id: <20240406143946.979-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240406143946.979-1-michal.wajdeczko@intel.com>
References: <20240406143946.979-1-michal.wajdeczko@intel.com>
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

The GuC submission cleanup code may depend on the GuC ID manager,
thus we can't initialize it after registering a submission cleanup
action, as reverse cleanup sequence will destroy GuC ID manager
prior to a call to guc_submit_fini().

Move GuC ID manager initialization up, right after managed mutex
initialization, to have it available during guc_submit_fini().

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4c444fddfba6..61e7a8fbd18c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -266,6 +266,10 @@ int xe_guc_submit_init(struct xe_guc *guc)
 	if (err)
 		return err;
 
+	err = xe_guc_id_mgr_init(&guc->submission_state.idm, ~0);
+	if (err)
+		return err;
+
 	err = alloc_submit_wq(guc);
 	if (err)
 		return err;
@@ -279,15 +283,7 @@ int xe_guc_submit_init(struct xe_guc *guc)
 
 	primelockdep(guc);
 
-	err = drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
-	if (err)
-		return err;
-
-	err = xe_guc_id_mgr_init(&guc->submission_state.idm, ~0);
-	if (err)
-		return err;
-
-	return 0;
+	return drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
 }
 
 static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa_count)
-- 
2.43.0

