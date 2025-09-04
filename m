Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C571CA1015
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 14:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD47610EA85;
	Thu,  4 Sep 2025 14:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5H5kOHh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A8C10EA7F
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 14:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756997385; x=1788533385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=weF63JyuE7Y5xEW9D03+TUz0wDc0Jj3k7eziqNPoodc=;
 b=C5H5kOHhibpwaWUBW8N2c/OPsKSRZ7RNttF1FX7IkUwWHC6bnyntiafL
 orm6odty5K8T0XLOeOSG2jdC8ox07iFOibKdrpFjfS+fDDT/yzNWB8Cn4
 +d8GSEVbXtetfmawylG6ka7rLw7Ol3ALeNwfl2cKlM76+VDdVAKL4f/U1
 4njzHT4yNuGnkY5LEtetm093mMpXMcI971mv7DDb6ojSxe8lhdi9OofjV
 M7JKk5tkooavjc6KQCjBvqBtk1VtSwpIl/8d/pFS3TsQIf2Kl2czkVkAk
 b3QOvbLpaJLe788Yg7r//axDf2A/xoV0ANQ9SXeqB5x0UVHlJl/LESID7 A==;
X-CSE-ConnectionGUID: S+59fSZWRfaDh2Xuv7qhoA==
X-CSE-MsgGUID: liBAVo8ZSnK1F3nmNSzMuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="76790132"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="76790132"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 07:49:45 -0700
X-CSE-ConnectionGUID: +8+rvIw8SOi/IYREI5t8QA==
X-CSE-MsgGUID: 4+mIVytxTneqe2RvB9eU5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="171851023"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora) ([10.245.244.98])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 07:49:42 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v5 07/13] drm/xe/display: Convert __xe_pin_fb_vma()
Date: Thu,  4 Sep 2025 16:49:02 +0200
Message-ID: <20250904144908.14303-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904144908.14303-1-thomas.hellstrom@linux.intel.com>
References: <20250904144908.14303-1-thomas.hellstrom@linux.intel.com>
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

