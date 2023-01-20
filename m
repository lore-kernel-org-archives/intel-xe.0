Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 20 Jan 2023 15:44:19 -0500
Message-ID: <20230120204426.68104-14-rodrigo.vivi@intel.com>
In-Reply-To: <20230120204426.68104-1-rodrigo.vivi@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 13/20] drm/xe/Kconfig.debug: select DEBUG_FS for
 KUnit runs
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

KUnit reuquires debugfs, as otherwise, it won't build:

$ make ARCH=x86_64 O=.kunit --jobs=8
ERROR:root:../drivers/gpu/drm/xe/display/intel_display_debugfs.c:1612:6: error: redefinition of ‘intel_display_debugfs_register’
 1612 | void intel_display_debugfs_register(struct drm_i915_private *i915)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/display/intel_display_debugfs.c:18:
../drivers/gpu/drm/xe/display/intel_display_debugfs.h:18:20: note: previous definition of ‘intel_display_debugfs_register’ with type ‘void(struct xe_device *)’
   18 | static inline void intel_display_debugfs_register(struct drm_i915_private *i915) {}
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_display_debugfs.c:1935:6: error: redefinition of ‘intel_connector_debugfs_add’
 1935 | void intel_connector_debugfs_add(struct intel_connector *intel_connector)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_display_debugfs.h:19:20: note: previous definition of ‘intel_connector_debugfs_add’ with type ‘void(struct intel_connector *)’
   19 | static inline void intel_connector_debugfs_add(struct intel_connector *connector) {}
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_display_debugfs.c:1993:6: error: redefinition of ‘intel_crtc_debugfs_add’
 1993 | void intel_crtc_debugfs_add(struct drm_crtc *crtc)
      |      ^~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/display/intel_display_debugfs.h:20:20: note: previous definition of ‘intel_crtc_debugfs_add’ with type ‘void(struct drm_crtc *)’
   20 | static inline void intel_crtc_debugfs_add(struct drm_crtc *crtc) {}
      |                    ^~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/.kunitconfig  | 1 +
 drivers/gpu/drm/xe/Kconfig.debug | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/.kunitconfig b/drivers/gpu/drm/xe/.kunitconfig
index ce8a4348669d..aaf30db71cea 100644
--- a/drivers/gpu/drm/xe/.kunitconfig
+++ b/drivers/gpu/drm/xe/.kunitconfig
@@ -1,6 +1,7 @@
 # xe dependencies
 CONFIG_KUNIT=y
 CONFIG_PCI=y
+CONFIG_DEBUG_FS=y
 CONFIG_DRM=y
 CONFIG_DRM_XE=y
 CONFIG_EXPERT=y
diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 0d42f30fbe81..b7fd6fa17bff 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -63,7 +63,7 @@ config DRM_XE_SIMPLE_ERROR_CAPTURE
 
 config DRM_XE_KUNIT_TEST
         tristate "KUnit tests for the drm xe driver" if !KUNIT_ALL_TESTS
-	depends on DRM_XE && KUNIT
+	depends on DRM_XE && KUNIT && DEBUG_FS
 	default KUNIT_ALL_TESTS
 	select DRM_EXPORT_FOR_TESTS if m
 	help
-- 
2.39.0


