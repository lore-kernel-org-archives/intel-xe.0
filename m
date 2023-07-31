Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADA5C001E0
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 13:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD6810E2A2;
	Mon, 31 Jul 2023 13:07:04 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A711C10E2A9
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690808822; x=1722344822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yu3JEaEjm30EYw0LQZeYoo3HKWcpf6Jo9yZZqNCuz0o=;
 b=hZ24aulDaE7hrpiEKXHw5VO4NdiRKmzg2xco3PLiFvVPgHQjQQjklPxr
 g9bXffsybUEEMbdhxKctsEk3nrDra9yA+2RBRwdQMiaouG7xQ6VGUcSnh
 69eX8Ia3fdCbgO3bAX/xrFxO+WsyDHRVuGYKhdnlnoWPsw+eVVBkuebH4
 hOOCWhohcvULzu3fspOq+ySdi1kZ399kJNh2j2+M4/Zp8S5dO0F5RzI8d
 JIvVgsYc0EB861YSwSLajz+A5aG5+spnNLKMvID2y/jocGvS0hNWjCH5X
 yqrLUyiQf+Ff+8Mez1oK6KHMEn01LYPyh8vgd7GBWag2GjlgzSKXumsih g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="399961021"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="399961021"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 06:07:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763379725"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="763379725"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga001.jf.intel.com with ESMTP; 31 Jul 2023 06:06:59 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 31 Jul 2023 18:43:37 +0530
Message-Id: <20230731131337.1100068-7-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731131337.1100068-1-tejas.upadhyay@intel.com>
References: <20230731131337.1100068-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V10 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
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

Add sysfs entries for the min, max, and defaults for each of
engine scheduler controls for every hardware engine class.

Non-elevated user IOCTLs to set these controls must be within
the min-max ranges of the sysfs entries, elevated user can set
these controls to any value. However, introduced compile time
CONFIG min-max values which restricts elevated user to be in
compile time min-max range if at all sysfs min/max are violated.

Sysfs entries examples are,
DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min

DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
.defaults/              job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us

V10:
   - Add kernel doc for non-static func
   - Make helper to get min/max for range validation - Matt
   - Filter min/max per user type
V9 :
   - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
V8 :
   - fix enforce_sched_limit and avoid code duplication - Niranjana
   - Make sure min < max - Niranjana
V7 :
   - Rebase to replace hw engine with eclass interface
   - return EINVAL in place of EPERM
   - Use some APIs to avoid code duplication
V6 :
   - Rebase changes to reflect per engine class props interface - MattB
   - Use #if ENABLED - MattB
   - Remove MAX_SCHED_TIMEOUT check as range validation is enough
V5 :
   - Rebase to resolve conflicts - CI
V4 :
   - Rebase
   - Update commit to reflect tile addition
   - Use XE_HW macro directly as they are already filtered
     for CONFIG checks - Niranjana
   - Add CONFIG for enable/disable min/max limitation
     on elevated user. Default is enable - Matt/Joonas
V3 :
   - Resolve CI hooks warning for kernel-doc
V2 :
   - Restric min/max setting to #define default min/max for
     elevated user - Himal
   - Remove unrelated changes from patch - Niranjana

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/Kconfig                    |   6 +
 drivers/gpu/drm/xe/Kconfig.profile            |  46 ++
 drivers/gpu/drm/xe/xe_engine.c                |  28 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |   8 +
 drivers/gpu/drm/xe/xe_hw_engine.h             |  31 ++
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 402 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   4 +
 7 files changed, 519 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/Kconfig.profile

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index d44794f99338..0a4ea965645b 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -83,3 +83,9 @@ depends on DRM_XE
 depends on EXPERT
 source "drivers/gpu/drm/xe/Kconfig.debug"
 endmenu
+
+menu "drm/xe Profile Guided Optimisation"
+	visible if EXPERT
+	depends on DRM_XE
+	source "drivers/gpu/drm/xe/Kconfig.profile"
+endmenu
diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
new file mode 100644
index 000000000000..e72f15ec4bf6
--- /dev/null
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -0,0 +1,46 @@
+config DRM_XE_JOB_TIMEOUT_MAX
+       int "Default max job timeout (ms)"
+       default 10000 # milliseconds
+       help
+         Configures the default max job timeout after which job will
+         be forcefully taken away from scheduler.
+config DRM_XE_JOB_TIMEOUT_MIN
+       int "Default max job timeout (ms)"
+       default 1 # milliseconds
+       help
+         Configures the default min job timeout after which job will
+         be forcefully taken away from scheduler.
+config DRM_XE_TIMESLICE_MAX
+       int "Default max timeslice duration (us)"
+       default 10000000 # microseconds
+       help
+         Configures the default max timeslice duration between multiple
+         contexts by guc scheduling.
+config DRM_XE_TIMESLICE_MIN
+       int "Default min timeslice duration (us)"
+       default 1 # microseconds
+       help
+         Configures the default min timeslice duration between multiple
+         contexts by guc scheduling.
+config DRM_XE_PREEMPT_TIMEOUT_MAX
+       int "Default max  preempt timeout (us)"
+       default 10000000 # microseconds
+       help
+         Configures the default max preempt timeout after which context
+         will be forcefully taken away and higher priority context will
+         run.
+config DRM_XE_PREEMPT_TIMEOUT_MIN
+       int "Default min  preempt timeout (us)"
+       default 1 # microseconds
+       help
+         Configures the default min preempt timeout after which context
+         will be forcefully taken away and higher priority context will
+         run.
+config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+       bool "Default configuration of limitation on scheduler timeout"
+       default y
+       help
+	 Configures the enablement of limitation on scheduler timeout
+	 to apply to applicable user. For elevated user, all above MIN
+	 and MAX values will apply when this configuration is enable to
+	 apply limitation. By default limitation is applied.
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index f4eb67915bfc..b7af890e0447 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -13,6 +13,7 @@
 
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_hw_engine_class_sysfs.h"
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
@@ -204,8 +205,13 @@ static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
 static int engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
 				u64 value, bool create)
 {
-	if (!capable(CAP_SYS_NICE))
-		return -EPERM;
+	u32 min = 0, max = 0;
+
+	engine_get_prop_minmax(e->hwe->eclass, "timeslice", &min, &max);
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(value, min, max))
+		return -EINVAL;
 
 	return e->ops->set_timeslice(e, value);
 }
@@ -214,8 +220,13 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
 					 struct xe_engine *e, u64 value,
 					 bool create)
 {
-	if (!capable(CAP_SYS_NICE))
-		return -EPERM;
+	u32 min = 0, max = 0;
+
+	engine_get_prop_minmax(e->hwe->eclass, "preempt_timeout", &min, &max);
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(value, min, max))
+		return -EINVAL;
 
 	return e->ops->set_preempt_timeout(e, value);
 }
@@ -279,11 +290,16 @@ static int engine_set_persistence(struct xe_device *xe, struct xe_engine *e,
 static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
 				  u64 value, bool create)
 {
+	u32 min = 0, max = 0;
+
 	if (XE_IOCTL_DBG(xe, !create))
 		return -EINVAL;
 
-	if (!capable(CAP_SYS_NICE))
-		return -EPERM;
+	engine_get_prop_minmax(e->hwe->eclass, "job_timeout", &min, &max);
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(value, min, max))
+		return -EINVAL;
 
 	return e->ops->set_job_timeout(e, value);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b7be7b0acb35..b8fcc6e985cf 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -364,8 +364,16 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 
 	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
 		gt->eclass[hwe->class].sched_props.job_timeout_ms = 5 * 1000;
+		gt->eclass[hwe->class].sched_props.job_timeout_min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
+		gt->eclass[hwe->class].sched_props.job_timeout_max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
 		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
+		gt->eclass[hwe->class].sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
+		gt->eclass[hwe->class].sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
 		gt->eclass[hwe->class].sched_props.preempt_timeout_us = 640 * 1000;
+		gt->eclass[hwe->class].sched_props.preempt_timeout_min =
+								XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
+		gt->eclass[hwe->class].sched_props.preempt_timeout_max =
+								XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
 		/* Record default props */
 		gt->eclass[hwe->class].defaults = gt->eclass[hwe->class].sched_props;
 	}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 7eca9d53c7b1..3d37d6d44261 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -10,6 +10,37 @@
 
 struct drm_printer;
 
+#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
+#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
+#else
+#define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1
+#endif
+#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX
+#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIMEOUT_MAX
+#else
+#define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)
+#endif
+#ifdef CONFIG_DRM_XE_TIMESLICE_MIN
+#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
+#else
+#define XE_HW_ENGINE_TIMESLICE_MIN 1
+#endif
+#ifdef CONFIG_DRM_XE_TIMESLICE_MAX
+#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
+#else
+#define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
+#endif
+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
+#else
+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
+#endif
+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
+#else
+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
+#endif
+
 int xe_hw_engines_init_early(struct xe_gt *gt);
 int xe_hw_engines_init(struct xe_gt *gt);
 void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index 7f84f35c3122..7b66045a92ff 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -12,6 +12,80 @@
 #define MAX_ENGINE_CLASS_NAME_LEN    16
 static int xe_add_hw_engine_class_defaults(struct kobject *parent);
 
+/**
+ * enforce_schedule_limit - Helper to check if schedule timeout min
+ * max limit to be applied.
+ *
+ * This helper helps to validate if schedule timeout limitation to be
+ * applied for the use or not.
+ *
+ * Returns: Returns false value for failure and true for success.
+ */
+bool enforce_schedule_limit(void)
+{
+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
+	return true;
+#else
+	return !capable(CAP_SYS_NICE);
+#endif
+}
+
+/**
+ * engine_timeout_in_range - Helper to check if timeout is in range
+ * @timeout: timeout to validate
+ * @min: min value of valid range
+ * @max: max value of valid range
+ *
+ * This helper helps to validate if schedule timeout is in min-max
+ * range.
+ *
+ * Returns: Returns false value for failure and true for success.
+ */
+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max)
+{
+	return timeout >= min && timeout <= max;
+}
+
+/**
+ * engine_get_prop_minmax - Helper to get min/max of engine scheduler prop
+ * @*eclass: hw engine class interface
+ * @*prop: prop name for which min/max will be fetched
+ * @*min: pointer to min value of valid range
+ * @*max: pointer to max value of valid range
+ *
+ * This helper helps to get min/max values of HW engine scheduler is property.
+ *
+ * Returns: Void.
+ */
+void engine_get_prop_minmax(struct xe_hw_engine_class_intf *eclass, char *prop,
+			    u32 *min, u32 *max)
+{
+	if (strcmp(prop, "timeslice") == 0) {
+		*min = eclass->sched_props.timeslice_min;
+		*max = eclass->sched_props.timeslice_max;
+	} else if (strcmp(prop, "preempt_timeout") == 0) {
+		*min = eclass->sched_props.preempt_timeout_min;
+		*max = eclass->sched_props.preempt_timeout_max;
+	} else if (strcmp(prop, "job_timeout") == 0) {
+		*min = eclass->sched_props.job_timeout_min;
+		*max = eclass->sched_props.job_timeout_max;
+	}
+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
+	if (capable(CAP_SYS_NICE)) {
+		if (strcmp(prop, "timeslice") == 0) {
+			*min = XE_HW_ENGINE_TIMESLICE_MIN;
+			*max = XE_HW_ENGINE_TIMESLICE_MAX;
+		} else if (strcmp(prop, "preempt_timeout") == 0) {
+			*min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
+			*max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
+		} else if (strcmp(prop, "job_timeout") == 0) {
+			*min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
+			*max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
+		}
+	}
+#endif
+}
+
 static void kobj_xe_hw_engine_release(struct kobject *kobj)
 {
 	kfree(kobj);
@@ -40,11 +114,86 @@ kobj_xe_hw_engine_class(struct kobject *parent, char *name)
 	return keclass;
 }
 
+static ssize_t job_timeout_max_store(struct kobject *kobj,
+				     struct kobj_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 timeout;
+	int err;
+
+	err = kstrtou32(buf, 0, &timeout);
+	if (err)
+		return err;
+
+	if (timeout < eclass->sched_props.job_timeout_min)
+		return -EINVAL;
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
+		return -EINVAL;
+
+	WRITE_ONCE(eclass->sched_props.job_timeout_max, timeout);
+
+	return count;
+}
+
+static ssize_t job_timeout_max_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+
+	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_max);
+}
+
+static struct kobj_attribute job_timeout_max_attr =
+__ATTR(job_timeout_max, 0644, job_timeout_max_show, job_timeout_max_store);
+
+static ssize_t job_timeout_min_store(struct kobject *kobj,
+				     struct kobj_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 timeout;
+	int err;
+
+	err = kstrtou32(buf, 0, &timeout);
+	if (err)
+		return err;
+
+	if (timeout > eclass->sched_props.job_timeout_max)
+		return -EINVAL;
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
+		return -EINVAL;
+
+	WRITE_ONCE(eclass->sched_props.job_timeout_min, timeout);
+
+	return count;
+}
+
+static ssize_t job_timeout_min_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+
+	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_min);
+}
+
+static struct kobj_attribute job_timeout_min_attr =
+__ATTR(job_timeout_min, 0644, job_timeout_min_show, job_timeout_min_store);
+
 static ssize_t job_timeout_store(struct kobject *kobj,
 				 struct kobj_attribute *attr,
 				 const char *buf, size_t count)
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 min = 0, max = 0;
 	u32 timeout;
 	int err;
 
@@ -52,6 +201,12 @@ static ssize_t job_timeout_store(struct kobject *kobj,
 	if (err)
 		return err;
 
+	engine_get_prop_minmax(eclass, "job_timeout", &min, &max);
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(timeout, min, max))
+		return -EINVAL;
+
 	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
 
 	return count;
@@ -79,11 +234,34 @@ static ssize_t job_timeout_default(struct kobject *kobj,
 static struct kobj_attribute job_timeout_def =
 __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
 
+static ssize_t job_timeout_min_default(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
+
+	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
+}
+
+static struct kobj_attribute job_timeout_min_def =
+__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
+
+static ssize_t job_timeout_max_default(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
+
+	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
+}
+
+static struct kobj_attribute job_timeout_max_def =
+__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
+
 static ssize_t timeslice_duration_store(struct kobject *kobj,
 					struct kobj_attribute *attr,
 					const char *buf, size_t count)
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 min = 0, max = 0;
 	u32 duration;
 	int err;
 
@@ -91,11 +269,94 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
 	if (err)
 		return err;
 
+	engine_get_prop_minmax(eclass, "timeslice", &min, &max);
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(duration, min, max))
+		return -EINVAL;
+
 	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
 
 	return count;
 }
 
+static ssize_t timeslice_duration_max_store(struct kobject *kobj,
+					    struct kobj_attribute *attr,
+					    const char *buf, size_t count)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 duration;
+	int err;
+
+	err = kstrtou32(buf, 0, &duration);
+	if (err)
+		return err;
+
+	if (duration < eclass->sched_props.timeslice_min)
+		return -EINVAL;
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(duration,
+				     XE_HW_ENGINE_TIMESLICE_MIN,
+				     XE_HW_ENGINE_TIMESLICE_MAX))
+		return -EINVAL;
+
+	WRITE_ONCE(eclass->sched_props.timeslice_max, duration);
+
+	return count;
+}
+
+static ssize_t timeslice_duration_max_show(struct kobject *kobj,
+					   struct kobj_attribute *attr,
+					   char *buf)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+
+	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
+}
+
+static struct kobj_attribute timeslice_duration_max_attr =
+	__ATTR(timeslice_duration_max, 0644, timeslice_duration_max_show,
+	       timeslice_duration_max_store);
+
+static ssize_t timeslice_duration_min_store(struct kobject *kobj,
+					    struct kobj_attribute *attr,
+					    const char *buf, size_t count)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 duration;
+	int err;
+
+	err = kstrtou32(buf, 0, &duration);
+	if (err)
+		return err;
+
+	if (duration > eclass->sched_props.timeslice_max)
+		return -EINVAL;
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(duration,
+				     XE_HW_ENGINE_TIMESLICE_MIN,
+				     XE_HW_ENGINE_TIMESLICE_MAX))
+		return -EINVAL;
+
+	WRITE_ONCE(eclass->sched_props.timeslice_min, duration);
+
+	return count;
+}
+
+static ssize_t timeslice_duration_min_show(struct kobject *kobj,
+					   struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+
+	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
+}
+
+static struct kobj_attribute timeslice_duration_min_attr =
+	__ATTR(timeslice_duration_min, 0644, timeslice_duration_min_show,
+	       timeslice_duration_min_store);
+
 static ssize_t timeslice_duration_show(struct kobject *kobj,
 				       struct kobj_attribute *attr, char *buf)
 {
@@ -119,11 +380,34 @@ static ssize_t timeslice_default(struct kobject *kobj,
 static struct kobj_attribute timeslice_duration_def =
 __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
 
+static ssize_t timeslice_min_default(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
+
+	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
+}
+
+static struct kobj_attribute timeslice_duration_min_def =
+__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
+
+static ssize_t timeslice_max_default(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
+
+	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
+}
+
+static struct kobj_attribute timeslice_duration_max_def =
+__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
+
 static ssize_t preempt_timeout_store(struct kobject *kobj,
 				     struct kobj_attribute *attr,
 				     const char *buf, size_t count)
 {
 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 min = 0, max = 0;
 	u32 timeout;
 	int err;
 
@@ -131,6 +415,12 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
 	if (err)
 		return err;
 
+	engine_get_prop_minmax(eclass, "preempt_timeout", &min, &max);
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(timeout, min, max))
+		return -EINVAL;
+
 	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
 
 	return count;
@@ -159,17 +449,129 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
 static struct kobj_attribute preempt_timeout_def =
 __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
 
+static ssize_t preempt_timeout_min_default(struct kobject *kobj,
+					   struct kobj_attribute *attr,
+					   char *buf)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
+
+	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_min);
+}
+
+static struct kobj_attribute preempt_timeout_min_def =
+__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default, NULL);
+
+static ssize_t preempt_timeout_max_default(struct kobject *kobj,
+					   struct kobj_attribute *attr,
+					   char *buf)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
+
+	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_max);
+}
+
+static struct kobj_attribute preempt_timeout_max_def =
+__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default, NULL);
+
+static ssize_t preempt_timeout_max_store(struct kobject *kobj,
+					 struct kobj_attribute *attr,
+					 const char *buf, size_t count)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 timeout;
+	int err;
+
+	err = kstrtou32(buf, 0, &timeout);
+	if (err)
+		return err;
+
+	if (timeout < eclass->sched_props.preempt_timeout_min)
+		return -EINVAL;
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
+		return -EINVAL;
+
+	WRITE_ONCE(eclass->sched_props.preempt_timeout_max, timeout);
+
+	return count;
+}
+
+static ssize_t preempt_timeout_max_show(struct kobject *kobj,
+					struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+
+	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_max);
+}
+
+static struct kobj_attribute preempt_timeout_max_attr =
+	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
+	       preempt_timeout_max_store);
+
+static ssize_t preempt_timeout_min_store(struct kobject *kobj,
+					 struct kobj_attribute *attr,
+					 const char *buf, size_t count)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 timeout;
+	int err;
+
+	err = kstrtou32(buf, 0, &timeout);
+	if (err)
+		return err;
+
+	if (timeout > eclass->sched_props.preempt_timeout_max)
+		return -EINVAL;
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
+		return -EINVAL;
+
+	WRITE_ONCE(eclass->sched_props.preempt_timeout_min, timeout);
+
+	return count;
+}
+
+static ssize_t preempt_timeout_min_show(struct kobject *kobj,
+					struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+
+	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_min);
+}
+
+static struct kobj_attribute preempt_timeout_min_attr =
+	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
+	       preempt_timeout_min_store);
+
 static const struct attribute *defaults[] = {
 	&job_timeout_def.attr,
+	&job_timeout_min_def.attr,
+	&job_timeout_max_def.attr,
 	&timeslice_duration_def.attr,
+	&timeslice_duration_min_def.attr,
+	&timeslice_duration_max_def.attr,
 	&preempt_timeout_def.attr,
+	&preempt_timeout_min_def.attr,
+	&preempt_timeout_max_def.attr,
 	NULL
 };
 
 static const struct attribute *files[] = {
 	&job_timeout_attr.attr,
+	&job_timeout_min_attr.attr,
+	&job_timeout_max_attr.attr,
 	&timeslice_duration_attr.attr,
+	&timeslice_duration_min_attr.attr,
+	&timeslice_duration_max_attr.attr,
 	&preempt_timeout_attr.attr,
+	&preempt_timeout_min_attr.attr,
+	&preempt_timeout_max_attr.attr,
 	NULL
 };
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
index c6199c75c234..8e499217b2fa 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
@@ -9,6 +9,10 @@
 #include "xe_gt.h"
 
 int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
+bool enforce_schedule_limit(void);
+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
+void engine_get_prop_minmax(struct xe_hw_engine_class_intf *eclass, char *prop,
+			    u32 *min, u32 *max);
 
 /**
  * struct kobj_eclass - A eclass's kobject struct that connects the kobject and the
-- 
2.25.1

