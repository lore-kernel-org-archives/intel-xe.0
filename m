Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:29 -0500
Message-ID: <20230112222538.2000142-29-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 28/37] drm/xe: Don't use engine_mask until after
 hwconfig parse
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
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com, maarten.lankhorst@linux.intel.com, philippe.lecluse@intel.com, mchehab@kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

From: Matthew Brost <matthew.brost@intel.com>

The IRQ and MCR init used engine_mask before hwconfig parse (currently
faked), move these steps after the hwconfig parse.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c  |  7 +++++++
 drivers/gpu/drm/xe/xe_irq.c | 34 +++++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_irq.h |  2 ++
 3 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6cea15725cae..75150077d62c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -21,6 +21,7 @@
 #include "xe_gt_sysfs.h"
 #include "xe_gt_topology.h"
 #include "xe_hw_fence.h"
+#include "xe_irq.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_migrate.h"
@@ -449,6 +450,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	/* Enables per hw engine IRQs */
+	xe_gt_irq_postinstall(gt);
+
+	/* Rerun MCR init as we now have hw engine list */
+	xe_gt_mcr_init(gt);
+
 	err = xe_hw_engines_init_early(gt);
 	if (err)
 		goto err_force_wake;
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index edebe1817400..92fe6b38d735 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -492,26 +492,32 @@ void xe_irq_reset(struct xe_device *xe)
 #endif
 }
 
-void xe_irq_postinstall(struct xe_device *xe)
+void xe_gt_irq_postinstall(struct xe_gt *gt)
 {
-	struct xe_gt *gt;
-	u8 id;
+	struct xe_device *xe = gt_to_xe(gt);
 
-	for_each_gt(gt, xe, id) {
-		if (GRAPHICS_VERx100(xe) >= 1210) {
-			dg1_irq_postinstall(xe, gt);
-		} else if (GRAPHICS_VER(xe) >= 11) {
-			gen11_irq_postinstall(xe, gt);
-		} else {
-			drm_err(&xe->drm, "No interrupt postinstall hook");
-		}
-	}
+	if (GRAPHICS_VERx100(xe) >= 1210)
+		dg1_irq_postinstall(xe, gt);
+	else if (GRAPHICS_VER(xe) >= 11)
+		gen11_irq_postinstall(xe, gt);
+	else
+		drm_err(&xe->drm, "No interrupt postinstall hook");
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	gen11_display_irq_postinstall(xe);
+	if (gt->info.id == XE_GT0)
+		gen11_display_irq_postinstall(gt_to_xe(gt));
 #endif
 }
 
+static void xe_irq_postinstall(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	u8 id;
+
+	for_each_gt(gt, xe, id)
+		xe_gt_irq_postinstall(gt);
+}
+
 static irq_handler_t xe_irq_handler(struct xe_device *xe)
 {
 	if (GRAPHICS_VERx100(xe) >= 1210) {
@@ -566,8 +572,6 @@ int xe_irq_install(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe_irq_postinstall(xe);
-
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index 7aee8d259353..34ecf22b32d3 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -7,8 +7,10 @@
 #define _XE_IRQ_H_
 
 struct xe_device;
+struct xe_gt;
 
 int xe_irq_install(struct xe_device *xe);
+void xe_gt_irq_postinstall(struct xe_gt *gt);
 void xe_irq_shutdown(struct xe_device *xe);
 void xe_irq_suspend(struct xe_device *xe);
 void xe_irq_resume(struct xe_device *xe);
-- 
2.38.1


