Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 20 Jan 2023 15:44:25 -0500
Message-ID: <20230120204426.68104-20-rodrigo.vivi@intel.com>
In-Reply-To: <20230120204426.68104-1-rodrigo.vivi@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 19/20] drm/xe: Fix Meteor Lake rsa issue on guc
 loading
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

From: Philippe Lecluse <philippe.lecluse@intel.com>

[  117.901473] xe 0000:00:02.0: [drm] GuC load failed: status = 0x400000A0
[  117.901506] xe 0000:00:02.0: [drm] GuC load failed: status: Reset = 0, BootROM = 0x50, UKernel = 0x00, MIA = 0x00, Auth = 0x01

was introduced by this commit:
  drm/xe: Move load of minimal GuC and hwconfig read much earlier

Signed-off-by: Philippe Lecluse <philippe.lecluse@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index bf5364046bab..d3c93c046c48 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -436,6 +436,8 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_hw_fence_irq;
 
+	setup_private_ppat(gt);
+
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt, gt->mem.ggtt);
 		if (err)
@@ -488,8 +490,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_hw_fence_irq;
 
-	setup_private_ppat(gt);
-
 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
 
 	err = xe_gt_clock_init(gt);
-- 
2.39.0


