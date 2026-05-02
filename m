Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27424CD342C
	for <intel-xe@archiver.kernel.org>; Sat,  2 May 2026 00:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF07C10E50E;
	Sat,  2 May 2026 00:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LBfsY5Ok";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39DE10E281
 for <intel-xe@lists.freedesktop.org>; Sat,  2 May 2026 00:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777683220; x=1809219220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GEEUtpy9qMGIjAxk6vy7e+L0JY7VTGLyRTeNSHMZ2h8=;
 b=LBfsY5OkjIQhdrO0TKH6/0TVEPDMQjuZjch3w8mt27jWjYUzZI7IOH0Q
 Lf9vTDBLjXROzrUWY1IO6Auhr8YVRhWMUaEZJLwQeMI4HLARu7ebRf0Yl
 +Pq1VtmqPzZ5Lafc4OIJxhPXmA8Uy6g3xyMETK3gXibdVWCmSIex9lbdz
 j+HzjtADIGv+fMUrqWfqVwi8yepPFqhpL9kYi6hu4+CKLzQut882OIcv5
 HyP55Krhs0qqvQCv/0hzzQFL/jSrTrljzwkUN3L/m9zh3NoO8ZmeFuTVH
 +nSSZYhq/BDnI6K4Vynew5tTRMptYqx43fGYj0usfKx8WMXtJHFJJsvtW w==;
X-CSE-ConnectionGUID: zjw6ByaiS460XmlmxuwoLg==
X-CSE-MsgGUID: 3KTC2zyNTaqCOdiFA+DdOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78841556"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="78841556"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:40 -0700
X-CSE-ConnectionGUID: yfv129btTK6Qnw4rYG3cfA==
X-CSE-MsgGUID: SrJUUvGeQV2xGtK1D/4zoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="228510937"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v2 1/9] drm/xe/lrc: Use 64 bit ctx timestamp in the LRC
 snapshot
Date: Fri,  1 May 2026 17:53:34 -0700
Message-ID: <20260502005332.3135977-12-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
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

Use the 64 bit value when available for the context timestamp in the LRC
snapshot.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
 drivers/gpu/drm/xe/xe_lrc.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 9d12a0d2f0b5..98dc4d0eb61b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2475,7 +2475,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->replay_offset = 0;
 	snapshot->replay_size = lrc->replay_size;
 	snapshot->lrc_snapshot = NULL;
-	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
+	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
 	return snapshot;
 }
@@ -2528,7 +2528,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	drm_printf(p, "\tRing start: (memory) 0x%08x\n", snapshot->start);
 	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
-	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
+	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
 
 	if (!snapshot->lrc_snapshot)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index e7c975f9e2d9..62beaffba0af 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -37,7 +37,7 @@ struct xe_lrc_snapshot {
 	} tail;
 	u32 start_seqno;
 	u32 seqno;
-	u32 ctx_timestamp;
+	u64 ctx_timestamp;
 	u32 ctx_job_timestamp;
 };
 
-- 
2.43.0

