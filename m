Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ED6EB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 10:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3C910E1D2;
	Mon, 26 Jun 2023 10:10:51 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7473410E1D2
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 10:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687774249; x=1719310249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MvDAbPH6h1BNDbRUHq4AfiL090R8fkbYvTznKh7GLZ0=;
 b=O9DUzhcdGrbcUPsvs70evz19cVu8QLi7hz7a6hlontBCdyL0Ym7XShHN
 7AElaJiBW8VmnAh0gQNU/JyOZkYvGd+aR+F/h52cVaTCnYo42OSgcb/T2
 aK9vIv7eI1dYi4pUufepgiNDp/u84caOLwO0TTK148kRLXNsT2y7nPtyo
 KyuST+ywfaElmHnAJa5Fhkn+slZTLhB7JE5/zQJvioW1sktYuDmWde8mv
 ETSyNXNalpQP4NFahSpVmDGkFUZkpmKHjA6Qasi17paYwengPSRTxCo9q
 R4ma5tyxXU4Wqz5O6Ub3AYEIZ7dPMFlM9QF97UHy7jn/UBkbaXBKjDDtP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="447614551"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="447614551"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="693434377"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="693434377"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga006.jf.intel.com with ESMTP; 26 Jun 2023 03:10:48 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 15:46:46 +0530
Message-Id: <20230626101648.3480340-5-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626101648.3480340-1-tejas.upadhyay@intel.com>
References: <20230626101648.3480340-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 4/6] drm/xe: Add timeslice duration engine
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

/sys/class/drm/cardX/device/gtN/engines/ccs/timeslice_duration_us

V2:
  - Rebase

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sysfs.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index afa11486856a..d85c7d7bc77e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -34,6 +34,38 @@ static struct kobj_type kobj_xe_engine_type = {
 	.sysfs_ops = &kobj_sysfs_ops
 };
 
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
+	WRITE_ONCE(hwe->sched_props.timeslice_us, duration);
+
+	return count;
+}
+
+static ssize_t timeslice_duration_show(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+
+	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_us);
+}
+
+static struct kobj_attribute timeslice_duration_attr =
+__ATTR(timeslice_duration_us, 0644, timeslice_duration_show,
+		timeslice_duration_store);
+
 static ssize_t job_timeout_store(struct kobject *kobj,
 				 struct kobj_attribute *attr,
 				 const char *buf, size_t count)
@@ -67,6 +99,7 @@ __ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
 
 static const struct attribute *files[] = {
 	&job_timeout_attr.attr,
+	&timeslice_duration_attr.attr,
 	NULL
 };
 
-- 
2.25.1

