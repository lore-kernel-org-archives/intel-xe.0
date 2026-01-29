Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7361AD358E7
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 08:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330EE10E81C;
	Thu, 29 Jan 2026 08:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaMc0b8P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AC310E81B;
 Thu, 29 Jan 2026 08:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769676911; x=1801212911;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=IkIVBIWkiexZa8AiBbjfBR5M12DBGq547186dAWsPU0=;
 b=OaMc0b8Pj4uy2g1NNnpkGc80oMyaoeJaKP5S6sNB7z42PIU/9gJtzxJl
 BDsFMB/xfFx8kyCYurRR4vnfTdXotbdzqgamd+pPZE99xv1Cax2jQ08Il
 cozTS1P5iZv9njFUxZdECcv47qMLXkSE0zCUmXoMFvZfLdJjQhjS0PYg3
 5/n9ub15br8QlS/+fEAevg9d3EOXjZcsKam1UrJ8NqY5AhMhaZGc8j0s3
 xlLLWFZ5GggFpfz34iRc4j+P2bi9nSgwVTzppTDOG8g2VXGjNsu5j2wM0
 Lx6QQR+FsI3x+fqzaxb8cyWZGfTpaqNzUitgOBO8MGRQojjfk37nS1c3n w==;
X-CSE-ConnectionGUID: 16dbH+hIT3m0okI4k/G4iQ==
X-CSE-MsgGUID: puT2Tl/rRPSjCelh6fR4MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69919974"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="69919974"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:55:11 -0800
X-CSE-ConnectionGUID: sAfL9Z40RT+VCE4dJGZytw==
X-CSE-MsgGUID: +FBBEthDSmyoyMGIqjyMKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213019569"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2026 00:55:06 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 29 Jan 2026 14:23:02 +0530
Subject: [PATCH v8 5/7] drm/atomic: Return user readable error in atomic_ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-atomic-v8-5-4cb7b0faa051@intel.com>
References: <20260129-atomic-v8-0-4cb7b0faa051@intel.com>
In-Reply-To: <20260129-atomic-v8-0-4cb7b0faa051@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com, 
 naveen1.kumar@intel.com, ramya.krishna.yella@intel.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>, 
 Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.15-dev
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

Add user readable error codes for failure cases in drm_atomic_ioctl() so
that user can decode the error code and take corrective measurements.

v8: Replaced DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,
    DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPP with INVALID_API_USAGE
    (Xaver)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 64 +++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index dacdfc2f706a88e93cab924fb988c762906047da..d90160723015e54206f9a251bf1a5a94c0d8cd67 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1196,6 +1196,11 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			ret = drm_atomic_connector_get_property(connector, connector_state,
 								prop, &old_val);
 			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
+			if (ret) {
+				drm_mode_atomic_add_error_msg(&state->error_code,
+							      DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
+							      "property change not allowed in async flip");
+			}
 			break;
 		}
 
@@ -1218,6 +1223,11 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 			ret = drm_atomic_crtc_get_property(crtc, crtc_state,
 							   prop, &old_val);
 			ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
+			if (ret) {
+				drm_mode_atomic_add_error_msg(&state->error_code,
+							      DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
+							      "property change not allowed in async flip");
+			}
 			break;
 		}
 
@@ -1256,9 +1266,10 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 					ret = plane_funcs->atomic_async_check(plane, state, true);
 
 				if (ret) {
-					drm_dbg_atomic(prop->dev,
-						       "[PLANE:%d:%s] does not support async flips\n",
-						       obj->id, plane->name);
+					drm_mode_atomic_add_error_msg(&state->error_code,
+								      DRM_MODE_ATOMIC_INVALID_API_USAGE,
+								      "[PLANE:%d:%s] does not support async flip",
+								      obj->id, plane->name);
 					break;
 				}
 			}
@@ -1568,6 +1579,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	struct drm_atomic_state *state;
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_out_fence_state *fence_state;
+	struct drm_mode_atomic_err_code __user *error_code_ptr;
 	int ret = 0;
 	unsigned int i, j, num_fences = 0;
 	bool async_flip = false;
@@ -1576,6 +1588,14 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
 		return -EOPNOTSUPP;
 
+	if (!arg->reserved)
+		drm_dbg_atomic(dev,
+			       "memory not allocated for drm_atomic error reporting\n");
+	else
+		/* Update the error code if any error to allow user handling it */
+		error_code_ptr = (struct drm_mode_atomic_err_code __user *)
+				 (unsigned long)arg->reserved;
+
 	state = drm_atomic_state_alloc(dev);
 	if (!state)
 		return -ENOMEM;
@@ -1584,31 +1604,35 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
 
+	memset(&state->error_code, 0, sizeof(*error_code_ptr));
+
 	/* disallow for userspace that has not enabled atomic cap (even
 	 * though this may be a bit overkill, since legacy userspace
 	 * wouldn't know how to call this ioctl)
 	 */
 	if (!file_priv->atomic) {
-		drm_dbg_atomic(dev,
-			       "commit failed: atomic cap not enabled\n");
-		return -EINVAL;
+		drm_mode_atomic_add_error_msg(&state->error_code,
+					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
+					      "drm atomic capability not enabled");
+		ret = -EINVAL;
+		goto out;
 	}
 
 	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS) {
-		drm_dbg_atomic(dev, "commit failed: invalid flag\n");
-		return -EINVAL;
-	}
-
-	if (arg->reserved) {
-		drm_dbg_atomic(dev, "commit failed: reserved field set\n");
-		return -EINVAL;
+		drm_mode_atomic_add_error_msg(&state->error_code,
+					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
+					      "invalid flag");
+		ret = -EINVAL;
+		goto out;
 	}
 
 	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
 		if (!dev->mode_config.async_page_flip) {
-			drm_dbg_atomic(dev,
-				       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported\n");
-			return -EINVAL;
+			drm_mode_atomic_add_error_msg(&state->error_code,
+						      DRM_MODE_ATOMIC_INVALID_API_USAGE,
+						      "DRM_MODE_PAGE_FLIP_ASYNC not supported with ATOMIC ioctl");
+			ret = -EINVAL;
+			goto out;
 		}
 
 		async_flip = true;
@@ -1617,9 +1641,11 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	/* can't test and expect an event at the same time. */
 	if ((arg->flags & DRM_MODE_ATOMIC_TEST_ONLY) &&
 			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
-		drm_dbg_atomic(dev,
-			       "commit failed: page-flip event requested with test-only commit\n");
-		return -EINVAL;
+		drm_mode_atomic_add_error_msg(&state->error_code,
+					      DRM_MODE_ATOMIC_INVALID_API_USAGE,
+					      "page-flip event requested with test-only commit");
+		ret = -EINVAL;
+		goto out;
 	}
 
 	state->plane_color_pipeline = file_priv->plane_color_pipeline;

-- 
2.25.1

