Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA401C44531
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 16:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEDD10E9E2;
	Mon, 20 Jul 2026 16:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="i83Idzz9";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BC210E9DD;
 Mon, 20 Jul 2026 16:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784564043;
 bh=SkTNDGVHEwC2lBIdr/rH5TIayqag1W4N488Ms7oFsPg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i83Idzz9RYUwsmvuu+Vmo4MzV3NKkmwyAYG4HBGQTCuV8f5nDmOMyxrykO0enAZPw
 NTD3KPECteXv5i+Tfupobc5aZSqrRJljSqAbUqti8cQz2UiiYhu9wKDMcsu39yljn8
 lsuzAIHYbKQZlm7HiuGQBFDgpOdq+pM/MVMC4BsOrHWfduon1CI6Rrya+7Z4u4UVHN
 7V5UtuOv0i4/FYJyO0+akcfXeLe+F+8rV7iKul6JPalJfhKKEZMumcwJsec9sb3W/v
 XGPQ7jSTgJC4IB9EgN02P+EzpjvAeUOj9nAnribX2QfS5P5o9CYhRkT2K4uH5Kd7iK
 paJzycha6KUOQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [DO NOT REVIEW 06/11] drm/xe/ggtt: Remove xe_ggtt_insert_bo_at
Date: Mon, 20 Jul 2026 18:14:58 +0200
Message-ID: <20260720161451.384968-19-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720161451.384968-13-dev@lankhorst.se>
References: <20260720161451.384968-13-dev@lankhorst.se>
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

This code was created specifically for the display handover,
and can be removed now that we temporarily reserve the area
of GGTT that contains the original framebuffer contents.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_bo.c   |  8 +-------
 drivers/gpu/drm/xe/xe_ggtt.c | 16 ----------------
 drivers/gpu/drm/xe/xe_ggtt.h |  2 --
 3 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c266fa6bade1b..5d7d91444dce3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2560,13 +2560,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 			if (t != tile && !(bo->flags & XE_BO_FLAG_GGTTx(t)))
 				continue;
 
-			if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
-				err = xe_ggtt_insert_bo_at(t->mem.ggtt, bo,
-							   start + xe_bo_size(bo), U64_MAX,
-							   exec);
-			} else {
-				err = xe_ggtt_insert_bo(t->mem.ggtt, bo, exec);
-			}
+			err = xe_ggtt_insert_bo(t->mem.ggtt, bo, exec);
 			if (err)
 				goto err_unlock_put_bo;
 		}
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 225e6378b2bfc..ccf5154761989 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -934,22 +934,6 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	return err;
 }
 
-/**
- * xe_ggtt_insert_bo_at - Insert BO at a specific GGTT space
- * @ggtt: the &xe_ggtt where bo will be inserted
- * @bo: the &xe_bo to be inserted
- * @start: address where it will be inserted
- * @end: end of the range where it will be inserted
- * @exec: The drm_exec transaction to use for exhaustive eviction.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
-			 u64 start, u64 end, struct drm_exec *exec)
-{
-	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end, exec);
-}
-
 /**
  * xe_ggtt_insert_bo - Insert BO into GGTT
  * @ggtt: the &xe_ggtt where bo will be inserted
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 7cd8b45ed5cd8..ac2bc7f7b9a66 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -36,8 +36,6 @@ void xe_ggtt_node_remove_noclear(struct xe_ggtt_node *node);
 size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node);
 void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo, struct drm_exec *exec);
-int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
-			 u64 start, u64 end, struct drm_exec *exec);
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
 
-- 
2.53.0

