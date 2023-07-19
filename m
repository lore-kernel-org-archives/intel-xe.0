Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8F2C001B0
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 18:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C0810E4F9;
	Wed, 19 Jul 2023 18:57:19 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EA810E4F3
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 18:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689793038; x=1721329038;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=325osZ88utXzEBRqU+b9nWU6n8qOMiCIbqQZmhlq9Tg=;
 b=knGBZJWRjgD1E6bFHBqdY+/GAmWK6JOshFI326zWpU038lkDCBOwbRZc
 AVVeL6iOaCekJzs5oNrhB5FJebmvzrRiA2ofO866enNZCdHfymLOFCXwA
 2uQRRsFTWFJ9NZgdlxWNQ04g/c3x9f4Q97AqDH3uxA9P+Szi894u9oA+l
 kTnG3SIVWqXULyuqtZDKdX+YGD3yXbaGCxjHEpQizW017znZfbYuJnf/p
 YWEBdxhiMzEl4iykciRH0axJgg8RGHPsxSRvrFTOG7tc1+uSx6FPY1gWa
 lY1AcQzx2dx2vOJ1bgjuLpKFTRju42GB9WXoIZRRUW0HokYulctubA/GI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="397410435"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="397410435"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 11:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="674412380"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="674412380"
Received: from vshulan-mobl1.ccr.corp.intel.com (HELO cb0e4cda7c7c.intel.com)
 ([10.251.223.230])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 11:57:15 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jul 2023 18:57:07 +0000
Message-Id: <20230719185707.6-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/execlist: Log when using execlist
 submission
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Make explicit in the log that execlist submission is used to prevent from
silently using it over GuC submission.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 3aec37985f32..541f82387bb5 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -318,9 +318,12 @@ static int execlist_engine_init(struct xe_engine *e)
 {
 	struct drm_gpu_scheduler *sched;
 	struct xe_execlist_engine *exl;
+	struct xe_device *xe = gt_to_xe(e->gt);
 	int err;
 
-	XE_BUG_ON(xe_device_guc_submission_enabled(gt_to_xe(e->gt)));
+	XE_BUG_ON(xe_device_guc_submission_enabled(xe));
+
+	drm_info(&xe->drm, "Enabling execlist submission (GuC submission disabled)\n");
 
 	exl = kzalloc(sizeof(*exl), GFP_KERNEL);
 	if (!exl)
-- 
2.34.1

