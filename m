Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F31C77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6784010E484;
	Wed, 10 May 2023 12:12:45 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DA310E484
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720763; x=1715256763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZBHjuc39jCGkXNWNcIuLxeSeaWejDjGLDC2Pvsonwrw=;
 b=gDz22Rnd9eyFmZApOGEJDFNJlwYtWCwPud3mXdusFiT9bElOwtW9XRz6
 s5cyLKdKKGh99LnZGcZSuGgR4ywe2FSk0D2KSdZsAsB0eeIa0tb32Lj3E
 9C+m/c4Fdgzb1HctYyqWJkymL6NGh5T8hzLctx2Lr5loKkXv8BoVcO6R1
 aJ8Z7ZPA8V/K0VCCGfhFu1iXgzUw0aGtzSm0Xie6et4cS3BcYB+BU0/Y1
 MdP4LDo1ObYpgd636RJS7ysrl/IAPHcrBPXKUO8S8YTje+2z7MgZO7e8v
 MFuCtl8TzUE0VXC5teIxysglM+EuAihlV6vlLcQ8ro49tfQ9ZC7/xe8Pg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268162"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268162"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906261"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906261"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:39 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:41 +0300
Message-Id: <20230510121152.736148-13-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 12/23] drm/i915: Add
 intel_bo_flush_if_display define for i915
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
Cc: jani.nikula@intel.com, rodrigo.vivi@kernel.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add intel_bo_flush_if_display for i915 and use it instead of
i915_gem_object_flush_if_display. This is targeting to get rid of need
for #ifdef I195 when doing i915_gem_object_flush_if_display during
dirtyfb call back.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c          | 2 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c      | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 37cd0efa5352..e62e1e12758d 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1895,7 +1895,7 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 {
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 
-	i915_gem_object_flush_if_display(obj);
+	intel_bo_flush_if_display(obj);
 	intel_frontbuffer_flush(to_intel_frontbuffer(fb), ORIGIN_DIRTYFB);
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index 1aca7552a85d..707b3cd171a3 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -93,7 +93,7 @@ intel_pin_fb_obj_dpt(struct drm_framebuffer *fb,
 
 	vma->display_alignment = max(vma->display_alignment, alignment);
 
-	i915_gem_object_flush_if_display(obj);
+	intel_bo_flush_if_display(obj);
 
 	i915_vma_get(vma);
 err:
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 17db49464597..87171b142989 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -685,4 +685,6 @@ to_intel_bo(struct drm_gem_object *gem)
 	return container_of(gem, struct drm_i915_gem_object, base);
 }
 
+#define intel_bo_flush_if_display(obj) i915_gem_object_flush_if_display(obj)
+
 #endif
-- 
2.34.1

