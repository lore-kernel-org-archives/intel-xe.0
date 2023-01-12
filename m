Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:15 -0500
Message-ID: <20230112222538.2000142-15-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 14/37] drm/xe: Add intel_pps support too
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

I misguidedly believed that this was i915 only due to support on old
platforms, but if I look at intel_num_pps() the code is valid
on all gen12+ platforms too.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_pps.c    | 14 ++++++-
 drivers/gpu/drm/xe/Makefile                 |  2 +-
 drivers/gpu/drm/xe/display/intel_pps.c      |  1 +
 drivers/gpu/drm/xe/display/intel_pps_stub.c | 43 ---------------------
 4 files changed, 14 insertions(+), 46 deletions(-)
 create mode 120000 drivers/gpu/drm/xe/display/intel_pps.c
 delete mode 100644 drivers/gpu/drm/xe/display/intel_pps_stub.c

diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index 7b21438edd9b..9f3675456913 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -3,7 +3,6 @@
  * Copyright © 2020 Intel Corporation
  */
 
-#include "g4x_dp.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_de.h"
@@ -16,6 +15,11 @@
 #include "intel_pps.h"
 #include "intel_quirks.h"
 
+#ifdef I915
+#include "g4x_dp.h"
+#include "intel_dpio_phy.h"
+#endif
+
 static void vlv_steal_power_sequencer(struct drm_i915_private *dev_priv,
 				      enum pipe pipe);
 
@@ -81,6 +85,7 @@ intel_wakeref_t intel_pps_unlock(struct intel_dp *intel_dp,
 	return 0;
 }
 
+#ifdef I915
 static void
 vlv_power_sequencer_kick(struct intel_dp *intel_dp)
 {
@@ -265,6 +270,7 @@ bxt_power_sequencer_idx(struct intel_dp *intel_dp)
 
 	return pps_idx;
 }
+#endif
 
 typedef bool (*pps_check)(struct drm_i915_private *dev_priv, int pps_idx);
 
@@ -478,16 +484,18 @@ static void intel_pps_get_registers(struct intel_dp *intel_dp,
 				    struct pps_registers *regs)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
-	int pps_idx;
+	int pps_idx = 0;
 
 	memset(regs, 0, sizeof(*regs));
 
+#ifdef I915
 	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
 		pps_idx = vlv_power_sequencer_pipe(intel_dp);
 	else if (IS_GEMINILAKE(dev_priv) || IS_BROXTON(dev_priv))
 		pps_idx = bxt_power_sequencer_idx(intel_dp);
 	else
 		pps_idx = intel_dp->pps.pps_idx;
+#endif
 
 	regs->pp_ctrl = PP_CONTROL(pps_idx);
 	regs->pp_stat = PP_STATUS(pps_idx);
@@ -1684,6 +1692,7 @@ void assert_pps_unlocked(struct drm_i915_private *dev_priv, enum pipe pipe)
 		return;
 
 	if (HAS_PCH_SPLIT(dev_priv)) {
+#ifdef I915
 		u32 port_sel;
 
 		pp_reg = PP_CONTROL(0);
@@ -1710,6 +1719,7 @@ void assert_pps_unlocked(struct drm_i915_private *dev_priv, enum pipe pipe)
 		/* presumably write lock depends on pipe, not port select */
 		pp_reg = PP_CONTROL(pipe);
 		panel_pipe = pipe;
+#endif
 	} else {
 		u32 port_sel;
 
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 5db7a811efdf..36996fe7d7a4 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -167,7 +167,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/intel_opregion.o \
 	display/intel_panel.o \
 	display/intel_pipe_crc.o \
-	display/intel_pps_stub.o \
+	display/intel_pps.o \
 	display/intel_psr.o \
 	display/intel_qp_tables.o \
 	display/intel_quirks.o \
diff --git a/drivers/gpu/drm/xe/display/intel_pps.c b/drivers/gpu/drm/xe/display/intel_pps.c
new file mode 120000
index 000000000000..ce8eef664f23
--- /dev/null
+++ b/drivers/gpu/drm/xe/display/intel_pps.c
@@ -0,0 +1 @@
+../../i915/display/intel_pps.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_pps_stub.c b/drivers/gpu/drm/xe/display/intel_pps_stub.c
deleted file mode 100644
index 65a8174165f9..000000000000
--- a/drivers/gpu/drm/xe/display/intel_pps_stub.c
+++ /dev/null
@@ -1,43 +0,0 @@
-#include "intel_pps.h"
-#include "intel_display.h"
-
-intel_wakeref_t intel_pps_lock(struct intel_dp *intel_dp)
-{
-        return 0;
-}
-
-intel_wakeref_t intel_pps_unlock(struct intel_dp *intel_dp, intel_wakeref_t wakeref)
-{
-        return wakeref;
-}
-
-void intel_pps_backlight_on(struct intel_dp *intel_dp) {}
-void intel_pps_backlight_off(struct intel_dp *intel_dp) {}
-void intel_pps_backlight_power(struct intel_connector *connector, bool enable) {}
-
-bool intel_pps_vdd_on_unlocked(struct intel_dp *intel_dp) { return false; }
-void intel_pps_vdd_off_unlocked(struct intel_dp *intel_dp, bool sync) {}
-void intel_pps_on_unlocked(struct intel_dp *intel_dp) {}
-void intel_pps_off_unlocked(struct intel_dp *intel_dp) {}
-void intel_pps_check_power_unlocked(struct intel_dp *intel_dp) {}
-
-void intel_pps_vdd_on(struct intel_dp *intel_dp) {}
-void intel_pps_on(struct intel_dp *intel_dp) {}
-void intel_pps_off(struct intel_dp *intel_dp) {}
-void intel_pps_vdd_off_sync(struct intel_dp *intel_dp) {}
-bool intel_pps_have_panel_power_or_vdd(struct intel_dp *intel_dp) { return false; }
-void intel_pps_wait_power_cycle(struct intel_dp *intel_dp) {}
-
-bool intel_pps_init(struct intel_dp *intel_dp) { return false; }
-void intel_pps_init_late(struct intel_dp *intel_dp) {}
-void intel_pps_encoder_reset(struct intel_dp *intel_dp) {}
-void intel_pps_reset_all(struct drm_i915_private *i915) {}
-
-void vlv_pps_init(struct intel_encoder *encoder,
-		  const struct intel_crtc_state *crtc_state) {}
-
-void intel_pps_unlock_regs_wa(struct drm_i915_private *i915) {}
-void intel_pps_setup(struct drm_i915_private *i915) {}
-
-void assert_pps_unlocked(struct drm_i915_private *i915, enum pipe pipe) {}
-
-- 
2.38.1


