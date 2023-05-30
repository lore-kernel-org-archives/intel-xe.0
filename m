Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17627C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E9410E134;
	Tue, 30 May 2023 10:47:46 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6320110E382
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685443659; x=1716979659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MaSs+xMugqwWfgFvh5HvN/VrrIi9V89VsqqpyZBDmK0=;
 b=fPxuNImQ2c5qFqiSiVxAZIALRv/14CEcu04ltJ/oHTNvruhSwjly+kfH
 iphP9dQRrLZi5fGYqLutwSMq0cDrBwtQgUW/bleLYvwl+lkHqSHwTWHzl
 TFgeBy07NGc+ns7O6YT34FUdMaH5KU1Heb/tGYQVv0Fm+YUlm3PBd/o+0
 nRlL8oZRa7DdXmRNE37jJbKJQfRB2irs2utnpvSvGw87pACE+cJRM/DSz
 RahKKFDfvUP1dv1jXzGJC9QEYW7Xmiiclv9mWhYQRJ7rQf1gXLYaveEri
 oMvK9Bw4THW6FaFTDE7/WgZJg2VPyAUJN3CNqZxWDBfqljBMfxtZYtNVR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420638371"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="420638371"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:47:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="656804778"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="656804778"
Received: from aravind2-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.46.36])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:47:38 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 13:47:10 +0300
Message-Id: <20230530104713.2570554-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530104713.2570554-1-jouni.hogander@intel.com>
References: <20230530104713.2570554-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 6/9] drm/i915: Move stolen memory handling
 into i915_gem_stolen
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We are preparing for Xe. As Xe stolen memory handling differs from i915 we
want to move stolen memory handling details into i915_gem_stolen.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c   | 40 ++++++++--------------
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 37 ++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h | 11 ++++++
 3 files changed, 62 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 19698ab117a1..b6fc993e6caf 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -54,15 +54,6 @@
 #include "intel_fbc.h"
 #include "intel_frontbuffer.h"
 
-#ifdef I915
-
-#define i915_gem_stolen_initialized(i915) (drm_mm_initialized(&(i915)->mm.stolen))
-#define i915_gem_stolen_node_allocated(node) drm_mm_node_allocated(&(node))
-#define i915_gem_stolen_node_offset(node) ((node)->start)
-#define i915_gem_stolen_node_size(node) ((node)->size)
-
-#endif
-
 #define for_each_fbc_id(__dev_priv, __fbc_id) \
 	for ((__fbc_id) = INTEL_FBC_A; (__fbc_id) < I915_MAX_FBCS; (__fbc_id)++) \
 		for_each_if(RUNTIME_INFO(__dev_priv)->fbc_mask & BIT(__fbc_id))
@@ -338,19 +329,18 @@ static void i8xx_fbc_nuke(struct intel_fbc *fbc)
 
 static void i8xx_fbc_program_cfb(struct intel_fbc *fbc)
 {
-#ifdef I915
 	struct drm_i915_private *i915 = fbc->i915;
 
-	GEM_BUG_ON(range_overflows_end_t(u64, i915->dsm.stolen.start,
-					 fbc->compressed_fb.start, U32_MAX));
-	GEM_BUG_ON(range_overflows_end_t(u64, i915->dsm.stolen.start,
-					 fbc->compressed_llb.start, U32_MAX));
-
+	GEM_BUG_ON(range_overflows_end_t(u64, i915_gem_stolen_area_address(i915),
+					 i915_gem_stolen_node_offset(&fbc->compressed_fb),
+					 U32_MAX));
+	GEM_BUG_ON(range_overflows_end_t(u64, i915_gem_stolen_area_address(i915),
+					 i915_gem_stolen_node_offset(&fbc->compressed_llb),
+					 U32_MAX));
 	intel_de_write(i915, FBC_CFB_BASE,
-		       i915->dsm.stolen.start + fbc->compressed_fb.start);
+		       i915_gem_stolen_node_address(i915, &fbc->compressed_fb));
 	intel_de_write(i915, FBC_LL_BASE,
-		       i915->dsm.stolen.start + fbc->compressed_llb.start);
-#endif
+		       i915_gem_stolen_node_address(i915, &fbc->compressed_llb));
 }
 
 static const struct intel_fbc_funcs i8xx_fbc_funcs = {
@@ -725,12 +715,10 @@ static u64 intel_fbc_stolen_end(struct drm_i915_private *i915)
 	 * reserved range size, so it always assumes the maximum (8mb) is used.
 	 * If we enable FBC using a CFB on that memory range we'll get FIFO
 	 * underruns, even if that range is not reserved by the BIOS. */
-#ifdef I915
 	if (IS_BROADWELL(i915) ||
 	    (DISPLAY_VER(i915) == 9 && !IS_BROXTON(i915)))
-		end = resource_size(&i915->dsm.stolen) - 8 * 1024 * 1024;
+		end = i915_gem_stolen_area_size(i915) - 8 * 1024 * 1024;
 	else
-#endif
 		end = U64_MAX;
 
 	return min(end, intel_fbc_cfb_base_max(i915));
@@ -786,9 +774,9 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 	int ret;
 
 	drm_WARN_ON(&i915->drm,
-		    i915_gem_stolen_node_allocated(fbc->compressed_fb));
+		    i915_gem_stolen_node_allocated(&fbc->compressed_fb));
 	drm_WARN_ON(&i915->drm,
-		    i915_gem_stolen_node_allocated(fbc->compressed_llb));
+		    i915_gem_stolen_node_allocated(&fbc->compressed_llb));
 
 	if (DISPLAY_VER(i915) < 5 && !IS_G4X(i915)) {
 		ret = i915_gem_stolen_insert_node(i915, &fbc->compressed_llb,
@@ -813,7 +801,7 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 	return 0;
 
 err_llb:
-	if (i915_gem_stolen_node_allocated(fbc->compressed_llb))
+	if (i915_gem_stolen_node_allocated(&fbc->compressed_llb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_llb);
 err:
 	if (i915_gem_stolen_initialized(i915))
@@ -841,9 +829,9 @@ static void __intel_fbc_cleanup_cfb(struct intel_fbc *fbc)
 	if (WARN_ON(intel_fbc_hw_is_active(fbc)))
 		return;
 
-	if (i915_gem_stolen_node_allocated(fbc->compressed_llb))
+	if (i915_gem_stolen_node_allocated(&fbc->compressed_llb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_llb);
-	if (i915_gem_stolen_node_allocated(fbc->compressed_fb))
+	if (i915_gem_stolen_node_allocated(&fbc->compressed_fb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_fb);
 }
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index ee492d823f1b..04cc6958cddf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -972,3 +972,40 @@ bool i915_gem_object_is_stolen(const struct drm_i915_gem_object *obj)
 {
 	return obj->ops == &i915_gem_object_stolen_ops;
 }
+
+bool i915_gem_stolen_initialized(const struct drm_i915_private *i915)
+{
+	return drm_mm_initialized(&i915->mm.stolen);
+}
+
+u64 i915_gem_stolen_area_address(const struct drm_i915_private *i915)
+{
+	return i915->dsm.stolen.start;
+}
+
+u64 i915_gem_stolen_area_size(const struct drm_i915_private *i915)
+{
+	return resource_size(&i915->dsm.stolen);
+}
+
+u64 i915_gem_stolen_node_address(const struct drm_i915_private *i915,
+			const struct drm_mm_node *node)
+{
+	return i915->dsm.stolen.start + i915_gem_stolen_node_offset(node);
+}
+
+
+bool i915_gem_stolen_node_allocated(const struct drm_mm_node *node)
+{
+	return drm_mm_node_allocated(node);
+}
+
+u64 i915_gem_stolen_node_offset(const struct drm_mm_node *node)
+{
+	return node->start;
+}
+
+u64 i915_gem_stolen_node_size(const struct drm_mm_node *node)
+{
+	return node->size;
+}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
index 3c084a1fcc73..ccebd24d65a9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.h
@@ -38,4 +38,15 @@ bool i915_gem_object_is_stolen(const struct drm_i915_gem_object *obj);
 
 #define I915_GEM_STOLEN_BIAS SZ_128K
 
+bool i915_gem_stolen_initialized(const struct drm_i915_private *i915);
+u64 i915_gem_stolen_area_address(const struct drm_i915_private *i915);
+u64 i915_gem_stolen_area_size(const struct drm_i915_private *i915);
+
+u64 i915_gem_stolen_node_address(const struct drm_i915_private *i915,
+			    const struct drm_mm_node *node);
+
+bool i915_gem_stolen_node_allocated(const struct drm_mm_node *node);
+u64 i915_gem_stolen_node_offset(const struct drm_mm_node *node);
+u64 i915_gem_stolen_node_size(const struct drm_mm_node *node);
+
 #endif /* __I915_GEM_STOLEN_H__ */
-- 
2.34.1

