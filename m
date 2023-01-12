Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:03 -0500
Message-ID: <20230112222538.2000142-3-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 02/37] drm/xe: Implement a local xe_mmio_wait32
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

Then, move the i915_utils.h include to its user.

The overall goal is to kill all the usages of the i915_utils
stuff.

Yes, wait_for also depends on <linux/delay.h>, so they go
together to where it is needed. It will be likely needed
anyway directly for udelay or usleep_range.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c |  6 ++++++
 drivers/gpu/drm/xe/xe_gt_mcr.c     |  7 +++++++
 drivers/gpu/drm/xe/xe_guc.c        |  7 +++++++
 drivers/gpu/drm/xe/xe_guc_pc.c     |  7 +++++++
 drivers/gpu/drm/xe/xe_mmio.h       | 29 ++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pcode.c      |  7 +++++++
 6 files changed, 54 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 5a5b6e3e715d..04b22eeb8ab5 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -10,6 +10,12 @@
 #include "xe_mmio.h"
 #include "../i915/gt/intel_gt_regs.h"
 
+/*
+ * FIXME: This header has been deemed evil and we need to kill it. Temporarily
+ * including so we can use '__mask_next_bit'.
+ */
+#include "i915_utils.h"
+
 #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
 
 static struct xe_gt *
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 63829d8c8b54..ce776b260750 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -11,6 +11,13 @@
 
 #include "../i915/gt/intel_gt_regs.h"
 
+#include <linux/delay.h>
+/*
+ * FIXME: This header has been deemed evil and we need to kill it. Temporar
+ * including so we can use 'wait_for'.
+ */
+#include "i915_utils.h"
+
 /**
  * DOC: GT Multicast/Replicated (MCR) Register Support
  *
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b5557375804f..373c94230fc3 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -22,6 +22,13 @@
 #include "i915_reg_defs.h"
 #include "../i915/gt/intel_gt_regs.h"
 
+#include <linux/delay.h>
+/*
+ * FIXME: This header has been deemed evil and we need to kill it. Temporarily
+ * including so we can use 'wait_for' and range_overflow_t.
+ */
+#include "i915_utils.h"
+
 /* TODO: move to common file */
 #define GUC_PVC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
 #define PVC_MOCS_UC_INDEX		1
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 38b1275ea655..515b7aab03c3 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -16,6 +16,13 @@
 #include "i915_reg_defs.h"
 #include "../i915/i915_reg.h"
 
+#include <linux/delay.h>
+/*
+ * FIXME: This header has been deemed evil and we need to kill it. Temporarily
+ * including so we can use 'wait_for'.
+ */
+#include "i915_utils.h"
+
 #include "../i915/intel_mchbar_regs.h"
 /* For GEN6_RP_STATE_CAP.reg to be merged when the definition moves to Xe */
 #define   RP0_MASK	REG_GENMASK(7, 0)
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index e7cca6d2f81f..d3bc0989ce2e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -10,13 +10,6 @@
 
 #include "xe_gt_types.h"
 
-/*
- * FIXME: This header has been deemed evil and we need to kill it. Temporarily
- * including so we can use 'wait_for' and unblock initial development. A follow
- * should replace 'wait_for' with a sane version and drop including this header.
- */
-#include "i915_utils.h"
-
 struct drm_device;
 struct drm_file;
 struct xe_device;
@@ -84,8 +77,26 @@ static inline int xe_mmio_wait32(struct xe_gt *gt,
 				 u32 reg, u32 val,
 				 u32 mask, u32 timeout_ms)
 {
-	return wait_for((xe_mmio_read32(gt, reg) & mask) == val,
-			timeout_ms);
+	ktime_t cur = ktime_get_raw();
+	const ktime_t end = ktime_add_ms(cur, timeout_ms);
+	s64 wait = 10;
+
+	for (;;) {
+		if ((xe_mmio_read32(gt, reg) & mask) == val)
+			return 0;
+
+		cur = ktime_get_raw();
+		if (!ktime_before(cur, end))
+			return -ETIMEDOUT;
+
+		if (ktime_after(ktime_add_us(cur, wait), end))
+			wait = ktime_us_delta(end, cur);
+
+		usleep_range(wait, wait << 1);
+		wait <<= 1;
+	}
+
+	return -ETIMEDOUT;
 }
 
 int xe_mmio_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 236159c8a6c0..313ccd70d1a9 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -11,6 +11,13 @@
 
 #include <linux/errno.h>
 
+#include <linux/delay.h>
+/*
+ * FIXME: This header has been deemed evil and we need to kill it. Temporarily
+ * including so we can use 'wait_for'.
+ */
+#include "i915_utils.h"
+
 /**
  * DOC: PCODE
  *
-- 
2.38.1


