Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D2FC76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 14:37:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA8710E093;
	Wed,  5 Apr 2023 14:37:07 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE1510E093
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 14:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680705425; x=1712241425;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tok6OiUrapXaCGQevJrlIcNBUoop6hEeZNDMC6SMxKA=;
 b=OJbyfBN8HoV6xCA67rgGNKI4L/upQlImM7q0/xP95+RQAj9ZJNUKVbyG
 gzWPbj4eRtC3vbz6FEi5tTClLfkaoMzWfndo2dcmGyGE8UEKYooeA+oi6
 kqvAEPAn+M/SOh35/smkWdZPTjsjI19U14hMBsYD+jIRAayQ5bsGz2QJ3
 yY/cPCm3zdYqonArcztlqHGYzv3cRKfZPD5FNyCadomvqYTC2sXvX914E
 H85iY1kLyTos3wTU+aHl6KQpf4vZ9GktWAS4/VsoXaDQ9IcMzld6p0yG0
 Z8VGQ7uM6T4axyXh88dfoKZY4tMSRlFHL2aIjFI3GjOlPl4kapc3Hwngt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="428754066"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="428754066"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 07:37:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="717066438"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="717066438"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 07:37:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  5 Apr 2023 07:37:06 -0700
Message-Id: <20230405143706.4063988-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH] drm/xe: Use Xe BO pin / unpin functions for
 FB pin
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

Need to use XE BO pin / unpin for suspend / resume to work properly.
Part this fix too is too allow xe_bo_pin to be called more than once.

v2:
  - (Matthew Auld) fixup unpin

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++--
 drivers/gpu/drm/xe/xe_bo.c             | 8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 65c0bc28a3d1..c7c849be288f 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -205,7 +205,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 
 	ret = xe_bo_validate(bo, NULL, true);
 	if (!ret)
-		ttm_bo_pin(&bo->ttm);
+		xe_bo_pin(bo);
 	ttm_bo_unreserve(&bo->ttm);
 	if (ret)
 		goto err;
@@ -222,7 +222,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 
 err_unpin:
 	ttm_bo_reserve(&bo->ttm, false, false, NULL);
-	ttm_bo_unpin(&bo->ttm);
+	xe_bo_unpin(bo);
 	ttm_bo_unreserve(&bo->ttm);
 err:
 	kfree(vma);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3a482c61c3ec..2cf112bedc92 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1278,8 +1278,8 @@ int xe_bo_pin(struct xe_bo *bo)
 	 */
 	XE_BUG_ON(bo->ttm.base.import_attach);
 
-	/* We only expect at most 1 pin */
-	XE_BUG_ON(xe_bo_is_pinned(bo));
+	if (xe_bo_is_pinned(bo))
+		goto pin;
 
 	err = xe_bo_validate(bo, NULL, false);
 	if (err)
@@ -1308,6 +1308,7 @@ int xe_bo_pin(struct xe_bo *bo)
 		}
 	}
 
+pin:
 	ttm_bo_pin(&bo->ttm);
 
 	/*
@@ -1359,7 +1360,8 @@ void xe_bo_unpin(struct xe_bo *bo)
 	XE_BUG_ON(bo->ttm.base.import_attach);
 	XE_BUG_ON(!xe_bo_is_pinned(bo));
 
-	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
+	if (bo->ttm.pin_count == 1 && IS_DGFX(xe) &&
+	    !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
 	    bo->flags & XE_BO_INTERNAL_TEST)) {
 		struct ttm_place *place = &(bo->placements[0]);
 
-- 
2.34.1

