Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7A2FC5921
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 10:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE4110E8B6;
	Thu, 26 Feb 2026 10:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZS89bm35";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4310110E8AF;
 Thu, 26 Feb 2026 10:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772100494; x=1803636494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Geu1knNNQi3dSJgz3D8XT369FPaAXU31fJmSvTc1spQ=;
 b=ZS89bm351rihRd/d307iqNDPA1wnqE11YohqCCQpH1+dKHd29S8nCa0s
 98fbAPQ+qBwzbcLA/6ByYyiGV58l9lMO4+CtTSs5zRtH/238dd1uj6Fml
 OGc539iXeHZEsS2LTBryTp4/02ER8hwbRypL8QeZvIEWUMZIsAF7j7Xnz
 QFNze+hWfDbfi3kem+bUa20SgGLqxbTHP5yOCkJirYD63ayqXJ3BERaws
 tvrhBI8itaeaj4O869JAfk7ya3oH+ACQBSFpeH8EZIEy6siJOXd2GxLFA
 KKBblGVcXLvUxfU6c0FUp7rhWlb/4vvPSCvPiYEZX3aM2Pf9NnYb5pkbS Q==;
X-CSE-ConnectionGUID: R+VIFHHpQzy7T9nwaG2VaQ==
X-CSE-MsgGUID: J9sspaxMQJibvvBNFRB06Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73029782"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73029782"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:08:13 -0800
X-CSE-ConnectionGUID: J9MY7QoMSVGWwo3Lg3+F1Q==
X-CSE-MsgGUID: ZQOzA5wbRUm0J2pUhWB/IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214518206"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.224])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:08:12 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 07/19] drm/i915/overlay: Use struct drm_gem_object as the
 type
Date: Thu, 26 Feb 2026 12:07:26 +0200
Message-ID: <20260226100738.29997-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260226100738.29997-1-ville.syrjala@linux.intel.com>
References: <20260226100738.29997-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use 'struct drm_gem_object' for the BO instead of 'struct
drm_i915_gem_object', to avoid having the display side
know anything about the i915 specific BO type.

v2: Correctly handle the ERR_PTR returned by
    i915_overlay_obj_lookup() (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 37 ++++++++++----------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 91398ee92042..adf419a30c65 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -768,8 +768,9 @@ static u32 overlay_cmd_reg(struct drm_intel_overlay_put_image *params)
 	return cmd;
 }
 
-static struct i915_vma *intel_overlay_pin_fb(struct drm_i915_gem_object *new_bo)
+static struct i915_vma *intel_overlay_pin_fb(struct drm_gem_object *obj)
 {
+	struct drm_i915_gem_object *new_bo = to_intel_bo(obj);
 	struct i915_gem_ww_ctx ww;
 	struct i915_vma *vma;
 	int ret;
@@ -795,7 +796,7 @@ static struct i915_vma *intel_overlay_pin_fb(struct drm_i915_gem_object *new_bo)
 }
 
 static int intel_overlay_do_put_image(struct intel_overlay *overlay,
-				      struct drm_i915_gem_object *new_bo,
+				      struct drm_gem_object *obj,
 				      struct drm_intel_overlay_put_image *params)
 {
 	struct intel_display *display = overlay->display;
@@ -816,7 +817,7 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 
 	atomic_inc(&display->restore.pending_fb_pin);
 
-	vma = intel_overlay_pin_fb(new_bo);
+	vma = intel_overlay_pin_fb(obj);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 		goto out_pin_section;
@@ -1016,7 +1017,7 @@ static int check_overlay_scaling(struct drm_intel_overlay_put_image *rec)
 
 static int check_overlay_src(struct intel_display *display,
 			     struct drm_intel_overlay_put_image *rec,
-			     struct drm_i915_gem_object *new_bo)
+			     struct drm_gem_object *obj)
 {
 	int uv_hscale = uv_hsubsampling(rec->flags);
 	int uv_vscale = uv_vsubsampling(rec->flags);
@@ -1101,7 +1102,7 @@ static int check_overlay_src(struct intel_display *display,
 			return -EINVAL;
 
 		tmp = rec->stride_Y*rec->src_height;
-		if (rec->offset_Y + tmp > new_bo->base.size)
+		if (rec->offset_Y + tmp > obj->size)
 			return -EINVAL;
 		break;
 
@@ -1112,12 +1113,12 @@ static int check_overlay_src(struct intel_display *display,
 			return -EINVAL;
 
 		tmp = rec->stride_Y * rec->src_height;
-		if (rec->offset_Y + tmp > new_bo->base.size)
+		if (rec->offset_Y + tmp > obj->size)
 			return -EINVAL;
 
 		tmp = rec->stride_UV * (rec->src_height / uv_vscale);
-		if (rec->offset_U + tmp > new_bo->base.size ||
-		    rec->offset_V + tmp > new_bo->base.size)
+		if (rec->offset_U + tmp > obj->size ||
+		    rec->offset_V + tmp > obj->size)
 			return -EINVAL;
 		break;
 	}
@@ -1125,7 +1126,7 @@ static int check_overlay_src(struct intel_display *display,
 	return 0;
 }
 
-static struct drm_i915_gem_object *
+static struct drm_gem_object *
 i915_overlay_obj_lookup(struct drm_device *drm,
 			struct drm_file *file_priv,
 			u32 handle)
@@ -1142,7 +1143,7 @@ i915_overlay_obj_lookup(struct drm_device *drm,
 		return ERR_PTR(-EINVAL);
 	}
 
-	return bo;
+	return intel_bo_to_drm_bo(bo);
 }
 
 int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
@@ -1152,8 +1153,8 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 	struct drm_intel_overlay_put_image *params = data;
 	struct intel_overlay *overlay;
 	struct drm_crtc *drmmode_crtc;
+	struct drm_gem_object *obj;
 	struct intel_crtc *crtc;
-	struct drm_i915_gem_object *new_bo;
 	int ret;
 
 	overlay = display->overlay;
@@ -1175,9 +1176,9 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 		return -ENOENT;
 	crtc = to_intel_crtc(drmmode_crtc);
 
-	new_bo = i915_overlay_obj_lookup(dev, file_priv, params->bo_handle);
-	if (IS_ERR(new_bo))
-		return PTR_ERR(new_bo);
+	obj = i915_overlay_obj_lookup(dev, file_priv, params->bo_handle);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
 
 	drm_modeset_lock_all(dev);
 
@@ -1224,7 +1225,7 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 		goto out_unlock;
 	}
 
-	ret = check_overlay_src(display, params, new_bo);
+	ret = check_overlay_src(display, params, obj);
 	if (ret != 0)
 		goto out_unlock;
 
@@ -1233,18 +1234,18 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 	if (ret != 0)
 		goto out_unlock;
 
-	ret = intel_overlay_do_put_image(overlay, new_bo, params);
+	ret = intel_overlay_do_put_image(overlay, obj, params);
 	if (ret != 0)
 		goto out_unlock;
 
 	drm_modeset_unlock_all(dev);
-	i915_gem_object_put(new_bo);
+	drm_gem_object_put(obj);
 
 	return 0;
 
 out_unlock:
 	drm_modeset_unlock_all(dev);
-	i915_gem_object_put(new_bo);
+	drm_gem_object_put(obj);
 
 	return ret;
 }
-- 
2.52.0

