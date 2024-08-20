Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555EAC52D7C
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 00:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213F410E32E;
	Tue, 20 Aug 2024 00:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fV5NtfO+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C91810E32E
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 00:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724115496; x=1755651496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cslacJ2opbHkP0JcLqh4pRNzxhrpiv1AUWKrvy5YRac=;
 b=fV5NtfO+YBjqo2kcJBn2xTMo8kw5LzB8pWa5jSF+3WMv7NzYjDSJWx7P
 07Kj/BrqlL1ZeAf7Ac6xabQCl9ZHuz5XfOxHEwM0srSH4/u/FWefe+7SX
 IoimoLFh5WLxAu8taCj33RLhqTpGQmA+GYEm6LAwfhYBWK/YJnohRPpaS
 Uik7XZ1tMvQRUveUr8Hsz1/fg96ac3GeDcbu3Ixeq0DdXv6gMFJOMrjB7
 /06zxFO8wpQ2fBcCoyy+ynd4ERbEuM+7r1C1+dkvB5Pcen7wGHHvV02TY
 JAcLByJ9OoUFB5r3GFETaOoD1GUQhv2f+Gus5bYg8+1r2nvJroqT7lIT6 w==;
X-CSE-ConnectionGUID: rrMiHxhNQ+CZ9efTRNwvlg==
X-CSE-MsgGUID: hM5sMutYRvONdSl2CNLbaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33057767"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="33057767"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 17:58:16 -0700
X-CSE-ConnectionGUID: AsQF/ieeQjeM1nBtZrDqbg==
X-CSE-MsgGUID: +1w3UhfNRQmE4RMftQmFQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="91319951"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 17:58:16 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Jose Souza <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 7/7] drm/xe/oa: Allow only certain property changes from config
Date: Mon, 19 Aug 2024 17:58:08 -0700
Message-ID: <20240820005808.1412649-8-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240820005808.1412649-1-ashutosh.dixit@intel.com>
References: <20240820005808.1412649-1-ashutosh.dixit@intel.com>
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 51 ++++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index f43767e0a75ec..96420c3ea10fd 100644
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
@@ -1246,6 +1251,12 @@ static int xe_oa_set_prop_syncs_user(struct xe_oa *oa, u64 value,
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
 static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
@@ -1262,8 +1273,22 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
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
@@ -1279,18 +1304,22 @@ static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_oa_set_property_funcs));
-	return xe_oa_set_property_funcs[idx](oa, ext.value, param);
+
+	if (from == XE_OA_USER_EXTN_FROM_CONFIG)
+		return xe_oa_set_property_funcs_config[idx](oa, ext.value, param);
+	else
+		return xe_oa_set_property_funcs[idx](oa, ext.value, param);
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
@@ -1309,12 +1338,12 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
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
@@ -1460,7 +1489,7 @@ static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
 	struct xe_oa_config *config;
 	int err;
 
-	err = xe_oa_user_extensions(stream->oa, arg, 0, &param);
+	err = xe_oa_user_extensions(stream->oa, XE_OA_USER_EXTN_FROM_CONFIG, arg, 0, &param);
 	if (err)
 		return err;
 
@@ -2011,7 +2040,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 	}
 
 	param.xef = xef;
-	ret = xe_oa_user_extensions(oa, data, 0, &param);
+	ret = xe_oa_user_extensions(oa, XE_OA_USER_EXTN_FROM_OPEN, data, 0, &param);
 	if (ret)
 		return ret;
 
-- 
2.41.0

