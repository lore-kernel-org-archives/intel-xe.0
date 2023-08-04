Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0440DC04E69
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 07:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59C710E6BA;
	Fri,  4 Aug 2023 07:41:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452E910E6BB
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 07:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691134891; x=1722670891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+TZtqWZ8BOfy2OPTFEffiPkrRTgIKZ8uWH338QIuPUk=;
 b=J5N5RqwG94cTL7bg53EEpda3mHFkiT9F4XZx3jdOQWz5IhrVBFzOr/gL
 QNMyLR0YK9Om5GmtYR/zWlbiDptVALfk3f/txYzTeLptfKGSZA42cLw2D
 JyWJ/YD7+p+M7ptKMQ/TAVaJDUy56fp+Aq9mnhoNaxx2BmVLcLDrebPgh
 BBqLB8TLOBqAE1YE4+tzLYCbzkXy4729+ROGjVNhIB8K5DrrvBvOyyqx9
 AppZfoP2x9AIrJDGS18ixsickUPo7nW42k2jif0i36Dov3c4CKrJ/6xSJ
 FdeSE8vBtR1GG03Ghm5MHVPwVImGBfcknxMUg4UAF1V1yEI0KwAFOYrdN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="373741640"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="373741640"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 00:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="679813837"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="679813837"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 04 Aug 2023 00:41:27 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  4 Aug 2023 13:18:13 +0530
Message-Id: <20230804074816.1369465-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804074816.1369465-1-tejas.upadhyay@intel.com>
References: <20230804074816.1369465-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V12 3/6] drm/xe: Add job timeout engine property
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

V8:
  - Rebase
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

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index b1432660abad..82b01a702fe8 100644
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
@@ -191,6 +224,10 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
 				 err);
 			goto err_object;
 		}
+
+		err = sysfs_create_files(&keclass->base, files);
+		if (err)
+			goto err_object;
 	}
 	return err;
 err_object:
-- 
2.25.1

