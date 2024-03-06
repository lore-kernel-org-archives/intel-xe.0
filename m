Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464E4C54E49
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 05:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B7310EE18;
	Wed,  6 Mar 2024 05:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPpmj47Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A73510EAD9
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 05:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709702396; x=1741238396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oskKYFv6cgSpfJnsEL98LtRoWFtmC1Vogukk8KxyWHs=;
 b=fPpmj47YVQfi5t1WKZqeV7JmXWxzEyAQX3SxJxpzhu6PEMAyx2QjH3xy
 qNX/wx1nywd1FldbY1JgoYqHgXBlZshL9VRo53K9tAl5mFW+0cAWdhxhD
 1vJ5G8ZJ56gb9/zRxEPkUmMOFY91a/uj4JqV+QcdSktYOtpHsNROzzMQb
 0/Ge9E635NxN3+G9Vv9MDHSH3B6cLNTaTDVn0qW5UF95uqQUfA9wpOqR8
 OOhbPII36GameeQXrWUr+oDOVnCXxlWeNcgq6gmYorU4L6/SUGVz5+4Le
 MHq+BP9ZawtkcF/GnmcuNst6OVtV++dPgJj9xT9MlNYHK6wEA3LsyOFlJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4415011"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4415011"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 21:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="32789804"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 21:19:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: rodrigo.vivi@intel.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/4] drm/xe: Fix NULL check in xe_ggtt_init()
Date: Tue,  5 Mar 2024 21:19:59 -0800
Message-Id: <20240306052002.311196-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306052002.311196-1-matthew.brost@intel.com>
References: <20240306052002.311196-1-matthew.brost@intel.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

The null check for GT is after calling gt_to_xe, fix it.

Fixes: 3121fed0c51b ("drm/xe: Cleanup some layering in GGTT")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5e739513ab0a..325337c38961 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -251,7 +251,6 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 
 static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	if (!gt)
@@ -259,7 +258,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 
 	err = xe_gt_tlb_invalidation_ggtt(gt);
 	if (err)
-		drm_warn(&xe->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
+		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
 }
 
 void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
-- 
2.34.1

