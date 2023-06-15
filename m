Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E032CEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 14:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD01210E503;
	Thu, 15 Jun 2023 14:14:05 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097B610E504
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686838443; x=1718374443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DvluIco52/IH8yVHlnkZxGe955pK3nvPmzVk+2CKwu4=;
 b=f7yy3KPVwuasui8lQYgBbHigVwuZ0XZimCiAhSwnq4ixNW3iRSL7kySK
 7HIE7z7+8Ot8CRrm5aBgdOiI1pSXHG3vI/fmYeeUfBMNFgz5xxf/UsBOL
 WhOTQR/MQ2OIADbKgrxvySdxLmxTolC8ooIJj3QHKg7bJFiJcQD6hs5YX
 zi294+w71u9L3LNILqRJfzC1VZZalO7l3BLSeEf0iSuLWymqQQEEC9ife
 DS276NfWET+gN/onhtLlmOXAqPoSMpW72jpY57F5XF0lTJV535w7fqofk
 J1plBWb4TKpDN8nU1YUmc7StPDJdz+cXvWmu6xZ09t5Z5tsm54/4TuQtH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="445290580"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="445290580"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 07:14:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="706683793"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="706683793"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga007.jf.intel.com with ESMTP; 15 Jun 2023 07:14:00 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 15 Jun 2023 19:49:32 +0530
Message-Id: <20230615141933.2865583-6-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
References: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] drm/xe: Add sysfs for preempt reset timeout
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

/sys/class/drm/cardX/device/gtN/engines/ccs/preempt_timeout_us

and can be disabled by setting it to 0.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sysfs.c | 53 +++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index bee8f56f0dee..f88f8f7dfc7b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -32,6 +32,37 @@ static struct kobj_type kobj_xe_engine_type = {
 	.sysfs_ops = &kobj_sysfs_ops
 };
 
+static ssize_t preempt_timeout_store(struct kobject *kobj,
+				     struct kobj_attribute *attr,
+				     const char *buf, size_t count)
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
+	WRITE_ONCE(hwe->sched_props.preempt_timeout_us, timeout);
+
+	return count;
+}
+
+static ssize_t preempt_timeout_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
+
+	return sprintf(buf, "%u\n", hwe->sched_props.preempt_timeout_us);
+}
+
+static struct kobj_attribute preempt_timeout_attr =
+__ATTR(preempt_timeout_us, 0644, preempt_timeout_show, preempt_timeout_store);
+
 static ssize_t timeslice_duration_store(struct kobject *kobj,
 		struct kobj_attribute *attr,
 		const char *buf, size_t count)
@@ -256,16 +287,22 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
 		}
 
 		err = sysfs_create_file(&khwe->base, &job_timeout_attr.attr);
-		if (err) {
-			kobject_put(kobj);
-			return err;
-		}
+		if (err)
+			goto err_object;
 
 		err = sysfs_create_file(&khwe->base, &timeslice_duration_attr.attr);
-		if (err) {
-			kobject_put(kobj);
-			return err;
-		}
+		if (err)
+			goto err_object;
+
+		err = sysfs_create_file(&khwe->base, &preempt_timeout_attr.attr);
+		if (err)
+			goto err_object;
+	}
+
+	if (0) {
+err_object:
+		kobject_put(kobj);
+		return err;
 	}
 
 	return err;
-- 
2.25.1

