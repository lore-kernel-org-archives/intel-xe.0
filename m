Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0DCC54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 09:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFC310EB6E;
	Mon, 18 Mar 2024 09:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="al0D9W1+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB7210EB6E
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 09:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710753882; x=1742289882;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ADqriz7Qgw+5gaW5fMez1fSbO/0AbHy7NZoynuVJJpE=;
 b=al0D9W1+FBxs4VDmifPzNclpnMI1KqqUJhFEA6tlHMVu1loIdRtlG61B
 oEREL8pbeGpoT3CqF48wAcidSNVpSE7s+YhBSJnZUt0uKrnFgEqRw2bvy
 +VtCk2DH6vVPrkTubVLW+KmreRC6BwmZpmVwzPVYlOvnHFajTx0BXtY43
 XIgN3i2/mlzNftbvp5tLrU6H7P18s19xoysjWLtxHRxTeW++9Gh1rKbTh
 /RS2cBDlhLYMU/bE2i8wS3PtXMg00CCdyY1ZXULL9csnXB0GD2pZY2hQP
 L0qOEJHKjOq8Y5OKbs4/djVxKLxR+SkpL7ukJlmV/OPdXyrqcOSrZngj7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16192010"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="16192010"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:24:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="50844955"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:24:40 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Remove usage of unsafe strcpy
Date: Mon, 18 Mar 2024 10:10:55 +0100
Message-ID: <20240318091055.638-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Remove usage of unsafe strcpy with a helper function
to convert engine class to string.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 44 ++++++++++---------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index 9e23ca7f45ad..c17cce53f19d 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -499,8 +499,8 @@ static void kobj_xe_hw_engine_class_fini(struct drm_device *drm, void *arg)
 	kobject_put(kobj);
 }
 
-	static struct kobj_eclass *
-kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, char *name)
+static struct kobj_eclass *
+kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char *name)
 {
 	struct kobj_eclass *keclass;
 	int err = 0;
@@ -635,6 +635,24 @@ static void hw_engine_class_sysfs_fini(struct drm_device *drm, void *arg)
 	kobject_put(kobj);
 }
 
+static const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
+{
+	switch (class) {
+	case XE_ENGINE_CLASS_RENDER:
+		return "rcs";
+	case XE_ENGINE_CLASS_VIDEO_DECODE:
+		return "vcs";
+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return "vecs";
+	case XE_ENGINE_CLASS_COPY:
+		return "bcs";
+	case XE_ENGINE_CLASS_COMPUTE:
+		return "ccs";
+	default:
+		return NULL;
+	}
+}
+
 /**
  * xe_hw_engine_class_sysfs_init - Init HW engine classes on GT.
  * @gt: Xe GT.
@@ -664,7 +682,7 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
 		goto err_object;
 
 	for_each_hw_engine(hwe, gt, id) {
-		char name[MAX_ENGINE_CLASS_NAME_LEN];
+		const char *name;
 		struct kobj_eclass *keclass;
 
 		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
@@ -675,24 +693,8 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
 			continue;
 
 		class_mask |= 1 << hwe->class;
-
-		switch (hwe->class) {
-		case XE_ENGINE_CLASS_RENDER:
-			strcpy(name, "rcs");
-			break;
-		case XE_ENGINE_CLASS_VIDEO_DECODE:
-			strcpy(name, "vcs");
-			break;
-		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
-			strcpy(name, "vecs");
-			break;
-		case XE_ENGINE_CLASS_COPY:
-			strcpy(name, "bcs");
-			break;
-		case XE_ENGINE_CLASS_COMPUTE:
-			strcpy(name, "ccs");
-			break;
-		default:
+		name = xe_hw_engine_class_to_str(hwe->class);
+		if (!name) {
 			err = -EINVAL;
 			goto err_object;
 		}
-- 
2.42.0

