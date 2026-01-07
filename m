Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE14D0D171
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 20:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021CC10E2DB;
	Wed,  7 Jan 2026 20:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CwmDWPV5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D452110E2DB
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 20:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767819458; x=1799355458;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CSGcwqvOTPaXU71fi2e5eFyS/0NAMhyqz5X410JKelk=;
 b=CwmDWPV5d/t2gcLfh8CREn6FtxUjqzQJA3qQ6km4tyVl64Le7GuCboSM
 1zMKsyIBPbTt+rOXEpzYrLd7Lss3THCvcaUPAZaMMpsoaHSBXPqhmvEKX
 E5s83Jb9N9X0VXUWhu9fkbs81+vjmf2y01idOCGSDdyGwibpzkCTvgRfi
 EtIxQyCyprUoN3jWX5G15krbH5lEUe50QhDZIkA2FaGkXyOHVkfpypJrv
 aHOwuxjccZHXgKYqOgmp8eGF0g5zKuvTW+dyZO5oymW0vSHMk8Tj8l7Ac
 wJTYwXZ0vSaZy/EUwp84BwpcxpEIgcTx4AL0sIh+c80a7H5WgAgV6goxb A==;
X-CSE-ConnectionGUID: HZeHml7IT1eJXbMDGNkxhw==
X-CSE-MsgGUID: 4Nh2pXTtTAew5v7xtBBzvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="79836930"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="79836930"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 12:57:37 -0800
X-CSE-ConnectionGUID: RUoPGpWOTTGbW7jHosri5Q==
X-CSE-MsgGUID: OdvhppHXQAWV0vEa9CJrUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="203470140"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 12:57:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arselan.alvi@intel.com, stable@vger.kernel.org
Subject: [PATCH v2] drm/xe: Adjust page count tracepoints in shrinker
Date: Wed,  7 Jan 2026 12:57:32 -0800
Message-Id: <20260107205732.2267541-1-matthew.brost@intel.com>
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
xe_ttm_tt_unpopulate(), which normally updates page count tracepoints
through update_global_total_pages. Add a call to
update_global_total_pages when the shrinker successfully shrinks a BO.

v2:
 - Don't adjust global accounting when pinning (Stuart)

Cc: stable@vger.kernel.org
Fixes: ce3d39fae3d3 ("drm/xe/bo: add GPU memory trace points")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8b6474cd3eaf..6ab52fa397e3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1054,6 +1054,7 @@ static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
 			       unsigned long *scanned)
 {
 	struct xe_device *xe = ttm_to_xe_device(bo->bdev);
+	struct ttm_tt *tt = bo->ttm;
 	long lret;
 
 	/* Fake move to system, without copying data. */
@@ -1078,8 +1079,10 @@ static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
 			      .writeback = false,
 			      .allow_move = false});
 
-	if (lret > 0)
+	if (lret > 0) {
 		xe_ttm_tt_account_subtract(xe, bo->ttm);
+		update_global_total_pages(bo->bdev, -(long)tt->num_pages);
+	}
 
 	return lret;
 }
@@ -1165,8 +1168,10 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 	if (needs_rpm)
 		xe_pm_runtime_put(xe);
 
-	if (lret > 0)
+	if (lret > 0) {
 		xe_ttm_tt_account_subtract(xe, tt);
+		update_global_total_pages(bo->bdev, -(long)tt->num_pages);
+	}
 
 out_unref:
 	xe_bo_put(xe_bo);
-- 
2.34.1

