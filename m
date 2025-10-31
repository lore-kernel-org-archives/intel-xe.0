Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7230ECCFA08
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:29:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F84310E307;
	Fri, 31 Oct 2025 18:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsGgmoD/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499BE10E2FE
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935384; x=1793471384;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=v9P1qE7RE2SHdOx/b82VF7fJLrN5buVcxe2ypgIP7O0=;
 b=RsGgmoD/nabowdYGVsRe4/YpCYA1xiYUrztumnQ8E6ug9PA6v6kMbgNS
 FidSebrFJavoBSyMS5hvNIhtBtMtwmKoQKan/BizuTisW2dBi4FsNfTGz
 6I6WLPNzj/sBJ6i4VRnZDmw4Noxjrs3CgO56TLNQOsBmyskO/bfncKj42
 969jzgzZEyCoyELJewoL6bH7PpMHd8XLsfXqUnpr/ngw+FxdgwRFkpZFg
 IZDJZcr+myT3kFOViZbSi4yexSCxPl/QBqWGirVAVorTj+NGx81BEfVKd
 q3ia8Ewoo+VWHBSLhYSt39Q09HSL/GFdmum0cHNHhY4nXxj6TR2J0gs12 g==;
X-CSE-ConnectionGUID: NdRTZFGkSQyLuMTLl37FFg==
X-CSE-MsgGUID: AEwYktTbSU2rZ1xc60pj9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63123855"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="63123855"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:43 -0700
X-CSE-ConnectionGUID: nkpztgClSQu/uR5uzXpaRw==
X-CSE-MsgGUID: h39lMhrYRKGbEzbNeAUSgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="185987632"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 05/16] drm/xe/multi_queue: Handle invalid exec queue property
 setting
Date: Fri, 31 Oct 2025 11:29:25 -0700
Message-ID: <20251031182936.1882062-6-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
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

Only MULTI_QUEUE_PRIORITY property is valid for secondary queues of a
multi queue group. MULTI_QUEUE_PRIORITY only applies to multi queue group
queues. Detect invalid user queue property setting and return error.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 66 ++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0da256428916..78b3a0e2ddd3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -61,7 +61,7 @@ enum xe_exec_queue_sched_prop {
 };
 
 static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
-				      u64 extensions, int ext_number);
+				      u64 extensions);
 
 static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
 {
@@ -206,7 +206,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 		 * may set q->usm, must come before xe_lrc_create(),
 		 * may overwrite q->sched_props, must come before q->ops->init()
 		 */
-		err = exec_queue_user_extensions(xe, q, extensions, 0);
+		err = exec_queue_user_extensions(xe, q, extensions);
 		if (err) {
 			__xe_exec_queue_free(q);
 			return ERR_PTR(err);
@@ -747,9 +747,35 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 							exec_queue_set_multi_queue_priority,
 };
 
+static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64 properties)
+{
+	u64 secondary_queue_valid_props = BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP) |
+				  BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY);
+
+	/*
+	 * Only MULTI_QUEUE_PRIORITY property is valid for secondary queues of a
+	 * multi-queue group.
+	 */
+	if (xe_exec_queue_is_multi_queue_secondary(q) &&
+	    properties & ~secondary_queue_valid_props)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int exec_queue_user_ext_check_final(struct xe_exec_queue *q, u64 properties)
+{
+	/* MULTI_QUEUE_PRIORITY only applies to multi-queue group queues */
+	if ((properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY)) &&
+	    !(properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP)))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
 					    struct xe_exec_queue *q,
-					    u64 extension)
+					    u64 extension, u64 *properties)
 {
 	u64 __user *address = u64_to_user_ptr(extension);
 	struct drm_xe_ext_set_property ext;
@@ -774,20 +800,25 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 	if (!exec_queue_set_property_funcs[idx])
 		return -EINVAL;
 
+	*properties |= BIT_ULL(idx);
+	err = exec_queue_user_ext_check(q, *properties);
+	if (XE_IOCTL_DBG(xe, err))
+		return err;
+
 	return exec_queue_set_property_funcs[idx](xe, q, ext.value);
 }
 
 typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
 					       struct xe_exec_queue *q,
-					       u64 extension);
+					       u64 extension, u64 *properties);
 
 static const xe_exec_queue_user_extension_fn exec_queue_user_extension_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
 };
 
 #define MAX_USER_EXTENSIONS	16
-static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
-				      u64 extensions, int ext_number)
+static int __exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
+					u64 extensions, int ext_number, u64 *properties)
 {
 	u64 __user *address = u64_to_user_ptr(extensions);
 	struct drm_xe_user_extension ext;
@@ -808,13 +839,30 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 
 	idx = array_index_nospec(ext.name,
 				 ARRAY_SIZE(exec_queue_user_extension_funcs));
-	err = exec_queue_user_extension_funcs[idx](xe, q, extensions);
+	err = exec_queue_user_extension_funcs[idx](xe, q, extensions, properties);
 	if (XE_IOCTL_DBG(xe, err))
 		return err;
 
 	if (ext.next_extension)
-		return exec_queue_user_extensions(xe, q, ext.next_extension,
-						  ++ext_number);
+		return __exec_queue_user_extensions(xe, q, ext.next_extension,
+						    ++ext_number, properties);
+
+	return 0;
+}
+
+static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
+				      u64 extensions)
+{
+	u64 properties = 0;
+	int err;
+
+	err = __exec_queue_user_extensions(xe, q, extensions, 0, &properties);
+	if (XE_IOCTL_DBG(xe, err))
+		return err;
+
+	err = exec_queue_user_ext_check_final(q, properties);
+	if (XE_IOCTL_DBG(xe, err))
+		return err;
 
 	if (xe_exec_queue_is_multi_queue_primary(q)) {
 		err = xe_exec_queue_group_init(xe, q);
-- 
2.43.0

