Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616BBCD484E
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 05:55:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2088D10E10F;
	Tue, 12 May 2026 05:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRrupAIB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D5C10E10F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 05:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778565316; x=1810101316;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a7tjshzK8N/FY1oILq9rwxxhnLkhC2EmQ1UlyrnzxII=;
 b=YRrupAIBkxwgIJk0WB9hYQuuhGi0c+XMWni30ls9hmGkOWj6+x0EKQLp
 6+EULxrXtHsJad/1SpZJB0sC080wscD8G08yuHbRTtIqdKYkpEuTHrmD/
 PeYyab9lVfsfg+oPvaNfY7SB6a713O66BSV9UbS5YRt0StrWqAACWkCZc
 v6xdnMoLaSbNgYxZzq3Ur62i8PDQ3m7A0nfRlM6VvR5Fy2nwHc/2+mOXk
 B6JIVoN+en/zWamWW8Yhi7KfC0Sag9wsdvN7PCjiyKLUVtzck0t704XN6
 Ll+Ri5hF8zsAva9hbpTZ3+HhQ6Blp5jFbWl5V5vrUq2IEkgizlBKkW7hN w==;
X-CSE-ConnectionGUID: f7qpPFu0SGiLw5G4C6uAEw==
X-CSE-MsgGUID: TOff2mGoSTuQGicuwfqnJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="97032046"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="97032046"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 22:55:15 -0700
X-CSE-ConnectionGUID: zRpdJ4U8T6GVrnQdpVzoPQ==
X-CSE-MsgGUID: xT1NY44SStGapD53B9Nc1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="236826159"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 22:55:14 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	balasubramani.vivekanandan@intel.com
Subject: [PATCH] drm/xe/devcoredump: Drop a FIXME in devcoredump
Date: Tue, 12 May 2026 11:25:08 +0530
Message-ID: <20260512055508.1380191-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
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

The FIXME says that xe_engine_snapshot_print.. is accessing persistent
driver data, unlike what the FIXME says that it does. Drop the FIXME
since the current code is not going to access the hardware while
dumping.
More details about this patch:
https://patchwork.freedesktop.org/patch/703884/?series=161407&rev=1
The starting two feedbacks make sense and the original patch is wrong
in adding those changes, but the last feedback is the one which
highlights the point.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index bc49e40165a3..21f7caf9ea08 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1841,12 +1841,6 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
 		   str_yes_no(snapshot->kernel_reserved));
 
 	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
-		/*
-		 * FIXME: During devcoredump print we should avoid accessing the
-		 * driver pointers for gt or engine. Printing should be done only
-		 * using the snapshot captured. Here we are accessing the gt
-		 * pointer. It should be fixed.
-		 */
 		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
 							capture_class, false);
 		snapshot_print_by_list_order(snapshot, p, type, list);
-- 
2.53.0

