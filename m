Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:08 -0500
Message-ID: <20230112222538.2000142-8-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 07/37] drm/xe: Remove i915_utils dependency from
 xe_guc_pc.
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

To make it simpler, all of the status checks also waits and
times out.

Also, no ktime precision is needed in this case, and we
can use usleep_range because we are not in atomic paths here.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 515b7aab03c3..506b9cb3f14c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -17,11 +17,6 @@
 #include "../i915/i915_reg.h"
 
 #include <linux/delay.h>
-/*
- * FIXME: This header has been deemed evil and we need to kill it. Temporarily
- * including so we can use 'wait_for'.
- */
-#include "i915_utils.h"
 
 #include "../i915/intel_mchbar_regs.h"
 /* For GEN6_RP_STATE_CAP.reg to be merged when the definition moves to Xe */
@@ -134,10 +129,26 @@ pc_to_maps(struct xe_guc_pc *pc)
 	(FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ID, id) | \
 	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
 
-static bool pc_is_in_state(struct xe_guc_pc *pc, enum slpc_global_state state)
+static int wait_for_pc_state(struct xe_guc_pc *pc,
+			     enum slpc_global_state state)
 {
+	int timeout_us = 5000; /* rought 5ms, but no need for precision */
+	int slept, wait = 10;
+
 	xe_device_assert_mem_access(pc_to_xe(pc));
-	return slpc_shared_data_read(pc, header.global_state) == state;
+
+	for (slept = 0; slept < timeout_us;) {
+		if (slpc_shared_data_read(pc, header.global_state) == state)
+			return 0;
+
+		usleep_range(wait, wait << 1);
+		slept += wait;
+		wait <<= 1;
+		if (slept + wait > timeout_us)
+			wait = timeout_us - slept;
+	}
+
+	return -ETIMEDOUT;
 }
 
 static int pc_action_reset(struct xe_guc_pc *pc)
@@ -188,7 +199,7 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 		0,
 	};
 
-	if (!pc_is_in_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
 		return -EAGAIN;
 
 	/* Blocking here to ensure the results are ready before reading them */
@@ -211,7 +222,7 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 		value,
 	};
 
-	if (!pc_is_in_state(pc, SLPC_GLOBAL_STATE_RUNNING))
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
@@ -746,7 +757,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	if (ret)
 		goto out;
 
-	if (wait_for(pc_is_in_state(pc, SLPC_GLOBAL_STATE_RUNNING), 5)) {
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
 		drm_err(&pc_to_xe(pc)->drm, "GuC PC Start failed\n");
 		ret = -EIO;
 		goto out;
@@ -792,7 +803,7 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 	if (ret)
 		goto out;
 
-	if (wait_for(pc_is_in_state(pc, SLPC_GLOBAL_STATE_NOT_RUNNING), 5)) {
+	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_NOT_RUNNING)) {
 		drm_err(&pc_to_xe(pc)->drm, "GuC PC Shutdown failed\n");
 		ret = -EIO;
 	}
-- 
2.38.1


