Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02E8C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 08:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B84310E547;
	Thu, 27 Jul 2023 08:16:05 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6030710E550
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 08:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690445761; x=1721981761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g5D387xsb958BHKoH8Cl9xRk4PSAh/Ojs730ZPhypZM=;
 b=U1I5/DxgwjPMHzPPmL+yIP0Gh1aCMlMeiCnxthjJBuoyq23fAiq/2MpD
 gbLSFxpMfpA1sO2AYe603qMeMZ+g76qyHk429kSNWu0HaIMwI/EE5e/HR
 3+q8wNh47CLPq6QbbZ3lH16V6zX2VeKR0t/b8Qekl7frP/NqCYicy5Ax3
 bsKRM8B/oyNijNhkk6pa646AYNYOv1RlTDGrgELdt5j8IN/clrNWJ0KTc
 /dNGy6h/5VevjPO2/dGOQF+bwpYkYetjXCQQLtU2wLGgGbVzSTa8l6oRg
 g89KBWXo7c95HL2jHzzanKWwHh4U8echSq42VwI2+wqOQTki7tSKCui6g w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="353144407"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="353144407"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 01:16:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057600820"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="1057600820"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga005.fm.intel.com with ESMTP; 27 Jul 2023 01:15:59 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 13:52:34 +0530
Message-Id: <20230727082235.905240-6-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230727082235.905240-1-tejas.upadhyay@intel.com>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V9 5/6] drm/xe: Add sysfs for preempt reset
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index b1c13d27bcf4..990bb675d1e0 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -118,6 +118,34 @@ static ssize_t timeslice_default(struct kobject *kobj,
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
@@ -140,6 +168,7 @@ static const struct attribute *defaults[] = {
 static const struct attribute *files[] = {
 	&job_timeout_attr.attr,
 	&timeslice_duration_attr.attr,
+	&preempt_timeout_attr.attr,
 	NULL
 };
 
-- 
2.25.1

