Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA63CCFA16
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 18:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD1810E3A6;
	Tue,  4 Nov 2025 18:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+WcEDPf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B5D10E2B9
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 18:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762282318; x=1793818318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EllcSPlGkv1t/JSwDgPY4EipgawvDqN+hT9Dpc5NhSc=;
 b=i+WcEDPf8zDnv1ShBKpflY86MTgwuC00pOfCmrb6xz7WkEVa0oarUvRY
 2tokbAE2jMwfZiVAiKoCMYxTtJkwro8IaPEXn0EDhdba9Sy4h05CDFMDO
 uJK1BmvEUSmd1ZiYP0HPxq8n/GsSjnLgcQgsxHKWxHy6ClYuighdx4+Tn
 T8EjGHwhhrzfPiv7UXYr9/IN7nF3oLQ6C1pHb2NO43qGp7RoKOyMuq/yr
 k8sy4QBxf6lJHXVD1eyoz4kzD/1ROZVfjXTUtb9Eve92kqLyk4K1w60LC
 2UwYErOdjwNzsImtDIpUO8ulopl3XDTTkFyamDF2fAuW3f+5YyFwN6+aO w==;
X-CSE-ConnectionGUID: ECpmwxpkTTeQ4NUG0L8q8A==
X-CSE-MsgGUID: 7yJWdEeXQmiVGALbMTpj2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68247750"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="68247750"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:51:57 -0800
X-CSE-ConnectionGUID: hN47MffBRB2SHbxphUivgw==
X-CSE-MsgGUID: uRhmXADCS1KG7Z9id0IKrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187183088"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:51:57 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v2 08/16] drm/xe/multi_queue: Add multi queue information to
 guc_info dump
Date: Tue,  4 Nov 2025 10:51:42 -0800
Message-ID: <20251104185150.246345-9-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
References: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
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

v2: Move multi queue related fields inside the multi_queue
    sub-structure (Matt Brost)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++++++
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 27ef83524a34..f70c5f8003b7 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3038,6 +3038,11 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	if (snapshot->parallel_execution)
 		guc_exec_queue_wq_snapshot_capture(q, snapshot);
 
+	if (xe_exec_queue_is_multi_queue(q)) {
+		snapshot->multi_queue.valid = true;
+		snapshot->multi_queue.primary = xe_exec_queue_multi_queue_primary(q)->guc->id;
+		snapshot->multi_queue.pos = q->multi_queue.pos;
+	}
 	spin_lock(&sched->base.job_list_lock);
 	snapshot->pending_list_size = list_count_nodes(&sched->base.pending_list);
 	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
@@ -3120,6 +3125,11 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 	if (snapshot->parallel_execution)
 		guc_exec_queue_wq_snapshot_print(snapshot, p);
 
+	if (snapshot->multi_queue.valid) {
+		drm_printf(p, "\tMulti queue primary GuC ID: %d\n", snapshot->multi_queue.primary);
+		drm_printf(p, "\tMulti queue position: %d\n", snapshot->multi_queue.pos);
+	}
+
 	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
 	     i++)
 		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index dc7456c34583..25e29e85502c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -135,6 +135,19 @@ struct xe_guc_submit_exec_queue_snapshot {
 		u32 wq[WQ_SIZE / sizeof(u32)];
 	} parallel;
 
+	/** @multi_queue: snapshot of the multi queue information */
+	struct {
+		/**
+		 * @multi_queue.primary: GuC id of the primary exec queue
+		 * of the multi queue group.
+		 */
+		u32 primary;
+		/** @multi_queue.pos: Position of the exec queue within the multi queue group */
+		u8 pos;
+		/** @valid: The exec queue is part of a multi queue group */
+		bool valid;
+	} multi_queue;
+
 	/** @pending_list_size: Size of the pending list snapshot array */
 	int pending_list_size;
 	/** @pending_list: snapshot of the pending list info */
-- 
2.43.0

