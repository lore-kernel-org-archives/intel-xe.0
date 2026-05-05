Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9D0CD3427
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 23:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8B010EC70;
	Tue,  5 May 2026 23:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVLb8lCo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9989C10E18F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 23:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778024657; x=1809560657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nRm17oAo/EGK11u0QKvCW04jmoIh+ZvPd0vrfM0XcRc=;
 b=eVLb8lCoPSOxJHgLXulGvyaKmlqy0q/fxpjUR3ByNOxxftxFgy7M9x/p
 NoZtQI9DnQ2KKv35W5lvwzjDiisYkKtbRmN60fvVjib8+0oxPAda43OwX
 9mmDIxJ7np58JDD/hANRYFcjInrS2JO3G0GcVJ+1oHeO0hVOsexQqvblG
 Q5+L7TegDNDLEFnJbuOMSZhNHqOnInkABQZCKwB2UCYo5FprXLDVNIK9i
 /HoSOuwxpCD/uwa1EezZJzymfA5RPWZO9enMOshrJuA3/0hdY2pDhASxV
 njPqO4u9jYw1t6bhOIlTXL7HxU0SS7y/42Z8xkNZlo99VHO8QI8LRIBVe w==;
X-CSE-ConnectionGUID: 5qcwZtxHQyGMpEkcbqTTPg==
X-CSE-MsgGUID: iee46xV4Tv+A2NVJWrt6Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78771093"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78771093"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:16 -0700
X-CSE-ConnectionGUID: mJ7ihvl2RGG4NmadqIox+w==
X-CSE-MsgGUID: dLWTy9dEQtGLYsiwzLYzaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="231569034"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v3 02/11] drm/xe: Add timestamp_ms to LRC snapshot
Date: Tue,  5 May 2026 16:44:11 -0700
Message-ID: <20260505234408.3552147-15-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Add a timestamp in milliseconds to the LRC snapshot to make it easier to
reason about how long the LRC has been running and the average duration
of each job.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: Group u32s to avoid padding (Niranjana)
---
 drivers/gpu/drm/xe/xe_lrc.c | 4 ++++
 drivers/gpu/drm/xe/xe_lrc.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 570ff9f55849..66682a678cc2 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -23,6 +23,7 @@
 #include "xe_drm_client.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
+#include "xe_gt_clock.h"
 #include "xe_gt_printk.h"
 #include "xe_hw_fence.h"
 #include "xe_map.h"
@@ -2463,6 +2464,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->replay_size = lrc->replay_size;
 	snapshot->lrc_snapshot = NULL;
 	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
+	snapshot->ctx_timestamp_ms =
+		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_ctx_timestamp(lrc));
 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
 	return snapshot;
 }
@@ -2516,6 +2519,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
 	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
+	drm_printf(p, "\tTimestamp ms: %llu\n", snapshot->ctx_timestamp_ms);
 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
 
 	if (!snapshot->lrc_snapshot)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index bef7af9a578b..d280e6572398 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -38,6 +38,7 @@ struct xe_lrc_snapshot {
 	u32 start_seqno;
 	u32 seqno;
 	u64 ctx_timestamp;
+	u64 ctx_timestamp_ms;
 	u32 ctx_job_timestamp;
 };
 
-- 
2.51.0

