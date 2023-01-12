Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:10 -0500
Message-ID: <20230112222538.2000142-10-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 09/37] drm/xe: Let's avoid i915_utils in the
 xe_force_wake.
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

We can run the bit operation locally without yet another macro.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 6c137d208a4a..9e2abddefb8a 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -10,11 +10,6 @@
 #include "xe_mmio.h"
 #include "../i915/gt/intel_gt_regs.h"
 
-/*
- * FIXME: This header has been deemed evil and we need to kill it. Temporarily
- * including so we can use '__mask_next_bit'.
- */
-#include "i915_utils.h"
 
 #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
 
@@ -145,9 +140,9 @@ static int domain_sleep_wait(struct xe_gt *gt,
 }
 
 #define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
-	for (tmp__ = (mask__); tmp__ ;) \
+	for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
 		for_each_if((domain__ = ((fw__)->domains + \
-					 __mask_next_bit(tmp__))) && \
+					 (ffs(tmp__) - 1))) && \
 					 domain__->reg_ctl)
 
 int xe_force_wake_get(struct xe_force_wake *fw,
-- 
2.38.1


