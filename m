Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9116C73C66
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 10:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA0410E9F7;
	Thu, 19 Jun 2025 10:49:38 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F99010E9FA
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Jun 2025 10:49:36 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 10/11] drm/xe: Remove xe_uc_fini_hw
Date: Thu, 19 Jun 2025 12:49:09 +0200
Message-ID: <20250619104858.418440-23-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619104858.418440-13-dev@lankhorst.se>
References: <20250619104858.418440-13-dev@lankhorst.se>
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

xe_uc_init_hw() is called multiple times from xe_gt.c,
and that makes the name xe_uc_fini_hw(), called for a different
reason in xe_guc.c confusing.

Remove it and inline the xe_uc_sanitize_reset into xe_guc.c directly.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 drivers/gpu/drm/xe/xe_uc.c  | 5 -----
 drivers/gpu/drm/xe/xe_uc.h  | 1 -
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index eeb23f8aa9de8..7a4207a2c1e0c 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -577,7 +577,7 @@ static void guc_fini_hw(void *arg)
 	unsigned int fw_ref;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
+	xe_uc_sanitize_reset(&guc_to_gt(guc)->uc);
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 
 	guc_g2g_fini(guc);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 8f56a5ef41e24..1b1441b234c92 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -220,11 +220,6 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	return 0;
 }
 
-int xe_uc_fini_hw(struct xe_uc *uc)
-{
-	return xe_uc_sanitize_reset(uc);
-}
-
 int xe_uc_reset_prepare(struct xe_uc *uc)
 {
 	/* GuC submission not enabled, nothing to do */
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index c13d705fe02c4..58ff3946a80ec 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -12,7 +12,6 @@ int xe_uc_init_noalloc(struct xe_uc *uc);
 int xe_uc_init(struct xe_uc *uc);
 int xe_uc_init_post_hwconfig(struct xe_uc *uc);
 int xe_uc_init_hw(struct xe_uc *uc);
-int xe_uc_fini_hw(struct xe_uc *uc);
 void xe_uc_gucrc_disable(struct xe_uc *uc);
 int xe_uc_reset_prepare(struct xe_uc *uc);
 void xe_uc_stop_prepare(struct xe_uc *uc);
-- 
2.45.2

