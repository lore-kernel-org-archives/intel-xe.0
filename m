Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ED8CDD0E2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 20:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BB110E214;
	Tue, 22 Oct 2024 20:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjWreyBw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B28810E03C
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 20:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729627441; x=1761163441;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oRDeV/D14dHgL/gQSmwycsBg1cVKnl7hyI7IYN5NWAE=;
 b=WjWreyBwzd0eKHuatw62JKPYgs0sMLuvrHaqiOn/8vEUWo3oc0zh2frc
 urbwhYN8z6y3DiFa3AYpWJgYotKpQ3fanWmvMhtxHWIAa7e6xKmattNi4
 2tnRgG6dgz9F5tKPy+IGYoLvVtpkBGdK8esvDfpEm4c3RJzu68kG8ZfvM
 1RLdCzJ1OCG43dhO1mwvOrKStIEQVb7J/N3owTDwO2BH76CvTZURd+kur
 1t7ft5jIMWZRbEQ+MKvU7YTaDdojlx5X2Yf5gyL3PNjqKoDEPNQ8x96y8
 evuh03OX5/Qf1eOsY8Lr7iAwZYky2KTonbTbHs7VWp1sqVlRK+qOymKzL Q==;
X-CSE-ConnectionGUID: oXy2ZMobQWa7Tuj2J1ppGQ==
X-CSE-MsgGUID: 3KILLCI0QS66V4yXUlCWEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28966840"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28966840"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 13:04:00 -0700
X-CSE-ConnectionGUID: ft/Jm7rkTe+JhOhGQY3d7A==
X-CSE-MsgGUID: 3hGhulAcQdGuEhOqEkeZYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="84570360"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 13:03:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 7/7] drm/xe/oa: Allow only certain property changes from config
Date: Tue, 22 Oct 2024 13:03:52 -0700
Message-ID: <20241022200352.1192560-8-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20241022200352.1192560-1-ashutosh.dixit@intel.com>
References: <20241022200352.1192560-1-ashutosh.dixit@intel.com>
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

Whereas all properties can be specified during OA stream open, when the OA
stream is reconfigured only the config_id and syncs can be specified.

v2: Use separate function table for reconfig case (Jonathan)
    Change bool function args to enum (Matt B)
v3: s/xe_oa_set_property_funcs/xe_oa_set_property_funcs_open/ (Jonathan)

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 60 +++++++++++++++++++++++++++++---------
 1 file changed, 46 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 9806caf1e530d..fd2ffe8df1561 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -47,6 +47,11 @@ enum xe_oa_submit_deps {
 	XE_OA_SUBMIT_ADD_DEPS,
 };
 
+enum xe_oa_user_extn_from {
+	XE_OA_USER_EXTN_FROM_OPEN,
+	XE_OA_USER_EXTN_FROM_CONFIG,
+};
+
 struct xe_oa_reg {
 	struct xe_reg addr;
 	u32 value;
@@ -1255,9 +1260,15 @@ static int xe_oa_set_prop_syncs_user(struct xe_oa *oa, u64 value,
 	return 0;
 }
 
+static int xe_oa_set_prop_ret_inval(struct xe_oa *oa, u64 value,
+				    struct xe_oa_open_param *param)
+{
+	return -EINVAL;
+}
+
 typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
 				     struct xe_oa_open_param *param);
-static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
+static const xe_oa_set_property_fn xe_oa_set_property_funcs_open[] = {
 	[DRM_XE_OA_PROPERTY_OA_UNIT_ID] = xe_oa_set_prop_oa_unit_id,
 	[DRM_XE_OA_PROPERTY_SAMPLE_OA] = xe_oa_set_prop_sample_oa,
 	[DRM_XE_OA_PROPERTY_OA_METRIC_SET] = xe_oa_set_prop_metric_set,
@@ -1271,8 +1282,22 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
 	[DRM_XE_OA_PROPERTY_SYNCS] = xe_oa_set_prop_syncs_user,
 };
 
-static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
-				       struct xe_oa_open_param *param)
+static const xe_oa_set_property_fn xe_oa_set_property_funcs_config[] = {
+	[DRM_XE_OA_PROPERTY_OA_UNIT_ID] = xe_oa_set_prop_ret_inval,
+	[DRM_XE_OA_PROPERTY_SAMPLE_OA] = xe_oa_set_prop_ret_inval,
+	[DRM_XE_OA_PROPERTY_OA_METRIC_SET] = xe_oa_set_prop_metric_set,
+	[DRM_XE_OA_PROPERTY_OA_FORMAT] = xe_oa_set_prop_ret_inval,
+	[DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT] = xe_oa_set_prop_ret_inval,
+	[DRM_XE_OA_PROPERTY_OA_DISABLED] = xe_oa_set_prop_ret_inval,
+	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] = xe_oa_set_prop_ret_inval,
+	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] = xe_oa_set_prop_ret_inval,
+	[DRM_XE_OA_PROPERTY_NO_PREEMPT] = xe_oa_set_prop_ret_inval,
+	[DRM_XE_OA_PROPERTY_NUM_SYNCS] = xe_oa_set_prop_num_syncs,
+	[DRM_XE_OA_PROPERTY_SYNCS] = xe_oa_set_prop_syncs_user,
+};
+
+static int xe_oa_user_ext_set_property(struct xe_oa *oa, enum xe_oa_user_extn_from from,
+				       u64 extension, struct xe_oa_open_param *param)
 {
 	u64 __user *address = u64_to_user_ptr(extension);
 	struct drm_xe_ext_set_property ext;
@@ -1283,23 +1308,30 @@ static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
 	if (XE_IOCTL_DBG(oa->xe, err))
 		return -EFAULT;
 
-	if (XE_IOCTL_DBG(oa->xe, ext.property >= ARRAY_SIZE(xe_oa_set_property_funcs)) ||
+	BUILD_BUG_ON(ARRAY_SIZE(xe_oa_set_property_funcs_open) !=
+		     ARRAY_SIZE(xe_oa_set_property_funcs_config));
+
+	if (XE_IOCTL_DBG(oa->xe, ext.property >= ARRAY_SIZE(xe_oa_set_property_funcs_open)) ||
 	    XE_IOCTL_DBG(oa->xe, ext.pad))
 		return -EINVAL;
 
-	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_oa_set_property_funcs));
-	return xe_oa_set_property_funcs[idx](oa, ext.value, param);
+	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_oa_set_property_funcs_open));
+
+	if (from == XE_OA_USER_EXTN_FROM_CONFIG)
+		return xe_oa_set_property_funcs_config[idx](oa, ext.value, param);
+	else
+		return xe_oa_set_property_funcs_open[idx](oa, ext.value, param);
 }
 
-typedef int (*xe_oa_user_extension_fn)(struct xe_oa *oa, u64 extension,
-				       struct xe_oa_open_param *param);
+typedef int (*xe_oa_user_extension_fn)(struct xe_oa *oa,  enum xe_oa_user_extn_from from,
+				       u64 extension, struct xe_oa_open_param *param);
 static const xe_oa_user_extension_fn xe_oa_user_extension_funcs[] = {
 	[DRM_XE_OA_EXTENSION_SET_PROPERTY] = xe_oa_user_ext_set_property,
 };
 
 #define MAX_USER_EXTENSIONS	16
-static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number,
-				 struct xe_oa_open_param *param)
+static int xe_oa_user_extensions(struct xe_oa *oa, enum xe_oa_user_extn_from from, u64 extension,
+				 int ext_number, struct xe_oa_open_param *param)
 {
 	u64 __user *address = u64_to_user_ptr(extension);
 	struct drm_xe_user_extension ext;
@@ -1318,12 +1350,12 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.name, ARRAY_SIZE(xe_oa_user_extension_funcs));
-	err = xe_oa_user_extension_funcs[idx](oa, extension, param);
+	err = xe_oa_user_extension_funcs[idx](oa, from, extension, param);
 	if (XE_IOCTL_DBG(oa->xe, err))
 		return err;
 
 	if (ext.next_extension)
-		return xe_oa_user_extensions(oa, ext.next_extension, ++ext_number, param);
+		return xe_oa_user_extensions(oa, from, ext.next_extension, ++ext_number, param);
 
 	return 0;
 }
@@ -1469,7 +1501,7 @@ static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
 	struct xe_oa_config *config;
 	int err;
 
-	err = xe_oa_user_extensions(stream->oa, arg, 0, &param);
+	err = xe_oa_user_extensions(stream->oa, XE_OA_USER_EXTN_FROM_CONFIG, arg, 0, &param);
 	if (err)
 		return err;
 
@@ -2023,7 +2055,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 	}
 
 	param.xef = xef;
-	ret = xe_oa_user_extensions(oa, data, 0, &param);
+	ret = xe_oa_user_extensions(oa, XE_OA_USER_EXTN_FROM_OPEN, data, 0, &param);
 	if (ret)
 		return ret;
 
-- 
2.41.0

