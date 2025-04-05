Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239B4C36010
	for <intel-xe@archiver.kernel.org>; Sat,  5 Apr 2025 07:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F375810E010;
	Sat,  5 Apr 2025 07:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQbPGL12";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE82010E010
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Apr 2025 07:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743836987; x=1775372987;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r5v8qpuuNJ7V5LDRfyqvzMuCtDG5kmjmKUducAd45K4=;
 b=QQbPGL12prAKI4aXDICu73hB3UajA8cOGHmi3dIQM5FgLONFuH+l1Rr6
 5KjE+7JApsGQmzdlB9M02UiUuCdroshXYWuMXe/CxN/DJi8W1O5HY16CR
 nefJNhxNfkzi0ntYciS5t6R4IOqVqxELOvY6KJZioRRsQQGMBXSubybuz
 gQsTIyh0bX3JzD3/D6MYN+hENIKIY6bro4R7mYiV4cyy6CcwlnXXpAIaH
 29KGM1CZi7qIg6vF1gFCCmde069Hd5jlHTCZSbG+4BivDeu1JF77H9vlj
 ti5dzhp67lx8F09Z4dDukDye80Cr+K4u4ikkV3zXgwwxR1ozwar+ipuSh g==;
X-CSE-ConnectionGUID: Ox3JHYPCSKm0r/tXbXYe1Q==
X-CSE-MsgGUID: urfNxelyRQO4965mY3Wspw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="56649627"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; d="scan'208";a="56649627"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2025 00:09:44 -0700
X-CSE-ConnectionGUID: u/WkLMvbSC2e7H+PyrTtLg==
X-CSE-MsgGUID: puX1rvr3RFCTJBgLf3mMLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; d="scan'208";a="127808407"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2025 00:09:43 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com
Subject: [PATCH i-g-t 1/1] drm/xe: xe_hw_engine_class: Add fault injection and
 improve error handling in kobj_xe_hw_engine_class
Date: Sat,  5 Apr 2025 06:54:32 +0000
Message-Id: <20250405065432.2254703-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
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

- Added fault injection for `kobj_xe_hw_engine_class` to enhance coverage.
- Improved error handling by checking for `IS_ERR_OR_NULL` on `keclass` and
  propagating the error using `PTR_ERR`.

Can be tested using inject-fault-probe-function-kobj_xe_hw_engine_class

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index 640950172088..0cafe1175389 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -571,6 +571,7 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char
 
 	return keclass;
 }
+ALLOW_ERROR_INJECTION(kobj_xe_hw_engine_class, NULL);
 
 static void hw_engine_class_defaults_fini(void *arg)
 {
@@ -662,8 +663,8 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
 		}
 
 		keclass = kobj_xe_hw_engine_class(xe, kobj, name);
-		if (!keclass) {
-			err = -EINVAL;
+		if (IS_ERR_OR_NULL(keclass)) {
+			err = PTR_ERR(keclass);
 			goto err_object;
 		}
 
-- 
2.34.1

