Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D46C0015E
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 11:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E6210E3C4;
	Tue, 25 Jul 2023 11:43:38 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2AE10E3C6
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 11:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690285414; x=1721821414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dZ+Yb/zSpOeYriVsqzBVyrkXzCqRAjmOt0IVKduM8HE=;
 b=cgzGZug0pz8ztDcw3kl4awJMtFAQnsECCDx4zLeDIYNdUhb9YZexgPnS
 BIqF1xoUxcQChO/9lQfOQNEyei6e11YoST7ekHqWSVZ261lG8eJry+GPX
 hRG+Q5mU2IaJm9fqhKQm21BuR+rukuFvSthEbd7+4fnwev6eQI1Ia7zM2
 eeqt2k8VaXgIZLK99+MJhn48lJJl5JgGuGJuc8owVuB+x4fabX4fl5bd7
 rC20wtLTajLIm5nHgEuMcWhOcR0K2KvkntXmOU9Ga+rsdA/spGBt3Vtj2
 KdOaggs2KjcRJB0QZX7kdjQaw72kWp1sI+mfU+2K694aJtMerRTdKcsts A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="431498494"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="431498494"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:43:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="972636593"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="972636593"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2023 04:43:31 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 17:20:03 +0530
Message-Id: <20230725115003.785982-7-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230725115003.785982-1-tejas.upadhyay@intel.com>
References: <20230725115003.785982-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V7 6/6] drm/xe: Add min/max cap for engine
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
 drivers/gpu/drm/xe/Kconfig                 |   6 +
 drivers/gpu/drm/xe/Kconfig.profile         |  46 +++
 drivers/gpu/drm/xe/xe_engine.c             |  40 ++-
 drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 336 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_engine_class_sysfs.h |   2 +
 drivers/gpu/drm/xe/xe_hw_engine.c          |   8 +
 drivers/gpu/drm/xe/xe_hw_engine.h          |  31 ++
 7 files changed, 460 insertions(+), 9 deletions(-)
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
index 19a7a05bbbc3..d516c4555ee3 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -12,6 +12,7 @@
 #include <drm/xe_drm.h>
 
 #include "xe_device.h"
+#include "xe_engine_class_sysfs.h"
 #include "xe_gt.h"
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
@@ -191,8 +192,17 @@ static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
 static int engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
 				u64 value, bool create)
 {
-	if (!capable(CAP_SYS_NICE))
-		return -EPERM;
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(value,
+				     e->hwe->eclass->sched_props.timeslice_min,
+				     e->hwe->eclass->sched_props.timeslice_max))
+		return -EINVAL;
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(value,
+				     XE_HW_ENGINE_TIMESLICE_MIN,
+				     XE_HW_ENGINE_TIMESLICE_MAX))
+		return -EINVAL;
 
 	return e->ops->set_timeslice(e, value);
 }
@@ -201,8 +211,17 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
 					 struct xe_engine *e, u64 value,
 					 bool create)
 {
-	if (!capable(CAP_SYS_NICE))
-		return -EPERM;
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(value,
+				     e->hwe->eclass->sched_props.preempt_timeout_min,
+				     e->hwe->eclass->sched_props.preempt_timeout_max))
+		return -EINVAL;
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(value,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
+		return -EINVAL;
 
 	return e->ops->set_preempt_timeout(e, value);
 }
@@ -269,8 +288,17 @@ static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
 	if (XE_IOCTL_DBG(xe, !create))
 		return -EINVAL;
 
-	if (!capable(CAP_SYS_NICE))
-		return -EPERM;
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(value,
+				     e->hwe->eclass->sched_props.job_timeout_min,
+				     e->hwe->eclass->sched_props.job_timeout_max))
+		return -EINVAL;
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(value,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
+		return -EINVAL;
 
 	return e->ops->set_job_timeout(e, value);
 }
diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
index 5e44b7a621d1..ccebf8248567 100644
--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
@@ -11,6 +11,20 @@
 
 static int xe_add_engine_class_defaults(struct kobject *parent);
 
+bool enforce_schedule_limit(void)
+{
+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
+	return capable(CAP_SYS_NICE);
+#else
+	return !capable(CAP_SYS_NICE);
+#endif
+}
+
+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max)
+{
+	return timeout >= min && timeout <= max;
+}
+
 static void kobj_xe_engine_release(struct kobject *kobj)
 {
 	kfree(kobj);
@@ -39,6 +53,74 @@ kobj_xe_engine(struct kobject *parent, char *name)
 	return keclass;
 }
 
+static ssize_t job_timeout_max_store(struct kobject *kobj,
+				     struct kobj_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 timeout;
+	int err;
+
+	err = kstrtou32(buf, 0, &timeout);
+	if (err)
+		return err;
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
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 timeout;
+	int err;
+
+	err = kstrtou32(buf, 0, &timeout);
+	if (err)
+		return err;
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
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
@@ -51,7 +133,16 @@ static ssize_t job_timeout_store(struct kobject *kobj,
 	if (err)
 		return err;
 
-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(timeout,
+				     eclass->sched_props.job_timeout_min,
+				     eclass->sched_props.job_timeout_max))
+		return -EINVAL;
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
 		return -EINVAL;
 
 	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
@@ -81,6 +172,28 @@ static ssize_t job_timeout_default(struct kobject *kobj,
 static struct kobj_attribute job_timeout_def =
 __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
 
+static ssize_t job_timeout_min_default(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
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
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
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
@@ -93,7 +206,16 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
 	if (err)
 		return err;
 
-	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(duration,
+				     eclass->sched_props.timeslice_min,
+				     eclass->sched_props.timeslice_max))
+		return -EINVAL;
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(duration,
+				     XE_HW_ENGINE_TIMESLICE_MIN,
+				     XE_HW_ENGINE_TIMESLICE_MAX))
 		return -EINVAL;
 
 	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
@@ -101,6 +223,77 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
 	return count;
 }
 
+static ssize_t timeslice_duration_max_store(struct kobject *kobj,
+					    struct kobj_attribute *attr,
+					    const char *buf, size_t count)
+{
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 duration;
+	int err;
+
+	err = kstrtou32(buf, 0, &duration);
+	if (err)
+		return err;
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
+		struct kobj_attribute *attr,
+		char *buf)
+{
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 duration;
+	int err;
+
+	err = kstrtou32(buf, 0, &duration);
+	if (err)
+		return err;
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
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
@@ -124,6 +317,28 @@ static ssize_t timeslice_default(struct kobject *kobj,
 static struct kobj_attribute timeslice_duration_def =
 __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
 
+static ssize_t timeslice_min_default(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buf)
+{
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
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
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
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
@@ -136,7 +351,16 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
 	if (err)
 		return err;
 
-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(timeout,
+				     eclass->sched_props.preempt_timeout_min,
+				     eclass->sched_props.preempt_timeout_max))
+		return -EINVAL;
+
+	if (enforce_schedule_limit() &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
 		return -EINVAL;
 
 	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
@@ -167,17 +391,123 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
 static struct kobj_attribute preempt_timeout_def =
 __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
 
+static ssize_t preempt_timeout_min_default(struct kobject *kobj,
+					   struct kobj_attribute *attr,
+					   char *buf)
+{
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
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
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
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
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 timeout;
+	int err;
+
+	err = kstrtou32(buf, 0, &timeout);
+	if (err)
+		return err;
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
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 timeout;
+	int err;
+
+	err = kstrtou32(buf, 0, &timeout);
+	if (err)
+		return err;
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
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
 
diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
index 683726563059..33c458606117 100644
--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
@@ -10,6 +10,8 @@
 
 #define MAX_ENGINE_CLASS_NAME_LEN    16
 int xe_engine_class_sysfs_init(struct xe_gt *gt);
+bool enforce_schedule_limit(void);
+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
 
 /**
  * struct kobj_eclass - A eclass's kobject struct that connects the kobject and the
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 96c32a815c90..06a98ea9800b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -364,8 +364,16 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 
 	if (!gt->eclass[hwe->class].init_done) {
 		gt->eclass[hwe->class].sched_props.job_timeout_ms = HZ * 5;
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
 		gt->eclass[hwe->class].init_done = true;
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
-- 
2.25.1

