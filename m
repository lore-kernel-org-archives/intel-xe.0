Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF00C41513
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 13:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69F510E1A1;
	Mon, 10 Jun 2024 13:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcbkM4O2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E270210E189
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718027383; x=1749563383;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yxiathPUoFfRZu3zsWN6JfGA4A9/KEJObu12rhSvYTI=;
 b=fcbkM4O2ubDGRT9qCNuQYIEZpNQEVro8CXq97r678DOnM5pcJeKZ1pvL
 Mikjbn56azvzP8TI5oc2+Ni8SeKYNkbNrLXiUcOViqR2XoP/dGt0KGDRg
 UzmHCzfdihEWLbNeHjd6cuhQnN8oc2+bMPxFCcI5gD/VoPyG0xZMjK50I
 hjYV2+JGmyZ9IbpBz9h2yFdwXqUXoJF1A44GjSp5ffI5eCugRZYI1P9Jb
 Q10NrbzvESj6l7Zu8C5jd3UGr5nHUj4DXMFTCfHLA5sQOhCCP7iyxtGVv
 mfPqNcNeVs6Ze2xmwMs/R01qaCjNH5Rg3iSMVcMmxhem8X96eV0Frspkx Q==;
X-CSE-ConnectionGUID: ybkD6z6HRM+lsgm72ycf8w==
X-CSE-MsgGUID: wjuRo2hZTJimhqP6jwOvdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14419830"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14419830"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 06:49:42 -0700
X-CSE-ConnectionGUID: ThwrM3oURWusNNu2G/ZMmw==
X-CSE-MsgGUID: dN2XNJPjTqyES7F3zMJaXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="76523124"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 06:49:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 1/7] drm/xe: Add ctx timestamp to LRC snapshot
Date: Mon, 10 Jun 2024 06:50:05 -0700
Message-Id: <20240610135011.2605272-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610135011.2605272-1-matthew.brost@intel.com>
References: <20240610135011.2605272-1-matthew.brost@intel.com>
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

