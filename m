Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A2ED358E6
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 08:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A7010E819;
	Thu, 29 Jan 2026 08:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKGUfh93";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E901E10E817;
 Thu, 29 Jan 2026 08:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769676901; x=1801212901;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=LTXOitanE3FL9GOQkLiNC+R24zAJvy3ynH9EoKCf+s8=;
 b=WKGUfh93C/7Jb1K19PtTDGh+LKJz2umgaNsz6+1P3mi+2bxFiplUS34v
 EHVi823SmclxJ5gIovtgcfeUIGVXFfNk3wyIcr8UOiHwPcgxdd4Vq3R8e
 51NtX7Ij8QTupWtVTZS8qpNPLgwsvAEnpbgtyNj/vUpBhaWrHLagqOsSQ
 Rco3cUzd7J6DVpZEEoIFsUnb0Z8/+ckIb8KJudWUeSUrNt71rqEllNUV2
 gtlqhyaAbveQRtZoNbCBqSFWCZhYZiLAYqpsT73+fH1obUTiZXfnUAHTS
 FI5qicpfaPN7RdsDpw9Nojr3RKtffUsO1arRBVtZF3YXijR06OBiqDsDC A==;
X-CSE-ConnectionGUID: 8IQN2fvjTxukfq/DTjBO7A==
X-CSE-MsgGUID: 9fcklO8pSPKUErw67WkyUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69919947"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="69919947"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:55:01 -0800
X-CSE-ConnectionGUID: g1ySuwMnR4yKnuE5ehS++Q==
X-CSE-MsgGUID: 7/fj0Q+5RXqxK5JXL4zzRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213019536"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2026 00:54:55 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 29 Jan 2026 14:23:00 +0530
Subject: [PATCH v8 3/7] drm/atomic: Allocate atomic_state at the beginning
 of atomic_ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-atomic-v8-3-4cb7b0faa051@intel.com>
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
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
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

Move atomic_state allocation to the beginning of the atomic_ioctl
to accommodate drm_mode_atomic_err_code usage for returning error
code on failures.
As atomic state is required for drm_mode_atomic_err_code to store the
error codes.

v7: Reframe commit message (Suraj)
v8: Moved the clearing fence change to a different patch (Suraj/Louis)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index dc013a22bf265512a4fa1edf0ae90931ff0d35e6..3042e6c2616fb09403c13a8630c8819a39cf55d4 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1576,6 +1576,14 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
 		return -EOPNOTSUPP;
 
+	state = drm_atomic_state_alloc(dev);
+	if (!state)
+		return -ENOMEM;
+
+	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
+	state->acquire_ctx = &ctx;
+	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
+
 	/* disallow for userspace that has not enabled atomic cap (even
 	 * though this may be a bit overkill, since legacy userspace
 	 * wouldn't know how to call this ioctl)
@@ -1614,13 +1622,6 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 		return -EINVAL;
 	}
 
-	state = drm_atomic_state_alloc(dev);
-	if (!state)
-		return -ENOMEM;
-
-	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
-	state->acquire_ctx = &ctx;
-	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
 	state->plane_color_pipeline = file_priv->plane_color_pipeline;
 
 retry:
@@ -1719,6 +1720,13 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	}
 
 out:
+	/* Update the error code if any error to allow user handling it */
+	if (ret < 0 && arg->reserved) {
+		if (copy_to_user(error_code_ptr, &state->error_code,
+				 sizeof(state->error_code)))
+			return -EFAULT;
+	}
+
 	complete_signaling(dev, state, fence_state, num_fences, !ret);
 
 	if (ret == -EDEADLK) {

-- 
2.25.1

