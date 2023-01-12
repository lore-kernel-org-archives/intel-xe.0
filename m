Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:30 -0500
Message-ID: <20230112222538.2000142-30-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 29/37] drm/xe: Fake pulling gt->info.engine_mask
 from hwconfig blob
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

From: Matthew Brost <matthew.brost@intel.com>

The blob doesn't fully support this yet, so fake for now to ensure our
driver load order is correct.

Once the blob supports pulling gt->info.engine_mask from the blob, this
patch can be removed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c       | 3 +++
 drivers/gpu/drm/xe/xe_gt_types.h | 6 ++++++
 drivers/gpu/drm/xe/xe_pci.c      | 4 ++--
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 75150077d62c..cb837745d893 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -450,6 +450,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	/* XXX: Fake that we pull the engine mask from hwconfig blob */
+	gt->info.engine_mask = gt->info.__engine_mask;
+
 	/* Enables per hw engine IRQs */
 	xe_gt_irq_postinstall(gt);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index c80a9215098d..2dbc8cedd630 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -93,6 +93,12 @@ struct xe_gt {
 		u32 clock_freq;
 		/** @engine_mask: mask of engines present on GT */
 		u64 engine_mask;
+		/**
+		 * @__engine_mask: mask of engines present on GT read from
+		 * xe_pci.c, used to fake reading the engine_mask from the
+		 * hwconfig blob.
+		 */
+		u64 __engine_mask;
 	} info;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index bcf6fd610881..d654f2351557 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -509,13 +509,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		if (id == 0) {
 			gt->info.type = XE_GT_TYPE_MAIN;
 			gt->info.vram_id = id;
-			gt->info.engine_mask = desc->platform_engine_mask;
+			gt->info.__engine_mask = desc->platform_engine_mask;
 			gt->mmio.adj_limit = 0;
 			gt->mmio.adj_offset = 0;
 		} else {
 			gt->info.type = desc->extra_gts[id - 1].type;
 			gt->info.vram_id = desc->extra_gts[id - 1].vram_id;
-			gt->info.engine_mask =
+			gt->info.__engine_mask =
 				desc->extra_gts[id - 1].engine_mask;
 			gt->mmio.adj_limit =
 				desc->extra_gts[id - 1].mmio_adj_limit;
-- 
2.38.1


