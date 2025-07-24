Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25738C87FC5
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 19:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A4510E223;
	Thu, 24 Jul 2025 19:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LS0WASlc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67F610E223
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 19:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753386026; x=1784922026;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r94BMO2pY8BfN7TueEga4FjLeIWlfGCBblp0O4mo2ZM=;
 b=LS0WASlcmPMR7nbECpzMMDlOG1L3l7O6eKqiOJH1ArviEozFE47Q4Sby
 tVWn4a/pM2M/FPQ5J0vY4OA/a3HIWNFLuU0X+2yRuE3EPXuLtmwMTcqGz
 5ot81iIU9nhRB3XtLIcGQ737U+6DPT/kUJBNlqMOGfoCESdjWHH3nRU7T
 U0ix9adq7RzwcAH7Ey7dO7xssKZfB3m8MDt1km3mSXckGL1WdL0ge4IOL
 5R/nHbRtGt4FZxZIpcFT7kAl+zgVoo3XKBsG4IEspjeLLvhSDOIr3ihVQ
 i1stHcHUKJCAmBEHNN7eQokTwLxY7P6Of1DKqf53TDM+lcNAttzpNIuAR w==;
X-CSE-ConnectionGUID: MnCPKImWRCuuFIDNwRAzCg==
X-CSE-MsgGUID: Qqx5IIKUQ+esW7H82dD1GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73299212"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="73299212"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 12:40:16 -0700
X-CSE-ConnectionGUID: 5GO+UCGxTJ+eFKcu68cJfA==
X-CSE-MsgGUID: ud3pBeY6R2a+AiKSAFD4eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160016227"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa007.fm.intel.com with ESMTP; 24 Jul 2025 12:40:13 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/hw_engine_group: Avoid call kfree() for drmm_kzalloc()
Date: Thu, 24 Jul 2025 19:38:55 +0000
Message-ID: <20250724193854.1124510-2-shuicheng.lin@intel.com>
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

Memory allocated with drmm_kzalloc() should not be freed using kfree(), as it
is managed by the DRM subsystem. The memory will be automatically freed when
the associated drm_device is released.
These 3 group pointers are allocated using drmm_kzalloc() in hw_engine_group_alloc(),
so they don't require manual deallocation.

Fixes: 67979060740f ("drm/xe/hw_engine_group: Fix potential leak")
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 28 ++++++-------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 87a6dcb1b4b5..c926f840c87b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -75,25 +75,18 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
 	enum xe_hw_engine_id id;
 	struct xe_hw_engine_group *group_rcs_ccs, *group_bcs, *group_vcs_vecs;
 	struct xe_device *xe = gt_to_xe(gt);
-	int err;
 
 	group_rcs_ccs = hw_engine_group_alloc(xe);
-	if (IS_ERR(group_rcs_ccs)) {
-		err = PTR_ERR(group_rcs_ccs);
-		goto err_group_rcs_ccs;
-	}
+	if (IS_ERR(group_rcs_ccs))
+		return PTR_ERR(group_rcs_ccs);
 
 	group_bcs = hw_engine_group_alloc(xe);
-	if (IS_ERR(group_bcs)) {
-		err = PTR_ERR(group_bcs);
-		goto err_group_bcs;
-	}
+	if (IS_ERR(group_bcs))
+		return PTR_ERR(group_bcs);
 
 	group_vcs_vecs = hw_engine_group_alloc(xe);
-	if (IS_ERR(group_vcs_vecs)) {
-		err = PTR_ERR(group_vcs_vecs);
-		goto err_group_vcs_vecs;
-	}
+	if (IS_ERR(group_vcs_vecs))
+		return PTR_ERR(group_vcs_vecs);
 
 	for_each_hw_engine(hwe, gt, id) {
 		switch (hwe->class) {
@@ -116,15 +109,6 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
 	}
 
 	return 0;
-
-err_group_vcs_vecs:
-	kfree(group_vcs_vecs);
-err_group_bcs:
-	kfree(group_bcs);
-err_group_rcs_ccs:
-	kfree(group_rcs_ccs);
-
-	return err;
 }
 
 /**
-- 
2.49.0

