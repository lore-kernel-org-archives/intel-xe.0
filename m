Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D644EB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 10:11:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280F810E1E5;
	Mon, 26 Jun 2023 10:11:02 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCB410E1DE
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 10:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687774253; x=1719310253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h6Yz1CUPEMXUypp6A/JQgrVJhvg8JuFMoas7tWSoQZE=;
 b=NXsWbMUiE0NK6CoG9Lpn9lQOdilZWel+GMPfVobvdANd+JdlGMtAtoDN
 X1hnaj94WH4V4B9qW+ZJznzfwRxacIK5sjW0suqSw1NmBkfl4+ic+nRsb
 OlwFts92hzfSL7d1TGf06XsKJFxYGcNcxtQBzy/00pyjpzIwwMouMd97t
 /kvMHO2Klmv1W7PntaGdGQrDDGTPvR/taF/aWGxYbSMqNF4Mgm5oAmWk7
 M/BgX+NBjjsTxTEKC8hdOdDpUyHFa6ScOuvTkO4/537LMYDuL/QxBUqcS
 rGz3RUmXkK7I/56rMmbgWoz+VLVhTkIxFJQi3CXUBcJCjeuEeyw1gTe46 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="447614562"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="447614562"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="693434386"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="693434386"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga006.jf.intel.com with ESMTP; 26 Jun 2023 03:10:50 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 15:46:48 +0530
Message-Id: <20230626101648.3480340-7-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626101648.3480340-1-tejas.upadhyay@intel.com>
References: <20230626101648.3480340-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 6/6] drm/xe: Add min/max cap for engine
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
DUT# cat /sys/class/drm/cardX/device/gtN/engines/ccs/.defaults/
job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min

DUT# cat /sys/class/drm/card1/device/gt1/engines/ccs/
.defaults/              job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us

V2 :
   - Restric min/max setting to #define default min/max for
     elevated user - Himal
   - Remove unrelated changes from patch - Niranjana

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/Kconfig              |   7 +
 drivers/gpu/drm/xe/Kconfig.profile      |  38 +++
 drivers/gpu/drm/xe/xe_engine.c          |  58 +++-
 drivers/gpu/drm/xe/xe_gt_sysfs.c        | 407 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sysfs.h        |   1 +
 drivers/gpu/drm/xe/xe_hw_engine.c       |   6 +
 drivers/gpu/drm/xe/xe_hw_engine.h       |  31 ++
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  12 +
 8 files changed, 547 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/Kconfig.profile

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index d44794f99338..964c440a1135 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -83,3 +83,10 @@ depends on DRM_XE
 depends on EXPERT
 source "drivers/gpu/drm/xe/Kconfig.debug"
 endmenu
+
+menu "drm/xe Profile Guided Optimisation"
+        visible if EXPERT
+        depends on DRM_XE
+        source "drivers/gpu/drm/xe/Kconfig.profile"
+endmenu
+
diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
new file mode 100644
index 000000000000..bc65326d52b4
--- /dev/null
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -0,0 +1,38 @@
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
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 33d1fbae560d..37c33a231f00 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -13,6 +13,7 @@
 
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_sysfs.h"
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
@@ -191,9 +192,26 @@ static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
 static int engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
 				u64 value, bool create)
 {
-	if (!capable(CAP_SYS_NICE))
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(value,
+				     e->hwe->sched_props.timeslice_min,
+				     e->hwe->sched_props.timeslice_max))
 		return -EPERM;
 
+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) && defined(CONFIG_DRM_XE_TIMESLICE_MAX)
+	if (capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(value,
+				     CONFIG_DRM_XE_TIMESLICE_MIN,
+				     CONFIG_DRM_XE_TIMESLICE_MAX))
+		return -EPERM;
+#else
+	if (capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(value,
+				     XE_HW_ENGINE_TIMESLICE_MIN,
+				     XE_HW_ENGINE_TIMESLICE_MAX))
+		return -EPERM;
+#endif
+
 	return e->ops->set_timeslice(e, value);
 }
 
@@ -201,9 +219,26 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
 					 struct xe_engine *e, u64 value,
 					 bool create)
 {
-	if (!capable(CAP_SYS_NICE))
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(value,
+				     e->hwe->sched_props.preempt_timeout_min,
+				     e->hwe->sched_props.preempt_timeout_max))
 		return -EPERM;
 
+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
+	if (capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(value,
+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
+		return -EPERM;
+#else
+	if (capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(value,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
+		return -EPERM;
+#endif
+
 	return e->ops->set_preempt_timeout(e, value);
 }
 
@@ -269,8 +304,25 @@ static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
 	if (XE_IOCTL_ERR(xe, !create))
 		return -EINVAL;
 
-	if (!capable(CAP_SYS_NICE))
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(value,
+				     e->hwe->sched_props.job_timeout_min,
+				     e->hwe->sched_props.job_timeout_max))
+		return -EPERM;
+
+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
+	if (capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(value,
+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
+		return -EPERM;
+#else
+	if (capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(value,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
 		return -EPERM;
+#endif
 
 	return e->ops->set_job_timeout(e, value);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index 38a34fb2528b..bf823fe75054 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -34,6 +34,11 @@ static struct kobj_type kobj_xe_engine_type = {
 	.sysfs_ops = &kobj_sysfs_ops
 };
 
+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max)
+{
+	return timeout >= min && timeout <= max;
+}
+
 static ssize_t preempt_timeout_store(struct kobject *kobj,
 				     struct kobj_attribute *attr,
 				     const char *buf, size_t count)
@@ -46,9 +51,26 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
 	if (err)
 		return err;
 
-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     hwe->sched_props.preempt_timeout_min,
+				     hwe->sched_props.preempt_timeout_max))
 		return -EINVAL;
 
+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
+	if (capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
+		return -EINVAL;
+#else
+	if (capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
+				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
+		return -EINVAL;
+#endif
+
 	WRITE_ONCE(hwe->sched_props.preempt_timeout_us, timeout);
 
 	return count;
@@ -65,6 +87,90 @@ static ssize_t preempt_timeout_show(struct kobject *kobj,
 static struct kobj_attribute preempt_timeout_attr =
 __ATTR(preempt_timeout_us, 0644, preempt_timeout_show, preempt_timeout_store);
 
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
+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
+	if (!engine_timeout_in_range(timeout,
+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
+		return -EINVAL;
+#else
+	if (capable(CAP_SYS_NICE) &&
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
+#if defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX)
+	if (!engine_timeout_in_range(timeout,
+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN,
+				     CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX))
+		return -EINVAL;
+#else
+	if (capable(CAP_SYS_NICE) &&
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
 static ssize_t timeslice_duration_store(struct kobject *kobj,
 					struct kobj_attribute *attr,
 					const char *buf, size_t count)
@@ -77,14 +183,116 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
 	if (err)
 		return err;
 
-	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(duration,
+				     hwe->sched_props.timeslice_min,
+				     hwe->sched_props.timeslice_max))
 		return -EINVAL;
 
+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) && defined(CONFIG_DRM_XE_TIMESLICE_MAX)
+	if (capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(duration,
+				     CONFIG_DRM_XE_TIMESLICE_MIN,
+				     CONFIG_DRM_XE_TIMESLICE_MAX))
+		return -EINVAL;
+#else
+	if (capable(CAP_SYS_NICE) &&
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
+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) && defined(CONFIG_DRM_XE_TIMESLICE_MAX)
+	if (!engine_timeout_in_range(duration,
+				     CONFIG_DRM_XE_TIMESLICE_MIN,
+				     CONFIG_DRM_XE_TIMESLICE_MAX))
+		return -EINVAL;
+#else
+	if (capable(CAP_SYS_NICE) &&
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
+					   struct kobj_attribute *attr,
+					   char *buf)
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
+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) && defined(CONFIG_DRM_XE_TIMESLICE_MAX)
+	if (!engine_timeout_in_range(duration,
+				     CONFIG_DRM_XE_TIMESLICE_MIN,
+				     CONFIG_DRM_XE_TIMESLICE_MAX))
+		return -EINVAL;
+#else
+	if (capable(CAP_SYS_NICE) &&
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
@@ -109,8 +317,25 @@ static ssize_t job_timeout_store(struct kobject *kobj,
 	if (err)
 		return err;
 
-	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
+	if (!capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     hwe->sched_props.job_timeout_min,
+				     hwe->sched_props.job_timeout_max))
+		return -EINVAL;
+
+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
+	if (capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
+		return -EINVAL;
+#else
+	if (capable(CAP_SYS_NICE) &&
+	    !engine_timeout_in_range(timeout,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
+				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
 		return -EINVAL;
+#endif
 
 	WRITE_ONCE(hwe->sched_props.job_timeout_ms, timeout);
 
@@ -128,13 +353,6 @@ static ssize_t job_timeout_show(struct kobject *kobj,
 static struct kobj_attribute job_timeout_attr =
 __ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
 
-static const struct attribute *files[] = {
-	&job_timeout_attr.attr,
-	&timeslice_duration_attr.attr,
-	&preempt_timeout_attr.attr,
-	NULL
-};
-
 static ssize_t job_timeout_default(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buf)
 {
@@ -143,6 +361,28 @@ static ssize_t job_timeout_default(struct kobject *kobj,
 	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_ms);
 }
 
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
 static struct kobj_attribute job_timeout_def =
 __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
 
@@ -157,6 +397,123 @@ static ssize_t timeslice_default(struct kobject *kobj,
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
+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
+	if (!engine_timeout_in_range(timeout,
+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
+		return -EINVAL;
+#else
+	if (capable(CAP_SYS_NICE) &&
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
+#if defined(CONFIG_DRM_XE_JOB_TIMEOUT_MIN) && defined(CONFIG_DRM_XE_JOB_TIMEOUT_MAX)
+	if (!engine_timeout_in_range(timeout,
+				     CONFIG_DRM_XE_JOB_TIMEOUT_MIN,
+				     CONFIG_DRM_XE_JOB_TIMEOUT_MAX))
+		return -EINVAL;
+#else
+	if (capable(CAP_SYS_NICE) &&
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
+static const struct attribute *files[] = {
+	&job_timeout_attr.attr,
+	&job_timeout_min_attr.attr,
+	&job_timeout_max_attr.attr,
+	&timeslice_duration_attr.attr,
+	&timeslice_duration_min_attr.attr,
+	&timeslice_duration_max_attr.attr,
+	&preempt_timeout_attr.attr,
+	&preempt_timeout_min_attr.attr,
+	&preempt_timeout_max_attr.attr,
+	NULL
+};
+
 static ssize_t preempt_timeout_default(struct kobject *kobj,
 				       struct kobj_attribute *attr,
 				       char *buf)
@@ -169,10 +526,40 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
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
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h b/drivers/gpu/drm/xe/xe_gt_sysfs.h
index a539cf031c7d..a7ac7b9a9768 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
@@ -12,6 +12,7 @@
 
 int xe_gt_sysfs_init(struct xe_gt *gt);
 int xe_gt_sysfs_engines(struct xe_gt *gt);
+bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
 
 static inline struct xe_gt *
 kobj_to_gt(struct kobject *kobj)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index bd94155a28b3..2b053ee0af80 100644
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
index 7a8d275df6db..60052e17c557 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -111,10 +111,22 @@ struct xe_hw_engine {
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

