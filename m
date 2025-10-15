Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B7FCCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 00:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11CB10E13D;
	Wed, 15 Oct 2025 00:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QggrqSI/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FD110E13D
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 00:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760488005; x=1792024005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZGWdI10fIbcV6I/ZwF9ANvlwn0V8QT5HXaTGZ5K01H0=;
 b=QggrqSI//XLmpH9Wxe9Ng0fGZltOX1DgJRfujPMn5ljLKHy83pmGf0oC
 n/YcMnb0pAt2tVcsaSLXcADMH9NuzvxC7B/6Ua3Ih5Geh/PmtvGzne6jk
 NjodPtQXM3MIWmAWBdPLEYlwVv1MWrKdyWmeKKw1g0NmJzFz4bTnCISvd
 agdBcR1bZwTo4IKdksbqbcqd6bZqUfcJpbo7WSLiwhgzRxhKs6vOe9UMR
 jKK3XOnaYitDcEdv5vpYW5K3k+1/Vy/UZR7kAjtf9VdmYe/YGXnCorGDB
 VsHzLRTumhm+5u9tk6jFV0z9Xn34vp8/7+dVYGHdeEi6g6mPCqdNzezmU Q==;
X-CSE-ConnectionGUID: Uwjn0RK0QJqlEifnuP97Hw==
X-CSE-MsgGUID: tLjc7/07R4im9WbvBtLAJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62551498"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="62551498"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 17:26:45 -0700
X-CSE-ConnectionGUID: stDa0M4BQ7aj8ANaC+sjQw==
X-CSE-MsgGUID: Z9+gEFpoR1yZHtnczTEvbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="181239938"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa010.jf.intel.com with ESMTP; 14 Oct 2025 17:26:44 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/4] drm/xe/vf: Skip fixups on VF migration before getting
 GGTT info
Date: Wed, 15 Oct 2025 02:27:53 +0200
Message-Id: <20251015002755.720992-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015002755.720992-1-tomasz.lis@intel.com>
References: <20251015002755.720992-1-tomasz.lis@intel.com>
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

The GuC RESFIX state should be achievable only after a successful
handshake. If VF KMD has no GGTT configuration yet and we still got
into RESFIX state, then either we're dealing with unclean initial
state due to unusual actions before probe, or the migration
happened while xe init (started by probe) was running.

In 1st case (VF migration before probe), we should just skip migration.
Init procedure will ensure exit from RESFIX state as it starts GuC
handshake with a reset.

In 2nd case (VF migration during xe init), the migration procedure
should execute normally if GGTT configuration was already acquired
from GuC, and can be skipped if it was not acquired.

This solution will avoid crashes due to the VF migration running
on non-initialized xe sub-structures. But it is not enough to allow
fully reliable migration during driver probe. In particular, the
situation where the probe might not end successfully, is:

* The VF is paused and migrated after GuC reset (vf_bootstrap) but
before config is acquired (vf_query_config). In such case, GuC may
remain in RESFIX state, leading to timeouting requests.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 95c10de0732f..73e855cefb57 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1152,6 +1152,12 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 		   pf_version->major, pf_version->minor);
 }
 
+static bool vf_ggtt_queried(struct xe_tile *tile)
+{
+	guard(mutex)(&tile->mem.ggtt->lock);
+	return xe_tile_sriov_vf_ggtt(tile) != 0;
+}
+
 static bool vf_post_migration_shutdown(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -1263,6 +1269,11 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
 
 	xe_pm_runtime_get(xe);
+
+	/* If during init and before GGTT configuration, skip the procedure. */
+	if (!vf_ggtt_queried(gt_to_tile(gt)))
+		goto skip;
+
 	retry = vf_post_migration_shutdown(gt);
 	if (retry)
 		goto queue;
@@ -1285,6 +1296,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 
 	vf_post_migration_kickstart(gt);
 
+skip:
 	xe_pm_runtime_put(xe);
 	xe_gt_sriov_notice(gt, "migration recovery ended\n");
 	return;
-- 
2.25.1

