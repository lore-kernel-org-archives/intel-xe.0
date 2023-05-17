Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A56C77B75
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 16:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2E810E214;
	Wed, 17 May 2023 16:29:34 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368EC10E214
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 16:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684340972; x=1715876972;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6aFi20sJ32/i81MY3Du9NV5mLBjFlEgHUatmbnTPTq0=;
 b=hoJmW09vyg/uQ7qEKgS3G0LL/JiVagCSDzqrNpgabHkUGV8nkM1FRRa1
 og7dkkvP+RB6P6l89HM0DJnFBeHmNUfl+eJi+EZXoYPkjv6mktt9twCfC
 zh7h8MPixyW8OhBwOznZgFOBhJs9wnvB+xmhgkgW/oEbF+8JQtopmn14U
 79vC+gKcair71ITn8rAP+k7fQUz7RM3QvYlz9KiJ8uJ5hvbERhhFXPGgC
 v3GDYlBzX5Jk9ZSv829F0wao4ARxf86yJ4XLC9MfA7aecS50TXVCjAAxm
 BFKntfqEyw2Q++XYVaK7c8QnXPdL4gsp43trKRxVixsWuMN9BzqEKDpwS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="415223084"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="415223084"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="846153519"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="846153519"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:29:29 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 17 May 2023 09:29:18 -0700
Message-Id: <20230517162918.59058-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Allow scanout of bos that can be
 migrated to lmem
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

OpenGL stack makes scanout buffers exported as well because usually
it will be exported from client application to compositor.

Exported buffers needs to be placed in SMEM so it can be accessed
by different GPUs if needed, so in discrete GPUs it is placed in
SMEM+LMEM.

But this combination is causing aplications like kmscube to be able
to create framebuffers.

So here doing the same handling as i915 and allowing bos that can
migrate to lmem0/vram0 to be promoted to framebuffer.

At least all current discrete GPUs with display only have one lmem
region, so we don't need to check for vram1 but we might need to
extend it in future.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 5 +++--
 drivers/gpu/drm/xe/display/xe_fb_pin.c  | 7 ++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 015aacbad1b11..feb8a0f5fbdf6 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2121,8 +2121,9 @@ intel_user_framebuffer_create(struct drm_device *dev,
 		return ERR_PTR(-ENOENT);
 
 	obj = gem_to_xe_bo(gem);
-	/* Require vram exclusive objects, but allow dma-buf imports */
-	if (IS_DGFX(i915) && obj->flags & XE_BO_CREATE_SYSTEM_BIT &&
+	/* Require vram placement or dma-buf import */
+	if (IS_DGFX(i915) &&
+	    !xe_bo_can_migrate(gem_to_xe_bo(gem), XE_PL_VRAM0) &&
 	    obj->ttm.type != ttm_bo_type_sg) {
 		drm_gem_object_put(gem);
 		return ERR_PTR(-EREMOTE);
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index ed691d28b34d7..c7c4df18e439b 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -183,6 +183,8 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 					const struct i915_gtt_view *view)
 {
+	struct drm_device *dev = fb->base.dev;
+	struct xe_device *xe = to_xe_device(dev);
 	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	struct xe_bo *bo = intel_fb_obj(&fb->base);
 	int ret;
@@ -204,7 +206,10 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 	if (ret)
 		goto err;
 
-	ret = xe_bo_validate(bo, NULL, true);
+	if (IS_DGFX(xe))
+		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
+	else
+		ret = xe_bo_validate(bo, NULL, true);
 	if (!ret)
 		ttm_bo_pin(&bo->ttm);
 	ttm_bo_unreserve(&bo->ttm);
-- 
2.40.1

