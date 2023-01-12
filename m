Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:05 -0500
Message-ID: <20230112222538.2000142-5-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 04/37] drm/xe: Let's return last value read on
 xe_mmio_wait32.
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

This is already useful because it avoids some extra reads
where registers might have changed after the timeout decision.

But also, it will be important to end the kill of i915's wait_for.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/display/intel_de.h |  4 ++--
 drivers/gpu/drm/xe/xe_force_wake.c    |  4 ++--
 drivers/gpu/drm/xe/xe_gt.c            |  2 +-
 drivers/gpu/drm/xe/xe_guc.c           | 13 ++++++-------
 drivers/gpu/drm/xe/xe_huc.c           |  2 +-
 drivers/gpu/drm/xe/xe_mmio.h          | 20 +++++++++++++++-----
 drivers/gpu/drm/xe/xe_uc_fw.c         |  7 +++----
 7 files changed, 30 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_de.h b/drivers/gpu/drm/xe/display/intel_de.h
index 974aadada45a..80cc8c9e48b8 100644
--- a/drivers/gpu/drm/xe/display/intel_de.h
+++ b/drivers/gpu/drm/xe/display/intel_de.h
@@ -41,14 +41,14 @@ static inline int
 intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
 			   u32 mask, u32 value, unsigned int timeout)
 {
-	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask, timeout);
+	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask, timeout, NULL);
 }
 
 static inline int
 intel_de_wait_for_register_fw(struct drm_i915_private *i915, i915_reg_t reg,
 			      u32 mask, u32 value, unsigned int timeout)
 {
-	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask, timeout);
+	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask, timeout, NULL);
 }
 
 static inline int
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 04b22eeb8ab5..6c137d208a4a 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -129,7 +129,7 @@ static int domain_wake_wait(struct xe_gt *gt,
 			    struct xe_force_wake_domain *domain)
 {
 	return xe_mmio_wait32(gt, domain->reg_ack, domain->val, domain->val,
-			      XE_FORCE_WAKE_ACK_TIMEOUT_MS);
+			      XE_FORCE_WAKE_ACK_TIMEOUT_MS, NULL);
 }
 
 static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
@@ -141,7 +141,7 @@ static int domain_sleep_wait(struct xe_gt *gt,
 			     struct xe_force_wake_domain *domain)
 {
 	return xe_mmio_wait32(gt, domain->reg_ack, 0, domain->val,
-			      XE_FORCE_WAKE_ACK_TIMEOUT_MS);
+			      XE_FORCE_WAKE_ACK_TIMEOUT_MS, NULL);
 }
 
 #define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 7f2213b7f6c7..71d255e72234 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -559,7 +559,7 @@ int do_gt_reset(struct xe_gt *gt)
 	int err;
 
 	xe_mmio_write32(gt, GEN6_GDRST.reg, GEN11_GRDOM_FULL);
-	err = xe_mmio_wait32(gt, GEN6_GDRST.reg, 0, GEN11_GRDOM_FULL, 5);
+	err = xe_mmio_wait32(gt, GEN6_GDRST.reg, 0, GEN11_GRDOM_FULL, 5, NULL);
 	if (err)
 		drm_err(&xe->drm,
 			"GT reset failed to clear GEN11_GRDOM_FULL\n");
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index f3cb52b99d29..d7fdb0acc8ab 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -324,17 +324,17 @@ int xe_guc_reset(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
-	u32 guc_status;
+	u32 guc_status, gdrst;
 	int ret;
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
 	xe_mmio_write32(gt, GEN6_GDRST.reg, GEN11_GRDOM_GUC);
 
-	ret = xe_mmio_wait32(gt, GEN6_GDRST.reg, 0, GEN11_GRDOM_GUC, 5);
+	ret = xe_mmio_wait32(gt, GEN6_GDRST.reg, 0, GEN11_GRDOM_GUC, 5, &gdrst);
 	if (ret) {
 		drm_err(&xe->drm, "GuC reset timed out, GEN6_GDRST=0x%8x\n",
-			xe_mmio_read32(gt, GEN6_GDRST.reg));
+			gdrst);
 		goto err_out;
 	}
 
@@ -654,7 +654,7 @@ int xe_guc_send_mmio(struct xe_guc *guc, const u32 *request, u32 len)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
-	u32 header;
+	u32 header, reply;
 	u32 reply_reg = xe_gt_is_media_type(gt) ?
 		MEDIA_SOFT_SCRATCH(0).reg : GEN11_SOFT_SCRATCH(0).reg;
 	int ret;
@@ -691,12 +691,11 @@ int xe_guc_send_mmio(struct xe_guc *guc, const u32 *request, u32 len)
 	ret = xe_mmio_wait32(gt, reply_reg,
 			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN,
 					GUC_HXG_ORIGIN_GUC),
-			     GUC_HXG_MSG_0_ORIGIN,
-			     50);
+			     GUC_HXG_MSG_0_ORIGIN, 50, &reply);
 	if (ret) {
 timeout:
 		drm_err(&xe->drm, "mmio request 0x%08x: no reply 0x%08x\n",
-			request[0], xe_mmio_read32(gt, reply_reg));
+			request[0], reply);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 93b22fac6e14..c8c93bdf4760 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -85,7 +85,7 @@ int xe_huc_auth(struct xe_huc *huc)
 
 	ret = xe_mmio_wait32(gt, GEN11_HUC_KERNEL_LOAD_INFO.reg,
 			     HUC_LOAD_SUCCESSFUL,
-			     HUC_LOAD_SUCCESSFUL, 100);
+			     HUC_LOAD_SUCCESSFUL, 100, NULL);
 	if (ret) {
 		drm_err(&xe->drm, "HuC: Firmware not verified %d\n", ret);
 		goto fail;
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index d3bc0989ce2e..faba1694eeba 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -73,21 +73,28 @@ static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
 	return (reg_val & mask) != eval ? -EINVAL : 0;
 }
 
-static inline int xe_mmio_wait32(struct xe_gt *gt,
-				 u32 reg, u32 val,
-				 u32 mask, u32 timeout_ms)
+static inline int xe_mmio_wait32(struct xe_gt *gt, u32 reg, u32 val,
+				 u32 mask, u32 timeout_ms, u32 *out_val)
 {
 	ktime_t cur = ktime_get_raw();
 	const ktime_t end = ktime_add_ms(cur, timeout_ms);
+	int ret = -ETIMEDOUT;
 	s64 wait = 10;
+	u32 read;
 
 	for (;;) {
 		if ((xe_mmio_read32(gt, reg) & mask) == val)
 			return 0;
 
+		read = xe_mmio_read32(gt, reg);
+		if ((read & mask) == val) {
+			ret = 0;
+			break;
+		}
+
 		cur = ktime_get_raw();
 		if (!ktime_before(cur, end))
-			return -ETIMEDOUT;
+			break;
 
 		if (ktime_after(ktime_add_us(cur, wait), end))
 			wait = ktime_us_delta(end, cur);
@@ -96,7 +103,10 @@ static inline int xe_mmio_wait32(struct xe_gt *gt,
 		wait <<= 1;
 	}
 
-	return -ETIMEDOUT;
+	if (out_val)
+		*out_val = read;
+
+	return ret;
 }
 
 int xe_mmio_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 86c47b7f0901..edd6a5d2db34 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -326,7 +326,7 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
 	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
-	u32 src_offset;
+	u32 src_offset, dma_ctrl;
 	int ret;
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
@@ -352,11 +352,10 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 			_MASKED_BIT_ENABLE(dma_flags | START_DMA));
 
 	/* Wait for DMA to finish */
-	ret = xe_mmio_wait32(gt, DMA_CTRL.reg, 0, START_DMA, 100);
+	ret = xe_mmio_wait32(gt, DMA_CTRL.reg, 0, START_DMA, 100, &dma_ctrl);
 	if (ret)
 		drm_err(&xe->drm, "DMA for %s fw failed, DMA_CTRL=%u\n",
-			xe_uc_fw_type_repr(uc_fw->type),
-			xe_mmio_read32(gt, DMA_CTRL.reg));
+			xe_uc_fw_type_repr(uc_fw->type), dma_ctrl);
 
 	/* Disable the bits once DMA is over */
 	xe_mmio_write32(gt, DMA_CTRL.reg, _MASKED_BIT_DISABLE(dma_flags));
-- 
2.38.1


