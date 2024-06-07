Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C28EC27C65
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 22:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC7710E0BF;
	Fri,  7 Jun 2024 22:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3/Otb8Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3381610E0DB
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 22:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717797764; x=1749333764;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yxiathPUoFfRZu3zsWN6JfGA4A9/KEJObu12rhSvYTI=;
 b=a3/Otb8Z6BQdzNo7HidaokfmF4cMyK41lnwcltOLeMJ07OnvoQH+bryb
 sO9hdcQ9gVTFTyKv3EopnelC7c6DeW/bLdqrKY54L68w5Njk6qQ9i3fS2
 WetWipiwFii7e8Uug0kCnEa4n1jrOy8ztFYSsfzfSyYy0/2PVbD3w6rJE
 B/pe9B8whjS35Mi/ibsCWbs06w1CZeKEqCf1LR9vAmfYuyle0dWY+mSm+
 yoKyPLerN7tXeFGPk1Cm5oeZqqZ0cKe8q4V/1Bk9ILbkvnZpXEZz+eXAG
 MQc+v5sljQ0dy6Cd5wsCBYTmRmOIwBaONTrPtnzd7Vm2DHQ6AkeWUQIPm Q==;
X-CSE-ConnectionGUID: xJG5l30YT+ypcwPx3sK8cQ==
X-CSE-MsgGUID: FIU8L1f6RfihjuJkWvLibg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14657038"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14657038"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 15:02:43 -0700
X-CSE-ConnectionGUID: Y40ILr83TQKLhAX6DB2Pog==
X-CSE-MsgGUID: gVt/r6GKQW+q76XQFjxqWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38307944"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 15:02:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 4/6] drm/xe: Add ctx timestamp to LRC snapshot
Date: Fri,  7 Jun 2024 15:03:12 -0700
Message-Id: <20240607220314.2318154-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607220314.2318154-1-matthew.brost@intel.com>
References: <20240607220314.2318154-1-matthew.brost@intel.com>
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

The ctx timestamp is useful information, add to LRC snapshot.

v2:
  - s/ctx_timestamp_job/ctx_job_timestamp

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 0fef354c6489..f3d77aa1750d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -49,6 +49,8 @@ struct xe_lrc_snapshot {
 	} tail;
 	u32 start_seqno;
 	u32 seqno;
+	u32 ctx_timestamp;
+	u32 ctx_job_timestamp;
 };
 
 static struct xe_device *
@@ -1642,6 +1644,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
 	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
 	snapshot->lrc_snapshot = NULL;
+	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
+	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
 	return snapshot;
 }
 
@@ -1690,6 +1694,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 		   snapshot->tail.internal, snapshot->tail.memory);
 	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
+	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
+	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
 
 	if (!snapshot->lrc_snapshot)
 		return;
-- 
2.34.1

