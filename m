Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58024C282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 10:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D3710E9BE;
	Fri, 14 Mar 2025 10:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kS4uZolX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C953A10E9B9
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 10:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741949463; x=1773485463;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0Y4i7ejaK/uQSrOWOyre9Ca1NANu7zqjAiK5WN8VjKo=;
 b=kS4uZolXkej7DB7/vKcjPIlT/TYHa5pai77ppm8+c1eneXWA7tRM+n4r
 WbMupMdQTm8KlCF3M9ev9WCdB53uwn/rerc4UeZBqxm5hnHTOyOqwbHa0
 4z8PGSUzDnucGYp4MNFCBP/0T1lIFEIB1rCXUWOyxrc4B9IiBB4mtrFSW
 Fj5zz1zNkvMRznH0Yavwftk60H5aH+bLM+5QM0D/eOeXd8etWkuF2/1Nu
 QGslx2vAb+/Pu0E9alu4oaUHGKFd7T4DC4s7imvzq01YmTp9Z0H07ztx0
 GUrXsc44+sUaA8iI8TTURRyo3k/gtdKBcEOJUWgxM4vG9Mrvo0oZgUnRG Q==;
X-CSE-ConnectionGUID: qNr0RCMGS+mXzY1ql3uBng==
X-CSE-MsgGUID: E0hC2WUlTUe99qtvrUi/zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="60493753"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="60493753"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 03:51:01 -0700
X-CSE-ConnectionGUID: RGb1SoptTWyciI4LlP29Ig==
X-CSE-MsgGUID: RE+e5aeyTdy10Su0T9HlZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126296937"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.175])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 03:50:58 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH] drm/xe/hw_engine_class_sysfs: Allow to inject error during
 probe
Date: Fri, 14 Mar 2025 11:50:50 +0100
Message-ID: <20250314105050.636983-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Allow fault injection in a function used during initialization by
xe_hw_engine_class_sysfs_init() so that its error handling can be
tested.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index b53e8d2accdb..e238c0e9fdd0 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -558,6 +558,7 @@ static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
 	kobject_put(kobj);
 	return err;
 }
+ALLOW_ERROR_INJECTION(xe_add_hw_engine_class_defaults, ERRNO); /* See xe_pci_probe() */
 
 static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
 {
-- 
2.43.0

