Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E44EB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 13:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB4C10E18F;
	Tue,  4 Jul 2023 13:46:18 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EDF10E18D
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 13:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688478377; x=1720014377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xJeWlwYtf7NgqLLEqWd2/VlWYk69+Hjse7jMUVmL/XU=;
 b=ePb5PfEUwOb1s3xtS54py0wV9uFIw5sd4pcn5MxhaXPuVsdM4WeB67Ed
 nAqKSb5/ZhRNtjzPkLF7RH5ZVOEP9Dqb0k4EAkHQ6Tw7P/yhyJGjbu4BI
 IKHKEzdD2o4G3eLeDWkI6MMeeosPzkaviBr0wFK6qV8Ik2wqzlLD9CTOF
 vpVf5SVzPRqHYNWdCLK8wGl2EmaZgaHlCV0fMapZmudHbbGfD58RFdTHb
 u7HMf/q6a+zOXbPnd5pr9UB81oCHLVmmLDzzA67igTF1gizNZu4Oha6sg
 zYrB3aLukdO77K8/IQY0zwXaV2Sk70VfpNFKyquvXWlaaSXVpNlcnDQcD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="361989281"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="361989281"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 06:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="712888718"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="712888718"
Received: from izharayx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.56])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 06:46:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 14:45:28 +0100
Message-ID: <20230704134524.138377-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230704134524.138377-7-matthew.auld@intel.com>
References: <20230704134524.138377-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/5] drm/xe/gt: tweak placement for signalling
 TLB fences after GT reset
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

Assumption here is that submission is disabled along with CT, and full
GT reset will also nuke TLBs, so should be safe to signal all in-flight
TLB fences, but only after the actual reset so move the placement
slightly.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index bc76678a8276..a21d44bfe9e8 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -519,7 +519,6 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_uc_stop_prepare(&gt->uc);
 	xe_gt_pagefault_reset(gt);
-	xe_gt_tlb_invalidation_reset(gt);
 
 	err = xe_uc_stop(&gt->uc);
 	if (err)
@@ -529,6 +528,8 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_out;
 
+	xe_gt_tlb_invalidation_reset(gt);
+
 	err = do_gt_restart(gt);
 	if (err)
 		goto err_out;
-- 
2.41.0

