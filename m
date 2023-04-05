Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA901C76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 04:19:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F6310E2F7;
	Wed,  5 Apr 2023 04:19:42 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0E810E2F7
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 04:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680668381; x=1712204381;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pXrbpC/B9xmCDR525z4YQoZ3JeroUAUznn0VzXoKo04=;
 b=GuzIZkhR2/Tu4k8JjEpr9ZfGseB/9UBiJaRE5S6m3bXd05BQZxMQQfF5
 GqP7IF6SPbeZsyD6Cw/TjnDsAbUg/n2MtAIqYvoKCBb/PpOqs/n44c+5H
 arPp7bDDJbktw8XUOi2Ncz+b/jQGioyRv1chDMBPsaoWaL291GpM9P91U
 LOgRDsZ8r6uUd/oaqvooKfaOLyB43Vsq4T4u1cv3evSl0HFbVOrXuslb6
 vMJLdNp3JWblo1l5u+U/8qS4o1EWLsx/4+gEm9YxN0SlGIumutK/gBrvU
 fWr4+jr39FGgG2Pf1597evzZ9/qhGiXvIgBUoo3XOMmp3KeRKoGrKsXsa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="341089861"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="341089861"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 21:19:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="663894213"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="663894213"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 21:19:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  4 Apr 2023 21:19:43 -0700
Message-Id: <20230405041943.3980167-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Use Xe BO pin / unpin functions for FB
 pin
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

Should fix:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/244

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++--
 drivers/gpu/drm/xe/xe_bo.c             | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

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
index 3a482c61c3ec..25c696bd380c 100644
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
-- 
2.34.1

