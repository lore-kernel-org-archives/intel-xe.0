Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 20 Jan 2023 15:44:13 -0500
Message-ID: <20230120204426.68104-8-rodrigo.vivi@intel.com>
In-Reply-To: <20230120204426.68104-1-rodrigo.vivi@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 07/20] drm/xe/mmio: Use non-atomic writeq/readq
 variant for 32b
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

From: Lucas De Marchi <lucas.demarchi@intel.com>

writeq() and readq() and other functions working on 64 bit variables
are not provided by 32b arch. For that it's needed to choose between
linux/io-64-nonatomic-hi-lo.h and linux/io-64-nonatomic-lo-hi.h,
spliting the read/write in 2 accesses. For xe driver, it doesn't matter
much, so just choose one and include in xe_mmio.h.

This also removes some ifdef CONFIG_64BIT we had around because of the
missing 64bit functions.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 7 -------
 drivers/gpu/drm/xe/xe_mmio.h | 1 +
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 372ee632898f..30efe3569b5c 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -51,7 +51,6 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
-#ifdef CONFIG_64BIT
 static int
 _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 {
@@ -135,9 +134,6 @@ static int xe_resize_lmem_bar(struct xe_device *xe, resource_size_t lmem_size)
 	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
 	return ret;
 }
-#else
-static int xe_resize_lmem_bar(struct xe_device *xe, resource_size_t lmem_size) { return 0; }
-#endif
 
 static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
 {
@@ -239,10 +235,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
 			 lmem_size, (u64)xe->mem.vram.size);
 
-#ifdef CONFIG_64BIT
 	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.size);
-#endif
-
 	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
 
 	drm_info(&xe->drm, "TOTAL VRAM: %pa, %pa\n", &xe->mem.vram.io_start, &xe->mem.vram.size);
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 7e7149c8d5ec..1bb7badf5898 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -7,6 +7,7 @@
 #define _XE_MMIO_H_
 
 #include <linux/delay.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 
 #include "xe_gt_types.h"
 
-- 
2.39.0


