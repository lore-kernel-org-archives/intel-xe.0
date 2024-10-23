Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9F6D2E023
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 07:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CFA10E77D;
	Wed, 23 Oct 2024 07:53:10 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACEC10E77C
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 07:53:08 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 6/7] [HACK] drm/xe: Hack to test with mapped pages instead of
 vram.
Date: Wed, 23 Oct 2024 09:52:59 +0200
Message-ID: <20241023075302.27194-7-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
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

We will probably want to make this a proper region in TTM for
everything, so that we can charge VRAM twice, once for mapped
in sysmem, once for mapped in vram. That way we don't need to
deal with evict failing from lack of available memory in mapped.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 9844a8edbfe19..20fa8ec8925ef 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -101,6 +101,18 @@ static void ttm_sys_mgr_fini(struct drm_device *drm, void *arg)
 	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, NULL);
 }
 
+static inline void apply_cg(struct xe_device *xe,
+			    struct ttm_resource_manager *man,
+			    u64 gtt_size)
+{
+	int cgregion = xe->cg.num_regions++;
+
+	xe->cg.regions[cgregion].size = gtt_size;
+	xe->cg.regions[cgregion].name = "mapped";
+	man->cgdev = &xe->cg;
+	man->cgidx = cgregion;
+
+}
 int xe_ttm_sys_mgr_init(struct xe_device *xe)
 {
 	struct ttm_resource_manager *man = &xe->mem.sys_mgr;
@@ -116,6 +128,8 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
 	man->func = &xe_ttm_sys_mgr_func;
 	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
 	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
+	apply_cg(xe, man, gtt_size);
+
 	ttm_resource_manager_set_used(man, true);
 	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini, xe);
 }
-- 
2.45.2

