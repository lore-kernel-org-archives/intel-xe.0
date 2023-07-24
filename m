Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1460C001DF
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 09:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E4710E29A;
	Mon, 24 Jul 2023 09:41:01 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF78510E29B
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 09:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690191659; x=1721727659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AWh5dVL61r/UDo8XxmpwvZehUb0ZYcPka2NcgAMfE0Q=;
 b=eDHmEgzSMyz3ftjzFEnFya99OvaixH3kzy9jR2LLTRdRtVPrnq0HSOCX
 colkZctI/gnkGdrJLz8jmalT444AVaXJn0uEcmTpmrxcIqNZoXZVuTXQn
 8iXG5Y2hFcKv9u5aGqL/HWygHuNr4lz84MwYQ0rSJOQ214gWi0/n6VNVB
 DpXRSUR381qfHTvKwT8zoXiZNiUnYw9QxWV3FEy7HXD7a/D/dP41lX+P4
 yTbl1NygQ/dWXZENNXLuukPw/NRo8YYJq1ZHfYGAI1xZvLg99up8UQknn
 Pp3GU5rwfkkvfKLkYmB0qlgCpuI62SdkCBCWlPjsVavhuM6irzU8oF1Vf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="347677626"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="347677626"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:40:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="869011815"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga001.fm.intel.com with ESMTP; 24 Jul 2023 02:40:59 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 24 Jul 2023 15:17:31 +0530
Message-Id: <20230724094733.720266-5-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230724094733.720266-1-tejas.upadhyay@intel.com>
References: <20230724094733.720266-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V6 4/6] drm/xe: Add timeslice duration engine
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

V4:
  - Rebase to per class engine props interface
V3:
  - Rebase
  - Update commit messge to add tile
V2:
  - Rebase

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
index f8d48e57578d..c9f9b62cfacd 100644
--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
@@ -81,6 +81,38 @@ static ssize_t job_timeout_default(struct kobject *kobj,
 static struct kobj_attribute job_timeout_def =
 __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
 
+static ssize_t timeslice_duration_store(struct kobject *kobj,
+					struct kobj_attribute *attr,
+					const char *buf, size_t count)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+	u32 duration;
+	int err;
+
+	err = kstrtou32(buf, 0, &duration);
+	if (err)
+		return err;
+
+	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
+		return -EINVAL;
+
+	WRITE_ONCE(hwe->eclass->sched_props.timeslice_us, duration);
+
+	return count;
+}
+
+static ssize_t timeslice_duration_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+
+	return sprintf(buf, "%u\n", hwe->eclass->sched_props.timeslice_us);
+}
+
+static struct kobj_attribute timeslice_duration_attr =
+	__ATTR(timeslice_duration_us, 0644, timeslice_duration_show,
+	       timeslice_duration_store);
+
 static ssize_t timeslice_default(struct kobject *kobj,
 				 struct kobj_attribute *attr, char *buf)
 {
@@ -113,6 +145,7 @@ static const struct attribute *defaults[] = {
 
 static const struct attribute *files[] = {
 	&job_timeout_attr.attr,
+	&timeslice_duration_attr.attr,
 	NULL
 };
 
-- 
2.25.1

