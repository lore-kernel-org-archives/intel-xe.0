Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3DFC369B9
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 06:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0923E10E2A5;
	Tue, 15 Apr 2025 06:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjI+KsuL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDF510E2A5
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 06:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744700330; x=1776236330;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BBzJIGoqBONVgA+qV8eJ81pzPSbcf7exkVIkjnX4vjU=;
 b=WjI+KsuL30C0AYD1X9xPK3NwcxqFodWBz9bbzyS2mZMxc/HOIhsWQVan
 4TJ5AyiCILMyxXWzlq0zbFKv3//O3Ee/tkC0y/nnWYN+ynRn09P0+VYJt
 5GRigjIBIGYEQX7L67NKBjVsrT1NVe4nFM7QvFOsOj42sMPEvZKIIgFuh
 uDnSxJay0sHZfNBrssXrNqJcLyeM0Yu2HZt+sQ+m2uqdM42+75AA3i21Y
 CmKj7SoxHjS9oOfpIhkOeIgrX94w2lGnRUJduG9Hkx79w6jWH/R+DG1jJ
 yKIG4+VS8tOaWxtdwNpRWV9GukjkWzBPm0UiR/v6hoXp7gj4VB/ZeTtsX A==;
X-CSE-ConnectionGUID: 5cu23AAnRN6JXxEXYge6eA==
X-CSE-MsgGUID: 7Dtigk4WRyOqpSyD/2XWZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="63733257"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="63733257"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 23:58:49 -0700
X-CSE-ConnectionGUID: bHHRlL01SlaDKjdm60hmhw==
X-CSE-MsgGUID: j8r1g8vqR2ynA7HGrz9GIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130360785"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 23:58:48 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	tejas.upadhyay@intel.com
Subject: [PATCH 1/2] drm/xe: Add fault injection for kobj_xe_hw_engine_class
Date: Tue, 15 Apr 2025 06:42:10 +0000
Message-Id: <20250415064211.2889970-1-sobin.thomas@intel.com>
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

- Add NULL ptr injection for kobj_xe_hw_engine_class
- Can be tested with igt@inject-fault-probe-function-kobj_xe_hw_engine_class 

v2: Modified the Fault injection with NULL.

v1: Initial checkin for Fault Handler.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index 640950172088..f9616ddf4376 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -571,6 +571,7 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char
 
 	return keclass;
 }
+ALLOW_ERROR_INJECTION(kobj_xe_hw_engine_class, NULL);
 
 static void hw_engine_class_defaults_fini(void *arg)
 {
-- 
2.34.1

