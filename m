Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 20 Jan 2023 15:44:24 -0500
Message-ID: <20230120204426.68104-19-rodrigo.vivi@intel.com>
In-Reply-To: <20230120204426.68104-1-rodrigo.vivi@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 18/20] drm/xe/gt: Enable interrupt while
 initializing root gt
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

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

At present the interrupts are enabled while initializing the last GT.
But this is incorrect for a Multi-GT platform, as root GT initialization
will fail with interrupt disabled. Interrupts are required for
the GuC submission triggered during initialization.
Enable the interrupt during the root GT initialization.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 92fe6b38d735..18ce129bd6be 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -349,7 +349,7 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 	GEN3_IRQ_INIT(gt, GEN11_GU_MISC_, ~GEN11_GU_MISC_GSE,
 		      GEN11_GU_MISC_GSE);
 
-	if (gt->info.id + 1 == xe->info.tile_count)
+	if (gt->info.id == XE_GT0)
 		dg1_intr_enable(xe, true);
 }
 
-- 
2.39.0


