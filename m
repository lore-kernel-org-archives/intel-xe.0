Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3717D74EFD
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 12:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AB310E414;
	Mon, 26 Jan 2026 12:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="O+jepxTW";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F367410E414
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 12:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1769431931;
 bh=ONs2Lew0ZEGvw/toj8nPlkKV0A+fyeJ+JJLT2MjHZrI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O+jepxTWkVLO4pu+DEQ8z1QspE/75jZCNEwOfc1kWRkc/3ecBkyxZRfsN+ROihuvN
 xDe3IwYVLchruV+o031ZhxxSX7glLfGEX5xNXtIqRGEy0z4obrPkk6U2lnBxZkcUvD
 qVoiHLn1k6Y3ymwxREaqWMr42ITDKvTk1ik33s+h3iqZjb4YbxvCcXcZwgWZ+4to+z
 YSAOfQmq1nc+sBn4KlX8WcNhsKi47XLeIi3DMYEkNz9bzKLREEW2tTbhfUbManKHlZ
 afjdyYVkLfUt+SNtie1HKcQEB55InD4nzFlwzs9sd1rMqrku1ro0629sW4L2q9uZp3
 yDeEOSsYW2HjQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [RFC PATCH 3/3] drm/xe: Add migration selftest for validating job
 submission and basic features work
Date: Mon, 26 Jan 2026 13:52:07 +0100
Message-ID: <20260126125207.1119351-4-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126125207.1119351-1-dev@lankhorst.se>
References: <20260126125207.1119351-1-dev@lankhorst.se>
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

Add a migration selftest that copies either from local VRAM to sysmem,
or sysmem to sysmem. The idea is to validate whether accessing VRAM and
system memory works, so we don't run into slightly harder issues later
if ATS fails.

TODO: Do we want to run this all the time, put it behind a module
parameter, or only if DRM_XE_DEBUG_VM is set?

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_device.c  |  7 ++++++
 drivers/gpu/drm/xe/xe_migrate.c | 43 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h |  1 +
 3 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index aad4aa53a51f9..4e244c0ed23cc 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -46,6 +46,7 @@
 #include "xe_i2c.h"
 #include "xe_irq.h"
 #include "xe_late_bind_fw.h"
+#include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_nvm.h"
@@ -974,6 +975,12 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	for_each_tile(tile, xe, id) {
+		err = xe_migrate_selftest(tile->migrate);
+		if (err)
+			return err;
+	}
+
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cbcac57b2c760..bf2000d8d7c23 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -37,6 +37,7 @@
 #include "xe_sriov_vf_ccs.h"
 #include "xe_svm.h"
 #include "xe_sync.h"
+#include "xe_tile_printk.h"
 #include "xe_trace_bo.h"
 #include "xe_validation.h"
 #include "xe_vm.h"
@@ -519,6 +520,48 @@ int xe_migrate_init(struct xe_migrate *m)
 
 }
 
+int xe_migrate_selftest(struct xe_migrate *m)
+{
+	struct xe_tile *tile = m->tile;
+	struct xe_device *xe = tile->xe;
+	struct xe_bo *mem_bo;
+	struct xe_bo *tile_bo;
+	struct dma_fence *fence;
+	int err;
+
+	tile_bo = xe_bo_create_pin_map_novm(xe, tile, SZ_2M, ttm_bo_type_kernel,
+					    XE_BO_FLAG_VRAM_IF_DGFX(tile), false);
+
+	if (IS_ERR(tile_bo))
+		return PTR_ERR(tile_bo);
+
+	mem_bo = xe_bo_create_pin_map_novm(xe, tile, xe_bo_size(tile_bo), ttm_bo_type_kernel,
+					   XE_BO_FLAG_SYSTEM, false);
+
+	if (IS_ERR(mem_bo)) {
+		err = PTR_ERR(mem_bo);
+		goto out_put_tile;
+	}
+
+	xe_map_memset(xe, &mem_bo->vmap, 0, 0xc0, xe_bo_size(mem_bo));
+
+	fence = xe_migrate_copy(m, tile_bo, mem_bo, tile_bo->ttm.resource, mem_bo->ttm.resource, false);
+	if (IS_ERR(fence)) {
+		err = PTR_ERR(fence);
+		goto out_put_mem;
+	}
+	err = dma_fence_wait(fence, false);
+	dma_fence_put(fence);
+
+out_put_mem:
+	xe_bo_unpin_map_no_vm(mem_bo);
+out_put_tile:
+	xe_bo_unpin_map_no_vm(tile_bo);
+	if (err)
+		xe_tile_err(tile, "Migration selftest failed with %pe\n", ERR_PTR(err));
+	return err;
+}
+
 static u64 max_mem_transfer_per_pass(struct xe_device *xe)
 {
 	if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 1522afb37dcfa..92f40bc671d40 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -112,6 +112,7 @@ struct xe_migrate_pt_update {
 
 struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
 int xe_migrate_init(struct xe_migrate *m);
+int xe_migrate_selftest(struct xe_migrate *m);
 
 struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     unsigned long npages,
-- 
2.51.0

