Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6554C001B0
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 13:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5691A10E484;
	Wed, 26 Jul 2023 13:19:21 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161C410E484
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 13:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690377558; x=1721913558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=peTDFsv0W49zTvagPmMk1JtOS1f6TPD0X+8iM96YuIg=;
 b=JagVdMkEq4omal7gTRDjPNqpwWo/FYLbtkBWJHoKK95AgSKok9PV0ls0
 zM4e5m/AKEmMpZU+Ja/haooHe3ATr/BxOvdzeYKplJbYe6AKT5CnP6xTF
 +40D+5liwMoFz3cmYRJxFDgnZrDFhVQeR6/+fyMQiKBeJ/bX744Ft1eym
 rfVF8bWtHWRcLwfGtusOcYEZkoHjVhHoYIL7ARtzPYbpuJCoW+hYcTR4G
 10wq+5Yd72IcQuFDKjG1KtB6+ZY3aXN2AyzmF8NxGfcRCKzxslRYIav0X
 cwFLSIziRhy76nxjU79jjWTvdv+2I+jx2Se+z1cgXFa/yOx5ava/lBlwK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371624373"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="371624373"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 06:19:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="676695806"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="676695806"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 26 Jul 2023 06:19:16 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 18:55:49 +0530
Message-Id: <20230726132550.846300-6-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230726132550.846300-1-tejas.upadhyay@intel.com>
References: <20230726132550.846300-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V8 5/6] drm/xe: Add sysfs for preempt reset
 timeout
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

The preemption request and timeout is used for
higher priority context or kill hung context and reset
gpu.

The preempt timeout can be adjusted per-engine class using,

/sys/class/drm/cardX/device/tileN/gtN/engines/ccs/preempt_timeout_us

and can be disabled by setting it to 0.

V5:
  - Remove timeout validation, not relevant - Niranjana
V4:
  - Rebase to replace hw engine with eclass interface
V3:
  - Rebase to per class engine props interface
V2:
  - Rebase
  - Update commit message to add tile

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
index a9a0135eae83..569d5f89310e 100644
--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
@@ -118,6 +118,34 @@ static ssize_t timeslice_default(struct kobject *kobj,
 static struct kobj_attribute timeslice_duration_def =
 __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
 
+static ssize_t preempt_timeout_store(struct kobject *kobj,
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
+	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
+
+	return count;
+}
+
+static ssize_t preempt_timeout_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
+
+	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_us);
+}
+
+static struct kobj_attribute preempt_timeout_attr =
+__ATTR(preempt_timeout_us, 0644, preempt_timeout_show, preempt_timeout_store);
+
 static ssize_t preempt_timeout_default(struct kobject *kobj,
 				       struct kobj_attribute *attr,
 				       char *buf)
@@ -140,6 +168,7 @@ static const struct attribute *defaults[] = {
 static const struct attribute *files[] = {
 	&job_timeout_attr.attr,
 	&timeslice_duration_attr.attr,
+	&preempt_timeout_attr.attr,
 	NULL
 };
 
-- 
2.25.1

