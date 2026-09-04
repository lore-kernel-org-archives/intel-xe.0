Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C96BC79F83
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA77710F836;
	Fri,  4 Sep 2026 02:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B64J/fO1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F53D10E1BB
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 02:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788488535; x=1820024535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7hz7K7ymTGgo7IFQicADgMT9IXLhYEAZauY39SxbdWI=;
 b=B64J/fO1cO0Nh6ypBgLTnRySIVDbSpX2XqsMNFc4ag6bd7F+xdkNkRBP
 aLHn7G61nQS/xj6p1aW8ca7BuPTchT7xL+TihzONT8u6IErINGJv2r3n7
 7RhGH3P8EDZKFYpqFy4+YoLqeirpo2UNCx786beLuLkLuORGlgshN8GD1
 1BPMMHduryEYwCPYasin+MqlVIA9WCNPD5gr2PHcF9KJc+2HhKR93gMN6
 0e/SHwDrd/2nnRhWQ6cD5ka2nowrBIVgP9ef29C/kWiwD1gu4qIZGAHv4
 jZiqBJ/PHX1jGhcpIcu1UFyqnK/VBwKF+hN1pqf5Xg3W/eLKs28t2argS Q==;
X-CSE-ConnectionGUID: kEJ7BZqcROe9UEU5YDUwNA==
X-CSE-MsgGUID: Dv0ccz/aTE2S8PgmsjkrxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="106506276"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="106506276"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 19:22:14 -0700
X-CSE-ConnectionGUID: zSYR35bERAyAO0lL0dln8A==
X-CSE-MsgGUID: TrT0st0LRe2P7LJjIcuKzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="275185115"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 19:22:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v5 04/25] drm/xe: Add job count to GuC exec queue snapshot
Date: Thu,  3 Sep 2026 19:21:46 -0700
Message-Id: <20260904022207.3490018-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904022207.3490018-1-matthew.brost@intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
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
index 99d8c807ff05..cf306568ef30 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3658,6 +3658,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	snapshot->logical_mask = q->logical_mask;
 	snapshot->width = q->width;
 	snapshot->refcount = kref_read(&q->refcount);
+	snapshot->jobcount = atomic_read(&q->job_cnt);
 	snapshot->sched_timeout = sched->base.timeout;
 	snapshot->sched_props.timeslice_us = q->sched_props.timeslice_us;
 	snapshot->sched_props.preempt_timeout_us =
@@ -3730,6 +3731,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
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

