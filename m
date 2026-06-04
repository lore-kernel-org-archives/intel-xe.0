Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60A0CD8C82
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 17:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C21711A1F5;
	Thu,  4 Jun 2026 17:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="FjAs5ALb";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F2111A1DE
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 17:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780593304;
 bh=rBWnAvSw2n9DujfAZdimAoZ6hdilAImz+EMHNVOtzyY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FjAs5ALbmYuj2jmCTyIyyN5vZ7fwqQqHv3pm89MIQ9pNVcp1+j4jRrdUMdDDPdyzk
 3HlsidheP54NSDMqA8CVMcRGlwgyHQOaQq9l15cOLiXdNTb2O9mMcGMyEWKSCwUtD4
 LxEenIxP+OI5iZ0WG1Zp73UZgUQ/B9Jsh5EjCRgD3YhbqAQfFJcgCz0w3P4u7n+XPs
 yCoBDNEbS7/zHqeEE45XJI4TFJD38uSsgMw1WfScWdwpYo2d3zFUsF1u+p+u2Dq17Q
 A9uMCcZsQDjpjls3SBaf19YeC0F+EfV9laqHffUtAYivx/easYbZIU1rV7pSslVvUp
 QmR8G1yIudnsg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 06/24] drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
Date: Thu,  4 Jun 2026 19:14:42 +0200
Message-ID: <20260604171502.84047-7-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604171502.84047-1-dev@lankhorst.se>
References: <20260604171502.84047-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Matthew Brost <matthew.brost@intel.com>

Add XE_BO_FLAG_PUT_VM_ASYNC, which indicates that an async BO put must
also drop an additional reference to the BO’s VM. This is useful when a
kernel BO, one that does not normally hold a VM reference, needs to be
put asynchronously, ensuring the shared dma-resv object does not
disappear before the BO.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-7-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4c80bac676229..5275badb024cd 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3793,8 +3793,14 @@ void xe_bo_put_commit(struct llist_head *deferred)
 	if (!freed)
 		return;
 
-	llist_for_each_entry_safe(bo, next, freed, freed)
+	llist_for_each_entry_safe(bo, next, freed, freed) {
+		struct xe_vm *vm = bo->vm;
+		bool async = bo->flags & XE_BO_FLAG_PUT_VM_ASYNC;
+
 		drm_gem_object_free(&bo->ttm.base.refcount);
+		if (async)
+			xe_vm_put(vm);
+	}
 }
 
 static void xe_bo_dev_work_func(struct work_struct *work)
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index dee2a5524039c..4128dbf7fe695 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -52,6 +52,7 @@
 #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
 #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
 #define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
+#define XE_BO_FLAG_PUT_VM_ASYNC		BIT(27)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
-- 
2.53.0

