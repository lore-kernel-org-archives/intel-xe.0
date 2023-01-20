Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 20 Jan 2023 15:44:20 -0500
Message-ID: <20230120204426.68104-15-rodrigo.vivi@intel.com>
In-Reply-To: <20230120204426.68104-1-rodrigo.vivi@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 14/20] drm/xe: KUnit tests depend on
 CONFIG_DRM_FBDEV_EMULATION
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

ERROR:root:../drivers/gpu/drm/xe/display/intel_fbdev.c:585:5: error: redefinition of ‘intel_fbdev_init’
  585 | int intel_fbdev_init(struct drm_device *dev)
      |     ^~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/display/intel_fbdev.c:55:
../drivers/gpu/drm/xe/display/intel_fbdev.h:26:19: note: previous definition of ‘intel_fbdev_init’ with type ‘int(struct drm_device *)’
   26 | static inline int intel_fbdev_init(struct drm_device *dev)
      |                   ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_fbdev.c:626:6: error: redefinition of ‘intel_fbdev_initial_config_async’
  626 | void intel_fbdev_initial_config_async(struct drm_device *dev)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_fbdev.h:31:20: note: previous definition of ‘intel_fbdev_initial_config_async’ with type ‘void(struct drm_device *)’
   31 | static inline void intel_fbdev_initial_config_async(struct drm_device *dev)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_fbdev.c:646:6: error: redefinition of ‘intel_fbdev_unregister’
  646 | void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
      |      ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_fbdev.h:35:20: note: previous definition of ‘intel_fbdev_unregister’ with type ‘void(struct xe_device *)’
   35 | static inline void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
      |                    ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_fbdev.c:661:6: error: redefinition of ‘intel_fbdev_fini’
  661 | void intel_fbdev_fini(struct drm_i915_private *dev_priv)
      |      ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_fbdev.h:39:20: note: previous definition of ‘intel_fbdev_fini’ with type ‘void(struct xe_device *)’
   39 | static inline void intel_fbdev_fini(struct drm_i915_private *dev_priv)
      |                    ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_fbdev.c:692:6: error: redefinition of ‘intel_fbdev_set_suspend’
  692 | void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous)
      |      ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_fbdev.h:43:20: note: previous definition of ‘intel_fbdev_set_suspend’ with type ‘void(struct drm_device *, int,  bool)’ {aka ‘void(struct drm_device *, int,  _Bool)’}
   43 | static inline void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_fbdev.c:751:6: error: redefinition of ‘intel_fbdev_output_poll_changed’
  751 | void intel_fbdev_output_poll_changed(struct drm_device *dev)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_fbdev.h:47:20: note: previous definition of ‘intel_fbdev_output_poll_changed’ with type ‘void(struct drm_device *)’
   47 | static inline void intel_fbdev_output_poll_changed(struct drm_device *dev)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_fbdev.c:770:6: error: redefinition of ‘intel_fbdev_restore_mode’
  770 | void intel_fbdev_restore_mode(struct drm_device *dev)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_fbdev.h:51:20: note: previous definition of ‘intel_fbdev_restore_mode’ with type ‘void(struct drm_device *)’
   51 | static inline void intel_fbdev_restore_mode(struct drm_device *dev)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_fbdev.c:785:27: error: redefinition of ‘intel_fbdev_framebuffer’
  785 | struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev)
      |                           ^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_fbdev.h:54:41: note: previous definition of ‘intel_fbdev_framebuffer’ with type ‘struct intel_framebuffer *(struct intel_fbdev *)’
   54 | static inline struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev)
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/.kunitconfig  | 3 +++
 drivers/gpu/drm/xe/Kconfig.debug | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/.kunitconfig b/drivers/gpu/drm/xe/.kunitconfig
index aaf30db71cea..06ed30420a8d 100644
--- a/drivers/gpu/drm/xe/.kunitconfig
+++ b/drivers/gpu/drm/xe/.kunitconfig
@@ -3,6 +3,9 @@ CONFIG_KUNIT=y
 CONFIG_PCI=y
 CONFIG_DEBUG_FS=y
 CONFIG_DRM=y
+CONFIG_DRM_FBDEV_EMULATION=y
+CONFIG_DRM_KMS_HELPER=y
 CONFIG_DRM_XE=y
 CONFIG_EXPERT=y
+CONFIG_FB=y
 CONFIG_DRM_XE_KUNIT_TEST=y
diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index b7fd6fa17bff..6726caa63acc 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -64,6 +64,7 @@ config DRM_XE_SIMPLE_ERROR_CAPTURE
 config DRM_XE_KUNIT_TEST
         tristate "KUnit tests for the drm xe driver" if !KUNIT_ALL_TESTS
 	depends on DRM_XE && KUNIT && DEBUG_FS
+	depends on FB && FB = DRM_KMS_HELPER && DRM_FBDEV_EMULATION
 	default KUNIT_ALL_TESTS
 	select DRM_EXPORT_FOR_TESTS if m
 	help
-- 
2.39.0


