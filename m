Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26D9C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 14:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1F010EBC2;
	Thu, 21 Mar 2024 14:56:41 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5AD10EBC2
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 14:56:39 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init
Date: Thu, 21 Mar 2024 15:56:44 +0100
Message-ID: <20240321145644.33091-1-maarten.lankhorst@linux.intel.com>
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

Add a reference to bo after all error paths, to prevent leaking a bo
ref.

Return 0 to clarify that this is the success path.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/display/intel_fb_bo.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
index b21da7b745a5..7262bbca9baf 100644
--- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
@@ -27,8 +27,6 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
 	struct drm_i915_private *i915 = to_i915(bo->ttm.base.dev);
 	int ret;
 
-	xe_bo_get(bo);
-
 	ret = ttm_bo_reserve(&bo->ttm, true, false, NULL);
 	if (ret)
 		return ret;
@@ -48,7 +46,8 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
 	}
 	ttm_bo_unreserve(&bo->ttm);
 
-	return ret;
+	xe_bo_get(bo);
+	return 0;
 }
 
 struct xe_bo *intel_fb_bo_lookup_valid_bo(struct drm_i915_private *i915,
-- 
2.43.0

