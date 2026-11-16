Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB38A606A88C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 12:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=YolyLbLl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FB410EFD5;
	Mon, 16 Nov 2026 12:27:37 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBFE10F012
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1794832044;
 bh=uKlXfVEq4aNUGhw4v10dqEgWKWK05L4JBHmYZXUHMlo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YolyLbLlmfREk2Uk9BG+06xeCRjFOSwiju1572bUt/77cd5bDb/VF+eG4A2UgerXe
 SlkSUufJsWP1151Cbg9F+++AKRwWupjbbOA82Fanab6tHLyXwwfOi65FVBK/5BVekE
 gsotcYHh+QNuW6EkouhaHsrIBBxUUAg1YkHv8pJ1qaFmId0p6Hef1KdkBSQa0KC8fI
 xJY9myjyVQArSN7eUkwGuYJUKuGrat51Kh3azVMFCqQv9y9Z/eRpaDLDPW87LqOZO4
 z6eFAgOwfluTu76GseIgJaTj45claT1tf4mEW6wthAP6dGrwnrAbVcxnvHPtCD4uhj
 sCKQvtDfTsceA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 6/6] drm/xe/ggtt: Remove xe_ggtt_insert_bo_at
Date: Mon, 16 Nov 2026 13:28:35 +0100
Message-ID: <20261116122828.266113-14-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116122828.266113-8-dev@lankhorst.se>
References: <20261116122828.266113-8-dev@lankhorst.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 42a6aa1a2e4a0..a8b047a553e13 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2733,13 +2733,7 @@ __xe_bo_create_locked(struct xe_device *xe,
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
index d7486dd545a26..2bdcd37da23a3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -979,22 +979,6 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
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
2.55.0

