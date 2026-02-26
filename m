Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801E3FD9E0A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 21:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B53510E9B6;
	Thu, 26 Feb 2026 21:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PI23rmC2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B8E10E9B4
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 21:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772140940; x=1803676940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vGwrF5oMtUyo92cJ5YZEhWxItuYjiixfi5bnw+FTuKc=;
 b=PI23rmC2fEMKzpabLqrIo8bg6hwmrckP6H4p1ie6pMu/FegA4OZYrqWe
 4uu0MnJgS+azn+oc4ODQn92OvDp/vSkBErtZf7QI5WeGEuERkQl9xyUI3
 A7LRC8JQ15CDNERNF28tV/BtIIxDoz9fgfTj6PybS70sgFMzumIxGVss1
 /vY3dTVirvA3bOuu6O0iC/IPUsKnoetopYs398zLYdK9mDjDkRgx4atzS
 +jb/5pbnL3Tqqz5a1Eq4eVPqEuxfe5acuqOKy3SWgOQFmOhANdg7Uz3dv
 k8sLCYeJ/PzPG9g1+7mZQA0xP0zZ7ItRuJVeU8CaUsmn/s9xXVV9tDuy7 A==;
X-CSE-ConnectionGUID: 56Zr3TTlRraljZdZ5GXbgw==
X-CSE-MsgGUID: kwquzS5LQ8uwt4wtgc3vjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84307898"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="84307898"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 13:22:20 -0800
X-CSE-ConnectionGUID: qIWSrGRJS1+Aw8FiOHjOSw==
X-CSE-MsgGUID: arRhV8hDT1+fRmZ/fqCIpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221698667"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa005.jf.intel.com with ESMTP; 26 Feb 2026 13:22:18 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 1/4] drm/xe/queue: Call fini on exec queue creation fail
Date: Thu, 26 Feb 2026 22:26:58 +0100
Message-Id: <20260226212701.2937065-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260226212701.2937065-1-tomasz.lis@intel.com>
References: <20260226212701.2937065-1-tomasz.lis@intel.com>
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

Every call to queue init should have a corresponding fini call.
Skipping this would mean skipping removal of the queue from GuC list
(which is part of guc_id allocation). A damaged queue stored in
exec_queue_lookup list would lead to invalid memory reference,
sooner or later.

Call fini to free guc_id. This must be done before any internal
LRCs are freed.

Since the finalization with this extra call became very similar to
__xe_exec_queue_fini(), reuse that. To make this reuse possible,
alter xe_lrc_put() so it can survive NULL parameters, like other
similar functions.

v2: Reuse _xe_exec_queue_fini(). Make xe_lrc_put() aware of NULLs.

Fixes: 3c1fa4aa60b1 ("drm/xe: Move queue init before LRC creation")
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> (v1)
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 23 +++++++++++------------
 drivers/gpu/drm/xe/xe_lrc.h        |  3 ++-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index f8980cb7293d..b4ef725a682d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -270,6 +270,16 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	return q;
 }
 
+static void __xe_exec_queue_fini(struct xe_exec_queue *q)
+{
+	int i;
+
+	q->ops->fini(q);
+
+	for (i = 0; i < q->width; ++i)
+		xe_lrc_put(q->lrc[i]);
+}
+
 static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 {
 	int i, err;
@@ -324,21 +334,10 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	return 0;
 
 err_lrc:
-	for (i = i - 1; i >= 0; --i)
-		xe_lrc_put(q->lrc[i]);
+	__xe_exec_queue_fini(q);
 	return err;
 }
 
-static void __xe_exec_queue_fini(struct xe_exec_queue *q)
-{
-	int i;
-
-	q->ops->fini(q);
-
-	for (i = 0; i < q->width; ++i)
-		xe_lrc_put(q->lrc[i]);
-}
-
 struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
 					   u32 logical_mask, u16 width,
 					   struct xe_hw_engine *hwe, u32 flags,
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 3e500004f1ae..48f7c26cf129 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -75,7 +75,8 @@ static inline struct xe_lrc *xe_lrc_get(struct xe_lrc *lrc)
  */
 static inline void xe_lrc_put(struct xe_lrc *lrc)
 {
-	kref_put(&lrc->refcount, xe_lrc_destroy);
+	if (lrc)
+		kref_put(&lrc->refcount, xe_lrc_destroy);
 }
 
 /**
-- 
2.25.1

