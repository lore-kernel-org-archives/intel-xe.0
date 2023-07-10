Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1222EB64DA
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 09:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD99110E256;
	Mon, 10 Jul 2023 09:42:12 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A4710E255
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 09:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688982130; x=1720518130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xMRxH6p3gMskUziOF2Yu/fj3NY13H8kBMhGaHz6r7to=;
 b=gPkntOjGuvq01i+4WeheSIYHfa4lDNn5y/Ljxr1aCRaGKSLiVfB+MW1d
 riTO29FR4nI/Uvn5ArlsxqwFdkU3hYIIlUpY1WTe3kMA8qaA8wE49B+wa
 sE8qGddmMFIgLPCOjJaze78EtLj0INCBS9Yy1zWxHUuQXVWg5JQzvjRt5
 0lGkiHS8T1ILx7JxpQIjPl/u1/ViI5oRvu6nMsDjSfo8nw9wPfEbYPmEu
 hiBefnOl223nnCuywP+K3Hq6Ja7sus9WU+QVMLhPmpcjtyF8rM5y+sYry
 1sj6XjnabIEsNzOlDWtDBIlHkZANbXJTkeI2puPFjcHFTNosMRwjEbWKJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="395081119"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="395081119"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:42:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755940717"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="755940717"
Received: from congsip-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.16])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:42:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Jul 2023 10:40:45 +0100
Message-ID: <20230710094037.28179-20-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710094037.28179-13-matthew.auld@intel.com>
References: <20230710094037.28179-13-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 07/11] drm/xe/gt: tweak placement for
 signalling TLB fences after GT reset
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

