Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12E0C4707B
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 23:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8892A10E53F;
	Tue,  9 Jan 2024 23:01:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D6D10E53E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 23:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704841293; x=1736377293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T7WOzVUxT9KBzMA4KdljXVVwAFnIvkRG1ogFbHh30kI=;
 b=ZHVvt6DN/DidscbQJRe7XskCSrmzfm3kyxbXtXw8wStGZlLu5bv0ckV1
 khSvXaRVOPurUGM02eydgPwuiFv5b7TKAvlmcFRiya2zV/PL08wHE2u0v
 tlL61uW9qPflqPTV3nVWFjqE2H08GbmKoWHuII2i7FpGT2zwtL8M9f58c
 neutH+J8YVoLi8UN5855OZKnos1A5Ysskc2Q0ZAp9sd3z9dJ8ooV3ijiR
 F8at92WL5RSNq5km6JqeSUEHk4LXvRhh+UxfV23D9zX7ChsUp5sybVsst
 PevD78Yn2VwnfYyKZAtE+8WjakiXtzjxFE9NQhy2JOlcgbEr44sAwrGYU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5715499"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5715499"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:01:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="852344957"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="852344957"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 15:01:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 2/3] drm/xe: Move TLB invalidation reset before HW reset
Date: Tue,  9 Jan 2024 15:01:48 -0800
Message-Id: <20240109230149.1399302-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109230149.1399302-1-matthew.brost@intel.com>
References: <20240109230149.1399302-1-matthew.brost@intel.com>
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

This is a software reset which can be done immediately after stopping
the UC.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3af2adec1295..c647f41b2751 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -619,12 +619,12 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_out;
 
+	xe_gt_tlb_invalidation_reset(gt);
+
 	err = do_gt_reset(gt);
 	if (err)
 		goto err_out;
 
-	xe_gt_tlb_invalidation_reset(gt);
-
 	err = do_gt_restart(gt);
 	if (err)
 		goto err_out;
-- 
2.34.1

