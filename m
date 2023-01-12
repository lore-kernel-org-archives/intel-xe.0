Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:07 -0500
Message-ID: <20230112222538.2000142-7-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 06/37] drm/xe: Wait for success on guc done.
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

Rather than a constant check on proto and wait not busy,
let's wait for the expected success and then check the
protocol afterwards.

With this, we can now use the regular xe_mmio_wait32
and kill this local need for the wait_for.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 966cac79625f..39a6d8f1cf68 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -22,13 +22,6 @@
 #include "i915_reg_defs.h"
 #include "../i915/gt/intel_gt_regs.h"
 
-#include <linux/delay.h>
-/*
- * FIXME: This header has been deemed evil and we need to kill it. Temporarily
- * including so we can use 'wait_for'.
- */
-#include "i915_utils.h"
-
 /* TODO: move to common file */
 #define GUC_PVC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
 #define PVC_MOCS_UC_INDEX		1
@@ -688,19 +681,17 @@ int xe_guc_send_mmio(struct xe_guc *guc, const u32 *request, u32 len)
 	header = xe_mmio_read32(gt, reply_reg);
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
 	    GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
-#define done ({ header = xe_mmio_read32(gt, reply_reg); \
-		FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) != \
-		GUC_HXG_ORIGIN_GUC || \
-		FIELD_GET(GUC_HXG_MSG_0_TYPE, header) != \
-		GUC_HXG_TYPE_NO_RESPONSE_BUSY; })
 
-		ret = wait_for(done, 1000);
-		if (unlikely(ret))
-			goto timeout;
+		ret = xe_mmio_wait32(gt, reply_reg,
+				     FIELD_PREP(GUC_HXG_MSG_0_TYPE,
+						GUC_HXG_TYPE_RESPONSE_SUCCESS),
+				     GUC_HXG_MSG_0_TYPE, 1000, &header);
+
 		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
-				       GUC_HXG_ORIGIN_GUC))
+			     GUC_HXG_ORIGIN_GUC))
 			goto proto;
-#undef done
+		if (unlikely(ret))
+			goto timeout;
 	}
 
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
-- 
2.38.1


