Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C315EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 14:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5513410E502;
	Thu, 15 Jun 2023 14:14:02 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF33F10E501
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686838440; x=1718374440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Jw+ZSuEuH1FxNklu3EYFi4MvtmJO9MemMg0e0nOv1Y=;
 b=YsdaLSAq9bo8lv9TxIRZkdfpHIzhiS1dMvKoyu1Fx6WVMONLCpoB00nf
 6dYlqQNtjW+zDArGu9TejHtABP4ODjGYtNI+EsggaYB+1bS8qmRnLqQJi
 h92nK9RKApYstdNWZZssOZNGpeNr2ts5Z5FQrGVe2zKFUx/bL4g3vtUlT
 XO6dPYHSOl4Nq8947BtlLx09Y13WmtXR7K5wTwwoNOWi2fVVQLfav5rvU
 WNhfQk9kbOzu4V6ucwaqAfBOKBHZihNOrVasO52RetgEzwSQXY0Log6Sz
 Pl2kpW/G7vSoN4LeRqwoqdo1QjLO02aQZQsG+W6Yp4oPwRi1a7/8IetOm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="445290570"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="445290570"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 07:14:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="706683790"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="706683790"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga007.jf.intel.com with ESMTP; 15 Jun 2023 07:13:57 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 15 Jun 2023 19:49:31 +0530
Message-Id: <20230615141933.2865583-5-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
References: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/6] drm/xe: Add timeslice duration engine
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sysfs.c | 38 ++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index 39ff8f017fa1..bee8f56f0dee 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -32,6 +32,38 @@ static struct kobj_type kobj_xe_engine_type = {
 	.sysfs_ops = &kobj_sysfs_ops
 };
 
+static ssize_t timeslice_duration_store(struct kobject *kobj,
+		struct kobj_attribute *attr,
+		const char *buf, size_t count)
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
+		struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+
+	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_us);
+}
+
+static struct kobj_attribute timeslice_duration_attr =
+__ATTR(timeslice_duration_us, 0644, timeslice_duration_show,
+timeslice_duration_store);
+
 static ssize_t job_timeout_store(struct kobject *kobj,
 		struct kobj_attribute *attr,
 		const char *buf, size_t count)
@@ -228,6 +260,12 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
 			kobject_put(kobj);
 			return err;
 		}
+
+		err = sysfs_create_file(&khwe->base, &timeslice_duration_attr.attr);
+		if (err) {
+			kobject_put(kobj);
+			return err;
+		}
 	}
 
 	return err;
-- 
2.25.1

