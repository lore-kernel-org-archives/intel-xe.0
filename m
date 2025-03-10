Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDE2C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 20:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5844310E4DD;
	Mon, 10 Mar 2025 20:07:23 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDEE10E4DD
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 20:07:21 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH 1/8] drm/xe: Defer memirq init until needed
Date: Mon, 10 Mar 2025 21:06:46 +0100
Message-ID: <20250310200653.89731-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250310200653.89731-1-dev@lankhorst.se>
References: <20250310200653.89731-1-dev@lankhorst.se>
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

memirqs require allocations into GGTT, which we cannot use until
after display is enabled.

Now that the initialisation of interrupts is postponed, move memirq
init too.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Ilia Levi <ilia.levi@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ----
 drivers/gpu/drm/xe/xe_tile.c   | 7 +++++++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 539da525aa14b..38b8e3e961a2f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -41,7 +41,6 @@
 #include "xe_hw_engine_group.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
-#include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_oa.h"
@@ -795,9 +794,6 @@ int xe_device_probe(struct xe_device *xe)
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
 			return err;
-		err = xe_memirq_init(&tile->memirq);
-		if (err)
-			return err;
 	}
 
 	for_each_gt(gt, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index d29658ff4dd41..be760c7fbfa28 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -10,6 +10,7 @@
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_memirq.h"
 #include "xe_migrate.h"
 #include "xe_pcode.h"
 #include "xe_sa.h"
@@ -173,6 +174,12 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 
 int xe_tile_init(struct xe_tile *tile)
 {
+	int err;
+
+	err = xe_memirq_init(&tile->memirq);
+	if (err)
+		return err;
+
 	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
 	if (IS_ERR(tile->mem.kernel_bb_pool))
 		return PTR_ERR(tile->mem.kernel_bb_pool);
-- 
2.45.2

