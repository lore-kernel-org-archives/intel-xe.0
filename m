Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3A0CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 09:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC92C11A386;
	Thu,  4 Apr 2024 09:03:07 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785CC11A3C2
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 09:02:54 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init
Date: Thu,  4 Apr 2024 11:03:02 +0200
Message-ID: <20240404090302.68422-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Add a unreference bo in the error path, to prevent leaking a bo ref.

Return 0 on success to clarify the success path.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/display/intel_fb_bo.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
index dba327f53ac5..e18521acc516 100644
--- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
@@ -31,7 +31,7 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
 
 	ret = ttm_bo_reserve(&bo->ttm, true, false, NULL);
 	if (ret)
-		return ret;
+		goto err;
 
 	if (!(bo->flags & XE_BO_FLAG_SCANOUT)) {
 		/*
@@ -42,12 +42,16 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
 		 */
 		if (XE_IOCTL_DBG(i915, !list_empty(&bo->ttm.base.gpuva.list))) {
 			ttm_bo_unreserve(&bo->ttm);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err;
 		}
 		bo->flags |= XE_BO_FLAG_SCANOUT;
 	}
 	ttm_bo_unreserve(&bo->ttm);
+	return 0;
 
+err:
+	xe_bo_put(bo);
 	return ret;
 }
 
-- 
2.43.0

