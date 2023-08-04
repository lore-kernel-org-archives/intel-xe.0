Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4B0C04A6A
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 07:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5252E10E6B8;
	Fri,  4 Aug 2023 07:41:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F26010E6BC
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691134893; x=1722670893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gXWT6yYqhaYDFx7nC4KWOAU3KKrHL6PuwXt7VrGtCBo=;
 b=dwYR3WERpmaX1Oktc9x2BYIrLqsJMXy8DLMIe5wVuN+K5DvsZQnPr+qg
 RMz14c30uuc8P/3uK91nx8P2yFx5SIeGQiwPvznQ6yGvEBN0sdKhpXYG6
 cu7xEKrOQkEYiCi4wjJV1NRyVRSjPopjW88X4HE8xao1hNDM+4QQZogIx
 LzQVYYvUV9WexcT3iEkuetD+g5Ahc8C4KMB1OCwooA9c01VT9Q71GbcEM
 po5Y7234Wz60QBesyw374SdcIw+lxSjfvhloEOS+Vfsmltvf6apP/5q6o
 zzraWHK6fEqQcKG8V28PuO4UDzUiehGMSw2lIVSPQnBCOBgH+36Ivb5vn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="373741644"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="373741644"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 00:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="679813894"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="679813894"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 04 Aug 2023 00:41:31 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  4 Aug 2023 13:18:15 +0530
Message-Id: <20230804074816.1369465-6-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804074816.1369465-1-tejas.upadhyay@intel.com>
References: <20230804074816.1369465-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V12 5/6] drm/xe: Add sysfs for preempt reset
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
hardware engine.

The preempt timeout can be adjusted per-engine class using,

/sys/class/drm/cardX/device/tileN/gtN/engines/ccs/preempt_timeout_us

and can be disabled by setting it to 0.

V7:
  - Rebase
V6:
  - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
V5:
  - Remove timeout validation, not relevant - Niranjana
V4:
  - Rebase to replace hw engine with eclass interface
V3:
  - Rebase to per class engine props interface
V2:
  - Rebase
  - Update commit message to add tile

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index 2237c6daaab5..5176920991ef 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -120,6 +120,34 @@ static ssize_t timeslice_default(struct kobject *kobj,
 static struct kobj_attribute timeslice_duration_def =
 __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
 
+static ssize_t preempt_timeout_store(struct kobject *kobj,
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
+	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
+
+	return count;
+}
+
+static ssize_t preempt_timeout_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
@@ -142,6 +170,7 @@ static const struct attribute *defaults[] = {
 static const struct attribute *files[] = {
 	&job_timeout_attr.attr,
 	&timeslice_duration_attr.attr,
+	&preempt_timeout_attr.attr,
 	NULL
 };
 
-- 
2.25.1

