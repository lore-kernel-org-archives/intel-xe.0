Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 20 Jan 2023 15:44:07 -0500
Message-ID: <20230120204426.68104-2-rodrigo.vivi@intel.com>
In-Reply-To: <20230120204426.68104-1-rodrigo.vivi@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 01/20] drm/xe/migrate: Update emit_pte to cope
 with a size level than 4k
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

From: Matthew Brost <matthew.brost@intel.com>

emit_pte assumes the size argument is 4k aligned, this may not be true
for the PTEs emitted for CSS as seen by below call stack:

[   56.734228] xe_migrate_copy:585: size=327680, ccs_start=327680, css_size=1280,4096
[   56.734250] xe_migrate_copy:643: size=262144
[   56.734252] emit_pte:404: ptes=64
[   56.734255] emit_pte:418: chunk=64
[   56.734257] xe_migrate_copy:650: size=1024	@ CCS emit PTE
[   56.734259] emit_pte:404: ptes=1
[   56.734261] emit_pte:418: chunk=1
[   56.734339] xe_migrate_copy:643: size=65536
[   56.734342] emit_pte:404: ptes=16
[   56.734344] emit_pte:418: chunk=16
[   56.734346] xe_migrate_copy:650: size=256	# CCS emit PTE
[   56.734348] emit_pte:404: ptes=1
[   56.734350] emit_pte:418: chunk=1
[   56.734352] xe_res_next:174: size=4096, remaining=0

Update emit_pte to handle sizes less than 4k.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 7b9f3de11b47..e9a08d68d17a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -453,11 +453,8 @@ static void emit_pte(struct xe_migrate *m,
 		while (chunk--) {
 			u64 addr;
 
-			XE_BUG_ON(cur->start & (PAGE_SIZE - 1));
-
+			addr = xe_res_dma(cur) & PAGE_MASK;
 			if (is_vram) {
-				addr = cur->start;
-
 				/* Is this a 64K PTE entry? */
 				if ((m->eng->vm->flags & XE_VM_FLAGS_64K) &&
 				    !(cur_ofs & (16 * 8 - 1))) {
@@ -466,14 +463,12 @@ static void emit_pte(struct xe_migrate *m,
 				}
 
 				addr |= GEN12_PPGTT_PTE_LM;
-			} else {
-				addr = xe_res_dma(cur);
 			}
 			addr |= PPAT_CACHED | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 
-			xe_res_next(cur, PAGE_SIZE);
+			xe_res_next(cur, min(size, (u32)PAGE_SIZE));
 			cur_ofs += 8;
 		}
 	}
@@ -615,13 +610,13 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
 
 	if (!src_is_vram)
-		xe_res_first_sg(xe_bo_get_sg(bo), 0, bo->size, &src_it);
+		xe_res_first_sg(xe_bo_get_sg(bo), 0, size, &src_it);
 	else
-		xe_res_first(src, 0, bo->size, &src_it);
+		xe_res_first(src, 0, size, &src_it);
 	if (!dst_is_vram)
-		xe_res_first_sg(xe_bo_get_sg(bo), 0, bo->size, &dst_it);
+		xe_res_first_sg(xe_bo_get_sg(bo), 0, size, &dst_it);
 	else
-		xe_res_first(dst, 0, bo->size, &dst_it);
+		xe_res_first(dst, 0, size, &dst_it);
 
 	if (copy_system_ccs)
 		xe_res_first_sg(xe_bo_get_sg(bo), xe_bo_ccs_pages_start(bo),
-- 
2.39.0


