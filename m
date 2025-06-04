Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF43C5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 15:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382D310E719;
	Wed,  4 Jun 2025 15:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpvAw+61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DFC10E07C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 15:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749049427; x=1780585427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vE4VvCE5ZTQSKvb47YyhdOIRSgWWpkWCeyt0bNnv5IU=;
 b=jpvAw+61YlOUTWXvQeiRaViVOaAnZDlUB/9gS/pR1H9lKTQhQz2NLJtb
 EadTC9/+ObnWPqF8NpJcublXEQHupM0Dxrg76i6yOPhC9lsxZQ9Zrmzb0
 tn2NsE7yWNZR7pUl8pOodAEX3KJXA8nHHmmU6RacnRFiqZiARCuPnYz8t
 YaaJzNTHVzwR+7WlRq2wd9sm0ospaZ6ZqzK8HDF6Jjd2FwNdSirqQVqzo
 FtTel53HoFEe6ARZKJ/4tKE7dHDKUoceVm+m0oZDvycc6zslwjfb3FyKc
 bxFReItF+CHgaAVWtFdB1KNbDVcJpv9yAGdt6gVHf/o5WJnMSU5CON10x A==;
X-CSE-ConnectionGUID: 3YvX656IQVCvXAsh6lKtRA==
X-CSE-MsgGUID: 372aI8Q2SOGj/f0Lh0MXow==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61800183"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="61800183"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 08:03:47 -0700
X-CSE-ConnectionGUID: DKZCLcxJRM+fhkeEqee2fw==
X-CSE-MsgGUID: 3w93P9llQJuasBgj/5Tt2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150096738"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 08:03:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/2] drm/xe/lrc: Prepare WA BB setup for more users
Date: Wed,  4 Jun 2025 08:03:06 -0700
Message-ID: <20250604-wa-bb-fix-v1-2-0dfc5dafcef0@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
References: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b77e2
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

The post context restore (WA BB) is a mechanism in HW that may be used
for things other than the utilization setup. Create a new function
called setup_wa_bb() that wraps any function writing useful commands in
the buffer.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 69 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 55 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index bf7c3981897de..529c6a972a55b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -914,9 +914,8 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 }
 
 /*
- * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
- * context run ticks.
- * @lrc: Pointer to the lrc.
+ * wa_bb_setup_utilization() - Write commands to wa bb to assist
+ * in calculating active context run ticks.
  *
  * Context Timestamp (CTX_TIMESTAMP) in the LRC accumulates the run ticks of the
  * context, but only gets updated when the context switches out. In order to
@@ -941,18 +940,13 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
  * store it in the PPHSWP.
  */
 #define CONTEXT_ACTIVE 1ULL
-static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
+static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
+				       u32 *batch, size_t max_len)
 {
-	u32 *cmd, *buf = NULL;
+	u32 *cmd = batch;
 
-	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
-		buf = kmalloc(lrc->bb_per_ctx_bo->size, GFP_KERNEL);
-		if (!buf)
-			return -ENOMEM;
-		cmd = buf;
-	} else {
-		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
-	}
+	if (xe_gt_WARN_ON(lrc->gt, max_len < 12))
+		return -ENOSPC;
 
 	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
 	*cmd++ = ENGINE_ID(0).addr;
@@ -971,6 +965,49 @@ static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
 		*cmd++ = upper_32_bits(CONTEXT_ACTIVE);
 	}
 
+	return cmd - batch;
+}
+
+struct wa_bb_setup {
+	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
+			 u32 *batch, size_t max_size);
+};
+
+static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
+{
+	const size_t max_size = lrc->bb_per_ctx_bo->size;
+	static const struct wa_bb_setup funcs[] = {
+		{ .setup = wa_bb_setup_utilization },
+	};
+	ssize_t remain;
+	u32 *cmd, *buf = NULL;
+
+	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
+		buf = kmalloc(max_size, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+		cmd = buf;
+	} else {
+		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
+	}
+
+	remain = max_size / sizeof(*cmd);
+
+	for (size_t i = 0; i < ARRAY_SIZE(funcs); i++) {
+		ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
+
+		remain -= len;
+
+		/*
+		 * There should always be at least 1 additional dword for
+		 * the end marker
+		 */
+		if (len < 0 || xe_gt_WARN_ON(lrc->gt, remain < 1))
+			goto fail;
+
+		cmd += len;
+	}
+
 	*cmd++ = MI_BATCH_BUFFER_END;
 
 	if (buf) {
@@ -983,6 +1020,10 @@ static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
 			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
 
 	return 0;
+
+fail:
+	kfree(buf);
+	return -ENOSPC;
 }
 
 #define PVC_CTX_ASID		(0x2e + 1)
@@ -1139,7 +1180,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	map = __xe_lrc_start_seqno_map(lrc);
 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
 
-	err = xe_lrc_setup_utilization(lrc);
+	err = setup_wa_bb(lrc, hwe);
 	if (err)
 		goto err_lrc_finish;
 

-- 
2.49.0

