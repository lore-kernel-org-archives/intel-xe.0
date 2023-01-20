Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 20 Jan 2023 15:44:26 -0500
Message-ID: <20230120204426.68104-21-rodrigo.vivi@intel.com>
In-Reply-To: <20230120204426.68104-1-rodrigo.vivi@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 20/20] drm/xe/guc_pc: Fix Meteor Lake registers.
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
To: intel-xe@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, philippe.lecluse@intel.com, mchehab@kernel.org
Cc: Francois Dugast <francois.dugast@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>

When adding the frequency management, Meteor Lake platform
was left behind. Handling it properly now.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 70 ++++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 506b9cb3f14c..bf3dff9e0c2b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -37,6 +37,9 @@
 #define GEN12_RPSTAT1		_MMIO(0x1381b4)
 #define   GEN12_CAGF_MASK	REG_GENMASK(19, 11)
 
+#define MTL_MIRROR_TARGET_WP1	_MMIO(0xc60)
+#define   MTL_CAGF_MASK		REG_GENMASK(8, 0)
+
 #define GT_FREQUENCY_MULTIPLIER	50
 #define GEN9_FREQ_SCALER	3
 
@@ -311,7 +314,20 @@ static int pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 				   freq);
 }
 
-static void pc_update_rp_values(struct xe_guc_pc *pc)
+static void mtl_update_rpe_value(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	u32 reg;
+
+	if (xe_gt_is_media_type(gt))
+		reg = xe_mmio_read32(gt, MTL_MPE_FREQUENCY.reg);
+	else
+		reg = xe_mmio_read32(gt, MTL_GT_RPE_FREQUENCY.reg);
+
+	pc->rpe_freq = REG_FIELD_GET(MTL_RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+}
+
+static void tgl_update_rpe_value(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
@@ -328,6 +344,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 		reg = xe_mmio_read32(gt, GEN10_FREQ_INFO_REC.reg);
 
 	pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+}
+
+static void pc_update_rp_values(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe->info.platform == XE_METEORLAKE)
+		mtl_update_rpe_value(pc);
+	else
+		tgl_update_rpe_value(pc);
 
 	/*
 	 * RPe is decided at runtime by PCODE. In the rare case where that's
@@ -342,6 +369,7 @@ static ssize_t freq_act_show(struct device *dev,
 {
 	struct kobject *kobj = &dev->kobj;
 	struct xe_gt *gt = kobj_to_gt(kobj);
+	struct xe_device *xe = gt_to_xe(gt);
 	u32 freq;
 	ssize_t ret;
 
@@ -354,10 +382,17 @@ static ssize_t freq_act_show(struct device *dev,
 		return ret;
 
 	xe_device_mem_access_get(gt_to_xe(gt));
-	freq = xe_mmio_read32(gt, GEN12_RPSTAT1.reg);
+
+	if (xe->info.platform == XE_METEORLAKE) {
+		freq = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1.reg);
+		freq = REG_FIELD_GET(MTL_CAGF_MASK, freq);
+	} else {
+		freq = xe_mmio_read32(gt, GEN12_RPSTAT1.reg);
+		freq = REG_FIELD_GET(GEN12_CAGF_MASK, freq);
+	}
+
 	xe_device_mem_access_put(gt_to_xe(gt));
 
-	freq = REG_FIELD_GET(GEN12_CAGF_MASK, freq);
 	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
@@ -606,7 +641,24 @@ static const struct attribute *pc_attrs[] = {
 	NULL
 };
 
-static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
+static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	u32 reg;
+
+	xe_device_assert_mem_access(pc_to_xe(pc));
+
+	if (xe_gt_is_media_type(gt))
+		reg = xe_mmio_read32(gt, MTL_MEDIAP_STATE_CAP.reg);
+	else
+		reg = xe_mmio_read32(gt, MTL_RP_STATE_CAP.reg);
+	pc->rp0_freq = REG_FIELD_GET(MTL_RP0_CAP_MASK, reg) *
+		GT_FREQUENCY_MULTIPLIER;
+	pc->rpn_freq = REG_FIELD_GET(MTL_RPN_CAP_MASK, reg) *
+		GT_FREQUENCY_MULTIPLIER;
+}
+
+static void tgl_init_fused_rp_values(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
@@ -622,6 +674,16 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
 	pc->rpn_freq = REG_FIELD_GET(RPN_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
 }
 
+static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe->info.platform == XE_METEORLAKE)
+		mtl_init_fused_rp_values(pc);
+	else
+		tgl_init_fused_rp_values(pc);
+}
 static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 {
 	int ret;
-- 
2.39.0


