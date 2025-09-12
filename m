Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8010CAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 21:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A9210E047;
	Fri, 12 Sep 2025 21:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AgtB/jcw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B9610E047
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 21:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757714111; x=1789250111;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g6Gfj40ciQarjuRf+wdBhc+LNZFApQY2IbeatKiuTXc=;
 b=AgtB/jcwE0muPoLZ2Cav38meDyYrpCqFTs7d1/BugUNAXQe+Pca298BL
 mAFCFdgtguexVlrhHGITIauQ3lHMgcGhb0Fo4/3I2vvoAfR9C1EAdHecJ
 mz+CosfPyrNmwbKmqRcj0mVMaSkBUHE3tzV3Sd9HJ1CnfQUtNa6W3tjTL
 pw6kOJXndlnmvc0H2Oofp+BPOFVoS1PYDv8TK//WjQQ+cKJJMtTBowFm5
 6vnFFKOPpdzCY2Mo1FoviktNjPfoNfXr/dg1AjfuK7P/ifdnXbvhpzg8U
 yarH40RxActIV77og2HaFMf/DSGYHmKgVV/3w+ARLraGh1XjqoXSTdIyf w==;
X-CSE-ConnectionGUID: aYU1PewDSMSGyeLFlly1iA==
X-CSE-MsgGUID: sigve/1iSMOd+HnxmbH8pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="60137326"
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; d="scan'208";a="60137326"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 14:55:10 -0700
X-CSE-ConnectionGUID: gGELW5saRlezYuDerBsoug==
X-CSE-MsgGUID: 1b+9/++HTXGDnRF/YnryLQ==
X-ExtLoop1: 1
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 14:55:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/xe: Fix build with CONFIG_MODULES=n
Date: Fri, 12 Sep 2025 14:54:51 -0700
Message-ID: <20250912-fix-nomodule-build-v1-1-d11b70a92516@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250912-fix-nomodule-build-8d177dbe5bda
X-Mailer: b4 0.15-dev-b03c7
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

When building with CONFIG_MODULES=n, the __exit functions are dropped.
However our init functions may call them for error handling, so they are
not good candidates for the exit sections.

Fix this error reported by 0day:

	ld.lld: error: relocation refers to a symbol in a discarded section: xe_configfs_exit
	>>> defined in vmlinux.a(drivers/gpu/drm/xe/xe_configfs.o)
	>>> referenced by xe_module.c
	>>>               drivers/gpu/drm/xe/xe_module.o:(init_funcs) in archive vmlinux.a

This is the only exit function using __exit. Drop it to fix the build.

Cc: Riana Tauro <riana.tauro@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506092221.1FmUQmI8-lkp@intel.com/
Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index e52808e3199fc..392550844404d 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -618,7 +618,7 @@ int __init xe_configfs_init(void)
 	return 0;
 }
 
-void __exit xe_configfs_exit(void)
+void xe_configfs_exit(void)
 {
 	configfs_unregister_subsystem(&xe_configfs);
 	mutex_destroy(&xe_configfs.su_mutex);



