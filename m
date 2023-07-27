Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EF1C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 08:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8ABC10E548;
	Thu, 27 Jul 2023 08:16:02 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8BC10E547
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 08:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690445757; x=1721981757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bAWO8ABpLBLvhOfL66eFY/pfJ8XHPurrQUaOty4Wq0c=;
 b=ZwCaauvkEaRJju3svEuIF4JoKVMG4H3IVhD7tpZRr+QvRSp7NSvBODs+
 mB5CQuBU+qR9qN/DwzRLo/zGF0240mPh7yIxfuPsrhIKUup9jZuUuw7th
 PL0TWAJDnPrfpgiJL6JFfq6CWjQ0gMCTE2hnu8a7pJm6/ii2SgSR1ziVU
 u8gJpiwgivCsK1FynLoiNuUQNLO2wTrW4WiQ/4eamDFfqq6rkhH+l9NIX
 clDMO4buiAFdwlcKNDBzDRQbiHhJnLGVXS9dDEoJKuHCr9F01OkJrg4Ag
 rQyAPdGs6g6gMdd7OZY5daYmhPQ/PX6T09dQBuszBy6dnxyZlCKCXlEva g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="353144400"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="353144400"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 01:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057600810"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="1057600810"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga005.fm.intel.com with ESMTP; 27 Jul 2023 01:15:56 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 13:52:32 +0530
Message-Id: <20230727082235.905240-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230727082235.905240-1-tejas.upadhyay@intel.com>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V9 3/6] drm/xe: Add job timeout engine property
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index 15c2b0b9f1fd..5e2dba0be8eb 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -39,6 +39,34 @@ kobj_xe_hw_engine_class(struct kobject *parent, char *name)
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
@@ -80,6 +108,11 @@ static const struct attribute *defaults[] = {
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
@@ -182,6 +215,9 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
 			goto err_object;
 		}
 
+		err = sysfs_create_files(&keclass->base, files);
+		if (err)
+			goto err_object;
 	}
 
 	return err;
-- 
2.25.1

