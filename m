Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327C5FF8868
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 15:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E0B10E2C7;
	Mon, 27 Apr 2026 15:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nggu7HFe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E65710E2C7
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 15:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777304818; x=1808840818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oc5XKM8t7fTPWSG84LN4SG8mvCXelk19O/V3nwgDhLg=;
 b=nggu7HFexuwOg8WvFj95IbgsI/p9Hn6iowmgPXQfeAIHPgAUox4CKKBG
 bsSi2cpOIg0nAMLXrQw8zBBJXSaVAKvxVXfOxXMpGUERVoim2LpK+OlPP
 aN8UwSIYS4JaK/OwFxg03vULdSqm8gartCr//MQ2G2/m2QZF7B9j4dm90
 sHvEs4cmwzlEYTHokJiiwXq5k00X5dQFp2IOxNPIi0s7ccHRBIQrbyIFE
 8JMdPamMDZLGUAR1T7uvDA3H3rlLzywdvmzrxeYzfE8gKjk4ju9S8UqaQ
 rX3h0eiRd0Ij8OVeMYKrAu76kOm+q20feu1XJ5itppdIrCNEt9/ul9JYM w==;
X-CSE-ConnectionGUID: nhBk4CoZRDeTL+iQLn/oUA==
X-CSE-MsgGUID: TZ3FrG52SdGgLkC273xrxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="80771897"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="80771897"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 08:46:57 -0700
X-CSE-ConnectionGUID: Zyq+aTuURRmcSx4UMPhyYQ==
X-CSE-MsgGUID: CGa9fH5AQcWa6vqaRDBemQ==
X-ExtLoop1: 1
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa003.fm.intel.com with ESMTP; 27 Apr 2026 08:46:56 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 1/2] drm/xe/gsc: Fix double-free of managed BO in error path
Date: Mon, 27 Apr 2026 15:46:43 +0000
Message-Id: <20260427154643.3985760-1-shuicheng.lin@intel.com>
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

The error path in xe_gsc_init_post_hwconfig() explicitly frees a BO
allocated with xe_managed_bo_create_pin_map() via
xe_bo_unpin_map_no_vm(). Since the managed BO already has a devm
cleanup action registered, this causes a double-free when devm
unwinds during probe failure.

Remove the explicit free and let devm handle it, consistent with
all other xe_managed_bo_create_pin_map() callers.

Fixes: 2e5d47fe7839 ("drm/xe/uc: Use managed bo for HuC and GSC objects")
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 0d13e357fb43..aab59dc647fb 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -482,8 +482,7 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
 				 EXEC_QUEUE_FLAG_PERMANENT, 0);
 	if (IS_ERR(q)) {
 		xe_gt_err(gt, "Failed to create queue for GSC submission\n");
-		err = PTR_ERR(q);
-		goto out_bo;
+		return PTR_ERR(q);
 	}
 
 	wq = alloc_ordered_workqueue("gsc-ordered-wq", 0);
@@ -506,8 +505,6 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
 
 out_q:
 	xe_exec_queue_put(q);
-out_bo:
-	xe_bo_unpin_map_no_vm(bo);
 	return err;
 }
 
-- 
2.43.0

