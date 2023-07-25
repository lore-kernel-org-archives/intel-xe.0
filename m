Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEFBC001E0
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 11:43:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAF110E13A;
	Tue, 25 Jul 2023 11:43:32 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F0410E10A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 11:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690285408; x=1721821408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SLkeUyngI6N5sjhn5pC6Qwz2/sZgQFykqzHzMAGihQs=;
 b=Nwy9/GjNr6VPH81s85yuldfkEERU+JIcJTtPXJ3NyYtPPUqJ4e+p5k+D
 XpOhnNesNPLncsmP1/wHVFXS2lnfteAu245HQBbBCdKubSS4sUGNS5NY7
 AoNf7xxU0ZV93fjNYqF4CeatsRsRGlTGo1VWb9pXuK9J9QwEsttWesMaW
 gxihxf4tg/vlysddqcBytYJZqsDVByJnL5GUVli1W1IdXt/du8usJUMdB
 pKj/m2am1j1rTOtQ5QLPioQJsjGyovMW8hp/b7hDr/k4hZdSLoaQ7lnS3
 FysuRzZUBS7nQZNsDBz0oCvOlDSVSx52+FtWeXvKHOeUPL8tsGjn72Z6i g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="431498465"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="431498465"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:43:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="972636529"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="972636529"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2023 04:43:26 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 17:20:00 +0530
Message-Id: <20230725115003.785982-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230725115003.785982-1-tejas.upadhyay@intel.com>
References: <20230725115003.785982-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V7 3/6] drm/xe: Add job timeout engine property
 to sysfs
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

/sys/class/drm/cardX/device/tileN/gtN/engines/ccs/job_timeout_ms

V5:
  - Rebase to use engine class interface instead of hw engine
V4:
  - Rebase to per class engine props interface
V3:
  - Rebase
  - Update commit message to reflect tile update
V2:
  - Use sysfs_create_files as part of this patch

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
index d9c7315b7f8b..9a2b69a1e5d1 100644
--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
@@ -39,6 +39,37 @@ kobj_xe_engine(struct kobject *parent, char *name)
 	return keclass;
 }
 
+static ssize_t job_timeout_store(struct kobject *kobj,
+				 struct kobj_attribute *attr,
+				 const char *buf, size_t count)
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
+	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
+
+	return count;
+}
+
+static ssize_t job_timeout_show(struct kobject *kobj,
+				struct kobj_attribute *attr, char *buf)
+{
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
+
+	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_ms);
+}
+
+static struct kobj_attribute job_timeout_attr =
+__ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
+
 static ssize_t job_timeout_default(struct kobject *kobj,
 				   struct kobj_attribute *attr, char *buf)
 {
@@ -80,6 +111,11 @@ static const struct attribute *defaults[] = {
 	NULL
 };
 
+static const struct attribute *files[] = {
+	&job_timeout_attr.attr,
+	NULL
+};
+
 static int xe_add_engine_class_defaults(struct kobject *parent)
 {
 	struct kobject *kobj;
@@ -188,6 +224,12 @@ int xe_engine_class_sysfs_init(struct xe_gt *gt)
 			return err;
 		}
 
+		err = sysfs_create_files(&keclass->base, files);
+		if (err) {
+			kobject_put(kobj);
+			return err;
+		}
 	}
+
 	return err;
 }
-- 
2.25.1

