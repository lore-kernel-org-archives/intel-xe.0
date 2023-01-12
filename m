Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:11 -0500
Message-ID: <20230112222538.2000142-11-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 10/37] drm/xe: Convert xe_mmio_wait32 to us so we
 can stop using wait_for_us.
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

Another clean-up towards killing the usage of i915_utils.h

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 6 ++++--
 drivers/gpu/drm/xe/xe_gt.c         | 3 ++-
 drivers/gpu/drm/xe/xe_gt_mcr.c     | 9 +--------
 drivers/gpu/drm/xe/xe_guc.c        | 9 +++++----
 drivers/gpu/drm/xe/xe_huc.c        | 2 +-
 drivers/gpu/drm/xe/xe_mmio.h       | 4 ++--
 drivers/gpu/drm/xe/xe_uc_fw.c      | 2 +-
 7 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 9e2abddefb8a..9c613a68b8d5 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -124,7 +124,8 @@ static int domain_wake_wait(struct xe_gt *gt,
 			    struct xe_force_wake_domain *domain)
 {
 	return xe_mmio_wait32(gt, domain->reg_ack, domain->val, domain->val,
-			      XE_FORCE_WAKE_ACK_TIMEOUT_MS, NULL);
+			      XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
+			      NULL);
 }
 
 static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
@@ -136,7 +137,8 @@ static int domain_sleep_wait(struct xe_gt *gt,
 			     struct xe_force_wake_domain *domain)
 {
 	return xe_mmio_wait32(gt, domain->reg_ack, 0, domain->val,
-			      XE_FORCE_WAKE_ACK_TIMEOUT_MS, NULL);
+			      XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
+			      NULL);
 }
 
 #define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 71d255e72234..bf173f374e73 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -559,7 +559,8 @@ int do_gt_reset(struct xe_gt *gt)
 	int err;
 
 	xe_mmio_write32(gt, GEN6_GDRST.reg, GEN11_GRDOM_FULL);
-	err = xe_mmio_wait32(gt, GEN6_GDRST.reg, 0, GEN11_GRDOM_FULL, 5, NULL);
+	err = xe_mmio_wait32(gt, GEN6_GDRST.reg, 0, GEN11_GRDOM_FULL, 5000,
+			     NULL);
 	if (err)
 		drm_err(&xe->drm,
 			"GT reset failed to clear GEN11_GRDOM_FULL\n");
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index ce776b260750..51badd3d6e90 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -11,13 +11,6 @@
 
 #include "../i915/gt/intel_gt_regs.h"
 
-#include <linux/delay.h>
-/*
- * FIXME: This header has been deemed evil and we need to kill it. Temporar
- * including so we can use 'wait_for'.
- */
-#include "i915_utils.h"
-
 /**
  * DOC: GT Multicast/Replicated (MCR) Register Support
  *
@@ -383,7 +376,7 @@ static void mcr_lock(struct xe_gt *gt)
 	 * shares the same steering control register.
 	 */
 	if (GRAPHICS_VERx100(xe) >= 1270)
-		ret = wait_for_us(xe_mmio_read32(gt, STEER_SEMAPHORE) == 0x1, 10);
+		ret = xe_mmio_wait32(gt, STEER_SEMAPHORE, 0, 0x1, 10, NULL);
 
 	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 39a6d8f1cf68..de24d289c635 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -324,7 +324,8 @@ int xe_guc_reset(struct xe_guc *guc)
 
 	xe_mmio_write32(gt, GEN6_GDRST.reg, GEN11_GRDOM_GUC);
 
-	ret = xe_mmio_wait32(gt, GEN6_GDRST.reg, 0, GEN11_GRDOM_GUC, 5, &gdrst);
+	ret = xe_mmio_wait32(gt, GEN6_GDRST.reg, 0, GEN11_GRDOM_GUC, 5000,
+			     &gdrst);
 	if (ret) {
 		drm_err(&xe->drm, "GuC reset timed out, GEN6_GDRST=0x%8x\n",
 			gdrst);
@@ -422,7 +423,7 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS.reg,
 			     FIELD_PREP(GS_UKERNEL_MASK,
 					XE_GUC_LOAD_STATUS_READY),
-			     GS_UKERNEL_MASK, 200, &status);
+			     GS_UKERNEL_MASK, 200000, &status);
 
 	if (ret) {
 		struct drm_device *drm = &xe->drm;
@@ -670,7 +671,7 @@ int xe_guc_send_mmio(struct xe_guc *guc, const u32 *request, u32 len)
 	ret = xe_mmio_wait32(gt, reply_reg,
 			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN,
 					GUC_HXG_ORIGIN_GUC),
-			     GUC_HXG_MSG_0_ORIGIN, 50, &reply);
+			     GUC_HXG_MSG_0_ORIGIN, 50000, &reply);
 	if (ret) {
 timeout:
 		drm_err(&xe->drm, "mmio request 0x%08x: no reply 0x%08x\n",
@@ -685,7 +686,7 @@ int xe_guc_send_mmio(struct xe_guc *guc, const u32 *request, u32 len)
 		ret = xe_mmio_wait32(gt, reply_reg,
 				     FIELD_PREP(GUC_HXG_MSG_0_TYPE,
 						GUC_HXG_TYPE_RESPONSE_SUCCESS),
-				     GUC_HXG_MSG_0_TYPE, 1000, &header);
+				     GUC_HXG_MSG_0_TYPE, 1000000, &header);
 
 		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
 			     GUC_HXG_ORIGIN_GUC))
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index c8c93bdf4760..9cb15bb40a38 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -85,7 +85,7 @@ int xe_huc_auth(struct xe_huc *huc)
 
 	ret = xe_mmio_wait32(gt, GEN11_HUC_KERNEL_LOAD_INFO.reg,
 			     HUC_LOAD_SUCCESSFUL,
-			     HUC_LOAD_SUCCESSFUL, 100, NULL);
+			     HUC_LOAD_SUCCESSFUL, 100000, NULL);
 	if (ret) {
 		drm_err(&xe->drm, "HuC: Firmware not verified %d\n", ret);
 		goto fail;
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index faba1694eeba..2edf3a166515 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -74,10 +74,10 @@ static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
 }
 
 static inline int xe_mmio_wait32(struct xe_gt *gt, u32 reg, u32 val,
-				 u32 mask, u32 timeout_ms, u32 *out_val)
+				 u32 mask, u32 timeout_us, u32 *out_val)
 {
 	ktime_t cur = ktime_get_raw();
-	const ktime_t end = ktime_add_ms(cur, timeout_ms);
+	const ktime_t end = ktime_add_us(cur, timeout_us);
 	int ret = -ETIMEDOUT;
 	s64 wait = 10;
 	u32 read;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index edd6a5d2db34..bbb931bc19ce 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -352,7 +352,7 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 			_MASKED_BIT_ENABLE(dma_flags | START_DMA));
 
 	/* Wait for DMA to finish */
-	ret = xe_mmio_wait32(gt, DMA_CTRL.reg, 0, START_DMA, 100, &dma_ctrl);
+	ret = xe_mmio_wait32(gt, DMA_CTRL.reg, 0, START_DMA, 100000, &dma_ctrl);
 	if (ret)
 		drm_err(&xe->drm, "DMA for %s fw failed, DMA_CTRL=%u\n",
 			xe_uc_fw_type_repr(uc_fw->type), dma_ctrl);
-- 
2.38.1


