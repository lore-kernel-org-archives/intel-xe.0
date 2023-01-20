Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 20 Jan 2023 15:44:12 -0500
Message-ID: <20230120204426.68104-7-rodrigo.vivi@intel.com>
In-Reply-To: <20230120204426.68104-1-rodrigo.vivi@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 06/20] drm/xe: Fix some log messages on 32b
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

Either use the proper format or cast up to 64b depending on the case.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 6 +++---
 drivers/gpu/drm/xe/xe_guc_submit.c    | 2 +-
 drivers/gpu/drm/xe/xe_mmio.c          | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 0f3b819f0a34..03a60d5b42f1 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -263,9 +263,9 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		goto free_tiny;
 	}
 
-	kunit_info(test, "Starting tests, top level PT addr: %llx, special pagetable base addr: %llx\n",
-		   xe_bo_main_addr(m->eng->vm->pt_root[id]->bo, GEN8_PAGE_SIZE),
-		   xe_bo_main_addr(m->pt_bo, GEN8_PAGE_SIZE));
+	kunit_info(test, "Starting tests, top level PT addr: %lx, special pagetable base addr: %lx\n",
+		   (unsigned long)xe_bo_main_addr(m->eng->vm->pt_root[id]->bo, GEN8_PAGE_SIZE),
+		   (unsigned long)xe_bo_main_addr(m->pt_bo, GEN8_PAGE_SIZE));
 
 	/* First part of the test, are we updating our pagetable bo with a new entry? */
 	xe_map_wr(xe, &bo->vmap, GEN8_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64, 0xdeaddeadbeefbeef);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8ce3751f4705..e72329598848 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1632,7 +1632,7 @@ static void guc_engine_wq_print(struct xe_engine *e, struct drm_printer *p)
 		for (i = parallel_read(xe, map, wq_desc.head);
 		     i != parallel_read(xe, map, wq_desc.tail);
 		     i = (i + sizeof(u32)) % WQ_SIZE)
-			drm_printf(p, "\tWQ[%ld]: 0x%08x\n", i / sizeof(u32),
+			drm_printf(p, "\tWQ[%zu]: 0x%08x\n", i / sizeof(u32),
 				   parallel_read(xe, map, wq[i / sizeof(u32)]));
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7600ce348005..372ee632898f 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -237,7 +237,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 			 (u64)xe->mem.vram.size >> 20);
 	if (xe->mem.vram.size < lmem_size)
 		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
-			 lmem_size, xe->mem.vram.size);
+			 lmem_size, (u64)xe->mem.vram.size);
 
 #ifdef CONFIG_64BIT
 	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.size);
-- 
2.39.0


