Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9603EC021A1
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 14:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3692B10E8B3;
	Wed, 12 Feb 2025 14:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel-corp-partner-google-com.20230601.gappssmtp.com header.i=@intel-corp-partner-google-com.20230601.gappssmtp.com header.b="qFBVoejk";
	dkim-atps=neutral
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2703010E0F7
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 02:20:51 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e5b638d3f83so1460793276.2
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 18:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1739240450; x=1739845250; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vgrVD/S1fyENeEPsNEMJUqa7EpsCQdaabmA21V0gJHA=;
 b=qFBVoejkmDf/aZaQHbl681itsms7wrfxWonvnvWcFNc5b3JbjvNEA5W12dSYNlR36W
 3+TLV3NYwTUTXKuVWnOmy87gbbInxMJCqAEvym5ptiEBg9Wf0GvP0JQ1o1LstKRSJuZc
 QGRNug8WDErsboryS7e0Hl4/5aznoxnJPel/31KEG0lsg7AWTQS10zZrB+5ctiJ2WLoH
 nYPM7cgUa4Xoi6i70YQcB22bQl/S/Qk+vOfqYgxnSXlpnhtJXCQZji3W957EbtHIp2om
 0xiG0hHPW4H9OXnNcIViBDp06paiAiirAlPYYRYWJZu3cGjXSCoa0RL0aUU5K7oTbwKo
 KwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739240450; x=1739845250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vgrVD/S1fyENeEPsNEMJUqa7EpsCQdaabmA21V0gJHA=;
 b=RaximwPqeTbRxcYrZx1AbNOp4I03t7pGaFRYf2sD+z1gfa/6n5YzS2jWnDYkumQq9f
 xSiLPDQ8jABlQwLWUgDmrvkGsunC0tDuBRCLINme9rdRgUlWXIaoZHvG97wou9TuEuyg
 oaGyD/r8cOe7L9rNk1Fd1B/Rfq1Na2gMhW/komsa6sLt9vJ7TbQ+kLDXDq5XxBGcbpyj
 x+0xrYxwfZxlQzCx3KNMHC7/Y15nFaiiouU8zyFj8xl48CmrAEYn5q8OowrntrcwzP+/
 Qs4Rl5uL+h6f/AFF9XMX49GrCPO+g54Ui0lVN0Slf2JkyxTO3+SZ7KjOpULYCmjvNL73
 +6OQ==
X-Gm-Message-State: AOJu0YzPU3Uhyy50TlVBkRryTiO0WR20j6bHVPpLxTj+MvMps77UfVjg
 ZDDN4grf6R0o7hZTyL2q6fpyVhhtc1GuwCr/0abx/epDB4Qw3H2IXYBpgvuYuKGK8q0TJF6vpCP
 HVmk=
X-Gm-Gg: ASbGncu1Fh7B5GxH+VVUiQXq2ho787am/f5eWbm28Lv3ZKlb0yiKZRhlrNW1Eh4EwTx
 faw7oq2l/FmObDDxij6/OioGyljYGp3DQGni9Z/oi3AX1YVeAfZt3CaNoMx5tyDUp+JSGRWzKeR
 shujedQ78QT2F5JUPeFAP4ct8kW8y1egCQ3BOE0HjytsQ2SGfrogMGRrGB9mxkW+mxtx7Qrcpzk
 Xw7xpeffoBGtnIZtzlotCvfcnJ4jnxxbm25ZwVnYXciWovHMe/LpuHunjyqmSRkjX9NKMsz8hJE
 gbsV36D++yEMjTTxJwfA6aT2+2HX30Wl0acsm5UdjStql2DR
X-Google-Smtp-Source: AGHT+IHJOfilrFvktlEInax0PL+kt79W7tVxot6BJ6qnLN0e3URDXKWG7Gp4/RSZPMnZWTt1gQJumA==
X-Received: by 2002:a05:6902:992:b0:e58:3422:fa06 with SMTP id
 3f1490d57ef6-e5d93d31888mr2671135276.49.1739240449910; 
 Mon, 10 Feb 2025 18:20:49 -0800 (PST)
Received: from nucskully.lan ([192.254.97.188])
 by smtp.googlemail.com with ESMTPSA id
 3f1490d57ef6-e5b3a203ef8sm2860928276.13.2025.02.10.18.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 18:20:48 -0800 (PST)
From: Carlos Santa <carlos.santa@intel.corp-partner.google.com>
X-Google-Original-From: Carlos Santa
 <carlos.santa@intel-corp-partner.google.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, lionel.g.landwerlin@intel.com,
 rodrigo.vivi@intel.com, carlos.santa@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Subject: [RFC v2 5/6] drm/xe: Add replay_offset and replay_length lines to LRC
 HWCTX snapshot
Date: Mon, 10 Feb 2025 18:20:05 -0800
Message-ID: <20250211022006.23234-6-carlos.santa@intel-corp-partner.google.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211022006.23234-1-carlos.santa@intel-corp-partner.google.com>
References: <20250211022006.23234-1-carlos.santa@intel-corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Feb 2025 14:09:49 +0000
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

From: Matthew Brost <matthew.brost@intel.com>

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
index df3ceddede07..a77fbce523e6 100644
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
@@ -1683,6 +1686,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->lrc_bo = xe_bo_get(lrc->bo);
 	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
 	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
+	snapshot->replay_offset = 0;
+	snapshot->replay_size = lrc->replay_size;
 	snapshot->lrc_snapshot = NULL;
 	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
@@ -1757,6 +1762,9 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
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
2.43.0

