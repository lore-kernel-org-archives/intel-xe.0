Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 20 Jan 2023 15:44:21 -0500
Message-ID: <20230120204426.68104-16-rodrigo.vivi@intel.com>
In-Reply-To: <20230120204426.68104-1-rodrigo.vivi@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 15/20] drm/xe: fix XE_DISPLAY dependency on ACPI
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Trying to run KUnit without passing arch currently fails with:

$ ./tools/testing/kunit/kunit.py run  --kunitconfig drivers/gpu/drm/xe/.kunitconfig
[10:42:07] Configuring KUnit Kernel ...
[10:42:07] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=8
ERROR:root:../drivers/gpu/drm/xe/display/intel_acpi.c: In function ‘intel_dsm_platform_mux_info’:
../drivers/gpu/drm/xe/display/intel_acpi.c:86:15: error: implicit declaration of function ‘acpi_evaluate_dsm_typed’; did you mean ‘acpi_evaluate_dsm’? [-Werror=implicit-function-declaration]
   86 |         pkg = acpi_evaluate_dsm_typed(dhandle, &intel_dsm_guid,
      |               ^~~~~~~~~~~~~~~~~~~~~~~
      |               acpi_evaluate_dsm
../drivers/gpu/drm/xe/display/intel_acpi.c:86:13: warning: assignment to ‘union acpi_object *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
   86 |         pkg = acpi_evaluate_dsm_typed(dhandle, &intel_dsm_guid,
      |             ^
../drivers/gpu/drm/xe/display/intel_acpi.c: In function ‘intel_dsm_pci_probe’:
../drivers/gpu/drm/xe/display/intel_acpi.c:142:14: error: implicit declaration of function ‘acpi_check_dsm’; did you mean ‘acpi_check_region’? [-Werror=implicit-function-declaration]
  142 |         if (!acpi_check_dsm(dhandle, &intel_dsm_guid, INTEL_DSM_REVISION_ID,
      |              ^~~~~~~~~~~~~~
      |              acpi_check_region
../drivers/gpu/drm/xe/display/intel_acpi.c: At top level:
../drivers/gpu/drm/xe/display/intel_acpi.c:176:6: error: redefinition of ‘intel_register_dsm_handler’
  176 | void intel_register_dsm_handler(void)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/display/intel_acpi.c:13:
../drivers/gpu/drm/xe/display/intel_acpi.h:19:20: note: previous definition of ‘intel_register_dsm_handler’ with type ‘void(void)’
   19 | static inline void intel_register_dsm_handler(void) { return; }
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.c:182:6: error: redefinition of ‘intel_unregister_dsm_handler’
  182 | void intel_unregister_dsm_handler(void)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.h:20:20: note: previous definition of ‘intel_unregister_dsm_handler’ with type ‘void(void)’
   20 | static inline void intel_unregister_dsm_handler(void) { return; }
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.c:186:6: error: redefinition of ‘intel_dsm_get_bios_data_funcs_supported’
  186 | void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.h:22:6: note: previous definition of ‘intel_dsm_get_bios_data_funcs_supported’ with type ‘void(struct xe_device *)’
   22 | void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915) { return; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.c: In function ‘intel_dsm_get_bios_data_funcs_supported’:
../drivers/gpu/drm/xe/display/intel_acpi.c:199:31: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
  199 |                 ACPI_FREE(obj);
      |                               ^
../drivers/gpu/drm/xe/display/intel_acpi.c:188:25: warning: unused variable ‘pdev’ [-Wunused-variable]
  188 |         struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
      |                         ^~~~
../drivers/gpu/drm/xe/display/intel_acpi.c: At top level:
../drivers/gpu/drm/xe/display/intel_acpi.c:266:6: error: redefinition of ‘intel_acpi_device_id_update’
  266 | void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.h:24:6: note: previous definition of ‘intel_acpi_device_id_update’ with type ‘void(struct xe_device *)’
   24 | void intel_acpi_device_id_update(struct drm_i915_private *i915) { return; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.c:291:6: error: redefinition of ‘intel_acpi_assign_connector_fwnodes’
  291 | void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.h:26:6: note: previous definition of ‘intel_acpi_assign_connector_fwnodes’ with type ‘void(struct xe_device *)’
   26 | void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915) { return; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.c: In function ‘intel_acpi_assign_connector_fwnodes’:
../drivers/gpu/drm/xe/display/intel_acpi.c:314:32: error: implicit declaration of function ‘acpi_find_child_device’; did you mean ‘acpi_match_device’? [-Werror=implicit-function-declaration]
  314 |                         adev = acpi_find_child_device(ACPI_COMPANION(drm_dev->dev),
      |                                ^~~~~~~~~~~~~~~~~~~~~~
      |                                acpi_match_device
../drivers/gpu/drm/xe/display/intel_acpi.c:314:30: warning: assignment to ‘struct acpi_device *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
  314 |                         adev = acpi_find_child_device(ACPI_COMPANION(drm_dev->dev),
      |                              ^
../drivers/gpu/drm/xe/display/intel_acpi.c: At top level:
../drivers/gpu/drm/xe/display/intel_acpi.c:336:6: error: redefinition of ‘intel_acpi_video_register’
  336 | void intel_acpi_video_register(struct drm_i915_private *i915)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_acpi.h:28:6: note: previous definition of ‘intel_acpi_video_register’ with type ‘void(struct xe_device *)’
   28 | void intel_acpi_video_register(struct drm_i915_private *i915) { return; }
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~

The reason is that XE_DISPLAY depends on ACPI. This issue may
also manifest on other randconfig, so fix the dependencies.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Philippe Lecluse <philippe.lecluse@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 6726caa63acc..6f7123e90563 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -99,6 +99,7 @@ config DRM_XE_USERPTR_INVAL_INJECT
 config DRM_XE_DISPLAY
 	bool "Enable display support"
 	depends on DRM_XE && EXPERT
+	depends on ACPI
 	default y
 	help
 	  Disable this option only if you want to compile out display support.
-- 
2.39.0


