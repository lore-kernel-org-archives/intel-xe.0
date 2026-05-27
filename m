Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2E2CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 22:55:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F8910EA88;
	Wed, 27 May 2026 22:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W39p0c/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336DB10EA86
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 22:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779922512; x=1811458512;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TjneiYmFO33lgg4mLuvA170snFyC3XJrheucf+xJuuo=;
 b=W39p0c/+jfgP0CTuR8L2WFXCmAT6CKXDrw71+1qy3OEr8Qoy+4H6dc65
 UrrKJ6NeJ5iL28oTFmGc2h9BAcvFhoLeY4zxF/iNdyMGjVPc8SaHS4SXf
 I4E3OunGVHo7dc/bLZ9gpGuTQLgZsA+P9RLiGwyqacqxtN9wnyRBzDeuz
 TE0cX97ryl1K7NGVXL2CnrPmlOWwk7nYlNgmo5oonCqvncdkw10oKQ4WJ
 /8U0nh8zBExEEgmkfb4MB6EbqZcGVvRbKRe0siZY3RsFZmLDZZKoRY6ai
 zFRaRRl4sFLiU3EcyHf5F5f0WCsqBX74oR317v/WZyhzdU+FkIXNMjB9g g==;
X-CSE-ConnectionGUID: QfmFe7igSNCZk1xQdrWlgg==
X-CSE-MsgGUID: HI3MInuzS9WQMoBNztyi/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="98340385"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="98340385"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 15:55:11 -0700
X-CSE-ConnectionGUID: +ZC9new9T0CMXyPaQAdxQg==
X-CSE-MsgGUID: l8cF3AtPQAGAq7JgFcVLeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="266260446"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 15:55:11 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: gate observation streams with perf_allow_cpu()
Date: Wed, 27 May 2026 15:55:07 -0700
Message-ID: <20260527225507.2044027-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527225507.2044027-1-ashutosh.dixit@intel.com>
References: <20260527225507.2044027-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: John Hubbard <jhubbard@nvidia.com>

xe OA and EU-stall paths open-code a partial copy of the system-wide
perf CPU-event permission check:

    if (xe_observation_paranoid && !perfmon_capable())
            return -EACCES;

This open-coded check skips two things perf_allow_cpu() handles: the
graduated kernel.perf_event_paranoid policy that an administrator
may have tuned, and the security_perf_event_open() LSM hook.

Introduce xe_observation_paranoid_check() to wrap perf_allow_cpu(),
and convert the open-coded sites in xe_oa.c and xe_eu_stall.c. The
dev.xe.observation_paranoid sysctl still acts as an escape hatch
when cleared.

xe observation now consults kernel.perf_event_paranoid and the LSM
perf hook on every open. Sites that have already configured an LSM
perf policy or tuned the paranoid sysctl will see those settings
extend to xe.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c    |  5 +++--
 drivers/gpu/drm/xe/xe_oa.c          | 25 +++++++++++++---------
 drivers/gpu/drm/xe/xe_observation.c | 32 ++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_observation.h |  3 +--
 4 files changed, 46 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 297be3c42b208..d37770c58c5d3 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -985,9 +985,10 @@ int xe_eu_stall_stream_open(struct drm_device *dev, u64 data, struct drm_file *f
 		return -ENODEV;
 	}
 
-	if (xe_observation_paranoid && !perfmon_capable()) {
+	ret = xe_observation_paranoid_check();
+	if (ret) {
 		drm_dbg(&xe->drm,  "Insufficient privileges for EU stall monitoring\n");
-		return -EACCES;
+		return ret;
 	}
 
 	/* Initialize and set default values */
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 4bf4b1f65929f..9fbd21b0ef974 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1698,11 +1698,12 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct xe_oa_stream *stream = file->private_data;
+	int ret = xe_observation_paranoid_check();
 	struct xe_bo *bo = stream->oa_buffer.bo;
 
-	if (xe_observation_paranoid && !perfmon_capable()) {
+	if (ret) {
 		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
-		return -EACCES;
+		return ret;
 	}
 
 	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
@@ -2073,10 +2074,12 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		privileged_op = true;
 	}
 
-	if (privileged_op && xe_observation_paranoid && !perfmon_capable()) {
-		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe OA stream\n");
-		ret = -EACCES;
-		goto err_exec_q;
+	if (privileged_op) {
+		ret = xe_observation_paranoid_check();
+		if (ret) {
+			drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe OA stream\n");
+			goto err_exec_q;
+		}
 	}
 
 	if (!param.exec_q && !param.sample) {
@@ -2358,9 +2361,10 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
 		return -ENODEV;
 	}
 
-	if (xe_observation_paranoid && !perfmon_capable()) {
+	err = xe_observation_paranoid_check();
+	if (err) {
 		drm_dbg(&oa->xe->drm, "Insufficient privileges to add xe OA config\n");
-		return -EACCES;
+		return err;
 	}
 
 	err = copy_from_user(&param, u64_to_user_ptr(data), sizeof(param));
@@ -2460,9 +2464,10 @@ int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file
 		return -ENODEV;
 	}
 
-	if (xe_observation_paranoid && !perfmon_capable()) {
+	ret = xe_observation_paranoid_check();
+	if (ret) {
 		drm_dbg(&oa->xe->drm, "Insufficient privileges to remove xe OA config\n");
-		return -EACCES;
+		return ret;
 	}
 
 	ret = get_user(arg, ptr);
diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
index e3f9b546207e4..39e05b9131a74 100644
--- a/drivers/gpu/drm/xe/xe_observation.c
+++ b/drivers/gpu/drm/xe/xe_observation.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/errno.h>
+#include <linux/perf_event.h>
 #include <linux/sysctl.h>
 
 #include <uapi/drm/xe_drm.h>
@@ -12,9 +13,28 @@
 #include "xe_oa.h"
 #include "xe_observation.h"
 
-u32 xe_observation_paranoid = true;
+static u32 xe_observation_paranoid = true;
 static struct ctl_table_header *sysctl_header;
 
+/**
+ * xe_observation_paranoid_check - Gate access to xe observation streams.
+ *
+ * When the xe-specific observation_paranoid sysctl is enabled (the
+ * default), defer to perf_allow_cpu() so that access is governed by the
+ * same policy as system-wide perf CPU events: kernel.perf_event_paranoid
+ * plus the security_perf_event_open() LSM hook. When the sysctl has been
+ * cleared by a privileged user, observation is open to all callers.
+ *
+ * Return: 0 if access is permitted, a negative errno otherwise.
+ */
+int xe_observation_paranoid_check(void)
+{
+	if (!xe_observation_paranoid)
+		return 0;
+
+	return perf_allow_cpu();
+}
+
 static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
 		       struct drm_file *file)
 {
@@ -83,11 +103,13 @@ static const struct ctl_table observation_ctl_table[] = {
 };
 
 /**
- * xe_observation_sysctl_register - Register xe_observation_paranoid sysctl
+ * xe_observation_sysctl_register - Register the observation_paranoid sysctl
  *
- * Normally only superuser/root can access observation stream
- * data. However, superuser can set xe_observation_paranoid sysctl to 0 to
- * allow non-privileged users to also access observation data.
+ * When dev.xe.observation_paranoid is set (the default), access to
+ * observation streams follows the system-wide perf_allow_cpu() policy:
+ * kernel.perf_event_paranoid plus the security_perf_event_open() LSM
+ * hook. A privileged user can clear the sysctl to bypass that gate and
+ * allow unprivileged access to observation data.
  *
  * Return: always returns 0
  */
diff --git a/drivers/gpu/drm/xe/xe_observation.h b/drivers/gpu/drm/xe/xe_observation.h
index 17816998e9666..73a03e03c96a7 100644
--- a/drivers/gpu/drm/xe/xe_observation.h
+++ b/drivers/gpu/drm/xe/xe_observation.h
@@ -11,8 +11,7 @@
 struct drm_device;
 struct drm_file;
 
-extern u32 xe_observation_paranoid;
-
+int xe_observation_paranoid_check(void);
 int xe_observation_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
 int xe_observation_sysctl_register(void);
 void xe_observation_sysctl_unregister(void);
-- 
2.54.0

