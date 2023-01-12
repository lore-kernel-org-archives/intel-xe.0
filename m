Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:14 -0500
Message-ID: <20230112222538.2000142-14-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 13/37] drm/xe: Take memory ref on kernel job
 creation
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

When a job is inflight we may access memory to read the hardware seqno.
All user jobs have VM open which has a ref but kernel jobs do not
require VM so it is possible to not have memory ref. To avoid this, take
a memory ref on kernel job creation.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_sched_job.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 5c4cf3d0d7a4..2985caa6097b 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -8,7 +8,7 @@
 #include <linux/dma-fence-array.h>
 #include <linux/slab.h>
 
-#include "xe_device_types.h"
+#include "xe_device.h"
 #include "xe_engine.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_types.h"
@@ -72,6 +72,11 @@ static void job_free(struct xe_sched_job *job)
 			xe_sched_job_parallel_slab : xe_sched_job_slab, job);
 }
 
+static struct xe_device *job_to_xe(struct xe_sched_job *job)
+{
+	return gt_to_xe(job->engine->gt);
+}
+
 struct xe_sched_job *xe_sched_job_create(struct xe_engine *e,
 					 u64 *batch_addr)
 {
@@ -149,6 +154,11 @@ struct xe_sched_job *xe_sched_job_create(struct xe_engine *e,
 	for (i = 0; i < width; ++i)
 		job->batch_addr[i] = batch_addr[i];
 
+	/* All other jobs require a VM to be open which has a ref */
+	if (unlikely(e->flags & ENGINE_FLAG_KERNEL))
+		xe_device_mem_access_get(job_to_xe(job));
+	xe_device_assert_mem_access(job_to_xe(job));
+
 	trace_xe_sched_job_create(job);
 	return job;
 
@@ -178,6 +188,8 @@ void xe_sched_job_destroy(struct kref *ref)
 	struct xe_sched_job *job =
 		container_of(ref, struct xe_sched_job, refcount);
 
+	if (unlikely(job->engine->flags & ENGINE_FLAG_KERNEL))
+		xe_device_mem_access_put(job_to_xe(job));
 	xe_engine_put(job->engine);
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
-- 
2.38.1


