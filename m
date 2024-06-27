Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF92C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 15:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E17890BE;
	Thu, 27 Jun 2024 15:57:54 +0000 (UTC)
X-Greylist: delayed 588 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jun 2024 15:57:52 UTC
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025E310E12E;
 Thu, 27 Jun 2024 15:57:52 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org
Subject: [RFC PATCH 4/6] drm/xe: Implement cgroup for vram
Date: Thu, 27 Jun 2024 17:47:23 +0200
Message-ID: <20240627154754.74828-5-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
References: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
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

Add vram based cgroup eviction to Xe.
Most hardware with VRAM uses TTM for its management, and can be
similarly trivially enabled.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  4 ++++
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 10 ++++++++++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5ef9b50a20d0..6e630d67b13a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -616,6 +616,10 @@ int xe_device_probe(struct xe_device *xe)
 	/* Allocate and map stolen after potential VRAM resize */
 	xe_ttm_stolen_mgr_init(xe);
 
+	err = drmmcg_register_device(&xe->drm, &xe->cg);
+	if (err)
+		goto err_irq_shutdown;
+
 	/*
 	 * Now that GT is initialized (TTM in particular),
 	 * we can try to init display, and inherit the initial fb.
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2e62450d86e1..6b60837d9090 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -7,6 +7,7 @@
 #define _XE_DEVICE_TYPES_H_
 
 #include <linux/pci.h>
+#include <linux/cgroup_drm.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
@@ -216,6 +217,9 @@ struct xe_device {
 	/** @devcoredump: device coredump */
 	struct xe_devcoredump devcoredump;
 
+	/** @cg: drm cgroup bookkeeping */
+	struct drmcgroup_device cg;
+
 	/** @info: device info */
 	struct intel_device_info {
 		/** @info.graphics_name: graphics IP name */
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index fe3779fdba2c..9a625b69fc52 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -339,6 +339,16 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	struct ttm_resource_manager *man = &mgr->manager;
 	int err;
 
+	if (mem_type != XE_PL_STOLEN) {
+		int cgregion = xe->cg.num_regions++;
+
+		xe->cg.regions[cgregion].size = size;
+		xe->cg.regions[cgregion].name =
+			mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
+		man->cgdev = &xe->cg;
+		man->cgidx = cgregion;
+	}
+
 	man->func = &xe_ttm_vram_mgr_func;
 	mgr->mem_type = mem_type;
 	mutex_init(&mgr->lock);
-- 
2.45.2

