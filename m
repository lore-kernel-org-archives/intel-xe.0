Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAC8C001DF
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 11:43:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A054B10E10A;
	Tue, 25 Jul 2023 11:43:32 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D26910E10A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 11:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690285410; x=1721821410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E5TjSvuGT41SMVzD48CJwdcoyHXjXqSFEAjbyTH4nlo=;
 b=AeE2XR3oIzIbn6CHTPCq4oJ3/zuKHxxgo6lE27VCLTzfMLI6jIKAeVIG
 ERA2EmD3cQ++QUacJVnfm6nknBiJmQPNvUu2Wi/BaJCHYJJWK2Ub+ty7B
 nkVRs5vdCYEoBiz47Q5AXHIJk/UxhPU/a2lTzwwCQUGr6gfDRK62rgTdN
 QC1kY55nuZVqT7rWAcRuYLJpQqy33v4ECb7mPLjGlpXlwO9J4PBUxlqFJ
 2O3e14aY6aJOpEnR7MGGqkT2jTveD1p0eL3kVdAUBpiqiJvsoh+oFyl4r
 3uRvc1r9WxxdY1yy6JWHeQ+yTA//dvrH7poIV6o9FXdJfcYw6cbqISAK/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="431498470"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="431498470"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="972636553"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="972636553"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2023 04:43:28 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 17:20:01 +0530
Message-Id: <20230725115003.785982-5-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230725115003.785982-1-tejas.upadhyay@intel.com>
References: <20230725115003.785982-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V7 4/6] drm/xe: Add timeslice duration engine
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

/sys/class/drm/cardX/device/tileN/gtN/engines/ccs/timeslice_duration_us

V5:
  - Rebase to replace hw engine with eclass interface
V4:
  - Rebase to per class engine props interface
V3:
  - Rebase
  - Update commit messge to add tile
V2:
  - Rebase

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
index 9a2b69a1e5d1..4124ad17c7af 100644
--- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
@@ -81,6 +81,38 @@ static ssize_t job_timeout_default(struct kobject *kobj,
 static struct kobj_attribute job_timeout_def =
 __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
 
+static ssize_t timeslice_duration_store(struct kobject *kobj,
+					struct kobj_attribute *attr,
+					const char *buf, size_t count)
+{
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
+	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
+
+	return count;
+}
+
+static ssize_t timeslice_duration_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
+
+	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_us);
+}
+
+static struct kobj_attribute timeslice_duration_attr =
+	__ATTR(timeslice_duration_us, 0644, timeslice_duration_show,
+	       timeslice_duration_store);
+
 static ssize_t timeslice_default(struct kobject *kobj,
 				 struct kobj_attribute *attr, char *buf)
 {
@@ -113,6 +145,7 @@ static const struct attribute *defaults[] = {
 
 static const struct attribute *files[] = {
 	&job_timeout_attr.attr,
+	&timeslice_duration_attr.attr,
 	NULL
 };
 
-- 
2.25.1

