Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3B9C001E0
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 11:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5223510E3CF;
	Tue, 25 Jul 2023 11:43:36 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9B610E10A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 11:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690285411; x=1721821411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3XmsLTdnmtafQoMvW7WlshYpAuQLErsrf9fVZtsGWzU=;
 b=S3hcxGwrAY6gHY4rFfSCqYpFEuPtdhNTJOc9c3JvagFH0gCrRquhn4U2
 zbu12IJZts5cbgai5AkP+BWmf3kmlhY8ETza4uDyoI1EzZgm13aki6y94
 zd+t6Gq9MD2lq3zQJbtNKhDjMuI0idJjpeCzc0b8mOLttGkOqVCd8DlWn
 Cj0Eq3ACrSAs+i8ODPqpi7e0VhPO3OE+V7OmbwLdWGN2jr3XmLN560JT+
 3xpg8GgDmvFE/ClIMDqAp7Dnl35CAqZGTq6TmsQfu/tEAcDuIHC8ztky5
 9O6knpUu+TQFJ+pHGcxYT7nSmQnEOHejeCPgedzZCEDexo5PQ2qcH5z3O w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="431498477"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="431498477"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:43:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="972636566"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="972636566"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2023 04:43:30 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 17:20:02 +0530
Message-Id: <20230725115003.785982-6-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230725115003.785982-1-tejas.upadhyay@intel.com>
References: <20230725115003.785982-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V7 5/6] drm/xe: Add sysfs for preempt reset
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

V4:
  - Rebase to replace hw engine with eclass interface
V3:
  - Rebase to per class engine props interface
V2:
  - Rebase
  - Update commit message to add tile

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
index 4124ad17c7af..5e44b7a621d1 100644
--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
@@ -124,6 +124,37 @@ static ssize_t timeslice_default(struct kobject *kobj,
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
+	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))
+		return -EINVAL;
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
@@ -146,6 +177,7 @@ static const struct attribute *defaults[] = {
 static const struct attribute *files[] = {
 	&job_timeout_attr.attr,
 	&timeslice_duration_attr.attr,
+	&preempt_timeout_attr.attr,
 	NULL
 };
 
-- 
2.25.1

