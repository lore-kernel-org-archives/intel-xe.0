Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490BCC0015E
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 12:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0390210E5C3;
	Thu, 20 Jul 2023 12:09:28 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A0B10E5C3
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 12:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689854966; x=1721390966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AhKaETxDWof3BSCr/Zbm49kr1B0TRZoToQ3MiCYGdxE=;
 b=D1p0eVBYorQVbnAJDBwJdpcQCy+26WwuPa1PqB48HK/Di0aTfkb4tEMG
 tEjkIw5NUBdaa5biYZ/hbGtSJjCgXyt0zmkLaiX7a4pWwvy+qyI7BrCJC
 2cXZGyBHkNNsGNTcn22Ywt9pNZqqA+bXw/Ag4wmak+1jnj/OyJ3l/1T82
 oFByoHw+5XIsOdP9nz6te02t1pr5afnbRUecipuQzdP4+5C8RFxV8aDeQ
 +qPjFEYVunCZbdC/dSPVK1R5tJ+5YqLJH3OWMATvFq2G1SioUUpF0TrM7
 RB8yv81MFc02HoHNCYX3EzCZND4xzWoN/KbMnQhPu6F7iJDLoz8uwYlCI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="430479480"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="430479480"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 05:09:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="754048499"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="754048499"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga008.jf.intel.com with ESMTP; 20 Jul 2023 05:09:24 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 20 Jul 2023 17:45:51 +0530
Message-Id: <20230720121551.518497-7-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230720121551.518497-1-tejas.upadhyay@intel.com>
References: <20230720121551.518497-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V4 6/6] drm/xe: Add min/max cap for engine
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
 drivers/gpu/drm/xe/Kconfig                 |   7 +
 drivers/gpu/drm/xe/Kconfig.profile         |  45 +++
 drivers/gpu/drm/xe/xe_engine.c             |  43 ++-
 drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 392 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_engine_class_sysfs.h |   1 +
 drivers/gpu/drm/xe/xe_hw_engine.c          |   6 +
 drivers/gpu/drm/xe/xe_hw_engine.h          |  31 ++
 drivers/gpu/drm/xe/xe_hw_engine_types.h    |  12 +
 8 files changed, 530 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/Kconfig.profile

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index b739faa401d3..fd48be7a2812 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -84,3 +84,10 @@ depends on DRM_XE
 depends on EXPERT
 source "drivers/gpu/drm/xe/Kconfig.debug"
 endmenu
+
+menu "drm/xe Profile Guided Optimisation"
+	visible if EXPERT
+	depends on DRM_XE
+	source "drivers/gpu/drm/xe/Kconfig.profile"
+endmenu
+
diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
new file mode 100644
index 000000000000..b9fa78f9d76f
--- /dev/null
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -0,0 +1,45 @@
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
+         Configures the enablement of limitation on scheduler timeout 
+	 to apply to applicable user. For elevated user, all above MIN
+	 and MAX values will apply when this configuration is enable.
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index aa2d49efb9bb..e64b84dc24de 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -12,6 +12,7 @@
 #include <drm/xe_drm.h>
 
 #include "xe_device.h"
+#include "xe_engine_class_sysfs.h"
 #include "xe_gt.h"
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
@@ -191,9 +192,21 @@ static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
 static int engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
 				u64 value, bool create)
 {
-	if (!capable(CAP_SYS_NICE))
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(value,
+				     e->hwe->sched_props.timeslice_min,
+				     e->hwe->sched_props.timeslice_max))
 		return -EPERM;
 
+#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
+	    capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(value,
+				     XE_HW_ENGINE_TIMESLICE_MIN,
+				     XE_HW_ENGINE_TIMESLICE_MAX))
+		return -EPERM;
+#endif
+
 	return e->ops->set_timeslice(e, value);
 }
 
@@ -201,8 +214,20 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
 					 struct xe_engine *e, u64 value,
 					 bool create)
 {
-	if (!capable(CAP_SYS_NICE))
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(value,
+				     e->hwe->sched_props.preempt_timeout_min,
+				     e->hwe->sched_props.preempt_timeout_max))
+		return -EPERM;
+
+#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
+	    capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(value,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
 		return -EPERM;
+#endif
 
 	return e->ops->set_preempt_timeout(e, value);
 }
@@ -269,8 +294,20 @@ static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
 	if (XE_IOCTL_DBG(xe, !create))
 		return -EINVAL;
 
-	if (!capable(CAP_SYS_NICE))
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(value,
+				     e->hwe->sched_props.job_timeout_min,
+				     e->hwe->sched_props.job_timeout_max))
+		return -EPERM;
+
+#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
+	    capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(value,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
 		return -EPERM;
+#endif
 
 	return e->ops->set_job_timeout(e, value);
 }
diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
index 8350f7441af6..42299a024c44 100644
--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
@@ -11,6 +11,11 @@
 
 static int xe_add_engine_class_defaults(struct kobject *parent);
 
+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max)
+{
+	return timeout >= min && timeout <= max;
+}
+
 static void kobj_xe_engine_release(struct kobject *kobj)
 {
 	kfree(kobj);
@@ -39,6 +44,92 @@ kobj_xe_engine(struct kobject *parent, char *name)
 	return khwe;
 }
 
+static ssize_t job_timeout_max_store(struct kobject *kobj,
+				     struct kobj_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+	u32 timeout;
+	int err;
+
+	err = kstrtou32(buf, 0, &timeout);
+	if (err)
+		return err;
+
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
+		return -EINVAL;
+
+#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
+	    capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
+		return -EINVAL;
+#endif
+
+	WRITE_ONCE(hwe->sched_props.job_timeout_max, timeout);
+
+	return count;
+}
+
+static ssize_t job_timeout_max_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+
+	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_max);
+}
+
+static struct kobj_attribute job_timeout_max_attr =
+__ATTR(job_timeout_max, 0644, job_timeout_max_show, job_timeout_max_store);
+
+static ssize_t job_timeout_min_store(struct kobject *kobj,
+				     struct kobj_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+	u32 timeout;
+	int err;
+
+	err = kstrtou32(buf, 0, &timeout);
+	if (err)
+		return err;
+
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
+		return -EINVAL;
+
+#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
+	    capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
+		return -EINVAL;
+#endif
+
+	WRITE_ONCE(hwe->sched_props.job_timeout_min, timeout);
+
+	return count;
+}
+
+static ssize_t job_timeout_min_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+
+	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_min);
+}
+
+static struct kobj_attribute job_timeout_min_attr =
+__ATTR(job_timeout_min, 0644, job_timeout_min_show, job_timeout_min_store);
+
 static ssize_t job_timeout_store(struct kobject *kobj,
 				 struct kobj_attribute *attr,
 				 const char *buf, size_t count)
@@ -51,8 +142,20 @@ static ssize_t job_timeout_store(struct kobject *kobj,
 	if (err)
 		return err;
 
-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     hwe->sched_props.job_timeout_min,
+				     hwe->sched_props.job_timeout_max))
+		return -EINVAL;
+
+#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
+	    capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
 		return -EINVAL;
+#endif
 
 	WRITE_ONCE(hwe->sched_props.job_timeout_ms, timeout);
 
@@ -81,6 +184,28 @@ static ssize_t job_timeout_default(struct kobject *kobj,
 static struct kobj_attribute job_timeout_def =
 __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
 
+static ssize_t job_timeout_min_default(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
+
+	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_min);
+}
+
+static struct kobj_attribute job_timeout_min_def =
+__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
+
+static ssize_t job_timeout_max_default(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
+
+	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_max);
+}
+
+static struct kobj_attribute job_timeout_max_def =
+__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
+
 static ssize_t timeslice_duration_store(struct kobject *kobj,
 					struct kobj_attribute *attr,
 					const char *buf, size_t count)
@@ -93,14 +218,115 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
 	if (err)
 		return err;
 
-	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(duration,
+				     hwe->sched_props.timeslice_min,
+				     hwe->sched_props.timeslice_max))
 		return -EINVAL;
 
+#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
+	    capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(duration,
+				     XE_HW_ENGINE_TIMESLICE_MIN,
+				     XE_HW_ENGINE_TIMESLICE_MAX))
+		return -EINVAL;
+#endif
+
 	WRITE_ONCE(hwe->sched_props.timeslice_us, duration);
 
 	return count;
 }
 
+static ssize_t timeslice_duration_max_store(struct kobject *kobj,
+					    struct kobj_attribute *attr,
+					    const char *buf, size_t count)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+	u32 duration;
+	int err;
+
+	err = kstrtou32(buf, 0, &duration);
+	if (err)
+		return err;
+
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(duration,
+				     XE_HW_ENGINE_TIMESLICE_MIN,
+				     XE_HW_ENGINE_TIMESLICE_MAX))
+		return -EINVAL;
+
+#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
+	    capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(duration,
+				     XE_HW_ENGINE_TIMESLICE_MIN,
+				     XE_HW_ENGINE_TIMESLICE_MAX))
+		return -EINVAL;
+#endif
+
+	WRITE_ONCE(hwe->sched_props.timeslice_max, duration);
+
+	return count;
+}
+
+static ssize_t timeslice_duration_max_show(struct kobject *kobj,
+		struct kobj_attribute *attr,
+		char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+
+	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_max);
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
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+	u32 duration;
+	int err;
+
+	err = kstrtou32(buf, 0, &duration);
+	if (err)
+		return err;
+
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(duration,
+				     XE_HW_ENGINE_TIMESLICE_MIN,
+				     XE_HW_ENGINE_TIMESLICE_MAX))
+		return -EINVAL;
+
+#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
+	    capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(duration,
+				     XE_HW_ENGINE_TIMESLICE_MIN,
+				     XE_HW_ENGINE_TIMESLICE_MAX))
+		return -EINVAL;
+#endif
+
+	WRITE_ONCE(hwe->sched_props.timeslice_min, duration);
+
+	return count;
+}
+
+static ssize_t timeslice_duration_min_show(struct kobject *kobj,
+					   struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+
+	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_min);
+}
+
+static struct kobj_attribute timeslice_duration_min_attr =
+	__ATTR(timeslice_duration_min, 0644, timeslice_duration_min_show,
+	       timeslice_duration_min_store);
+
 static ssize_t timeslice_duration_show(struct kobject *kobj,
 		struct kobj_attribute *attr, char *buf)
 {
@@ -110,7 +336,7 @@ static ssize_t timeslice_duration_show(struct kobject *kobj,
 }
 
 static struct kobj_attribute timeslice_duration_attr =
-	__ATTR(timeslice_duration_us, 0644, timeslice_duration_show, 
+	__ATTR(timeslice_duration_us, 0644, timeslice_duration_show,
 	       timeslice_duration_store);
 
 static ssize_t timeslice_default(struct kobject *kobj,
@@ -124,6 +350,28 @@ static ssize_t timeslice_default(struct kobject *kobj,
 static struct kobj_attribute timeslice_duration_def =
 __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
 
+static ssize_t timeslice_min_default(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
+
+	return sprintf(buf, "%u\n", hwe->defaults.timeslice_min);
+}
+
+static struct kobj_attribute timeslice_duration_min_def =
+__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
+
+static ssize_t timeslice_max_default(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
+
+	return sprintf(buf, "%u\n", hwe->defaults.timeslice_max);
+}
+
+static struct kobj_attribute timeslice_duration_max_def =
+__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
+
 static ssize_t preempt_timeout_store(struct kobject *kobj,
 				     struct kobj_attribute *attr,
 				     const char *buf, size_t count)
@@ -136,8 +384,20 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
 	if (err)
 		return err;
 
-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     hwe->sched_props.preempt_timeout_min,
+				     hwe->sched_props.preempt_timeout_max))
+		return -EINVAL;
+
+#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
+	    capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
 		return -EINVAL;
+#endif
 
 	WRITE_ONCE(hwe->sched_props.preempt_timeout_us, timeout);
 
@@ -167,17 +427,141 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
 static struct kobj_attribute preempt_timeout_def =
 __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
 
+static ssize_t preempt_timeout_min_default(struct kobject *kobj,
+					   struct kobj_attribute *attr,
+					   char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
+
+	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_min);
+}
+
+static struct kobj_attribute preempt_timeout_min_def =
+__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default, NULL);
+
+static ssize_t preempt_timeout_max_default(struct kobject *kobj,
+					   struct kobj_attribute *attr,
+					   char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
+
+	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_max);
+}
+
+static struct kobj_attribute preempt_timeout_max_def =
+__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default, NULL);
+
+static ssize_t preempt_timeout_max_store(struct kobject *kobj,
+					 struct kobj_attribute *attr,
+					 const char *buf, size_t count)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+	u32 timeout;
+	int err;
+
+	err = kstrtou32(buf, 0, &timeout);
+	if (err)
+		return err;
+
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
+		return -EINVAL;
+
+#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
+	    capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
+		return -EINVAL;
+#endif
+
+	WRITE_ONCE(hwe->sched_props.preempt_timeout_max, timeout);
+
+	return count;
+}
+
+static ssize_t preempt_timeout_max_show(struct kobject *kobj,
+					struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+
+	return sprintf(buf, "%u\n", hwe->sched_props.preempt_timeout_max);
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
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+	u32 timeout;
+	int err;
+
+	err = kstrtou32(buf, 0, &timeout);
+	if (err)
+		return err;
+
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
+		return -EINVAL;
+
+#ifdef CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
+	if (CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT &&
+	    capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
+		return -EINVAL;
+#endif
+
+	WRITE_ONCE(hwe->sched_props.preempt_timeout_min, timeout);
+
+	return count;
+}
+
+static ssize_t preempt_timeout_min_show(struct kobject *kobj,
+					struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+
+	return sprintf(buf, "%u\n", hwe->sched_props.preempt_timeout_min);
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
index 492a84a22c30..7b4ae8b726a3 100644
--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
@@ -10,6 +10,7 @@
 
 #define MAX_ENGINE_CLASS_NAME_LEN    16
 int xe_engine_class_sysfs_init(struct xe_gt *gt);
+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
 
 /**
  * struct kobj_hwe - A hwe's kobject struct that connects the kobject and the
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 0a254a59735d..2951fa999520 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -363,8 +363,14 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	hwe->engine_id = id;
 	/* FIXME: Wire up to configurable default value */
 	hwe->sched_props.job_timeout_ms = HZ * 5;
+	hwe->sched_props.job_timeout_min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
+	hwe->sched_props.job_timeout_max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
 	hwe->sched_props.timeslice_us = 1 * 1000;
+	hwe->sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
+	hwe->sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
 	hwe->sched_props.preempt_timeout_us = 640 * 1000;
+	hwe->sched_props.preempt_timeout_min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
+	hwe->sched_props.preempt_timeout_max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
 	hwe->defaults = hwe->sched_props; /* Record default props */
 
 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
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
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 6635c36f38d0..404556f69126 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -114,10 +114,22 @@ struct xe_hw_engine {
 	struct {
 		/** @set_job_timeout: Set job timeout in ms for engine */
 		u32 job_timeout_ms;
+		/** @job_timeout_min: Min job timeout in ms for engine */
+		u32 job_timeout_min;
+		/** @job_timeout_max: Max job timeout in ms for engine */
+		u32 job_timeout_max;
 		/** @timeslice_us: timeslice period in micro-seconds */
 		u32 timeslice_us;
+		/** @timeslice_min: min timeslice period in micro-seconds */
+		u32 timeslice_min;
+		/** @timeslice_max: max timeslice period in micro-seconds */
+		u32 timeslice_max;
 		/** @preempt_timeout_us: preemption timeout in micro-seconds */
 		u32 preempt_timeout_us;
+		/** @preempt_timeout_min: min preemption timeout in micro-seconds */
+		u32 preempt_timeout_min;
+		/** @preempt_timeout_max: max preemption timeout in micro-seconds */
+		u32 preempt_timeout_max;
 	} sched_props, defaults;
 };
 
-- 
2.25.1

