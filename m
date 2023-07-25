Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563B3C0015E
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 15:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2292210E0EC;
	Tue, 25 Jul 2023 15:12:52 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55A410E400
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 15:12:48 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 17:12:39 +0200
Message-Id: <20230725151239.133708-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix error paths of __xe_bo_create_locked
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

ttm_bo_init_reserved() calls the destroy() callback if it fails.

Because of this, __xe_bo_create_locked is required to be responsible
for freeing the bo even when it's passed in as argument.

Additionally, if the placement check fails, the bo was kept alive.
Fix it too.

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e240df6c7ae64..b63290540dd9b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1158,8 +1158,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	/* Only kernel objects should set GT */
 	XE_BUG_ON(tile && type != ttm_bo_type_kernel);
 
-	if (XE_WARN_ON(!size))
+	if (XE_WARN_ON(!size)) {
+		xe_bo_free(bo);
 		return ERR_PTR(-EINVAL);
+	}
 
 	if (!bo) {
 		bo = xe_bo_alloc();
@@ -1197,8 +1199,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 
 	if (!(flags & XE_BO_FIXED_PLACEMENT_BIT)) {
 		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
-		if (WARN_ON(err))
+		if (WARN_ON(err)) {
+			xe_ttm_bo_destroy(&bo->ttm);
 			return ERR_PTR(err);
+		}
 	}
 
 	/* Defer populating type_sg bos */
-- 
2.39.2

