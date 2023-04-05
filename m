Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3037C76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 02:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81B210E013;
	Wed,  5 Apr 2023 02:26:41 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1E510E077
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 02:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680661600; x=1712197600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YiQDaP7MiB3VP3YPCVQ3OvGqWqgA4Y036+dRM85dleI=;
 b=WotDEdke04uAsWljTDeMq9FGvDNyVuMP1HJ36RMgrNt+4QmY1nBjmWZN
 i27O4kR//5pDa+ATM2aBzVYhaWXAcd1LK/aG5jrVQrIh9KrgtNovt2CWW
 b95DdsVqgrp6mnN7es4msC46DQd5WY3xUsslKYLSlxC4kk94xY7Y72j7u
 fwQSlHUTbtxv2hVeZfrAdtcX9p1xBkD8yOmoIkei32NkIBRzhy2CIyB9S
 OzIJphRIFdP1dCBxCtP6fkS1NHIA6NLyBcj6e+fW/ZlKsPh7QPKEZg2M4
 YIgWmItt+lkzJAX+vFeJS7eyry1rBdkG9HzdATZOuc4+jgUdDFMjI9ai/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="407429693"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="407429693"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 19:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="716865320"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="716865320"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 19:26:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  4 Apr 2023 19:26:36 -0700
Message-Id: <20230405022637.3960068-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230405022637.3960068-1-matthew.brost@intel.com>
References: <20230405022637.3960068-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Always invalidate GGTT on map during
 driver load
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

Coalescing GGTT invalidations should work but it creating an issue where
the driver sporadically fails to load. For now just disable coalescing
during load.

Should fix:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/232

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index a430d1568890..55d0c2554f7b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -263,6 +263,7 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
+	struct xe_gt *gt = ggtt->gt;
 	u64 start = bo->ggtt_node.start;
 	u64 offset, pte;
 
@@ -278,8 +279,12 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 		xe_ggtt_set_pte(ggtt, start + bo->size, pte);
 	}
 
-	if (ggtt->invalidate) {
-		xe_ggtt_invalidate(ggtt->gt);
+	/*
+	 * XXX: Unsure why without invalidation on every map during driver load
+	 * we can fail the driver load.
+	 */
+	if (ggtt->invalidate || !gt->uc.guc.submission_state.enabled) {
+		xe_ggtt_invalidate(gt);
 		ggtt->invalidate = false;
 	}
 }
-- 
2.34.1

