Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ABFC79F87
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0E510FB3A;
	Fri,  4 Sep 2026 21:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ain0vIOT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6839A10E42F
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788556581; x=1820092581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yt8uqNfFHGxRZ3j2uSIDsQHSkdTUmUYSJEGtk5c771g=;
 b=Ain0vIOTaFiIz4MyJOUb3Z9kyysLkyeOszinU0tYxnS4BjFY34JekCJf
 L7IzORT68/qH0Mym8yLC3p3UBw6qH59X+ZucB6iJ6zKvbuHLPKPcMT4QT
 qtmRwWj23jmBGkVGIih0XmklrRbSU9ZpZNfZrARYy6ei2A3n4y1OUZoge
 DqjIitdYnuGFSJbjmBSXDVF00EMJREJUVTR15yMWImPqFzRK1TooPTBKz
 tXin4bjph1RAU+esIGRtOsShqQAGzpY2IXoOXFfEEyy8iVbo6OnFRDJLW
 5EhUl85fPvEBEh5zpHahjDoO48zHwlC2Q8CamTeQok7ZLO+FwV0wtih+q Q==;
X-CSE-ConnectionGUID: 79JNFuiISNKt28HxdldUIA==
X-CSE-MsgGUID: yLdZghfsR261SXuCxfAx4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89096801"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89096801"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:20 -0700
X-CSE-ConnectionGUID: 5cxwdTB6SQuHYw1zMOwNEw==
X-CSE-MsgGUID: nYoOJqndQG20bvn/roSkcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="267563417"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v6 04/24] drm/xe: Add job count to GuC exec queue snapshot
Date: Fri,  4 Sep 2026 14:15:53 -0700
Message-Id: <20260904211613.3934307-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904211613.3934307-1-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
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

Add the job count to the GuC exec queue snapshot, as this is useful
debug information.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-5-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_guc_submit.c       | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0a6e2b81b5a5..8b8673f4e037 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3684,6 +3684,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	snapshot->logical_mask = q->logical_mask;
 	snapshot->width = q->width;
 	snapshot->refcount = kref_read(&q->refcount);
+	snapshot->jobcount = atomic_read(&q->job_cnt);
 	snapshot->sched_timeout = sched->base.timeout;
 	snapshot->sched_props.timeslice_us = q->sched_props.timeslice_us;
 	snapshot->sched_props.preempt_timeout_us =
@@ -3756,6 +3757,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
 	drm_printf(p, "\tWidth: %d\n", snapshot->width);
 	drm_printf(p, "\tRef: %d\n", snapshot->refcount);
+	drm_printf(p, "\tJob count: %d\n", snapshot->jobcount);
 	drm_printf(p, "\tTimeout: %ld (ms)\n", snapshot->sched_timeout);
 	drm_printf(p, "\tTimeslice: %u (us)\n",
 		   snapshot->sched_props.timeslice_us);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index 7824f61b1290..8271702e692e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -77,6 +77,8 @@ struct xe_guc_submit_exec_queue_snapshot {
 	u16 width;
 	/** @refcount: ref count of this exec queue */
 	u32 refcount;
+	/** @jobcount: job count of this exec queue */
+	u32 jobcount;
 	/**
 	 * @sched_timeout: the time after which a job is removed from the
 	 * scheduler.
-- 
2.34.1

