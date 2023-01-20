Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 20 Jan 2023 15:44:15 -0500
Message-ID: <20230120204426.68104-10-rodrigo.vivi@intel.com>
In-Reply-To: <20230120204426.68104-1-rodrigo.vivi@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 09/20] drm/xe/gt: Fix min() with u32 and u64
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

Fix the following error while building for 32b:

	In file included from ../drivers/gpu/drm/xe/xe_gt.c:6:
	../drivers/gpu/drm/xe/xe_gt.c: In function ‘gt_ttm_mgr_init’:
	../include/linux/minmax.h:20:35: error: comparison of distinct pointer types lacks a cast [-Werror]
	   20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
	      |                                   ^~

Cast it to u64 so size of the second operand matches the first one when
building it for 32 bits.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index cb837745d893..bf5364046bab 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -183,7 +183,7 @@ static int gt_ttm_mgr_init(struct xe_gt *gt)
 		if (err)
 			return err;
 		gtt_size = min(max((XE_DEFAULT_GTT_SIZE_MB << 20),
-				   gt->mem.vram.size),
+				   (u64)gt->mem.vram.size),
 			       gtt_size);
 		xe->info.mem_region_mask |= BIT(gt->info.vram_id) << 1;
 	}
-- 
2.39.0


