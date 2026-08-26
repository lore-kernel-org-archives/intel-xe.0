Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0616CC61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC43A10E6E2;
	Wed, 26 Aug 2026 13:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hqwms8sh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC6010E6E2
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 13:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787752317; x=1819288317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=78DRqw9a/ZlXfKoWsFd2F4OOw0/iIko25YoTFjN3x5s=;
 b=Hqwms8shYthuVvMJ+27ncXxFX6rlimT9ai7nkd+rES6MeE9ZMyL12ViR
 LVLgJlu8YVmyhfk/+8OI6qMN1SjEe5iFmu7ZlIt0R+bcTp7CAC46lxyVo
 JZ3S3OscSUqJ3d1TNmnTwWWpTaEcrSmLRrI3qI0+hTw8WburMFvi2eXi7
 0i32dBRGMvsCpH4Y7qJSM3Y565YQUU9fPSdwcFCvh2vEt147TZkmydp/r
 5U/AmNX0bCC7clKPONzGvaWOXzqylISwO0WhvfRdVVOTYqYyKoZ68i1Do
 L5o/XJQxfgyXv6vd1swcdpTVxPk2gFqT1D8mZ+KYJ71BszSs5JNw9+oYz w==;
X-CSE-ConnectionGUID: yhM+OtxITp67+H/GM30uhA==
X-CSE-MsgGUID: xY3ZWgNSTCSP9utRLwyucg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88251022"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88251022"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:51:57 -0700
X-CSE-ConnectionGUID: YRwetGsCRn2f0d2is2FfHw==
X-CSE-MsgGUID: yKtSr9kXQLmCO97ao9hk2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="269533476"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:51:54 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V18 02/14] drm/xe: Link LRC BO and its execution Queue
Date: Wed, 26 Aug 2026 19:21:37 +0530
Message-ID: <20260826135136.204044-18-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260826135136.204044-16-tejas.upadhyay@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
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

