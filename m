Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4901DC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 15:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68A010E405;
	Mon, 29 Apr 2024 15:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ugtz7nho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9537C10E405
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 15:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714405494; x=1745941494;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xm0YTmzaOhx5JNx+BJier4I+SRSv0PUIihy7Tz8Cfmg=;
 b=Ugtz7nhoqKE9+w3ZPAGBcejIk5HecIosIPaE/SEL05zbMTC+kA75xrrJ
 Vqzu0iyTnc9zXOErjTO2oe7Bp0F/tqEKSOMx0uINXBRS33kCH37xxxsvE
 oBdgeXWFIYesPE//7V3W9b0Ol0/kukVWHJiD48KfGc0VduigjScW0qTHJ
 wohbDm38cY/hQXb65s+Wr6qYqfUCBcS5eRSkl8n0zGhLjbA0Dlt36NkJk
 tVNCDD+FSpSuxke27EMXJ1ZCpZrtxexYJ3gp8NgYk28pedfgiZXBCaT4r
 5hYWwA1+qsdW5sZbjyz2UNDNsMyA8+DF8ChJiZ/1JfT83tZC/GW+jzE/l Q==;
X-CSE-ConnectionGUID: nCetGmqjQPC028hp+Bza9w==
X-CSE-MsgGUID: wNq3OOz5RvqzE1KFOXxGsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="20688583"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="20688583"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 08:44:54 -0700
X-CSE-ConnectionGUID: NTH1Z1EXQ9W1dz4UYsdMmQ==
X-CSE-MsgGUID: YDulLJaJQwuzV7prJEpuyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26138652"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 08:44:53 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Promote xe_hw_engine_class_to_str()
Date: Mon, 29 Apr 2024 17:30:17 +0200
Message-ID: <20240429153018.1520-1-nirmoy.das@intel.com>
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

From: Lucas De Marchi <lucas.demarchi@intel.com>

Move it out of the sysfs compilation unit so it can be re-used in other
places.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c             | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h             |  1 +
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 18 ------------------
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 4cc757457e01..302d33bdb847 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1083,3 +1083,21 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	return xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
+
+const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
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
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 71968ee2f600..2ae86c600802 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -67,4 +67,5 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 	return hwe->name;
 }
 
+const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index 844ec68cbbb8..efce6c7dd2a2 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -618,24 +618,6 @@ static void hw_engine_class_sysfs_fini(struct drm_device *drm, void *arg)
 	kobject_put(kobj);
 }
 
-static const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
-{
-	switch (class) {
-	case XE_ENGINE_CLASS_RENDER:
-		return "rcs";
-	case XE_ENGINE_CLASS_VIDEO_DECODE:
-		return "vcs";
-	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
-		return "vecs";
-	case XE_ENGINE_CLASS_COPY:
-		return "bcs";
-	case XE_ENGINE_CLASS_COMPUTE:
-		return "ccs";
-	default:
-		return NULL;
-	}
-}
-
 /**
  * xe_hw_engine_class_sysfs_init - Init HW engine classes on GT.
  * @gt: Xe GT.
-- 
2.42.0

