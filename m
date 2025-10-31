Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E79CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7410110EC13;
	Fri, 31 Oct 2025 18:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUGZH6O2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CC210E2FF
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935384; x=1793471384;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qhVPNFa3ObYETwc/6BHVKyzcQ+QEC7kTRGJNzvAHrcI=;
 b=BUGZH6O2TnzYgMamfHAa8e09o9hm/tz6Q0uJ3Xx7LU1jKEkIkEz0OLit
 miN2qcduy1sKfayBU9dlY9dtAhJNaIfcYPqWdOykoRC3sCz27B74rrPFF
 j/t0aTc4ChVvG0fl6CyrG3HIn3Z8vTlvdtTCGkdTpOOUq7ZRHLjYllrP4
 7/FnRlUjL2W7FdUd65pfz+XZwvM9Tbor87801/CyfklKHbTCaKG2+XFY8
 1WALu4ax2s61Fkhu/VqCmhvFy4LGd0xtx1tQt9IPU9dBW4JrjmGXb58wq
 FqJyzm7w2Nn2bFg5YdnkBRg2XIus5/7sogEaqXYDTNBkqr2RaABWRbl8F Q==;
X-CSE-ConnectionGUID: l1BM5TzWRf+2gyK+qDCxZQ==
X-CSE-MsgGUID: fnLWL0lIQiCHBnDdYqfm5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63123858"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="63123858"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:43 -0700
X-CSE-ConnectionGUID: ad1VMxF6SY2i+Bjob6dFGw==
X-CSE-MsgGUID: ttJXZ0zYR121+3vOETFD5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="185987635"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 08/16] drm/xe/multi_queue: Add multi queue information to
 guc_info dump
Date: Fri, 31 Oct 2025 11:29:28 -0700
Message-ID: <20251031182936.1882062-9-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
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

Dump multi queue specific information in the guc exec queue
dump.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++++++
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 426b64ef8d99..b84a0be2eefe 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3032,6 +3032,11 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	if (snapshot->parallel_execution)
 		guc_exec_queue_wq_snapshot_capture(q, snapshot);
 
+	snapshot->is_multi_queue = xe_exec_queue_is_multi_queue(q);
+	if (snapshot->is_multi_queue) {
+		snapshot->multi_queue.primary = xe_exec_queue_multi_queue_primary(q)->guc->id;
+		snapshot->multi_queue.pos = q->multi_queue.pos;
+	}
 	spin_lock(&sched->base.job_list_lock);
 	snapshot->pending_list_size = list_count_nodes(&sched->base.pending_list);
 	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
@@ -3114,6 +3119,11 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 	if (snapshot->parallel_execution)
 		guc_exec_queue_wq_snapshot_print(snapshot, p);
 
+	if (snapshot->is_multi_queue) {
+		drm_printf(p, "\tMulti queue primary GuC ID: %d\n", snapshot->multi_queue.primary);
+		drm_printf(p, "\tMulti queue position: %d\n", snapshot->multi_queue.pos);
+	}
+
 	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
 	     i++)
 		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index dc7456c34583..20dddf50d802 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -135,6 +135,19 @@ struct xe_guc_submit_exec_queue_snapshot {
 		u32 wq[WQ_SIZE / sizeof(u32)];
 	} parallel;
 
+	/** @is_multi_queue: The exec queue is part of a multi queue group */
+	bool is_multi_queue;
+	/** @multi_queue: snapshot of the multi queue information */
+	struct {
+		/**
+		 * @multi_queue.primary: GuC id of the primary exec queue
+		 * of the multi queue group.
+		 */
+		u32 primary;
+		/** @multi_queue.pos: Position of the exec queue within the multi queue group */
+		u8 pos;
+	} multi_queue;
+
 	/** @pending_list_size: Size of the pending list snapshot array */
 	int pending_list_size;
 	/** @pending_list: snapshot of the pending list info */
-- 
2.43.0

