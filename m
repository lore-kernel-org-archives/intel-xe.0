Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD3AC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC7310E8C9;
	Thu,  9 Nov 2023 15:08:27 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B3C10E21C
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:08:06 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 16:07:56 +0100
Message-Id: <20231109150759.44549-7-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109150759.44549-1-maarten.lankhorst@linux.intel.com>
References: <20231109150759.44549-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/9] FIXME drm/i915/display: add_dma_resv_fences
 is i915 only
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
Cc: Maarten Lankhorst <dev@lankhorst.se>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <dev@lankhorst.se>

I'm 99% sure that this code is no longer needed on i915, but I'm 100%
sure it won't be needed for xe.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index ef553270c0796..a5ee4af25836f 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1021,9 +1021,10 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
 static int add_dma_resv_fences(struct dma_resv *resv,
 			       struct drm_plane_state *new_plane_state)
 {
+	int ret = 0;
+#ifdef I915
 	struct dma_fence *fence = dma_fence_get(new_plane_state->fence);
 	struct dma_fence *new;
-	int ret;
 
 	ret = dma_resv_get_singleton(resv, dma_resv_usage_rw(false), &new);
 	if (ret)
@@ -1050,6 +1051,7 @@ static int add_dma_resv_fences(struct dma_resv *resv,
 
 error:
 	dma_fence_put(fence);
+#endif
 	return ret;
 }
 
-- 
2.39.2

