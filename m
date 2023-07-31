Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCA2C001E0
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 19:11:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B823F10E091;
	Mon, 31 Jul 2023 19:11:01 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BFB10E053
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 19:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690830659; x=1722366659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0TrM8LAz08k5eISYNgS8Sr/5K03jT1Maq36KVFQ+VeI=;
 b=UAPl6J6dZki19gNVro0yc7hD/3UexO58aPE+jg9uSJaqSjmcXLouoYE9
 yvNHHt5tKayl82zQlMW2vDT69+hfDVLeCriixP6+K87LPL6/i3SMSipTO
 8doiEM6O8gvxX2I+sRyv85b8crnp7HDH6W+g9VHQXwW426Da3PGJ4idkC
 Lb7EevK6FVBpa0tclG9gTsxXAYHn6XbwJ1vMqFIVJOB1YgECQbq3woyY0
 S2lLp9BFPxmOtcHO/stL3tOsXfjX0VgH1Pp71VpveM9OmIb4zxmKjnK0V
 1gkWaBChbX4LyJjVZ1CV2ZJFDD3v2VdyhMkwWkxk2yQ/7HKoLc0yWe3mu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="371815483"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="371815483"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 12:10:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="728403037"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="728403037"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga002.jf.intel.com with ESMTP; 31 Jul 2023 12:10:58 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  1 Aug 2023 00:47:39 +0530
Message-Id: <20230731191742.1130309-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731191742.1130309-1-tejas.upadhyay@intel.com>
References: <20230731191742.1130309-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V11 3/6] drm/xe: Add job timeout engine property
 to sysfs
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

The time after which a job is removed from the scheduler.
Add sysfs entry to provide user defined job timeout to
scheduler.

The job timeout can be adjusted per-engine class using,

/sys/class/drm/cardX/device/tileN/gtN/engines/ccs/job_timeout_ms

V7:
  - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
V6:
  - Remove timeout validation, not relevant - Niranjana
  - Rebase to use common error path
V5:
  - Rebase to use engine class interface instead of hw engine
V4:
  - Rebase to per class engine props interface
V3:
  - Rebase
  - Update commit message to reflect tile update
V2:
  - Use sysfs_create_files as part of this patch

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index 96e6c3c3c7ff..2169301cd9e6 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -41,6 +41,34 @@ kobj_xe_hw_engine_class(struct kobject *parent, char *name)
 	return keclass;
 }
 
+static ssize_t job_timeout_store(struct kobject *kobj,
+				 struct kobj_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 timeout;
+	int err;
+
+	err = kstrtou32(buf, 0, &timeout);
+	if (err)
+		return err;
+
+	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
+
+	return count;
+}
+
+static ssize_t job_timeout_show(struct kobject *kobj,
+				struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+
+	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_ms);
+}
+
+static struct kobj_attribute job_timeout_attr =
+__ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
+
 static ssize_t job_timeout_default(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buf)
 {
@@ -82,6 +110,11 @@ static const struct attribute *defaults[] = {
 	NULL
 };
 
+static const struct attribute *files[] = {
+	&job_timeout_attr.attr,
+	NULL
+};
+
 static int xe_add_hw_engine_class_defaults(struct kobject *parent)
 {
 	struct kobject *kobj;
@@ -193,6 +226,9 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
 			goto err_object;
 		}
 
+		err = sysfs_create_files(&keclass->base, files);
+		if (err)
+			goto err_object;
 	}
 
 	return err;
-- 
2.25.1

