Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:26 -0500
Message-ID: <20230112222538.2000142-26-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 25/37] drm/xe: Introduce force_probe parameter.
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

Following the i915 ones and its rules.

So, with this in place, developers can select which driver should
take control of which device.

This is specially useful on hybrid device where developer might
want to use i915 driving everything including display on your ADL-P
while working with xe
on the DG2:

i915.force_probe=!5690,46a6 xe.force_probe=5690,!46a6

or vice versa:

i915.force_probe=5690,!46a6 xe.force_probe=!5690,46a6

This commit also ensures that all current platforms are marked as
require_force_probe at a top level, since this will likely remain
forever in upstream and only be removed after the official switch
on a later platform.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Kconfig  | 28 +++++++++++++
 drivers/gpu/drm/xe/xe_pci.c | 79 +++++++++++++++++++++++++++++++++++--
 2 files changed, 104 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 3815e25d0eec..22e47918bfcf 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -40,6 +40,34 @@ config DRM_XE
 
 	  If "M" is selected, the module will be called xe.
 
+config DRM_XE_FORCE_PROBE
+	string "Force probe xe for selected Intel hardware IDs"
+	depends on DRM_XE
+	help
+	  This is the default value for the xe.force_probe module
+	  parameter. Using the module parameter overrides this option.
+
+	  Force probe the xe for Intel graphics devices that are
+	  recognized but not properly supported by this kernel version. It is
+	  recommended to upgrade to a kernel version with proper support as soon
+	  as it is available.
+
+	  It can also be used to block the probe of recognized and fully
+	  supported devices.
+
+	  Use "" to disable force probe. If in doubt, use this.
+
+	  Use "<pci-id>[,<pci-id>,...]" to force probe the xe for listed
+	  devices. For example, "4500" or "4500,4571".
+
+	  Use "*" to force probe the driver for all known devices.
+
+	  Use "!" right before the ID to block the probe of the device. For
+	  example, "4500,!4571" forces the probe of 4500 and blocks the probe of
+	  4571.
+
+	  Use "!*" to block the probe of the driver for all known devices.
+
 menu "drm/Xe Debugging"
 depends on DRM_XE
 depends on EXPERT
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 91a6fba95ac7..bcf6fd610881 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -22,6 +22,12 @@
 
 #include "../i915/i915_reg.h"
 
+static char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
+module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
+MODULE_PARM_DESC(force_probe,
+		 "Force probe options for specified devices. "
+		 "See CONFIG_DRM_XE_FORCE_PROBE for details.");
+
 #define DEV_INFO_FOR_EACH_FLAG(func) \
 	func(require_force_probe); \
 	func(is_dgfx); \
@@ -148,6 +154,7 @@ struct xe_device_desc {
 
 /* Keep in gen based order, and chronological order within a gen */
 #define GEN12_FEATURES \
+	.require_force_probe = true, \
 	.graphics_ver = 12, \
 	.media_ver = 12, \
 	.dma_mask_size = 39, \
@@ -196,7 +203,6 @@ static const struct xe_device_desc dg1_desc = {
 	DGFX_FEATURES,
 	.graphics_rel = 10,
 	PLATFORM(XE_DG1),
-	.require_force_probe = true,
 	.platform_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
@@ -204,6 +210,7 @@ static const struct xe_device_desc dg1_desc = {
 };
 
 #define XE_HP_FEATURES \
+	.require_force_probe = true, \
 	.graphics_ver = 12, \
 	.graphics_rel = 50, \
 	.has_flat_ccs = true, \
@@ -288,7 +295,6 @@ static const struct xe_device_desc pvc_desc = {
 	.has_flat_ccs = 0,
 	.media_rel = 60,
 	.platform_engine_mask = PVC_ENGINES,
-	.require_force_probe = true,
 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
 	.dma_mask_size = 52,
 	.max_tiles = 2,
@@ -319,6 +325,7 @@ static const struct xe_device_desc mtl_desc = {
 	 * Real graphics IP version will be obtained from hardware GMD_ID
 	 * register.  Value provided here is just for sanity checking.
 	 */
+	.require_force_probe = true,
 	.graphics_ver = 12,
 	.graphics_rel = 70,
 	.dma_mask_size = 46,
@@ -328,7 +335,6 @@ static const struct xe_device_desc mtl_desc = {
 	PLATFORM(XE_METEORLAKE),
 	.extra_gts = xelpmp_gts,
 	.platform_engine_mask = MTL_MAIN_ENGINES,
-	.require_force_probe = 1,
 	GEN13_DISPLAY,
 	.display.ver = 14,
 	.display.has_cdclk_crawl = 1,
@@ -363,6 +369,55 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
 
 #undef INTEL_VGA_DEVICE
 
+/* is device_id present in comma separated list of ids */
+static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
+{
+	char *s, *p, *tok;
+	bool ret;
+
+	if (!devices || !*devices)
+		return false;
+
+	/* match everything */
+	if (negative && strcmp(devices, "!*") == 0)
+		return true;
+	if (!negative && strcmp(devices, "*") == 0)
+		return true;
+
+	s = kstrdup(devices, GFP_KERNEL);
+	if (!s)
+		return false;
+
+	for (p = s, ret = false; (tok = strsep(&p, ",")) != NULL; ) {
+		u16 val;
+
+		if (negative && tok[0] == '!')
+			tok++;
+		else if ((negative && tok[0] != '!') ||
+			 (!negative && tok[0] == '!'))
+			continue;
+
+		if (kstrtou16(tok, 16, &val) == 0 && val == device_id) {
+			ret = true;
+			break;
+		}
+	}
+
+	kfree(s);
+
+	return ret;
+}
+
+static bool id_forced(u16 device_id)
+{
+	return device_id_in_list(device_id, xe_param_force_probe, false);
+}
+
+static bool id_blocked(u16 device_id)
+{
+	return device_id_in_list(device_id, xe_param_force_probe, true);
+}
+
 static const struct xe_subplatform_desc *
 subplatform_get(const struct xe_device *xe, const struct xe_device_desc *desc)
 {
@@ -398,6 +453,24 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	u8 id;
 	int err;
 
+	if (desc->require_force_probe && !id_forced(pdev->device)) {
+		dev_info(&pdev->dev,
+			 "Your graphics device %04x is not officially supported\n"
+			 "by xe driver in this kernel version. To force Xe probe,\n"
+			 "use xe.force_probe='%04x' and i915.force_probe='!%04x'\n"
+			 "module parameters or CONFIG_DRM_XE_FORCE_PROBE='%04x' and\n"
+			 "CONFIG_DRM_I915_FORCE_PROBE='!%04x' configuration options.\n",
+			 pdev->device, pdev->device, pdev->device,
+			 pdev->device, pdev->device);
+		return -ENODEV;
+	}
+
+	if (id_blocked(pdev->device)) {
+		dev_info(&pdev->dev, "Probe blocked for device [%04x:%04x].\n",
+			 pdev->vendor, pdev->device);
+		return -ENODEV;
+	}
+
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 	/* Detect if we need to wait for other drivers early on */
 	if (intel_modeset_probe_defer(pdev))
-- 
2.38.1


