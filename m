Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FB5C36004
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 19:27:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4E610E6A0;
	Thu, 20 Mar 2025 19:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FvtkGQEm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF60010E69E
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 19:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742498848; x=1774034848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NA33YsIrBPmZphwYoyHdYKof+u3G/lxHeLLYoRxBTgs=;
 b=FvtkGQEmyl2/yb/LIMUXdb+lOLkubJh4FJlX3is4Eq1GlCEurPNkEfdO
 8S+asAncxWpcpbGYJIB7bS1UVA925xlx7ZCVhoeOFDTPMG4x7Lo3JKGxJ
 E25FvWMi+2YtPtDjqdhWYIn6Yp1zqrn6QqyFb4fWaMDVENyntjrucg3Ac
 3cae/AryXkoUP2/MJAkG0CTkPEjZ0zyoKgX7lxMdrBQzNC7zYqvMXVJd4
 hILD1X+5RrvUW7bvrIB5ns0dpwvptymnHhUSsjgqoH2nAAibs4bi22fJf
 Sn/HpNpAl5Esjqb3yX7oHDyzzrKt5W7X27ROvfGSjs++MpuJXmceYb+WI A==;
X-CSE-ConnectionGUID: oz+Cq50zR4qD2yS9eM7DFw==
X-CSE-MsgGUID: Yvqa2UQqR4W0sTgR86RIuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43678752"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43678752"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:27:23 -0700
X-CSE-ConnectionGUID: 7D6iS5hGRpiEniBaf64CLA==
X-CSE-MsgGUID: ouyAZx8eS/e1QZtMa6JrQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="123156829"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:27:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v3 8/9] drm/xe: Add replay_offset and replay_length lines to
 LRC HWCTX snapshot
Date: Thu, 20 Mar 2025 12:28:30 -0700
Message-Id: <20250320192831.3842138-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320192831.3842138-1-matthew.brost@intel.com>
References: <20250320192831.3842138-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add replay_offset and replay_length lines to LRC HWCTX snapshot with the
idea being this information can be used extract the data which needs to
be pass to exec queue extension DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
so GPU hang can be replayed via a Mesa tool.

The additional lines look like:

[HWCTX].replay_offset: 0x%x
[HWCTX].replay_length: 0x%x

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c       | 8 ++++++++
 drivers/gpu/drm/xe/xe_lrc.h       | 1 +
 drivers/gpu/drm/xe/xe_lrc_types.h | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 81def1792664..da8846a0104a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -897,6 +897,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 	kref_init(&lrc->refcount);
 	lrc->flags = 0;
+	lrc->replay_size = xe_gt_lrc_size(gt, hwe->class);
+	if (xe_gt_has_indirect_ring_state(gt))
+		lrc->replay_size -= LRC_INDIRECT_RING_STATE_SIZE;
 	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
 	if (xe_gt_has_indirect_ring_state(gt))
 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
@@ -1684,6 +1687,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->lrc_bo = xe_bo_get(lrc->bo);
 	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
 	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
+	snapshot->replay_offset = 0;
+	snapshot->replay_size = lrc->replay_size;
 	snapshot->lrc_snapshot = NULL;
 	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
@@ -1758,6 +1763,9 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	}
 
 	drm_printf(p, "\n\t[HWCTX].length: 0x%lx\n", snapshot->lrc_size - LRC_PPHWSP_SIZE);
+	drm_printf(p, "\n\t[HWCTX].replay_offset: 0x%lx\n", snapshot->replay_offset);
+	drm_printf(p, "\n\t[HWCTX].replay_length: 0x%lx\n", snapshot->replay_size);
+
 	drm_puts(p, "\t[HWCTX].data: ");
 	for (; i < snapshot->lrc_size; i += sizeof(u32)) {
 		u32 *val = snapshot->lrc_snapshot + i;
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 0b40f349ab95..2d6838645858 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -23,6 +23,7 @@ struct xe_lrc_snapshot {
 	struct xe_bo *lrc_bo;
 	void *lrc_snapshot;
 	unsigned long lrc_size, lrc_offset;
+	unsigned long replay_size, replay_offset;
 
 	u32 context_desc;
 	u32 ring_addr;
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 71ecb453f811..c2766719ff77 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -25,6 +25,9 @@ struct xe_lrc {
 	/** @size: size of lrc including any indirect ring state page */
 	u32 size;
 
+	/** @replay_size: Size LRC needed for replaying a hang */
+	u32 replay_size;
+
 	/** @tile: tile which this LRC belongs to */
 	struct xe_tile *tile;
 
-- 
2.34.1

