Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83343CEDD89
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 12:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D4210E6EE;
	Wed,  9 Oct 2024 12:51:09 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924FB10E6EC
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 12:51:07 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 2/6] drm/xe: Add xe_ggtt_might_lock
Date: Wed,  9 Oct 2024 14:51:10 +0200
Message-ID: <20241009125114.412624-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241009125114.412624-1-maarten.lankhorst@linux.intel.com>
References: <20241009125114.412624-1-maarten.lankhorst@linux.intel.com>
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

Another requirement of hiding more of struct xe_ggtt.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c   | 2 +-
 drivers/gpu/drm/xe/xe_ggtt.c | 7 +++++++
 drivers/gpu/drm/xe/xe_ggtt.h | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5e8f60a8d4316..9c4df3986d582 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2359,7 +2359,7 @@ void xe_bo_put(struct xe_bo *bo)
 			might_lock(&bo->client->bos_lock);
 #endif
 		if (bo->ggtt_node && bo->ggtt_node->ggtt)
-			might_lock(&bo->ggtt_node->ggtt->lock);
+			xe_ggtt_might_lock(bo->ggtt_node->ggtt);
 		drm_gem_object_put(&bo->ttm.base);
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 655eb6b7474e1..16be6f53b75b2 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -176,6 +176,13 @@ static void ggtt_fini(void *arg)
 	ggtt->scratch = NULL;
 }
 
+#ifdef CONFIG_LOCKDEP
+void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
+{
+	might_lock(&ggtt->lock);
+}
+#endif
+
 static void primelockdep(struct xe_ggtt *ggtt)
 {
 	if (!IS_ENABLED(CONFIG_LOCKDEP))
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index bdf6d0733e2ca..62c8ce636939a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -38,4 +38,11 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
 #endif
 
+#ifndef CONFIG_LOCKDEP
+static inline void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
+{ }
+#else
+void xe_ggtt_might_lock(struct xe_ggtt *ggtt);
+#endif
+
 #endif
-- 
2.45.2

