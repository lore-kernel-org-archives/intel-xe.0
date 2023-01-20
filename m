Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 20 Jan 2023 15:44:22 -0500
Message-ID: <20230120204426.68104-17-rodrigo.vivi@intel.com>
In-Reply-To: <20230120204426.68104-1-rodrigo.vivi@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 16/20] drm/xe: allow building XE_DISPLAY without
 ACPI
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

It is not needed to make XE_DISPLAY dependent on ACPI. All it is
needed is to not include intel_acpi and intel_opregion.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug | 1 -
 drivers/gpu/drm/xe/Makefile      | 8 ++++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 6f7123e90563..6726caa63acc 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -99,7 +99,6 @@ config DRM_XE_USERPTR_INVAL_INJECT
 config DRM_XE_DISPLAY
 	bool "Enable display support"
 	depends on DRM_XE && EXPERT
-	depends on ACPI
 	default y
 	help
 	  Disable this option only if you want to compile out display support.
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 06bed3f12b54..d9a66ad0543d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -112,7 +112,6 @@ CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
 # Display..
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/icl_dsi.o \
-	display/intel_acpi.o \
 	display/intel_atomic.o \
 	display/intel_atomic_plane.o \
 	display/intel_audio.o \
@@ -165,7 +164,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/intel_lvds.o \
 	display/intel_modeset_setup.o \
 	display/intel_modeset_verify.o \
-	display/intel_opregion.o \
 	display/intel_panel.o \
 	display/intel_pipe_crc.o \
 	display/intel_pps.o \
@@ -189,6 +187,12 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/ext/intel_pch.o \
 	display/ext/intel_pm.o
 
+ifeq ($(CONFIG_ACPI),y)
+	xe-$(CONFIG_DRM_XE_DISPLAY) += \
+		display/intel_acpi.o \
+		display/intel_opregion.o
+endif
+
 obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
 
-- 
2.39.0


