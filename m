Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8A5606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 23:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UN4WoYO3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A182E10F82F;
	Tue, 10 Nov 2026 23:15:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EEE10E9AE
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 23:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794352501; x=1825888501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WIAJ1lZp/8va85AS3S8StbNgPEjwkJXwGZZvOu7rogo=;
 b=UN4WoYO3atG4szlRJPm3stjKyiSYOpFm7aDI2EFkS96keEc0ELUCQKiB
 ZjrVgRZMFFVjvr4ooZj4iKe3R5HpMllp2tTYC5pY9vZAqrYAecMztStz2
 K9pFHiKmVVsCjpq8iyRABdtZiyYDPxRkonPu68t22NTkIRYdJ1wzq7hVW
 9gPmIjDVRvX279m1j3y1vyidvpOGOUnq8ZpypY/5ZmoBpkR2pn4CWKgqN
 O7aqvFJ79wosOoiFuGv578c/Rq0ujkAKscjnAPx1emfcBQt5wODYMBG52
 TrlCtJ6pAWX7ghtWocqvQ+cUbeOJyawTLz/Z3+ZYjT1InXxhIvP20mEPx g==;
X-CSE-ConnectionGUID: mal2gUBPRcifHUCnXcccUw==
X-CSE-MsgGUID: DTaOBY5qQpGgIZMa6EMvXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3120827"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3120827"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:51 -0800
X-CSE-ConnectionGUID: kE6+xkZLTdOygrLuU/QA1Q==
X-CSE-MsgGUID: i2cyJnuGSHqLsN729DZG3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8133960"
Received: from dut4463arlhx.fm.intel.com ([10.105.9.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:51 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, matthew.d.roper@intel.com, fei.yang@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 05/11] drm/xe: Stop assuming the root tile has a primary GT
Date: Tue, 10 Nov 2026 23:14:47 +0000
Message-ID: <20261110231442.218721-18-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110231442.218721-13-stuart.summers@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A handful of device level consumers reach for xe_root_mmio_gt() to get at
state that merely happens to be hung off a GT - the GuC firmware version,
GT stats counters and the default OA unit - and dereference it without a
NULL check.  None of them touch MMIO, so none of them actually need the
primary GT; they just need some GT.

Add xe_device_any_gt(), which falls back to the root tile's media GT, and
use it in those places.  For OA, walk the GTs instead so the default unit
is the first one that exists, which keeps it OA unit 0 as the uapi
promises.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h    | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.c        | 24 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pagefault.c |  4 ++--
 drivers/gpu/drm/xe/xe_query.c     |  3 ++-
 drivers/gpu/drm/xe/xe_vm.c        |  2 +-
 5 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6df60edcb8f8..3d0282822f17 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -109,6 +109,22 @@ static inline struct xe_gt *xe_root_mmio_gt(struct xe_device *xe)
 	return xe_device_get_root_tile(xe)->primary_gt;
 }
 
+/*
+ * Provide a GT structure for device level state that happens to be hung off a
+ * GT but is not specific to one, such as GuC firmware versions or OA units.
+ * Unlike xe_root_mmio_gt(), this never returns NULL: the root tile always has
+ * at least one GT, even when the graphics IP is absent.  It must not be used
+ * for MMIO, since the media GT needs GSI offset translation.
+ *
+ * Returns the primary GT of the root tile, or its media GT if there is none.
+ */
+static inline struct xe_gt *xe_device_any_gt(struct xe_device *xe)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+
+	return tile->primary_gt ?: tile->media_gt;
+}
+
 static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
 {
 	return &xe->tiles[0].mmio;
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 838802482ada..05beb156c941 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2041,6 +2041,23 @@ static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
 	return ret;
 }
 
+/*
+ * OA unit IDs are handed out in GT iteration order, so the first unit of the
+ * first GT that has one is OA unit 0. The primary GT may be absent, in which
+ * case unit 0 lives on the media GT.
+ */
+static struct xe_oa_unit *xe_oa_first_unit(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	u8 id;
+
+	for_each_gt(gt, xe, id)
+		if (gt->oa.num_oa_units)
+			return &gt->oa.oa_unit[0];
+
+	return NULL;
+}
+
 /**
  * xe_oa_stream_open_ioctl - Opens an OA stream
  * @dev: @drm_device
@@ -2073,8 +2090,11 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		return ret;
 
 	/* If not provided, OA unit defaults to OA unit 0 as per uapi */
-	if (!param.oa_unit)
-		param.oa_unit = &xe_root_mmio_gt(oa->xe)->oa.oa_unit[0];
+	if (!param.oa_unit) {
+		param.oa_unit = xe_oa_first_unit(oa->xe);
+		if (XE_IOCTL_DBG(xe, !param.oa_unit))
+			return -ENODEV;
+	}
 
 	if (param.exec_queue_id > 0) {
 		/* An exec_queue is only needed for OAR/OAC functionality on OAG */
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 98cce0f12b12..e1058d52abd9 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -547,7 +547,7 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
 			continue;
 
 		if (cache_start != XE_PAGEFAULT_CACHE_START_INVALID) {
-			xe_gt_stats_incr(xe_root_mmio_gt(xe),
+			xe_gt_stats_incr(xe_device_any_gt(xe),
 					 XE_GT_STATS_ID_PARALLEL_PAGEFAULT_COUNT,
 					 1);
 			break;
@@ -759,7 +759,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 	}
 #undef USM_QUEUE_MAX_RUNTIME_MS
 
-	xe_gt_stats_incr(xe_root_mmio_gt(xe), XE_GT_STATS_ID_PAGEFAULT_US,
+	xe_gt_stats_incr(xe_device_any_gt(xe), XE_GT_STATS_ID_PAGEFAULT_US,
 			 xe_gt_stats_ktime_us_delta(start));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dc975f595368..01433ae09130 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -592,7 +592,8 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
 
 	switch (resp.uc_type) {
 	case XE_QUERY_UC_TYPE_GUC_SUBMISSION: {
-		struct xe_guc *guc = &xe->tiles[0].primary_gt->uc.guc;
+		struct xe_gt *gt = xe_device_any_gt(xe);
+		struct xe_guc *guc = &gt->uc.guc;
 
 		version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
 		break;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a26f6b20a22e..cd9f7589c4c2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1706,7 +1706,7 @@ static void xe_vm_init_prove_locking(struct xe_device *xe, struct xe_vm *vm)
 	fs_reclaim_release(GFP_KERNEL);
 
 	down_read(&vm->exec_queues.lock);
-	might_lock(&xe_root_mmio_gt(xe)->uc.guc.ct.lock);
+	might_lock(&xe_device_any_gt(xe)->uc.guc.ct.lock);
 	up_read(&vm->exec_queues.lock);
 }
 
-- 
2.43.0

