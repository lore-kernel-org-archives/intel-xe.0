Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A45EB64DC
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 14:14:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A697410E188;
	Thu, 15 Jun 2023 14:14:00 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436CA10E0BE
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 14:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686838438; x=1718374438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fqKM59xGib4f2P5p9hW/FkklKGL7n1GhbQLk5BCPzWI=;
 b=f4gDMhSJLBrP3us6y07jm4G6zoFT2yQ+gNWLIT5mcskKs49h21Zv+AJJ
 87S1BdVQ7pzowlCRSAVpKRfwRrLZw4NcBQu0UPbG00lKy4oe9/jNXqkmE
 LvRZJGoMwUMHC8J3MFm5vElXWHB1Km9a739Juq3gybarWQjdLMrPi3KHE
 DrgWI5iRZIRDZxEzMDJASOwEN+gz3pt2vjBKPhGfiSp5iBgcTC9jUctLQ
 YavkdzygmmzW9ekjGDlJipsnPxgvFlC/IkZmzFH2JceJOyBehvfgNi0r7
 Hqijg1IQQhR1MRS1+eMwED/qkc4JQ8NdLINEoeWqMklnPJImjkai+2hzo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="445290561"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="445290561"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 07:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="706683787"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="706683787"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga007.jf.intel.com with ESMTP; 15 Jun 2023 07:13:54 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 15 Jun 2023 19:49:30 +0530
Message-Id: <20230615141933.2865583-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
References: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/6] drm/xe: Add job timeout engine property to
 sysfs
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

/sys/class/drm/cardX/device/gtN/engines/ccs/job_timeout_ms

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sysfs.c | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index 72809078bd83..39ff8f017fa1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -32,6 +32,37 @@ static struct kobj_type kobj_xe_engine_type = {
 	.sysfs_ops = &kobj_sysfs_ops
 };
 
+static ssize_t job_timeout_store(struct kobject *kobj,
+		struct kobj_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
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
+	WRITE_ONCE(hwe->sched_props.job_timeout_ms, timeout);
+
+	return count;
+}
+
+static ssize_t job_timeout_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+
+	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_ms);
+}
+
+static struct kobj_attribute job_timeout_attr =
+__ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
+
 static ssize_t job_timeout_default(struct kobject *kobj,
 				 struct kobj_attribute *attr, char *buf)
 {
@@ -191,6 +222,12 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
 				 err);
 			return err;
 		}
+
+		err = sysfs_create_file(&khwe->base, &job_timeout_attr.attr);
+		if (err) {
+			kobject_put(kobj);
+			return err;
+		}
 	}
 
 	return err;
-- 
2.25.1

