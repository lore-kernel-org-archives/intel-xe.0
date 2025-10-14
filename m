Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E96ECCD18F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 00:43:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E6710E104;
	Tue, 14 Oct 2025 00:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aRpXC0iO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0BB10E104
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 00:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760402591; x=1791938591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QH3qPepVQDt6nIhQ91Jm+M5xPuiIeuUZrfq/6uEexfM=;
 b=aRpXC0iOV9vvpEbzFtaQBoIOhQG7X5vIHcTd42NcEiZBhuQrMkU4KCVU
 hpJUmq+z2yVuO2AiWVAheAXrGdvSW38cJx9j3niMaiYcvbOy8uluiq760
 Cz5EB9+aDf16dJcb43w75LxkEwq9yOoWVW4+crnM5cBCRZ1nIxUd0Q8+g
 dRFIr8Jnhvm6yJnjKR8elgapOK+rpjZpy+XJqmzpJIf47Gpte6LinslXc
 RwTxvPx4O6v484wGbewT2VY2K7cs4YKW+lJSAAFn7B82GrQmd5ZYsOMwz
 WeUJltHRNcqW+UM6yWPhhp2TiOZKw8pRYxpjr+xsQ7uavQ15hxkQ1Za8B A==;
X-CSE-ConnectionGUID: hSiv8uVgT4uGbGoYWOjikQ==
X-CSE-MsgGUID: 2VECw2k2TRWFqBmwuB5qqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="80191836"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="80191836"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 17:43:11 -0700
X-CSE-ConnectionGUID: c/5+GoXhRXSJtn+lzkcbvA==
X-CSE-MsgGUID: UP7COM1BQee4Eg6ONLfZvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185994723"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 13 Oct 2025 17:43:09 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v1 1/3] drm/xe/vf: Skip fixups on VF migration before getting
 GGTT info
Date: Tue, 14 Oct 2025 02:44:16 +0200
Message-Id: <20251014004418.378928-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014004418.378928-1-tomasz.lis@intel.com>
References: <20251014004418.378928-1-tomasz.lis@intel.com>
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
index 46518e629ba3..6d9bffe25acc 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1108,6 +1108,12 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
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
@@ -1219,6 +1225,11 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
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
@@ -1241,6 +1252,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 
 	vf_post_migration_kickstart(gt);
 
+skip:
 	xe_pm_runtime_put(xe);
 	xe_gt_sriov_notice(gt, "migration recovery ended\n");
 	return;
-- 
2.25.1

