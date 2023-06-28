Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC95CEB64DC
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 11:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC8110E377;
	Wed, 28 Jun 2023 11:41:38 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C478010E0F3
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 11:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687952491; x=1719488491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B7xkI6OKjoZBKCq2zArKkR/y0FTTzESiW5+vK+bjriY=;
 b=RwqMezISOj4WZNGL7iqqdkYL6ZXyRNpIhnAc1TAryhjnTBQAWrrGhT4b
 3D5ze8+anRycfF9IMcKfrVAtbWMK7/hk46W1YpWGfPlwjFqZN9GARWSFd
 xDs0ji1s/PMLbmZqdqsRMOPKp9zELrYu5c1lwIbRYlw61epEA1pcO27VZ
 17NIyfhQpLiUoIdTW5/WevInhz7RLQRm0t7o5UzZaiaYE1xdCp0v+oLYZ
 8oDkvNuIHEpDcScH0BoCEsxxm3LgMWqSAT7b7zDGZDZ+lm07RlNrrInlj
 eH7dU7o6iVlI3QOoLZ7aqJcwF2h9eVl783eO0LS6uKYEJw2WDdBEhB78e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="425492911"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="425492911"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 04:41:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="861507331"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="861507331"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2023 04:41:30 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jun 2023 17:17:31 +0530
Message-Id: <20230628114732.3598169-6-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
References: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V3 5/6] drm/xe: Add sysfs for preempt reset
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

/sys/class/drm/cardX/device/gtN/engines/ccs/preempt_timeout_us

and can be disabled by setting it to 0.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sysfs.c | 44 +++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index 6ca77c5917cc..4c8f589870ba 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -34,6 +34,37 @@ static const struct kobj_type kobj_xe_engine_type = {
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
@@ -100,6 +131,7 @@ __ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
 static const struct attribute *files[] = {
 	&job_timeout_attr.attr,
 	&timeslice_duration_attr.attr,
+	&preempt_timeout_attr.attr,
 	NULL
 };
 
@@ -261,10 +293,14 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
 		}
 
 		err = sysfs_create_files(&khwe->base, files);
-		if (err) {
-			kobject_put(kobj);
-			return err;
-		}
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

