Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F79DD358E5
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 08:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA6C10E821;
	Thu, 29 Jan 2026 08:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+eIdTxp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E149C10E819;
 Thu, 29 Jan 2026 08:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769676917; x=1801212917;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=XkpSbIkJV5Tc8uIw6zllllw5O4nhdkW3OT1KYC5vQm0=;
 b=g+eIdTxpMYuHA+iye2qKzV9vWlTTsUIMEa05uPQvRZAvpKAs5zAhHKyd
 ZrrU83BnJnop4v//46Nd5x4Be7wOWUM1bT6PPLKOVqhTHGYiVMS5+5lkp
 nsXBmoDLj8/AtGyfheCIn18HC4u5gHWDbFvJKCYzH4o75r6TjVNYh6i7c
 p91jGKL+QIA+/Wixsumchavew3mpquRj4lQx0q+21su46WWWAlY11wX2J
 kU0+p/Xt58R95YQDv6alkXZJSUton5bDlB+EtagBI/vIdxhMoeXiQPhHC
 BBg9UYAmiAllvViG5YaMXzJ5GwQk8JVKh4Wmk94yrJzBJ2CZt6hAchouG A==;
X-CSE-ConnectionGUID: zECJutcpSGK4lzCDJIoYKg==
X-CSE-MsgGUID: gambgKk5T+C2DeE548nvsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69919983"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="69919983"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:55:16 -0800
X-CSE-ConnectionGUID: M8IDMWegR+6TnTEWEAYO9w==
X-CSE-MsgGUID: HglhVcazSp+LTuW60UpqVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213019583"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2026 00:55:11 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 29 Jan 2026 14:23:03 +0530
Subject: [PATCH v8 6/7] drm/i915/display: Error codes for async flip failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-atomic-v8-6-4cb7b0faa051@intel.com>
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

For failures in async flip atomic check/commit path return user readable
error codes in struct drm_atomic_state.

v8: Replaced DRM_MODE_ATOMIC_ASYNC_NOT_SUPP_PLANE,
    DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPP with INVALUD_API_USAGE
    (Xaver)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7491e00e385854bde3eb176282e05259cf95b7a3..02ddd7133378ac3c1e3b7ed808beb6e12182e279 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6016,9 +6016,10 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
 	}
 
 	if (intel_crtc_needs_modeset(new_crtc_state)) {
-		drm_dbg_kms(display->drm,
-			    "[CRTC:%d:%s] modeset required\n",
-			    crtc->base.base.id, crtc->base.name);
+		drm_mode_atomic_add_error_msg(&state->base.error_code,
+					      DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET,
+					      "[CRTC:%d:%s] requires full modeset",
+					      crtc->base.base.id, crtc->base.name);
 		return -EINVAL;
 	}
 
@@ -6085,9 +6086,10 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 	}
 
 	if (intel_crtc_needs_modeset(new_crtc_state)) {
-		drm_dbg_kms(display->drm,
-			    "[CRTC:%d:%s] modeset required\n",
-			    crtc->base.base.id, crtc->base.name);
+		drm_mode_atomic_add_error_msg(&state->base.error_code,
+					      DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET,
+					      "[CRTC:%d:%s] requires full modeset",
+					      crtc->base.base.id, crtc->base.name);
 		return -EINVAL;
 	}
 
@@ -6125,11 +6127,12 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 
 		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb->format,
 						new_plane_state->hw.fb->modifier)) {
-			drm_dbg_kms(display->drm,
-				    "[PLANE:%d:%s] pixel format %p4cc / modifier 0x%llx does not support async flip\n",
-				    plane->base.base.id, plane->base.name,
-				    &new_plane_state->hw.fb->format->format,
-				    new_plane_state->hw.fb->modifier);
+			drm_mode_atomic_add_error_msg(&state->base.error_code,
+						      DRM_MODE_ATOMIC_INVALID_API_USAGE,
+						      "[PLANE:%d:%s] pixel format %p4cc / 0x%llx modifier does not support async flip",
+						      plane->base.base.id, plane->base.name,
+						      &new_plane_state->hw.fb->format->format,
+						      new_plane_state->hw.fb->modifier);
 			return -EINVAL;
 		}
 

-- 
2.25.1

