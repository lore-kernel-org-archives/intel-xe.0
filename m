Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3C1C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 19:10:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B76910E94A;
	Thu, 10 Jul 2025 19:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXsjSZhs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021ED10E94A
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 19:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752174628; x=1783710628;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9qVS3/jZe7+D6HotiE+WexjzJLkpsWC55T95WSKYE24=;
 b=mXsjSZhsv7tms3gdgIpVwSlx02p6yKpvquzLEEDyJ/D0r1zCgEA5xt+d
 oRxnUt6Xd3YqUkz5rtqYuWHClVb9o0S9gGWEralONpDJv8HHYq7skR2Q4
 EoFYFFsAiGLVoIb5R+ZA/DoYyLeMntjZfk7x6DSIK8KPapHsl/rQdJb2X
 3Y1FkW8W6erd1eEqZnz6NB6f00bmujKox37oYucF3oV/bajC5zYdyqWUX
 hPlf1zbDJqeqJNLOGDOTaPNPQUW54AzrLvh30x9/gVVId1xDke+3b1Bv9
 YezZHghEZvV7Yq/ZiQZnNqOBoN9GQOc+BVTJGLcCLz43JcynoYMya0i0m g==;
X-CSE-ConnectionGUID: kxU9wOxQS96twZvDuPyshg==
X-CSE-MsgGUID: 88x7EEs3QQabGcs2C5KzqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="64724277"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="64724277"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:10:27 -0700
X-CSE-ConnectionGUID: U4UXimrnQHazNa2oxJMoMA==
X-CSE-MsgGUID: HkH3wA2uTiOxj6er/IQblA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156726966"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:10:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Move page fault init after topology init
Date: Thu, 10 Jul 2025 12:12:08 -0700
Message-Id: <20250710191208.1040215-1-matthew.brost@intel.com>
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

We need the topology to determine GT page fault queue size, move page
fault init after topology init.

Cc: stable@vger.kernel.org
Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d397df056e4c..af03e19ef9be 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -628,15 +628,15 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	err = xe_gt_pagefault_init(gt);
+	err = xe_gt_sysfs_init(gt);
 	if (err)
 		return err;
 
-	err = xe_gt_sysfs_init(gt);
+	err = gt_init_with_gt_forcewake(gt);
 	if (err)
 		return err;
 
-	err = gt_init_with_gt_forcewake(gt);
+	err = xe_gt_pagefault_init(gt);
 	if (err)
 		return err;
 
-- 
2.34.1

