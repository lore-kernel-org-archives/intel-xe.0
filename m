Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26904C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 17:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79A210E7B5;
	Thu,  8 Aug 2024 17:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbGKVLw0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60E010E7CA
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723138910; x=1754674910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GeCJECOJNrpz31yFt2tUva0OfeIy3T3a0z6B0uhhABQ=;
 b=SbGKVLw0CASKOCGTjCb6V4Ej5tEoWlIcqizOnijmToqT+66ZbQPTrg5m
 yYyWpNkC39ciWR+quSv/iFWflSlnYLZxyJRr5oQmgYAXiqicwXkJSd2La
 OX8ZfUzS91YifqfEA2Zppr0CoWbxov4vks/3vh4bwCnlsEgPFUOtsf81r
 3cMSrFF+vw7ri6JbHGN0d8IhaiPbK4ww8AZ9rltYx+b65oUxnBOC/M1U4
 rrO8RJJ2KdtDzgo5c6AFq098iamfQOgaTLhuQpesj/bRQf2xVyTr9Nj8n
 cD8/Pfxlz/MbjKwtG0elCvMwGp6MBhSXbgEBszUBkgpRrQO0lT7x8rW/s A==;
X-CSE-ConnectionGUID: /+YyxxiaTVOfgEUxP8k5WA==
X-CSE-MsgGUID: 2xqztIHqSQKdDRcIX4olZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21256067"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="21256067"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:41:49 -0700
X-CSE-ConnectionGUID: Lqv4AnfSSQOVsO255VuW7A==
X-CSE-MsgGUID: kiiWO6MGRAu8cg/Zb7OqtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="57850464"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:41:49 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jose Souza <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: [PATCH 8/8] drm/xe/oa: Allow only certain property changes from
 config ioctl
Date: Thu,  8 Aug 2024 10:41:39 -0700
Message-ID: <20240808174139.4027534-9-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 69 ++++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index c9f77f0342b60..27654a0d4358f 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1133,9 +1133,12 @@ static int decode_oa_format(struct xe_oa *oa, u64 fmt, enum xe_oa_format_name *n
 	return -EINVAL;
 }
 
-static int xe_oa_set_prop_oa_unit_id(struct xe_oa *oa, u64 value,
+static int xe_oa_set_prop_oa_unit_id(struct xe_oa *oa, u64 value, bool all,
 				     struct xe_oa_open_param *param)
 {
+	if (!all)
+		return -EINVAL;
+
 	if (value >= oa->oa_unit_ids) {
 		drm_dbg(&oa->xe->drm, "OA unit ID out of range %lld\n", value);
 		return -EINVAL;
@@ -1144,25 +1147,32 @@ static int xe_oa_set_prop_oa_unit_id(struct xe_oa *oa, u64 value,
 	return 0;
 }
 
-static int xe_oa_set_prop_sample_oa(struct xe_oa *oa, u64 value,
+static int xe_oa_set_prop_sample_oa(struct xe_oa *oa, u64 value, bool all,
 				    struct xe_oa_open_param *param)
 {
+	if (!all)
+		return -EINVAL;
+
 	param->sample = value;
 	return 0;
 }
 
-static int xe_oa_set_prop_metric_set(struct xe_oa *oa, u64 value,
+static int xe_oa_set_prop_metric_set(struct xe_oa *oa, u64 value, bool all,
 				     struct xe_oa_open_param *param)
 {
 	param->metric_set = value;
 	return 0;
 }
 
-static int xe_oa_set_prop_oa_format(struct xe_oa *oa, u64 value,
+static int xe_oa_set_prop_oa_format(struct xe_oa *oa, u64 value, bool all,
 				    struct xe_oa_open_param *param)
 {
-	int ret = decode_oa_format(oa, value, &param->oa_format);
+	int ret;
 
+	if (!all)
+		return -EINVAL;
+
+	ret = decode_oa_format(oa, value, &param->oa_format);
 	if (ret) {
 		drm_dbg(&oa->xe->drm, "Unsupported OA report format %#llx\n", value);
 		return ret;
@@ -1170,11 +1180,14 @@ static int xe_oa_set_prop_oa_format(struct xe_oa *oa, u64 value,
 	return 0;
 }
 
-static int xe_oa_set_prop_oa_exponent(struct xe_oa *oa, u64 value,
+static int xe_oa_set_prop_oa_exponent(struct xe_oa *oa, u64 value, bool all,
 				      struct xe_oa_open_param *param)
 {
 #define OA_EXPONENT_MAX 31
 
+	if (!all)
+		return -EINVAL;
+
 	if (value > OA_EXPONENT_MAX) {
 		drm_dbg(&oa->xe->drm, "OA timer exponent too high (> %u)\n", OA_EXPONENT_MAX);
 		return -EINVAL;
@@ -1183,49 +1196,61 @@ static int xe_oa_set_prop_oa_exponent(struct xe_oa *oa, u64 value,
 	return 0;
 }
 
-static int xe_oa_set_prop_disabled(struct xe_oa *oa, u64 value,
+static int xe_oa_set_prop_disabled(struct xe_oa *oa, u64 value, bool all,
 				   struct xe_oa_open_param *param)
 {
+	if (!all)
+		return -EINVAL;
+
 	param->disabled = value;
 	return 0;
 }
 
-static int xe_oa_set_prop_exec_queue_id(struct xe_oa *oa, u64 value,
+static int xe_oa_set_prop_exec_queue_id(struct xe_oa *oa, u64 value, bool all,
 					struct xe_oa_open_param *param)
 {
+	if (!all)
+		return -EINVAL;
+
 	param->exec_queue_id = value;
 	return 0;
 }
 
-static int xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value,
+static int xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value, bool all,
 					  struct xe_oa_open_param *param)
 {
+	if (!all)
+		return -EINVAL;
+
 	param->engine_instance = value;
 	return 0;
 }
 
-static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
+static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value, bool all,
 				struct xe_oa_open_param *param)
 {
+	if (!all)
+		return -EINVAL;
+
 	param->no_preempt = value;
 	return 0;
 }
 
-static int xe_oa_set_num_syncs(struct xe_oa *oa, u64 value,
+static int xe_oa_set_num_syncs(struct xe_oa *oa, u64 value, bool all,
 			       struct xe_oa_open_param *param)
 {
 	param->num_syncs = value;
 	return 0;
 }
 
-static int xe_oa_set_syncs_user(struct xe_oa *oa, u64 value,
+static int xe_oa_set_syncs_user(struct xe_oa *oa, u64 value, bool all,
 				struct xe_oa_open_param *param)
 {
 	param->syncs_user = u64_to_user_ptr(value);
 	return 0;
 }
 
-typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
+typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value, bool all,
 				     struct xe_oa_open_param *param);
 static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
 	[DRM_XE_OA_PROPERTY_OA_UNIT_ID] = xe_oa_set_prop_oa_unit_id,
@@ -1241,7 +1266,7 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
 	[DRM_XE_OA_PROPERTY_SYNCS] = xe_oa_set_syncs_user,
 };
 
-static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
+static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension, bool all,
 				       struct xe_oa_open_param *param)
 {
 	u64 __user *address = u64_to_user_ptr(extension);
@@ -1258,18 +1283,18 @@ static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_oa_set_property_funcs));
-	return xe_oa_set_property_funcs[idx](oa, ext.value, param);
+	return xe_oa_set_property_funcs[idx](oa, ext.value, all, param);
 }
 
-typedef int (*xe_oa_user_extension_fn)(struct xe_oa *oa, u64 extension,
+typedef int (*xe_oa_user_extension_fn)(struct xe_oa *oa, u64 extension, bool all,
 				       struct xe_oa_open_param *param);
 static const xe_oa_user_extension_fn xe_oa_user_extension_funcs[] = {
 	[DRM_XE_OA_EXTENSION_SET_PROPERTY] = xe_oa_user_ext_set_property,
 };
 
 #define MAX_USER_EXTENSIONS	16
-static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number,
-				 struct xe_oa_open_param *param)
+static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, bool all,
+				 int ext_number, struct xe_oa_open_param *param)
 {
 	u64 __user *address = u64_to_user_ptr(extension);
 	struct drm_xe_user_extension ext;
@@ -1288,12 +1313,12 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.name, ARRAY_SIZE(xe_oa_user_extension_funcs));
-	err = xe_oa_user_extension_funcs[idx](oa, extension, param);
+	err = xe_oa_user_extension_funcs[idx](oa, extension, all, param);
 	if (XE_IOCTL_DBG(oa->xe, err))
 		return err;
 
 	if (ext.next_extension)
-		return xe_oa_user_extensions(oa, ext.next_extension, ++ext_number, param);
+		return xe_oa_user_extensions(oa, ext.next_extension, all, ++ext_number, param);
 
 	return 0;
 }
@@ -1439,7 +1464,7 @@ static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
 	struct xe_oa_config *config;
 	int err;
 
-	err = xe_oa_user_extensions(stream->oa, arg, 0, &param);
+	err = xe_oa_user_extensions(stream->oa, arg, false, 0, &param);
 	if (err)
 		return err;
 
@@ -1989,7 +2014,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 	}
 
 	param.xef = xef;
-	ret = xe_oa_user_extensions(oa, data, 0, &param);
+	ret = xe_oa_user_extensions(oa, data, true, 0, &param);
 	if (ret)
 		return ret;
 
-- 
2.41.0

