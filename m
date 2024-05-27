Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B283EC25B75
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 01:37:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE10610EAB5;
	Mon, 27 May 2024 01:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="epQ/5V7o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811F410EACC
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 01:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716773820; x=1748309820;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Mg2JL+NvcBm9R7WAAAa0Xtw8G+F6hXCnk2gTe4EyB7w=;
 b=epQ/5V7o+MbEnO2tdJkc57kHHwlGWTI0Sgjaepc2yvXCSqFo2e0U7GIS
 RrQq7J8ImzeWuAryi/MYLKYdNGnbjmeRKTCPqsARoli/6yKtAtA8wi5Jk
 LiUiexKrDDZqaF3P4lnXFjYf1xTnagks+Fyv62TJeQIisb4CK+VYP5ieK
 UbWVa4LdbaqnDq0FdgfS++yrpddGEXkGSmegw9B177/mLTerSpSNVYR1N
 5oNa3fW0NJFHDriHnpA1yFEcJuikJ9sTiD+Fw0vB7cTm1H8noW8IsArKU
 jU4V96YnYoHex2sC4DBtF3sMDVAR3Ha9pJs8pOvoX3YVSadlbdWpg+Kat Q==;
X-CSE-ConnectionGUID: PgC+V4oYTxSe8gkZONX/4A==
X-CSE-MsgGUID: 87S3wbOHS3ecqiRbi5QTIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="16899142"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="16899142"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 18:36:58 -0700
X-CSE-ConnectionGUID: QbS5tIw3RICpWXM7WUBxHQ==
X-CSE-MsgGUID: 5OnnBVn2ROGh5sF9fbNuKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="34494492"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 18:36:58 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/1] drm/xe/oa: Combined diff of changes between v14 and v15
Date: Sun, 26 May 2024 18:36:55 -0700
Message-ID: <20240527013655.603514-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240527013655.603514-1-ashutosh.dixit@intel.com>
References: <20240527013655.603514-1-ashutosh.dixit@intel.com>
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

Because Xe OA changes between successive revisions are distributed across
multiple patches, provide a combined diff of all changes in a single patch
to help with code review.

These changes pertain to: https://patchwork.freedesktop.org/series/121084/

This patch will not compile, it's purpose is to just provide the diff.

* Fix 32 bit build issues

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c   | 16 +++++++---------
 drivers/gpu/drm/xe/xe_oa.h   |  9 +++------
 drivers/gpu/drm/xe/xe_perf.c |  6 +++---
 3 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 38e6364a60b1..3ed4ca19f9cd 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -401,7 +401,7 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 
 static u32 __format_to_oactrl(const struct xe_oa_format *format, int counter_sel_mask)
 {
-	return ((format->counter_select << __bf_shf(counter_sel_mask)) & counter_sel_mask) |
+	return ((format->counter_select << (ffs(counter_sel_mask) - 1)) & counter_sel_mask) |
 		REG_FIELD_PREP(OA_OACONTROL_REPORT_BC_MASK, format->bc_report) |
 		REG_FIELD_PREP(OA_OACONTROL_COUNTER_SIZE_MASK, format->counter_size);
 }
@@ -1698,7 +1698,7 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
 	return 0;
 }
 
-int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
 {
 	struct xe_oa *oa = &to_xe_device(dev)->oa;
 	struct xe_file *xef = to_xe_file(file);
@@ -1712,7 +1712,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file
 		return -ENODEV;
 	}
 
-	ret = xe_oa_user_extensions(oa, (u64)data, 0, &param);
+	ret = xe_oa_user_extensions(oa, data, 0, &param);
 	if (ret)
 		return ret;
 
@@ -1963,8 +1963,7 @@ static int create_dynamic_oa_sysfs_entry(struct xe_oa *oa,
 	return sysfs_create_group(oa->metrics_kobj, &oa_config->sysfs_metric);
 }
 
-int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
-			   struct drm_file *file)
+int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
 {
 	struct xe_oa *oa = &to_xe_device(dev)->oa;
 	struct drm_xe_oa_config param;
@@ -1983,7 +1982,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
 		return -EACCES;
 	}
 
-	err = __copy_from_user(&param, data, sizeof(param));
+	err = __copy_from_user(&param, u64_to_user_ptr(data), sizeof(param));
 	if (XE_IOCTL_DBG(oa->xe, err))
 		return -EFAULT;
 
@@ -2059,12 +2058,11 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
 	return err;
 }
 
-int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
-			      struct drm_file *file)
+int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
 {
 	struct xe_oa *oa = &to_xe_device(dev)->oa;
 	struct xe_oa_config *oa_config;
-	u64 arg, *ptr = data;
+	u64 arg, *ptr = u64_to_user_ptr(data);
 	int ret;
 
 	if (!oa->xe) {
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index 6308aa1829bd..d2f50c3accf3 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -18,12 +18,9 @@ int xe_oa_init(struct xe_device *xe);
 void xe_oa_fini(struct xe_device *xe);
 void xe_oa_register(struct xe_device *xe);
 void xe_oa_unregister(struct xe_device *xe);
-int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
-			    struct drm_file *file);
-int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
-			   struct drm_file *file);
-int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
-			      struct drm_file *file);
+int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *file);
+int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file);
+int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file);
 u32 xe_oa_timestamp_frequency(struct xe_gt *gt);
 u16 xe_oa_unit_id(struct xe_hw_engine *hwe);
 
diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
index 2c0615481b7d..06739787d0e7 100644
--- a/drivers/gpu/drm/xe/xe_perf.c
+++ b/drivers/gpu/drm/xe/xe_perf.c
@@ -17,11 +17,11 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg,
 {
 	switch (arg->perf_op) {
 	case DRM_XE_PERF_OP_STREAM_OPEN:
-		return xe_oa_stream_open_ioctl(dev, (void *)arg->param, file);
+		return xe_oa_stream_open_ioctl(dev, arg->param, file);
 	case DRM_XE_PERF_OP_ADD_CONFIG:
-		return xe_oa_add_config_ioctl(dev, (void *)arg->param, file);
+		return xe_oa_add_config_ioctl(dev, arg->param, file);
 	case DRM_XE_PERF_OP_REMOVE_CONFIG:
-		return xe_oa_remove_config_ioctl(dev, (void *)arg->param, file);
+		return xe_oa_remove_config_ioctl(dev, arg->param, file);
 	default:
 		return -EINVAL;
 	}
-- 
2.41.0

