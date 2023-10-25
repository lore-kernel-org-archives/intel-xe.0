Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C62CC25B47
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 10:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D69610E62D;
	Wed, 25 Oct 2023 10:21:07 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37DF10E634
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 10:20:56 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 12:20:38 +0200
Message-Id: <20231025102045.817068-4-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025102045.817068-1-maarten.lankhorst@linux.intel.com>
References: <20231025102045.817068-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 03/10] drm/i915: Implement fence->set_deadline.
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

Useful when we want to start using it in display.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index f59081066a197..72e6d0e705231 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -105,6 +105,14 @@ static signed long i915_fence_wait(struct dma_fence *fence,
 					 timeout);
 }
 
+static void i915_fence_set_deadline(struct dma_fence *fence,
+				    ktime_t deadline)
+{
+	struct i915_sched_attr attr = { .priority = I915_PRIORITY_DISPLAY };
+
+	i915_gem_fence_wait_priority(fence, &attr);
+}
+
 struct kmem_cache *i915_request_slab_cache(void)
 {
 	return slab_requests;
@@ -177,6 +185,7 @@ const struct dma_fence_ops i915_fence_ops = {
 	.enable_signaling = i915_fence_enable_signaling,
 	.signaled = i915_fence_signaled,
 	.wait = i915_fence_wait,
+	.set_deadline = i915_fence_set_deadline,
 	.release = i915_fence_release,
 };
 
-- 
2.39.2

