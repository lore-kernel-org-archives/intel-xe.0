Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E297C36010
	for <intel-xe@archiver.kernel.org>; Sat,  5 Apr 2025 07:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DFC10E078;
	Sat,  5 Apr 2025 07:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDipF0l2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D094D10E078
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Apr 2025 07:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743838330; x=1775374330;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r5v8qpuuNJ7V5LDRfyqvzMuCtDG5kmjmKUducAd45K4=;
 b=EDipF0l2z3IRnNe0z9vnI8vbeEFmuKg2MEwCgPvw+Lr0Hh3hB+urPwXV
 /+2a2fG646WAwWPUMLT0qHv9U9PrfucApdreYf6Tgm9on0XTXQeFKIlJx
 wiMYbp0RGzeGeQi7w0Gz7pohWnUDm9d7ixZoDkRGt008AtOAyX6h/aH9K
 1D111aN0OcIe/EhI8D1ibpS/N5iuhbY1wKzK9287Syaem0zutR3OlxFMf
 l0PAEnULXdjI3mK7z6EO/pzrCSZqx7/VMEhwqNP3ZFA4v66o0pxYupBGr
 A+IQRqweDk1BS4BbFaylIMk4oNuTnR0sb0omTFSGuaeMCpaivRAkAYE0W A==;
X-CSE-ConnectionGUID: 7aifT0OPR1iXXmorn4ryMg==
X-CSE-MsgGUID: /Gy8atPiSmiFdkIFiZ3Tlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="62683362"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; d="scan'208";a="62683362"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2025 00:32:10 -0700
X-CSE-ConnectionGUID: yKpTriqxT4GOH3j86DP/eA==
X-CSE-MsgGUID: rIsEIC6nTCitoE3x70J1qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; d="scan'208";a="132353050"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2025 00:32:08 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com
Subject: drm/xe: xe_hw_engine_class: Add fault injection and improve error
 handling in kobj_xe_hw_engine_class
Date: Sat,  5 Apr 2025 07:17:03 +0000
Message-Id: <20250405071703.2255259-1-sobin.thomas@intel.com>
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

