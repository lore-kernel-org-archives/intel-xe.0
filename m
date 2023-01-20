Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 20 Jan 2023 15:44:23 -0500
Message-ID: <20230120204426.68104-18-rodrigo.vivi@intel.com>
In-Reply-To: <20230120204426.68104-1-rodrigo.vivi@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 17/20] drm/xe: fix DRM_FBDEV_EMULATION
 dependencies
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

The intel_fbdev should only be added when framebuffer emulation
is enabled.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index d9a66ad0543d..08fff058e9d0 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -150,7 +150,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/intel_dsi_vbt.o \
 	display/intel_fb.o \
 	display/intel_fbc.o \
-	display/intel_fbdev.o \
 	display/intel_fdi.o \
 	display/intel_fifo_underrun.o \
 	display/intel_frontbuffer.o \
@@ -193,6 +192,10 @@ ifeq ($(CONFIG_ACPI),y)
 		display/intel_opregion.o
 endif
 
+ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
+	xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
+endif
+
 obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
 
-- 
2.39.0


