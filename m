Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4333AC4452D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 16:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90D310E9D0;
	Mon, 20 Jul 2026 16:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="cVarkWux";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047DE10E9CB;
 Mon, 20 Jul 2026 16:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784563638;
 bh=SkTNDGVHEwC2lBIdr/rH5TIayqag1W4N488Ms7oFsPg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cVarkWuxHCBrfnCGQ3Rl6/Tj8Q3XP+zsi+sLI+v1iD11IMC+FtIta1SRGEYZSKo6l
 mstb2iyl9zf2Zyxz1X5J1S+yDWPpO3uo6GBzDED2/tJXGOfdg0Fp3BFtBQppyxwANu
 mD2Bwr07uWhbTx3sLSYeJQO7XhDkqadaewAdz4eJfG1vc3zchSmfZdYhpr6c9bXlMK
 OqrUVzNaNnn9YlADFcyBVdY29F3qQH+e5C2gg/2OjLlvJHCohyMPUZSxzvlT7jaGSu
 +dZ89witibypHqT2xuSoiiouO63OzDCRHCK5ysyfnrgvwg3OSh7SuKvR6/kElSmdK3
 JlFvvWTF+5JKQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v3 6/6] drm/xe/ggtt: Remove xe_ggtt_insert_bo_at
Date: Mon, 20 Jul 2026 18:08:12 +0200
Message-ID: <20260720160805.380356-14-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720160805.380356-8-dev@lankhorst.se>
References: <20260720160805.380356-8-dev@lankhorst.se>
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

