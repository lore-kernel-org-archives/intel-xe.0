Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C08DC98306
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 04:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB4310E594;
	Fri, 25 Sep 2026 04:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mn5bysl3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BA410F825
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 04:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790312011; x=1821848011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t0CgUBmt2iU9OYboLf+JZR4pGOi+drGSPW/VN/syDZU=;
 b=mn5bysl3S1elshsOIoel/nACLC40CvkazWd9OcvOg1+6Ie7VsVBK00lf
 lps6ojPQp2vl+kkwU8J5oX/qpFJTClJb6330VlfZZsDkVEr8wjIkxzzat
 AInrHubQ0/SsHXeLCKSitZjn83u5JhhH9llLdWB7dzudQLXyINJATxSlD
 wyysKxUNwevxe/PMMQCIvXcA8pieC1G3Ptkj33A6WCm/YmnIal/+cw7Dw
 JtUsis5/m1jLDTBmYzdtMEGLIPmPfpHtAFdYVFd/sB12ZSOomeyp1Rwac
 UMMMYT+IvF5IIMAbssYMKUM5euu0YzdIPPSk9oaN4LGttoDLoIYbCE8RM Q==;
X-CSE-ConnectionGUID: MI8Q59xcTi64PiW6K+rkUQ==
X-CSE-MsgGUID: 7uCsPrFeREicb+Tzi87t4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90156218"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90156218"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:27 -0700
X-CSE-ConnectionGUID: dmQ7RCTsQnSRrTi6YZkwhg==
X-CSE-MsgGUID: Ea3HK0f9ToOtU1bjrRF+qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="312155509"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v7 05/24] drm/xe: Add job count to GuC exec queue snapshot
Date: Thu, 24 Sep 2026 21:53:01 -0700
Message-Id: <20260925045320.1325860-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925045320.1325860-1-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
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

---
v7:
 - s/%d/%u (Sashiko)
---
 drivers/gpu/drm/xe/xe_guc_submit.c       | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f3ba8abfc228..4bd1ead57efa 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3686,6 +3686,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	snapshot->logical_mask = q->logical_mask;
 	snapshot->width = q->width;
 	snapshot->refcount = kref_read(&q->refcount);
+	snapshot->jobcount = atomic_read(&q->job_cnt);
 	snapshot->sched_timeout = sched->base.timeout;
 	snapshot->sched_props.timeslice_us = q->sched_props.timeslice_us;
 	snapshot->sched_props.preempt_timeout_us =
@@ -3758,6 +3759,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
 	drm_printf(p, "\tWidth: %d\n", snapshot->width);
 	drm_printf(p, "\tRef: %d\n", snapshot->refcount);
+	drm_printf(p, "\tJob count: %u\n", snapshot->jobcount);
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

