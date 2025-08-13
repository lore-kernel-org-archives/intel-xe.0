Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5666DCA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 10:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166EB10E6F7;
	Wed, 13 Aug 2025 10:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eiLKWJRT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2634810E6FC
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 10:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755082331; x=1786618331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fz32HMJaNDq4Z/EYXXCmEuaLNuvq+wR8Q2zQavFRiWI=;
 b=eiLKWJRTWePpHN/Ljk0fhgmj4ZRgH+WBfIZaI6ca6dbLKxmUl4GDV+mv
 WQxDaVO1R95IYCyVYSBwbe2VYSwwXdrCKnQlD2KLh4NnJl3R+TnYndpIp
 EEHM7E2fFLtwwSG2d5qJLsaj3zYvWxC9OLeHRAfg1/Oxddr89iCq/lZa7
 uquJERQ4eg2XZbyaCExyl2ybhxcXzXDX0PfjbbNwQeJKrv04llWr1WVFe
 tV7UG2rVF1YTTGBEKeZPpgl933fiF4FNzqBVD2A1plprNaNl09xc3zwrd
 61sqkkZtygc7QtuedtbpJZXb3YCI0ccuK2mXNRfCzxi1S0RGdQOyAKik9 g==;
X-CSE-ConnectionGUID: ci56Z0EyTfWkLixUs1QU0w==
X-CSE-MsgGUID: LQRB4WRdQtqkipFvx2wJ9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57450045"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57450045"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:52:11 -0700
X-CSE-ConnectionGUID: SYm8sYjlR1Oycr3LeNH10A==
X-CSE-MsgGUID: 6aA5NGteT+ehootLVKWnVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166069079"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.199])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:52:09 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 10/15] drm/xe/display: Convert __xe_pin_fb_vma()
Date: Wed, 13 Aug 2025 12:51:16 +0200
Message-ID: <20250813105121.5945-11-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 27 +++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 4b0748e6fdd6..43c45344ea26 100644
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
@@ -309,17 +310,21 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	 * Pin the framebuffer, we can't use xe_bo_(un)pin functions as the
 	 * assumptions are incorrect for framebuffers
 	 */
-	ret = ttm_bo_reserve(&bo->ttm, false, false, NULL);
-	if (ret)
-		goto err;
+	xe_validation_guard(&ctx, &xe->val, &exec, 0, ret, false) {
+		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (ret)
+			goto err;
 
-	if (IS_DGFX(xe))
-		ret = xe_bo_migrate(bo, XE_PL_VRAM0, exec);
-	else
-		ret = xe_bo_validate(bo, NULL, true, exec);
-	if (!ret)
-		ttm_bo_pin(&bo->ttm);
-	ttm_bo_unreserve(&bo->ttm);
+		if (IS_DGFX(xe))
+			ret = xe_bo_migrate(bo, XE_PL_VRAM0, &exec);
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

