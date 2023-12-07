Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2233CC10F04
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 05:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8B510E7DA;
	Thu,  7 Dec 2023 05:23:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CF810E7E5
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 05:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701926616; x=1733462616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qWmppjPEWHom2blT1Q1jG5yTJ5ociZtjXhU+2BGdIWk=;
 b=RdKIOFuzyCXibO/tp2MwviNcTx3JJCOd6Ia3Bw3N3NoLjamnBS5DsOhP
 yGjr0iIybDI40QoZFlEgJWuanY6dtusj1T4cLtB+tgDrbWKZw/vjGqt+I
 WxFOz9pL/rMycPceKLhoSyjH4OiWJo+CKI6NUwJdCrM8B5cQFFPo+ALlA
 IxPGTziGpATPgh+gHDroBJUvpOLHuiXlkukgcMyfCwJctOuKe2Wnhy47M
 o4hKzVd6x3UjWseZopvTU45MGRBj1lbTQapEas1sh4nJaGZLF/7vDFeR9
 TdRpL0revL3e1uNbXxNTWGnVsiQ0giahNR1W0hmB9+mK/V/aY7188TRc7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7482074"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7482074"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="842086058"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="842086058"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:23:35 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Dec 2023 07:22:50 +0200
Message-Id: <20231207052252.2092191-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207052252.2092191-1-jouni.hogander@intel.com>
References: <20231207052252.2092191-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 7/9] drm/i915/display: Add
 intel_fb_bo_framebuffer_fini
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

Xe needs intel_fb_bo_framebuffer_fini for taking care of unpinning the fb
and taking reference.  In i915 this can be empty.

Also move intel_frontbuffer_get to be done after
intel_fb_bo_framebuffer_init to have reasonable sequences:

intel_fb_bo_framebuffer_init
intel_frontbuffer_get
...
intel_frontbuffer_put
intel_fb_bo_framebuffer_fini

v2: Empty function instead of define

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c    | 32 +++++++++++++---------
 drivers/gpu/drm/i915/display/intel_fb_bo.c |  5 ++++
 drivers/gpu/drm/i915/display/intel_fb_bo.h |  2 ++
 3 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 96663f9ac431..3c3847cfa323 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1888,6 +1888,8 @@ static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
 
 	intel_frontbuffer_put(intel_fb->frontbuffer);
 
+	intel_fb_bo_framebuffer_fini(intel_fb_obj(fb));
+
 	kfree(intel_fb);
 }
 
@@ -1988,13 +1990,15 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	int ret = -EINVAL;
 	int i;
 
-	intel_fb->frontbuffer = intel_frontbuffer_get(obj);
-	if (!intel_fb->frontbuffer)
-		return -ENOMEM;
-
 	ret = intel_fb_bo_framebuffer_init(intel_fb, obj, mode_cmd);
 	if (ret)
+		return ret;
+
+	intel_fb->frontbuffer = intel_frontbuffer_get(obj);
+	if (!intel_fb->frontbuffer) {
+		ret = -ENOMEM;
 		goto err;
+	}
 
 	ret = -EINVAL;
 	if (!drm_any_plane_has_format(&dev_priv->drm,
@@ -2003,7 +2007,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		drm_dbg_kms(&dev_priv->drm,
 			    "unsupported pixel format %p4cc / modifier 0x%llx\n",
 			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
-		goto err;
+		goto err_frontbuffer_put;
 	}
 
 	max_stride = intel_fb_max_stride(dev_priv, mode_cmd->pixel_format,
@@ -2014,7 +2018,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			    mode_cmd->modifier[0] != DRM_FORMAT_MOD_LINEAR ?
 			    "tiled" : "linear",
 			    mode_cmd->pitches[0], max_stride);
-		goto err;
+		goto err_frontbuffer_put;
 	}
 
 	/* FIXME need to adjust LINOFF/TILEOFF accordingly. */
@@ -2022,7 +2026,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		drm_dbg_kms(&dev_priv->drm,
 			    "plane 0 offset (0x%08x) must be 0\n",
 			    mode_cmd->offsets[0]);
-		goto err;
+		goto err_frontbuffer_put;
 	}
 
 	drm_helper_mode_fill_fb_struct(&dev_priv->drm, fb, mode_cmd);
@@ -2033,7 +2037,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		if (mode_cmd->handles[i] != mode_cmd->handles[0]) {
 			drm_dbg_kms(&dev_priv->drm, "bad plane %d handle\n",
 				    i);
-			goto err;
+			goto err_frontbuffer_put;
 		}
 
 		stride_alignment = intel_fb_stride_alignment(fb, i);
@@ -2041,7 +2045,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			drm_dbg_kms(&dev_priv->drm,
 				    "plane %d pitch (%d) must be at least %u byte aligned\n",
 				    i, fb->pitches[i], stride_alignment);
-			goto err;
+			goto err_frontbuffer_put;
 		}
 
 		if (intel_fb_is_gen12_ccs_aux_plane(fb, i)) {
@@ -2052,7 +2056,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 					    "ccs aux plane %d pitch (%d) must be %d\n",
 					    i,
 					    fb->pitches[i], ccs_aux_stride);
-				goto err;
+				goto err_frontbuffer_put;
 			}
 		}
 
@@ -2061,7 +2065,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 
 	ret = intel_fill_fb_info(dev_priv, intel_fb);
 	if (ret)
-		goto err;
+		goto err_frontbuffer_put;
 
 	if (intel_fb_uses_dpt(fb)) {
 		struct i915_address_space *vm;
@@ -2070,7 +2074,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		if (IS_ERR(vm)) {
 			drm_dbg_kms(&dev_priv->drm, "failed to create DPT\n");
 			ret = PTR_ERR(vm);
-			goto err;
+			goto err_frontbuffer_put;
 		}
 
 		intel_fb->dpt_vm = vm;
@@ -2087,8 +2091,10 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 err_free_dpt:
 	if (intel_fb_uses_dpt(fb))
 		intel_dpt_destroy(intel_fb->dpt_vm);
-err:
+err_frontbuffer_put:
 	intel_frontbuffer_put(intel_fb->frontbuffer);
+err:
+	intel_fb_bo_framebuffer_fini(obj);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_fb_bo.c b/drivers/gpu/drm/i915/display/intel_fb_bo.c
index ce86eff7b226..4be09541e509 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_bo.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_bo.c
@@ -11,6 +11,11 @@
 #include "intel_fb.h"
 #include "intel_fb_bo.h"
 
+void intel_fb_bo_framebuffer_fini(struct drm_i915_gem_object *obj)
+{
+	/* Nothing to do for i915 */
+}
+
 int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
 				 struct drm_i915_gem_object *obj,
 				 struct drm_mode_fb_cmd2 *mode_cmd)
diff --git a/drivers/gpu/drm/i915/display/intel_fb_bo.h b/drivers/gpu/drm/i915/display/intel_fb_bo.h
index dd06ceec8601..232bf898b013 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_bo.h
+++ b/drivers/gpu/drm/i915/display/intel_fb_bo.h
@@ -12,6 +12,8 @@ struct drm_i915_gem_object;
 struct drm_i915_private;
 struct intel_framebuffer;
 
+void intel_fb_bo_framebuffer_fini(struct drm_i915_gem_object *obj);
+
 int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
 				 struct drm_i915_gem_object *obj,
 				 struct drm_mode_fb_cmd2 *mode_cmd);
-- 
2.34.1

