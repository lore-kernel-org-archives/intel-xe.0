Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C2DCD3427
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 23:44:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C7E10E18F;
	Tue,  5 May 2026 23:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="egpDNjPU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DD210E4C1
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 23:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778024658; x=1809560658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZWFfEE0wsxwYYTVC8FVOyLtzlRIvXDo/JUBsuvkbczY=;
 b=egpDNjPUI9WbeP5e6b1P8T0F4zbThsgv+KlMdxvg1w92lVq8IVphABM/
 l10zeNhpAtlD0oT0nyLEQucCzO7xPwpunuiaQFJV+wtTmdt36IXq/QoL7
 A2ZtZM2G5xKPryAlaQqWadzs9tDxUsnkTXb18bpcN9MnkswJ8aPRMbBv8
 tTU8Fljnvu4/Mo4yI4Li28fxdNRhr9QksMlo3eUcDG/pWHBW071/PZEYj
 AsPhoSCW9qq910sassPmZaoO1UyHcnvUOmlzM7DDB8W+Emy2BPuNcEkDJ
 RQOTUHTk7Yv9x1NTLSD59w3vOzKvr84welRssi6lkiNShD8TnSsowxeVa g==;
X-CSE-ConnectionGUID: qFW7Q2GUTXSMT5QcvOCCwQ==
X-CSE-MsgGUID: 9gExdG+ESDWxQkfkD8aV+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78771096"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78771096"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:16 -0700
X-CSE-ConnectionGUID: mYe/GCJ5QbGY1FkSbkQAmA==
X-CSE-MsgGUID: APoip+RpSCaRnP4eh05QMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="231569044"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v3 05/11] drm/xe/multi_queue: Store primary LRC and position
 info in LRC
Date: Tue,  5 May 2026 16:44:14 -0700
Message-ID: <20260505234408.3552147-18-umesh.nerlige.ramappa@intel.com>
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

Given an LRC belonging to the secondary queue, in order to check if its
context group is active, we need to check the LRC of the primary queue.
In addition to that we want to compare the secondary queue position to
CSMQDEBUG register to check if the queue itself is active.

To do so, store primary LRC and position information in the LRC as well
as take a reference to the primary LRC from each LRC in the queue group.

A note on references involved:

- In general the Queue takes a ref on its LRC.
- In addition, for multi-queue,
a. Primary Queue takes a ref for each Secondary LRC.
b. Each Secondary Queue takes a ref to the Primary Queue

In the current patch, each LRC in the queue group is storing a pointer
to Primary LRC. Both Primary and secondary LRCs are freed only when
primary queue is destroyed. At this time there all secondary queues are
already destroyed, so there is no one using secondary LRCs. We should be
good without taking any additional references.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2:
- Store primary LRC instead of primary queue (Niranjana)
- Drop the valid flag and check if primary_lrc is NULL (Niranjana)
- Document/Revisit references (Matt/Umesh)

v3:
- Drop the reference logic since it's not needed (Niranjana)
- Move lrc->multi_queue initialization to a later point (Niranjana)
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 5 +++++
 drivers/gpu/drm/xe/xe_lrc.h        | 5 +++++
 drivers/gpu/drm/xe/xe_lrc_types.h  | 8 ++++++++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 9b36ff5b09a6..bc8110a9b054 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1389,6 +1389,11 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 				goto put_exec_queue;
 		}
 
+		if (xe_exec_queue_is_multi_queue(q)) {
+			q->lrc[0]->multi_queue.pos = q->multi_queue.pos;
+			q->lrc[0]->multi_queue.primary_lrc = q->multi_queue.group->primary->lrc[0];
+		}
+
 		if (xe_vm_in_preempt_fence_mode(vm)) {
 			q->lr.context = dma_fence_context_alloc(1);
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index d280e6572398..557dce004d48 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -91,6 +91,11 @@ static inline size_t xe_lrc_ring_size(void)
 	return SZ_16K;
 }
 
+static inline bool xe_lrc_is_multi_queue(struct xe_lrc *lrc)
+{
+	return lrc->multi_queue.primary_lrc;
+}
+
 size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 5a718f759ed6..0a5c13ec2ad7 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -63,6 +63,14 @@ struct xe_lrc {
 
 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
 	u64 ctx_timestamp;
+
+	/** @multi_queue: Multi queue LRC related information */
+	struct {
+		/** @multi_queue.primary_lrc: Primary lrc of this multi-queue group*/
+		struct xe_lrc *primary_lrc;
+		/** @multi_queue.pos: Position of LRC within the multi-queue group */
+		u8 pos;
+	} multi_queue;
 };
 
 struct xe_lrc_snapshot;
-- 
2.51.0

