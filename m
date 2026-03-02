Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F4EEB3624
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 18:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488B410E584;
	Mon,  2 Mar 2026 18:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjA0LXFB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C883910E584;
 Mon,  2 Mar 2026 18:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772475477; x=1804011477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UyBqL8rkVBBGgKdFEevxAF2ksJN60GxBh6EB0EeIr8A=;
 b=jjA0LXFBOQZKoRJt8KKGzuSyyxDahxMD9FgM1O8gv/vt5HpTn9927mg4
 1PzSwON+7yDW56KWbZklTu7HO76sBgtPe7wk7q7n38KnZNmd+1y3Dsl/i
 +IYD/UDs/ePtqXtInymhj0nBUgSDSFCZ5hamtUIzp7VDB93u6CDnEPjQU
 Y/4LiPq7oYcmqwdiSyOuDiD4xgjMLXdcgwB0Q4DEy47BcCcl05haqDXHf
 XRfYVrojGoQ2QKHwrSZSDnFFTq2FI7hQUwqzC13Fu4lJRI57gNT9YFDPZ
 iMLa8wAVdz1OfgDu+KYgI+KwoJcOZl+MF22qLq/WIURpUTQvWwLXfsn5Y g==;
X-CSE-ConnectionGUID: BkHKTb3xRFK6V2zotmCPFA==
X-CSE-MsgGUID: yd/DvBeURhia9XVVbiRMZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73400616"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73400616"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 10:17:55 -0800
X-CSE-ConnectionGUID: jRRPG4WlS7ScTdVvWSFIeQ==
X-CSE-MsgGUID: C00fOJ2uStuokrVN7VTmGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="214165506"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 10:17:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 2/7] drm/i915/gem: unify i915 gem object frontbuffer function
 names
Date: Mon,  2 Mar 2026 20:17:34 +0200
Message-ID: <3415b59497f2c3a79586600d259eeaf58be73498.1772475391.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772475391.git.jani.nikula@intel.com>
References: <cover.1772475391.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Many of the i915 gem object frontbuffer function names follow the file
name as prefix. Follow suit with the remaining functions, renaming them
i915_gem_object_frontbuffer_*().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c          |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c           |  6 +++---
 .../gpu/drm/i915/gem/i915_gem_object_frontbuffer.c   |  4 ++--
 .../gpu/drm/i915/gem/i915_gem_object_frontbuffer.h   | 12 ++++++------
 drivers/gpu/drm/i915/gem/i915_gem_phys.c             |  4 ++--
 drivers/gpu/drm/i915/i915_gem.c                      |  6 +++---
 6 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index 30cc08583cbd..7782ba44fabd 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -22,7 +22,7 @@ static void __do_clflush(struct drm_i915_gem_object *obj)
 	GEM_BUG_ON(!i915_gem_object_has_pages(obj));
 	drm_clflush_sg(obj->mm.pages);
 
-	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
+	i915_gem_object_frontbuffer_flush(obj, ORIGIN_CPU);
 }
 
 static void clflush_work(struct dma_fence_work *base)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index ef3b14ae2e0d..df7502391b50 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -68,7 +68,7 @@ flush_write_domain(struct drm_i915_gem_object *obj, unsigned int flush_domains)
 			i915_vma_flush_writes(vma);
 		spin_unlock(&obj->vma.lock);
 
-		i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
+		i915_gem_object_frontbuffer_flush(obj, ORIGIN_CPU);
 		break;
 
 	case I915_GEM_DOMAIN_WC:
@@ -647,7 +647,7 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 	i915_gem_object_unlock(obj);
 
 	if (!err && write_domain)
-		i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
+		i915_gem_object_frontbuffer_invalidate(obj, ORIGIN_CPU);
 
 out:
 	i915_gem_object_put(obj);
@@ -759,7 +759,7 @@ int i915_gem_object_prepare_write(struct drm_i915_gem_object *obj,
 	}
 
 out:
-	i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
+	i915_gem_object_frontbuffer_invalidate(obj, ORIGIN_CPU);
 	obj->mm.dirty = true;
 	/* return with the pages pinned */
 	return 0;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.c
index 29076aefdfd8..cf0b66eaf11b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.c
@@ -102,7 +102,7 @@ void i915_gem_object_frontbuffer_put(struct i915_frontbuffer *front)
 		      &i915->frontbuffer_lock);
 }
 
-void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
+void __i915_gem_object_frontbuffer_flush(struct drm_i915_gem_object *obj,
 					 enum fb_op_origin origin)
 {
 	struct i915_frontbuffer *front;
@@ -114,7 +114,7 @@ void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
 	}
 }
 
-void __i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
+void __i915_gem_object_frontbuffer_invalidate(struct drm_i915_gem_object *obj,
 					      enum fb_op_origin origin)
 {
 	struct i915_frontbuffer *front;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h b/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
index 2133e29047c5..1c250ce4ca66 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
@@ -20,25 +20,25 @@ struct i915_frontbuffer {
 	struct kref ref;
 };
 
-void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
+void __i915_gem_object_frontbuffer_flush(struct drm_i915_gem_object *obj,
 					 enum fb_op_origin origin);
-void __i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
+void __i915_gem_object_frontbuffer_invalidate(struct drm_i915_gem_object *obj,
 					      enum fb_op_origin origin);
 
 static inline void
-i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
+i915_gem_object_frontbuffer_flush(struct drm_i915_gem_object *obj,
 				  enum fb_op_origin origin)
 {
 	if (unlikely(rcu_access_pointer(obj->frontbuffer)))
-		__i915_gem_object_flush_frontbuffer(obj, origin);
+		__i915_gem_object_frontbuffer_flush(obj, origin);
 }
 
 static inline void
-i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
+i915_gem_object_frontbuffer_invalidate(struct drm_i915_gem_object *obj,
 				       enum fb_op_origin origin)
 {
 	if (unlikely(rcu_access_pointer(obj->frontbuffer)))
-		__i915_gem_object_invalidate_frontbuffer(obj, origin);
+		__i915_gem_object_frontbuffer_invalidate(obj, origin);
 }
 
 struct i915_frontbuffer *i915_gem_object_frontbuffer_get(struct drm_i915_gem_object *obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index ce2780ef97ef..e375afbf458e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -155,7 +155,7 @@ int i915_gem_object_pwrite_phys(struct drm_i915_gem_object *obj,
 	 * We manually control the domain here and pretend that it
 	 * remains coherent i.e. in the GTT domain, like shmem_pwrite.
 	 */
-	i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
+	i915_gem_object_frontbuffer_invalidate(obj, ORIGIN_CPU);
 
 	if (copy_from_user(vaddr, user_data, args->size))
 		return -EFAULT;
@@ -163,7 +163,7 @@ int i915_gem_object_pwrite_phys(struct drm_i915_gem_object *obj,
 	drm_clflush_virt_range(vaddr, args->size);
 	intel_gt_chipset_flush(to_gt(i915));
 
-	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
+	i915_gem_object_frontbuffer_flush(obj, ORIGIN_CPU);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 160733619a4a..761491750914 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -579,7 +579,7 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object *obj,
 		goto out_rpm;
 	}
 
-	i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
+	i915_gem_object_frontbuffer_invalidate(obj, ORIGIN_CPU);
 
 	user_data = u64_to_user_ptr(args->data_ptr);
 	offset = args->offset;
@@ -626,7 +626,7 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object *obj,
 	}
 
 	intel_gt_flush_ggtt_writes(ggtt->vm.gt);
-	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
+	i915_gem_object_frontbuffer_flush(obj, ORIGIN_CPU);
 
 	i915_gem_gtt_cleanup(obj, &node, vma);
 out_rpm:
@@ -714,7 +714,7 @@ i915_gem_shmem_pwrite(struct drm_i915_gem_object *obj,
 		offset = 0;
 	}
 
-	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
+	i915_gem_object_frontbuffer_flush(obj, ORIGIN_CPU);
 
 	i915_gem_object_unpin_pages(obj);
 	return ret;
-- 
2.47.3

