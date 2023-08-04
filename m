Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BDFC001DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 07:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2AC10E6BD;
	Fri,  4 Aug 2023 07:41:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AE110E6BA
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 07:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691134891; x=1722670891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6+qgl+kL4C2XTK6ahTsN58PExepnmn5Ui3LzvqUWa7c=;
 b=Q6b+wREE7yRKfm05oX/9bOt6aE8/OmEwENS7Sv/qPSP6hIMygGXftoC2
 15SV1hqOLynAMkI6YZEgJyumuMItR9tGmGa0uk/NAs7ztjms6mgQDjlT8
 w+vAFsydR5ewUVBHQnCVs/EaIuawZscppQolCi1D72pgQOmFkYp53rWCl
 z5iP8/HKrrERM2Of5S4ykiUYkDVZfV6QoNmvUAjsy9zSTMiTSa8DfYaLN
 thkE9zgTtv40HCxZ6fH1BmLJuEsXjlPDrAoTEeXIZVL52Uyz2wyxJPpJN
 4ZRm/t4J1j/rTVBN+PT+BE1wGUkKa3p2b7uJ6Q/h3NvcphT2LEpqRZlDy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="373741642"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="373741642"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 00:41:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="679813863"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="679813863"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 04 Aug 2023 00:41:29 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  4 Aug 2023 13:18:14 +0530
Message-Id: <20230804074816.1369465-5-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804074816.1369465-1-tejas.upadhyay@intel.com>
References: <20230804074816.1369465-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V12 4/6] drm/xe: Add timeslice duration engine
 property to sysfs
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

Timeslices between multiple context is supported via
guc scheduling. Add sysfs entry to provide user defined
timeslice duration to guc scheduling.

The timeslice duration can be adjusted per-engine class using,

/sys/class/drm/cardX/device/tileN/gtN/engines/ccs/timeslice_duration_us

V8:
  - Rebase
V7:
  - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
V6:
  - Remove duration validation, not relevant - Niranjana
V5:
  - Rebase to replace hw engine with eclass interface
V4:
  - Rebase to per class engine props interface
V3:
  - Rebase
  - Update commit messge to add tile
V2:
  - Rebase

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index 82b01a702fe8..2237c6daaab5 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -80,6 +80,35 @@ static ssize_t job_timeout_default(struct kobject *kobj,
 static struct kobj_attribute job_timeout_def =
 __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
 
+static ssize_t timeslice_duration_store(struct kobject *kobj,
+					struct kobj_attribute *attr,
+					const char *buf, size_t count)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+	u32 duration;
+	int err;
+
+	err = kstrtou32(buf, 0, &duration);
+	if (err)
+		return err;
+
+	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
+
+	return count;
+}
+
+static ssize_t timeslice_duration_show(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
+
+	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_us);
+}
+
+static struct kobj_attribute timeslice_duration_attr =
+	__ATTR(timeslice_duration_us, 0644, timeslice_duration_show,
+	       timeslice_duration_store);
+
 static ssize_t timeslice_default(struct kobject *kobj,
 				 struct kobj_attribute *attr, char *buf)
 {
@@ -112,6 +141,7 @@ static const struct attribute *defaults[] = {
 
 static const struct attribute *files[] = {
 	&job_timeout_attr.attr,
+	&timeslice_duration_attr.attr,
 	NULL
 };
 
-- 
2.25.1

