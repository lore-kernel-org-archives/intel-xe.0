Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD3DC5DF77
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 06:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F70210E65F;
	Mon, 17 Aug 2026 06:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5LdMJxa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3630810E65D
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 06:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786949473; x=1818485473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RbWh2wKrRIrRA+DOE4wuQX3UMBrye5InTonZcRezolU=;
 b=K5LdMJxa1rYy3KIhwqRX2klQdDeCo1kiU+dwb2vMQ1jjqr+GNFR5o6Ya
 d0KHdvCJ6oq28Suc0Y+aXISXjz0Z4ScbtLpLXI2dKWzPefSb6WE+WpSUC
 6x7lXp4NfbFfaaxvp8y+f8NUFuIx4OM74CWmMoGINeeItknf7PQtkhBwG
 53GHvtIxsh5+p/qEG1XN8zU/TjP+1+mbJOP8iaYvaUwGGXB1H+GfhmlnM
 eVc7ZgihkNRTHyCmvrlaymNMxq5eY4wcdDSBBIypPBvGOyFN6t/TJ57I+
 XTqTVrlBDldlqy527Fattc4WqBonkuwBmW1Vh6qpeY/MtTIuEf3an53GB g==;
X-CSE-ConnectionGUID: bIpf64MDSx+sXRMAoB/JWw==
X-CSE-MsgGUID: N2ZO3tP6RTKmhFIveb3j2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91289546"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="91289546"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 23:51:13 -0700
X-CSE-ConnectionGUID: lO2ZGZyXSvCeY2W+BtROTA==
X-CSE-MsgGUID: JJ83bEA/R0a/ac8lRVF2+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="264383776"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 23:51:11 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V16 02/12] drm/xe: Link LRC BO and its execution Queue
Date: Mon, 17 Aug 2026 12:20:57 +0530
Message-ID: <20260817065055.3734576-16-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
References: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
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
index 9f3d022a1463..d6c7f346f49b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -390,6 +390,12 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
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
index 35b4e8289b5f..675902753735 100644
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

