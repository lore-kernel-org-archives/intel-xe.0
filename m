Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:09 -0500
Message-ID: <20230112222538.2000142-9-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 08/37] drm/xe: Stop using i915_utils in xe_wopcm.
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

We don't need any macro for a simple check we can do explicitly
and clear.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_wopcm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index e4a8d4a1899e..8fe182afa06c 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -11,8 +11,6 @@
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
-#include "i915_utils.h"
-
 /**
  * DOC: Write Once Protected Content Memory (WOPCM) Layout
  *
@@ -92,7 +90,8 @@ static bool __check_layout(struct xe_device *xe, u32 wopcm_size,
 	u32 size;
 
 	size = wopcm_size - ctx_rsvd;
-	if (unlikely(range_overflows(guc_wopcm_base, guc_wopcm_size, size))) {
+	if (unlikely(guc_wopcm_base >= size ||
+		     guc_wopcm_size > size - guc_wopcm_base)) {
 		drm_err(&xe->drm,
 			"WOPCM: invalid GuC region layout: %uK + %uK > %uK\n",
 			guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K,
-- 
2.38.1


