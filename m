Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:04 -0500
Message-ID: <20230112222538.2000142-4-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 03/37] drm/xe: Stop using i915's
 range_overflows_t macro.
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

Let's do it directly.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 373c94230fc3..f3cb52b99d29 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -25,7 +25,7 @@
 #include <linux/delay.h>
 /*
  * FIXME: This header has been deemed evil and we need to kill it. Temporarily
- * including so we can use 'wait_for' and range_overflow_t.
+ * including so we can use 'wait_for'.
  */
 #include "i915_utils.h"
 
@@ -55,7 +55,8 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
 	u32 addr = xe_bo_ggtt_addr(bo);
 
 	XE_BUG_ON(addr < xe_wopcm_size(guc_to_xe(guc)));
-	XE_BUG_ON(range_overflows_t(u32, addr, bo->size, GUC_GGTT_TOP));
+	XE_BUG_ON(addr >= GUC_GGTT_TOP);
+	XE_BUG_ON(bo->size > GUC_GGTT_TOP - addr);
 
 	return addr;
 }
-- 
2.38.1


