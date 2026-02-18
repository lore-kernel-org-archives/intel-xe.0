Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C5CE9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 15:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5786010E5D8;
	Wed, 18 Feb 2026 15:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NvpL9GOv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B7510E0F8;
 Wed, 18 Feb 2026 15:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771428517; x=1802964517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qaZmqHtrKfMLNjRtefYfy5wvqaUeMmEorxe/B5pCl9c=;
 b=NvpL9GOvAoRFb/TnniNxQYxIGnp2e4rXyVEw4ofOPmThFxn/gx/6+Tkt
 QGgadwoC/jdxClxL6/VT2dyRgbKdnS1SwQCgPRK8LYtaQx5ViIx4r29PG
 kkGIjTpdR/DbRY7uyXezryoiEI5whxLGRClXfDiqwRHYiR27rjE7+KuVA
 0j6y6GX+4/JOyblDiJlh5nJD0uP3Z3TA+1BWDIgyhwIdXDoDO6OOhBdju
 UnN39kjLJ4jOjaj0GI3jvCKEj2OM9Fil3Xys8aoF4DmiehHOBPcW/Ftn1
 tqy/O33ph3pUdjKlqSPCqDf7vcLsC+PysuCWVGibIJwLawYyJOC6oJmjH g==;
X-CSE-ConnectionGUID: w3MukgQwRAyNzNmyM8sX6Q==
X-CSE-MsgGUID: +Cw6Wfm9QMScjNxXnTVRzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72420174"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="72420174"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:28:37 -0800
X-CSE-ConnectionGUID: zeEKjKOMSzmcP//xFYcG6w==
X-CSE-MsgGUID: K+UvENn5TFKS/W8Odr77WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="214335166"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.66])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:28:36 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 06/19] drm/i915/overlay: Introduce i915_overlay_obj_lookup()
Date: Wed, 18 Feb 2026 17:27:53 +0200
Message-ID: <20260218152806.18885-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
References: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
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

Extract the BO lookup and tiling check into a new
helper called i915_overlay_obj_lookup(). This will have to
move to the i915 side of the parent vs. display driver split.

There is a slight change here in that we now do the tiling
check before taking the modeset locks, but those locks don't
protect the BO tiling stuff in any way, so nothing is really
different here.

Note that the hardware should support X-tiled scanout also
for the overlay, but I guess no one ever bothered to hook
it up and test it. So the check should stay at least for now.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 31 ++++++++++++++------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index e1707a678acb..5c4f8bf8ac44 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -1125,6 +1125,26 @@ static int check_overlay_src(struct intel_display *display,
 	return 0;
 }
 
+static struct drm_i915_gem_object *
+i915_overlay_obj_lookup(struct drm_device *drm,
+			struct drm_file *file_priv,
+			u32 handle)
+{
+	struct drm_i915_gem_object *bo;
+
+	bo = i915_gem_object_lookup(file_priv, handle);
+	if (!bo)
+		return ERR_PTR(-ENOENT);
+
+	if (i915_gem_object_is_tiled(bo)) {
+		drm_dbg(drm, "buffer used for overlay image can not be tiled\n");
+		i915_gem_object_put(bo);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return bo;
+}
+
 int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *file_priv)
 {
@@ -1155,19 +1175,12 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
 		return -ENOENT;
 	crtc = to_intel_crtc(drmmode_crtc);
 
-	new_bo = i915_gem_object_lookup(file_priv, params->bo_handle);
+	new_bo = i915_overlay_obj_lookup(dev, file_priv, params->bo_handle);
 	if (!new_bo)
-		return -ENOENT;
+		return PTR_ERR(new_bo);
 
 	drm_modeset_lock_all(dev);
 
-	if (i915_gem_object_is_tiled(new_bo)) {
-		drm_dbg_kms(display->drm,
-			    "buffer used for overlay image can not be tiled\n");
-		ret = -EINVAL;
-		goto out_unlock;
-	}
-
 	ret = intel_overlay_recover_from_interrupt(overlay);
 	if (ret != 0)
 		goto out_unlock;
-- 
2.52.0

