Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5AAC624A5
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 06:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B91210E59D;
	Mon, 31 Aug 2026 06:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SDWFrf/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09FA10E255
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 06:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788159066; x=1819695066;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pRciijvASqdXNQ/eVaSCFjk5ASD0d7I808l4JjfiSrY=;
 b=SDWFrf/Ck1qOpc37b2qMD3yo7GLAOaKeYKfBNOjA/4NYPlZ0wT6N0who
 zQ5ranx2GW/SNN1/4FbuaQhvUn0gvqxAeJnmLRkF36ws63hUCZyvH8AC0
 +mc9laenaqxeXHGEeARQDSKaLRRjPStUdfj4kqR6GTbabC5o2vSzppi93
 L5+Blx55Ug4N4mgSkggQ1Qogw8fK+ZRy4J4SLdo6muPu98M/bp0Zwn2AH
 pY60z58nqKShw2zKvi4f/eBMTrd7FVtmeGo2xfMO8q3NiKQV9GLSxE/ym
 mmSPwtd6pd/w8z4TRhWETPitUh//qJorgo1Eq97fYWZYJpWldD8qUar/0 g==;
X-CSE-ConnectionGUID: soQdIJJhQ4eweZZ6MKrMjQ==
X-CSE-MsgGUID: PIu8Wo8NSe6+Un5DISfsYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106081703"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106081703"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:50:09 -0700
X-CSE-ConnectionGUID: DfD0Y/JDQqaP8GzCqE4UpQ==
X-CSE-MsgGUID: 0r90MEScSP6UKWCP9a6XSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="269302725"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:50:08 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH V19 02/15] drm/xe: Link LRC BO and its execution Queue
Date: Mon, 31 Aug 2026 12:19:44 +0530
Message-ID: <20260831064942.315720-19-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260831064942.315720-17-tejas.upadhyay@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
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

To establish a link between an LRC BO (Logical Ring Context
Buffer Object) and its corresponding execution Queue in the
drm/xe driver, you need to store a back-pointer to the queue
within the BO's private data structure. This allows the
driver to identify and take corrective action on the specific
queue if the LRC BO encounters an error (e.g., memory
corruption or eviction issues).

V3(Sashiko):
- Placeholder of 8 byte for non-lrc bo is acceptable
- Assign bo-q is safe just use READ_ONCE/WRITE_ONCE
V2(MattB):
- Handle multiqueue

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h   | 3 +++
 drivers/gpu/drm/xe/xe_exec_queue.c | 6 ++++++
 drivers/gpu/drm/xe/xe_lrc.c        | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index e45f24301050..a9c48e440669 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -20,6 +20,7 @@
 struct xe_device;
 struct xe_mem_pool_node;
 struct xe_vm;
+struct xe_exec_queue;
 
 #define XE_BO_MAX_PLACEMENTS	3
 
@@ -42,6 +43,8 @@ struct xe_bo {
 	u32 flags;
 	/** @vm: VM this BO is attached to, for extobj this will be NULL */
 	struct xe_vm *vm;
+	/** @q: Queue this BO is attached to, mostly for LRC BO, NULL otherwise */
+	struct xe_exec_queue *q;
 	/** @tile: Tile this BO is attached to (kernel BO only) */
 	struct xe_tile *tile;
 	/** @placements: valid placements for this BO */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index c4213bb9c137..91ed6c0fac84 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -387,6 +387,12 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 				goto err_lrc;
 			}
 
+			/*
+			 * The queue ref counts the LRCs, thus it safe for the LRC BO to hold a
+			 * pointer to queue without reference.  The reader holds dma_resv (
+			 * xe_bo_lock) which serializes with xe_lrc_finish().
+			 */
+			WRITE_ONCE(lrc->bo->q, xe_exec_queue_multi_queue_primary(q));
 			xe_exec_queue_set_lrc(q, lrc, i);
 
 			if (__lrc)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 25fe9dbc9141..3e1aa0256719 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1066,6 +1066,7 @@ static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 static void xe_lrc_finish(struct xe_lrc *lrc)
 {
 	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
+	WRITE_ONCE(lrc->bo->q, NULL);
 	xe_bo_unpin_map_no_vm(lrc->bo);
 	xe_bo_unpin_map_no_vm(lrc->seqno_bo);
 }
-- 
2.52.0

