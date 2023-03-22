Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21F2C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 10:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6E010E35A;
	Wed, 22 Mar 2023 10:35:57 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987C810E35A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679481355; x=1711017355;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=odoakiScCbj172MyvyUAHHGSj9FvAtC3UUhiC6pNmG0=;
 b=f0IjzY8rtbSqtwd1Y68lvBVKRSIFUeV4SXVxno7zCBmc30RnkveummhM
 Xzg0rzHI3jYzSe1LblUybBVPv+hOROxfhaTXXfrkt/FWv5GRk5SL7dua9
 SXhnjye5Kz41g+HPC4KFfnbcT/b0ITXAFbEK7nKWZNzsE3PKWE0PkS3h+
 V+BZVMrB3MHjqghB5eMZML0vTMpXkqWPIE72QKhdA/eiKlOD9xnV09tYU
 iaeOtFvcWGgWz6Nen1sq+nxPTmf0Wv6I+iKaIY2uZ8uAogHHJZEVd1/Ga
 8khirMV4St014fMuaP8iAvgxMRxxVEfVYnJs1ImxpKqClwOE0qcAqWfRl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339219282"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="339219282"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 03:35:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="825346675"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="825346675"
Received: from ftbyrne-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.151])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 03:35:54 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Mar 2023 10:35:45 +0000
Message-Id: <20230322103545.272048-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/gt: some error handling fixes
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

Make sure we pass along the correct errors.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index daa433d0f2f5..07464ba42746 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -234,7 +234,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_engine *e)
 	job = xe_bb_create_wa_job(e, bb, batch_ofs);
 	if (IS_ERR(job)) {
 		xe_bb_free(bb, NULL);
-		return PTR_ERR(bb);
+		return PTR_ERR(job);
 	}
 
 	xe_sched_job_arm(job);
@@ -285,7 +285,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
 	job = xe_bb_create_wa_job(e, bb, batch_ofs);
 	if (IS_ERR(job)) {
 		xe_bb_free(bb, NULL);
-		return PTR_ERR(bb);
+		return PTR_ERR(job);
 	}
 
 	xe_sched_job_arm(job);
@@ -545,8 +545,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
 
 	if (!xe_gt_is_media_type(gt)) {
 		gt->migrate = xe_migrate_init(gt);
-		if (IS_ERR(gt->migrate))
+		if (IS_ERR(gt->migrate)) {
+			err = PTR_ERR(gt->migrate);
 			goto err_force_wake;
+		}
 	} else {
 		gt->migrate = xe_find_full_gt(gt)->migrate;
 	}
-- 
2.39.2

