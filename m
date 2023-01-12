Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:06 -0500
Message-ID: <20230112222538.2000142-6-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 05/37] drm/xe: Convert guc_ready to regular
 xe_mmio_wait32
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

Possible now that the wait function returns the last read value.

So we can remove the users of i915's wait_for one by one...

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d7fdb0acc8ab..966cac79625f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -403,24 +403,6 @@ static int guc_xfer_rsa(struct xe_guc *guc)
 	return 0;
 }
 
-/*
- * Read the GuC status register (GUC_STATUS) and store it in the
- * specified location; then return a boolean indicating whether
- * the value matches either of two values representing completion
- * of the GuC boot process.
- *
- * This is used for polling the GuC status in a wait_for()
- * loop below.
- */
-static bool guc_ready(struct xe_guc *guc, u32 *status)
-{
-	u32 val = xe_mmio_read32(guc_to_gt(guc), GUC_STATUS.reg);
-	u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, val);
-
-	*status = val;
-	return uk_val == XE_GUC_LOAD_STATUS_READY;
-}
-
 static int guc_wait_ucode(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
@@ -444,7 +426,11 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	 * 200ms. Even at slowest clock, this should be sufficient. And
 	 * in the working case, a larger timeout makes no difference.
 	 */
-	ret = wait_for(guc_ready(guc, &status), 200);
+	ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS.reg,
+			     FIELD_PREP(GS_UKERNEL_MASK,
+					XE_GUC_LOAD_STATUS_READY),
+			     GS_UKERNEL_MASK, 200, &status);
+
 	if (ret) {
 		struct drm_device *drm = &xe->drm;
 		struct drm_printer p = drm_info_printer(drm->dev);
-- 
2.38.1


