Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCD8CD343F
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 22:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B3910EF00;
	Wed,  6 May 2026 22:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXiO3F1K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BF510EF03
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 22:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778106911; x=1809642911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M1p8rN3xz4rUFKHyZmDbN0pYm3rTukJHwbrwvJOEYEk=;
 b=DXiO3F1KnVGYbmaLRfX5z6yL7uyWt9k225OH0qdIclEEnI4V0t9/3Ec7
 gUwGUyWmaHiuX+TlPj6rfnmppAOlAe0Y1fnKjzuqYaIhaJUwuEG1F3MA8
 FPrdRzxATtfOrr36LCUZ6AvMlgWrCXtZJrRY1zKLf7COutzgOOUlWXaU6
 CPVTOGzvcq43l7XC2CvvpR3FjO0YiUfDRn6cCcHULllmYVu4cREcHnwHg
 YtBH7rvKk6FJmvCqPixbOmQeNjS31KHCzgvfKKmfee2hZ7541i/tKPlzz
 RxckNFUT3IFKq/5LDAGDIwGt1p45q0BLF1rc4HRzk8lElwIVNmu52EV6i Q==;
X-CSE-ConnectionGUID: H7yAgD41SiqizOYKiy9eqw==
X-CSE-MsgGUID: p3hG39i4TJulF10yBJhDEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90429710"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="90429710"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 15:35:11 -0700
X-CSE-ConnectionGUID: 6JxXf8wmTnmjK1xX2gH3WA==
X-CSE-MsgGUID: q886Z+DSRjy4Qw27CCIfeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="259707467"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 15:35:10 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v4 02/11] drm/xe: Add timestamp_ms to LRC snapshot
Date: Wed,  6 May 2026 15:35:03 -0700
Message-ID: <20260506223500.3769614-15-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
References: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
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
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
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

