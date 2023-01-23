Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Mon, 23 Jan 2023 09:55:51 -0800
Message-Id: <20230123175552.148742-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] xe/uapi: Rename XE_ENGINE_PROPERTY_X to
 XE_ENGINE_SET_PROPERTY_X
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
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Engine property get uAPI will be added, so to avoid ambiguity here
renaming XE_ENGINE_PROPERTY_X to XE_ENGINE_SET_PROPERTY_X.

No changes in behavior.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c | 18 +++++++++---------
 include/uapi/drm/xe_drm.h      | 18 +++++++++---------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 7cd945fcdd979..2db23f0c36cfe 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -314,15 +314,15 @@ typedef int (*xe_engine_set_property_fn)(struct xe_device *xe,
 					 u64 value, bool create);
 
 static const xe_engine_set_property_fn engine_set_property_funcs[] = {
-	[XE_ENGINE_PROPERTY_PRIORITY] = engine_set_priority,
-	[XE_ENGINE_PROPERTY_TIMESLICE] = engine_set_timeslice,
-	[XE_ENGINE_PROPERTY_PREEMPTION_TIMEOUT] = engine_set_preemption_timeout,
-	[XE_ENGINE_PROPERTY_COMPUTE_MODE] = engine_set_compute_mode,
-	[XE_ENGINE_PROPERTY_PERSISTENCE] = engine_set_persistence,
-	[XE_ENGINE_PROPERTY_JOB_TIMEOUT] = engine_set_job_timeout,
-	[XE_ENGINE_PROPERTY_ACC_TRIGGER] = engine_set_acc_trigger,
-	[XE_ENGINE_PROPERTY_ACC_NOTIFY] = engine_set_acc_notify,
-	[XE_ENGINE_PROPERTY_ACC_GRANULARITY] = engine_set_acc_granularity,
+	[XE_ENGINE_SET_PROPERTY_PRIORITY] = engine_set_priority,
+	[XE_ENGINE_SET_PROPERTY_TIMESLICE] = engine_set_timeslice,
+	[XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT] = engine_set_preemption_timeout,
+	[XE_ENGINE_SET_PROPERTY_COMPUTE_MODE] = engine_set_compute_mode,
+	[XE_ENGINE_SET_PROPERTY_PERSISTENCE] = engine_set_persistence,
+	[XE_ENGINE_SET_PROPERTY_JOB_TIMEOUT] = engine_set_job_timeout,
+	[XE_ENGINE_SET_PROPERTY_ACC_TRIGGER] = engine_set_acc_trigger,
+	[XE_ENGINE_SET_PROPERTY_ACC_NOTIFY] = engine_set_acc_notify,
+	[XE_ENGINE_SET_PROPERTY_ACC_GRANULARITY] = engine_set_acc_granularity,
 };
 
 static int engine_user_ext_set_property(struct xe_device *xe,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f564860de622e..f4d9b1f805820 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -511,21 +511,21 @@ struct drm_xe_engine_set_property {
 	__u32 engine_id;
 
 	/** @property: property to set */
-#define XE_ENGINE_PROPERTY_PRIORITY			0
-#define XE_ENGINE_PROPERTY_TIMESLICE			1
-#define XE_ENGINE_PROPERTY_PREEMPTION_TIMEOUT		2
+#define XE_ENGINE_SET_PROPERTY_PRIORITY			0
+#define XE_ENGINE_SET_PROPERTY_TIMESLICE		1
+#define XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
 	/*
 	 * Long running or ULLS engine mode. DMA fences not allowed in this
 	 * mode. Must match the value of DRM_XE_VM_CREATE_COMPUTE_MODE, serves
 	 * as a sanity check the UMD knows what it is doing. Can only be set at
 	 * engine create time.
 	 */
-#define XE_ENGINE_PROPERTY_COMPUTE_MODE			3
-#define XE_ENGINE_PROPERTY_PERSISTENCE			4
-#define XE_ENGINE_PROPERTY_JOB_TIMEOUT			5
-#define XE_ENGINE_PROPERTY_ACC_TRIGGER			6
-#define XE_ENGINE_PROPERTY_ACC_NOTIFY			7
-#define XE_ENGINE_PROPERTY_ACC_GRANULARITY		8
+#define XE_ENGINE_SET_PROPERTY_COMPUTE_MODE		3
+#define XE_ENGINE_SET_PROPERTY_PERSISTENCE		4
+#define XE_ENGINE_SET_PROPERTY_JOB_TIMEOUT		5
+#define XE_ENGINE_SET_PROPERTY_ACC_TRIGGER		6
+#define XE_ENGINE_SET_PROPERTY_ACC_NOTIFY		7
+#define XE_ENGINE_SET_PROPERTY_ACC_GRANULARITY		8
 	__u32 property;
 
 	/** @value: property value */
-- 
2.39.1


