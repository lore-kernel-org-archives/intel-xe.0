Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B91606A321
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HF5lUTW8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B1110FB23;
	Wed, 11 Nov 2026 11:20:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3197F10FB36;
 Wed, 11 Nov 2026 11:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794396035; x=1825932035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lm/e97rGImNbiaauLLwSTYQ9nduQN8BxKIiuwOq4qBA=;
 b=HF5lUTW8U0Qlw3YOBybIbM1B//GwuJMcvtc4FzyybJ5FGkgpFm2kbfHy
 ThR8VK3S+tqsnNGKMwoEXVR5ywYSMsfMg2FTP38ioi7a3j6XUTDb5KKug
 nnUPKDLnzy2JpjsS0aD8H/AGGSf1d79AxtHPP+q8uX/0wQxQDkDb94JzQ
 f4+Qpn2FT5zNmZCZGKF22+bpPHsBug8HvoN3c15IidZVp3weH7HkO32wB
 0xnSqowK+xXZZuEqIDlH4lYqX55dy3vzNjK1ypjqKLQgcaMgFqTgMJWeC
 I3UUMCvWS1/VTSP88TD087KNFLqmPcxadXJ6mGx7UJPKO4CzLCNHIchXa g==;
X-CSE-ConnectionGUID: ZJl6Y9eQRRCMmSQXz036AQ==
X-CSE-MsgGUID: BD4La1f1TdyuhJoVY33Xcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3162120"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3162120"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:34 -0800
X-CSE-ConnectionGUID: fZ9tB7z8SWaHIegG9kzpSg==
X-CSE-MsgGUID: +wdWLb1fQYKPfBAb7Q9woA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8493157"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:33 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 06/13] drm/i915/dpt: Compute DPT size in the DPT code
Date: Wed, 11 Nov 2026 13:20:00 +0200
Message-ID: <20261111112007.16790-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
References: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Get rid of the weird division of labor where the DPT code
calculates the DPT size for normal views, and the fb code
calculates it for remapped views. Just do it in the DPT
code every time.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c      |  8 +++++---
 drivers/gpu/drm/i915/display/intel_parent.c  |  5 +++--
 drivers/gpu/drm/i915/display/intel_parent.h  |  3 ++-
 drivers/gpu/drm/i915/i915_dpt.c              | 10 ++++++++--
 include/drm/intel/display_parent_interface.h |  3 ++-
 5 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index b3344e3f187f..35f1d5dd31d7 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2275,13 +2275,15 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 
 	if (intel_fb_uses_dpt(fb)) {
 		struct drm_gem_object *obj = intel_fb_bo(&intel_fb->base);
+		const struct intel_gtt_view *view;
 		struct intel_dpt *dpt;
-		size_t size = 0;
 
 		if (intel_fb_needs_pot_stride_remap(intel_fb))
-			size = intel_remapped_info_size(&intel_fb->remapped_view.gtt.remapped);
+			view = &intel_fb->remapped_view.gtt;
+		else
+			view = &intel_fb->normal_view.gtt;
 
-		dpt = intel_parent_dpt_create(display, obj, size);
+		dpt = intel_parent_dpt_create(display, obj, view);
 		if (IS_ERR(dpt)) {
 			drm_dbg_kms(display->drm, "failed to create DPT\n");
 			ret = PTR_ERR(dpt);
diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/drm/i915/display/intel_parent.c
index ed3e21b0a927..e9609c29997e 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.c
+++ b/drivers/gpu/drm/i915/display/intel_parent.c
@@ -26,10 +26,11 @@
 
 /* dpt */
 struct intel_dpt *intel_parent_dpt_create(struct intel_display *display,
-					  struct drm_gem_object *obj, size_t size)
+					  struct drm_gem_object *obj,
+					  const struct intel_gtt_view *view)
 {
 	if (display->parent->dpt)
-		return display->parent->dpt->create(obj, size);
+		return display->parent->dpt->create(obj, view);
 
 	return NULL;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/drm/i915/display/intel_parent.h
index 923cb6464a98..3d0959d67727 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.h
+++ b/drivers/gpu/drm/i915/display/intel_parent.h
@@ -24,7 +24,8 @@ struct iosys_map;
 
 /* dpt */
 struct intel_dpt *intel_parent_dpt_create(struct intel_display *display,
-					  struct drm_gem_object *obj, size_t size);
+					  struct drm_gem_object *obj,
+					  const struct intel_gtt_view *view);
 void intel_parent_dpt_destroy(struct intel_display *display, struct intel_dpt *dpt);
 void intel_parent_dpt_suspend(struct intel_display *display, struct intel_dpt *dpt);
 void intel_parent_dpt_resume(struct intel_display *display, struct intel_dpt *dpt);
diff --git a/drivers/gpu/drm/i915/i915_dpt.c b/drivers/gpu/drm/i915/i915_dpt.c
index 6daf75c3eb49..96bcffc38d3c 100644
--- a/drivers/gpu/drm/i915/i915_dpt.c
+++ b/drivers/gpu/drm/i915/i915_dpt.c
@@ -179,16 +179,22 @@ void i915_dpt_unpin_from_ggtt(struct intel_dpt *dpt)
 	i915_vma_put(dpt->vma);
 }
 
-static struct intel_dpt *i915_dpt_create(struct drm_gem_object *obj, size_t size)
+static struct intel_dpt *i915_dpt_create(struct drm_gem_object *obj,
+					 const struct intel_gtt_view *view)
 {
 	struct drm_i915_private *i915 = to_i915(obj->dev);
 	struct drm_i915_gem_object *dpt_obj;
 	struct i915_address_space *vm;
 	struct intel_dpt *dpt;
+	size_t size;
 	int ret;
 
-	if (!size)
+	if (intel_gtt_view_is_remapped(view)) {
+		size = intel_remapped_info_size(&view->remapped);
+	} else {
+		drm_WARN_ON(&i915->drm, !intel_gtt_view_is_normal(view));
 		size = DIV_ROUND_UP_ULL(obj->size, I915_GTT_PAGE_SIZE);
+	}
 
 	size = round_up(size * sizeof(gen8_pte_t), I915_GTT_PAGE_SIZE);
 
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index 464fb588cb60..33d29d061373 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -66,7 +66,8 @@ struct intel_display_bo_interface {
 };
 
 struct intel_display_dpt_interface {
-	struct intel_dpt *(*create)(struct drm_gem_object *obj, size_t size);
+	struct intel_dpt *(*create)(struct drm_gem_object *obj,
+				    const struct intel_gtt_view *view);
 	void (*destroy)(struct intel_dpt *dpt);
 	void (*suspend)(struct intel_dpt *dpt);
 	void (*resume)(struct intel_dpt *dpt);
-- 
2.56.0

