Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AB1CA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 12:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF1610E6B3;
	Tue,  2 Sep 2025 12:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZaXXKIg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FAC10E6BA
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 12:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756816871; x=1788352871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=weF63JyuE7Y5xEW9D03+TUz0wDc0Jj3k7eziqNPoodc=;
 b=eZaXXKIgilnAcMXGWYF7pKcLXmss3oHRiMspVD1B1shtt43w1hZxENYT
 skkenq4WispSQ6737uSIfZsoJ2oHli/r1gmko3kewD0LnI1iyBhadWsLx
 2CpnQ4o85ECHscwLbz10I5bI86vRnj7BHeokKQ2nj/dKeDakLGSr285XE
 Q9juVfnP+FvnKBrTHnkZJsPK2F34Fv3qM6jCjFiIIkXRRFaSO+dqeR+FG
 T/eTQ0H9v1OaLMSrxzVLrmmWy0qeopuookO/vz+dCS+JGkZ0ERj7gdUEX
 jy1veqmFEVSD8yE1EzD+I+kXdS5+IwEwMwK9+HIt5FMvvq2m7tQ8yYCQI Q==;
X-CSE-ConnectionGUID: xNqWcdUMTse5JIjuq+/CBw==
X-CSE-MsgGUID: J0hJyjj2RY63eMRkB8zzbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59157320"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="59157320"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:41:11 -0700
X-CSE-ConnectionGUID: 3tqAtSS0RbaUTOWQTeyKmQ==
X-CSE-MsgGUID: 5yOOTruRTZ+pYYH8rE+1OQ==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.33])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:41:09 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v4 07/13] drm/xe/display: Convert __xe_pin_fb_vma()
Date: Tue,  2 Sep 2025 14:40:15 +0200
Message-ID: <20250902124021.70211-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902124021.70211-1-thomas.hellstrom@linux.intel.com>
References: <20250902124021.70211-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Convert __xe_pin_fb_vma() for exhaustive eviction
using xe_validation_guard().

v2:
- Avoid gotos from within xe_validation_guard(). (Matt Brost)
- Adapt to signature change of xe_validation_guard(). (Matt Brost)
- Use interruptible waiting, since xe_bo_migrate() already does that.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 30 +++++++++++++++-----------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d7a8448a43dc..3d7045852154 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -281,7 +281,8 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
 	struct xe_bo *bo = gem_to_xe_bo(obj);
-	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	int ret;
 
 	if (!vma)
@@ -309,17 +310,22 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	 * Pin the framebuffer, we can't use xe_bo_(un)pin functions as the
 	 * assumptions are incorrect for framebuffers
 	 */
-	ret = ttm_bo_reserve(&bo->ttm, false, false, NULL);
-	if (ret)
-		goto err;
-
-	if (IS_DGFX(xe))
-		ret = xe_bo_migrate(bo, XE_PL_VRAM0, NULL, exec);
-	else
-		ret = xe_bo_validate(bo, NULL, true, exec);
-	if (!ret)
-		ttm_bo_pin(&bo->ttm);
-	ttm_bo_unreserve(&bo->ttm);
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = true},
+			    ret) {
+		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (ret)
+			break;
+
+		if (IS_DGFX(xe))
+			ret = xe_bo_migrate(bo, XE_PL_VRAM0, NULL, &exec);
+		else
+			ret = xe_bo_validate(bo, NULL, true, &exec);
+		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &ret);
+		if (!ret)
+			ttm_bo_pin(&bo->ttm);
+	}
 	if (ret)
 		goto err;
 
-- 
2.50.1

