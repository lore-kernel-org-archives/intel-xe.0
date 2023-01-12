Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:22 -0500
Message-ID: <20230112222538.2000142-22-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 21/37] drm/i915: Remove i915_drm_suspend_mode
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

enum i915_drm_suspend_mode suspend_mode is only used in
intel_display_power, while we only care about whether we perform a
s2idle. Remove it and use a simple bool.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/i915/display/intel_display_power.c   |  8 +++-----
 .../gpu/drm/i915/display/intel_display_power.h   |  3 +--
 drivers/gpu/drm/i915/i915_driver.c               | 16 ++--------------
 drivers/gpu/drm/i915/intel_runtime_pm.h          |  6 ------
 4 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index c3a57ec0d2f3..00e32a423708 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -2039,7 +2039,7 @@ void intel_power_domains_disable(struct drm_i915_private *i915)
 /**
  * intel_power_domains_suspend - suspend power domain state
  * @i915: i915 device instance
- * @suspend_mode: specifies the target suspend state (idle, mem, hibernation)
+ * @s2idle: specifies whether we go to idle, or deeper sleep
  *
  * This function prepares the hardware power domain state before entering
  * system suspend.
@@ -2047,8 +2047,7 @@ void intel_power_domains_disable(struct drm_i915_private *i915)
  * It must be called with power domains already disabled (after a call to
  * intel_power_domains_disable()) and paired with intel_power_domains_resume().
  */
-void intel_power_domains_suspend(struct drm_i915_private *i915,
-				 enum i915_drm_suspend_mode suspend_mode)
+void intel_power_domains_suspend(struct drm_i915_private *i915, bool s2idle)
 {
 	struct i915_power_domains *power_domains = &i915->display.power.domains;
 	intel_wakeref_t wakeref __maybe_unused =
@@ -2064,8 +2063,7 @@ void intel_power_domains_suspend(struct drm_i915_private *i915,
 	 * that would be blocked if the firmware was inactive.
 	 */
 	if (!(i915->display.dmc.allowed_dc_mask & DC_STATE_EN_DC9) &&
-	    suspend_mode == I915_DRM_SUSPEND_IDLE &&
-	    intel_dmc_has_payload(i915)) {
+	    s2idle && intel_dmc_has_payload(i915)) {
 		intel_display_power_flush_work(i915);
 		intel_power_domains_verify_state(i915);
 		return;
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index 3aae045749f7..d8d9309c1f19 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -172,8 +172,7 @@ void intel_power_domains_init_hw(struct drm_i915_private *dev_priv, bool resume)
 void intel_power_domains_driver_remove(struct drm_i915_private *dev_priv);
 void intel_power_domains_enable(struct drm_i915_private *dev_priv);
 void intel_power_domains_disable(struct drm_i915_private *dev_priv);
-void intel_power_domains_suspend(struct drm_i915_private *dev_priv,
-				 enum i915_drm_suspend_mode);
+void intel_power_domains_suspend(struct drm_i915_private *dev_priv, bool s2idle);
 void intel_power_domains_resume(struct drm_i915_private *dev_priv);
 void intel_power_domains_sanitize_state(struct drm_i915_private *dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index f4201f9c5f84..c72f37f8c593 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1235,18 +1235,6 @@ static int i915_drm_suspend(struct drm_device *dev)
 	return 0;
 }
 
-static enum i915_drm_suspend_mode
-get_suspend_mode(struct drm_i915_private *dev_priv, bool hibernate)
-{
-	if (hibernate)
-		return I915_DRM_SUSPEND_HIBERNATE;
-
-	if (suspend_to_idle(dev_priv))
-		return I915_DRM_SUSPEND_IDLE;
-
-	return I915_DRM_SUSPEND_MEM;
-}
-
 static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
@@ -1254,6 +1242,7 @@ static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
 	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
 	struct intel_gt *gt;
 	int ret, i;
+	bool s2idle = !hibernation && suspend_to_idle(dev_priv);
 
 	disable_rpm_wakeref_asserts(rpm);
 
@@ -1264,8 +1253,7 @@ static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
 	for_each_gt(gt, dev_priv, i)
 		intel_uncore_suspend(gt->uncore);
 
-	intel_power_domains_suspend(dev_priv,
-				    get_suspend_mode(dev_priv, hibernation));
+	intel_power_domains_suspend(dev_priv, s2idle);
 
 	intel_display_power_suspend_late(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.h b/drivers/gpu/drm/i915/intel_runtime_pm.h
index e592e8d6499a..764b183ae452 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.h
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.h
@@ -16,12 +16,6 @@ struct device;
 struct drm_i915_private;
 struct drm_printer;
 
-enum i915_drm_suspend_mode {
-	I915_DRM_SUSPEND_IDLE,
-	I915_DRM_SUSPEND_MEM,
-	I915_DRM_SUSPEND_HIBERNATE,
-};
-
 /*
  * This struct helps tracking the state needed for runtime PM, which puts the
  * device in PCI D3 state. Notice that when this happens, nothing on the
-- 
2.38.1


