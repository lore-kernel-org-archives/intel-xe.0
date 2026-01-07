Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DEBCE9D7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 00:22:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE5E10E138;
	Wed,  7 Jan 2026 00:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LocUwEuX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1535C10E138
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 00:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767745323; x=1799281323;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2sOWIa0qSYW/W6fnwloOu0tp3mpkaPLNLIrk5BmtuAk=;
 b=LocUwEuXTbPT8NmCzPoSPvRjzqomWc4jLwEbBhZaR78dfi+Lk/G6HSN1
 yZL3sMafLNkGu7rbS+uzc/0yOlA95S7iEXP0Rwef/gR8UzEToP6MPgBOD
 RzvhJ9dSi3PHvzMQ7efsXc+Ex13r/dS9HlvlyePXTXgkMyTiQwMIrPkEq
 J+CXlwDTD5w4RqQfGc9JR3kPNQ7LnxOwQXfyWbZZ7HMlg2MOO3D4KiWRW
 lNMEyyGZqfzLfyt6ZW03AXmFO+S6LdNDJUs9AVGWvIDwmzmW7kjwZg0Nj
 PoplwknPEqE5Ue9IOfwrJOc/JRVcV+eetEO6nUSaqn3Lw4LiGZALvDjBf w==;
X-CSE-ConnectionGUID: wdAAXJBASniYsazDWca85A==
X-CSE-MsgGUID: /BArqx13RoC33Upg3zIzAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="94582139"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="94582139"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 16:22:02 -0800
X-CSE-ConnectionGUID: 9jdUOszTTB6NiBGgh0Y8lA==
X-CSE-MsgGUID: yR0VIK1MSe253n4kpjTwxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="233486969"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 16:22:03 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: arselan.alvi@intel.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/xe: Tie page count tracepoints to TTM accounting functions
Date: Tue,  6 Jan 2026 16:21:54 -0800
Message-Id: <20260107002154.1934332-1-matthew.brost@intel.com>
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

Page accounting can change via the shrinker without calling
xe_ttm_tt_unpopulate(), but those paths already update accounting
through the xe_ttm_tt_account_*() helpers.

Move the page count tracepoints into xe_ttm_tt_account_add() and
xe_ttm_tt_account_subtract() so accounting updates are recorded
consistently, regardless of whether pages are populated, unpopulated,
or reclaimed via the shrinker.

This avoids missing page count updates and keeps global accounting
balanced across all TT lifecycle paths.

Cc: stable@vger.kernel.org
Fixes: ce3d39fae3d3 ("drm/xe/bo: add GPU memory trace points")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8b6474cd3eaf..33afaee38f48 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -432,6 +432,9 @@ struct sg_table *xe_bo_sg(struct xe_bo *bo)
 	return xe_tt->sg;
 }
 
+static void update_global_total_pages(struct ttm_device *ttm_dev,
+				      long num_pages);
+
 /*
  * Account ttm pages against the device shrinker's shrinkable and
  * purgeable counts.
@@ -440,6 +443,7 @@ static void xe_ttm_tt_account_add(struct xe_device *xe, struct ttm_tt *tt)
 {
 	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
 
+	update_global_total_pages(&xe->ttm, tt->num_pages);
 	if (xe_tt->purgeable)
 		xe_shrinker_mod_pages(xe->mem.shrinker, 0, tt->num_pages);
 	else
@@ -450,6 +454,7 @@ static void xe_ttm_tt_account_subtract(struct xe_device *xe, struct ttm_tt *tt)
 {
 	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
 
+	update_global_total_pages(&xe->ttm, -(long)tt->num_pages);
 	if (xe_tt->purgeable)
 		xe_shrinker_mod_pages(xe->mem.shrinker, 0, -(long)tt->num_pages);
 	else
@@ -575,7 +580,6 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 
 	xe_tt->purgeable = false;
 	xe_ttm_tt_account_add(ttm_to_xe_device(ttm_dev), tt);
-	update_global_total_pages(ttm_dev, tt->num_pages);
 
 	return 0;
 }
@@ -592,7 +596,6 @@ static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 
 	ttm_pool_free(&ttm_dev->pool, tt);
 	xe_ttm_tt_account_subtract(xe, tt);
-	update_global_total_pages(ttm_dev, -(long)tt->num_pages);
 }
 
 static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
-- 
2.34.1

