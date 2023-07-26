Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01895C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D45589A1F;
	Wed, 26 Jul 2023 16:10:06 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1253810E49E
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690387799; x=1721923799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J29iVdAWlptcxvHJQzdQQwDah78aKHW0Adtk074xm84=;
 b=V3EFjELgMnhBFAEf+96H9yrD7OWW5479ZO4JFxT8xAwMssH0zlxr6KpZ
 NdS098vVrqBPCJLgabjRMPtyJtFo3lzftn2sztymxh1QYmP9G/W6AiQ3H
 oHC1pb+khUyMQoBqHKA60Aa3GZ9P9ONQcSmU0KQzM7D7bMkc+sLYK2U7Y
 mnmfMcOX4ydYcDG9diPOyaksCTgPl4NV/iHSACNcH5/kxRvwnGI+8gsrK
 vaj0cOFcHx0hpQV2xbedx23oQvlTM+a2Bit2H8F4e47oZOQ5psHgdPfzP
 u7qoJqCrtP+1HdNjB4mY8nEAMVlTfdww8JeFKfnJ/kThQjLb4mq4+oYun g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="398994893"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="398994893"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057279356"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="1057279356"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 09:07:00 -0700
Message-Id: <20230726160708.3967790-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230726160708.3967790-1-lucas.demarchi@intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 02/10] fixup! drm/xe/display: Implement
 display support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

drm/xe: Fix bo refcounting in intel_framebuffer

Seems we have various confused refcounting mechanisms.
intel_frontbuffer.c was holding a reference on the bo, but it should be
handled in the framebuffer.

A few rebases before, there was code that explicitly adds a refcount in
intel_fb_init, but chunks of that have disappeared. The changes in
xe_plane_initial are reminders of it.

By adding a refcount, we match how drm_gem_framebuffer_helper handles
things. In i915, this is opaquely (and accidentally?) handled through
intel_frontbuffer_get(), not going to duplicate that mistake in xe.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c          | 10 +++++++---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c |  4 ----
 drivers/gpu/drm/xe/display/xe_plane_initial.c    |  5 ++---
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index e2b400318b31..e0bac4cf3f4b 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1895,7 +1895,8 @@ static void intel_user_framebuffer_destroy_vm(struct drm_framebuffer *fb)
 		xe_bo_lock_no_vm(bo, NULL);
 		xe_bo_unpin(bo);
 		xe_bo_unlock_no_vm(bo);
-        }
+	}
+	xe_bo_put(intel_fb_obj(fb));
 #endif
 }
 
@@ -1905,10 +1906,10 @@ static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
 
 	drm_framebuffer_cleanup(fb);
 
-	intel_user_framebuffer_destroy_vm(fb);
-
 	intel_frontbuffer_put(intel_fb->frontbuffer);
 
+	intel_user_framebuffer_destroy_vm(fb);
+
 	kfree(intel_fb);
 }
 
@@ -2125,6 +2126,9 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 
 		intel_fb->dpt_vm = vm;
 	}
+#else
+	/* Hold a reference to object while fb is alive */
+	xe_bo_get(obj);
 #endif
 
 	ret = drm_framebuffer_init(&dev_priv->drm, fb, &intel_fb_funcs);
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 64fdc7880381..15d414ed0d73 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -256,8 +256,6 @@ static void frontbuffer_release(struct kref *ref)
 	i915_active_fini(&front->write);
 
 	i915_gem_object_put(obj);
-#else
-	xe_bo_get(obj);
 #endif
 	kfree_rcu(front, rcu);
 }
@@ -300,8 +298,6 @@ intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 		rcu_assign_pointer(obj->frontbuffer, front);
 	}
 	spin_unlock(&i915->display.fb_tracking.lock);
-#else
-	xe_bo_get(obj);
 #endif
 
 	return front;
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 37cba91be10d..6695908024d9 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -166,6 +166,8 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
 		drm_dbg_kms(&dev_priv->drm, "intel fb init failed\n");
 		goto err_bo;
 	}
+	/* Reference handed over to fb */
+	xe_bo_put(bo);
 
 	return true;
 
@@ -263,9 +265,6 @@ static void plane_config_fini(struct intel_initial_plane_config *plane_config)
 		else
 			kfree(fb);
 	}
-
-	if (plane_config->vma)
-		drm_gem_object_put(&plane_config->vma->bo->ttm.base);
 }
 
 void intel_crtc_initial_plane_config(struct intel_crtc *crtc)
-- 
2.40.1

