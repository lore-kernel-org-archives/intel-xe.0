Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E83D11197
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 19:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D776E10E702;
	Wed, 26 Nov 2025 19:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ds3eQqxZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A92E10E708
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764183598; x=1795719598;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=90o+RHbsamMbjuBtmCkMr9PgjrKyr3YjRMc9yGeDocw=;
 b=Ds3eQqxZExN8NqmoPd32dHzPTRTGrupC3jpdPaS4qBPjVzXGrozqt7EO
 2asj1u9gPc3cbPRy0eOOqntiEVO4SXfRn/rT0/XoLQ7//IdiYLo2nwDJa
 QtAKBIS+7BFUIkWDN0hNPGQam/9BCEu3svHi7ZGaGsh/Mfd8dJpXxWGPy
 LCgRhYXq/q7h9SFvLVeBH3GxMWvYlVe9w2byJHLTPt/U+EYrkVJvWojgB
 LXaTujapg0q+ygzJJn7y9v4JCK3/JXRRA8lPJ8VyCZINT+74EAM0e/NJ3
 V54off8NC1D8n7DIbdXIwL7tqdcu4ZQI5W1PvTWSXICGgfuvDoS+kQp8b w==;
X-CSE-ConnectionGUID: 5hO9cAHDTm+yZj+9cL77Ww==
X-CSE-MsgGUID: W/2/kN7aRwyr5+2iuGMYxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66269526"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66269526"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:57 -0800
X-CSE-ConnectionGUID: nhVjir/3SOiCx/eqGwF41Q==
X-CSE-MsgGUID: 1PoWctMqQQODui8IpucwjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193121216"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 8/9] drm/xe: Add replay_offset and replay_length lines to
 LRC HWCTX snapshot
Date: Wed, 26 Nov 2025 10:59:51 -0800
Message-Id: <20251126185952.546277-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126185952.546277-1-matthew.brost@intel.com>
References: <20251126185952.546277-1-matthew.brost@intel.com>
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
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c       | 8 ++++++++
 drivers/gpu/drm/xe/xe_lrc.h       | 1 +
 drivers/gpu/drm/xe/xe_lrc_types.h | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index b5083c99dd50..2deca095607c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1402,6 +1402,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 	kref_init(&lrc->refcount);
 	lrc->gt = gt;
+	lrc->replay_size = xe_gt_lrc_size(gt, hwe->class);
+	if (xe_gt_has_indirect_ring_state(gt))
+		lrc->replay_size -= LRC_INDIRECT_RING_STATE_SIZE;
 	lrc->size = lrc_size;
 	lrc->flags = 0;
 	lrc->ring.size = ring_size;
@@ -2235,6 +2238,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->lrc_bo = xe_bo_get(lrc->bo);
 	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
 	snapshot->lrc_size = lrc->size;
+	snapshot->replay_offset = 0;
+	snapshot->replay_size = lrc->replay_size;
 	snapshot->lrc_snapshot = NULL;
 	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
@@ -2305,6 +2310,9 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	}
 
 	drm_printf(p, "\n\t[HWCTX].length: 0x%lx\n", snapshot->lrc_size - LRC_PPHWSP_SIZE);
+	drm_printf(p, "\n\t[HWCTX].replay_offset: 0x%lx\n", snapshot->replay_offset);
+	drm_printf(p, "\n\t[HWCTX].replay_length: 0x%lx\n", snapshot->replay_size);
+
 	drm_puts(p, "\t[HWCTX].data: ");
 	for (; i < snapshot->lrc_size; i += sizeof(u32)) {
 		u32 *val = snapshot->lrc_snapshot + i;
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 2fb628da5c43..c3288625d0c7 100644
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
index e9883706e004..a4373d280c39 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -25,6 +25,9 @@ struct xe_lrc {
 	/** @size: size of the lrc and optional indirect ring state */
 	u32 size;
 
+	/** @replay_size: Size LRC needed for replaying a hang */
+	u32 replay_size;
+
 	/** @gt: gt which this LRC belongs to */
 	struct xe_gt *gt;
 
-- 
2.34.1

