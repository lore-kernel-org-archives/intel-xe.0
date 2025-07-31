Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174EFC87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 22:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B1610E2C8;
	Thu, 31 Jul 2025 22:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJZSCENU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA0D10E2C8
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 22:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753999413; x=1785535413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/0L7B9J3cw7AZhuLEPsEJKS2jB13SAxO/EAhsxgeF5M=;
 b=PJZSCENUX2iF97sVOkliDV588CJV65Ejh0i+CmrzJXNeDW/bmW4wLTU1
 06ofiOYD8U8QSgRQhWvIyeEowqmmAhQ0n5md1DYMDSbSWu5KTGFAwFMqf
 h/11RWwYQBrEqlZ4+/gj88beQ0SbVyUsADUugpWHtDWzuJDjDycXFI049
 QZsb3pw9EeJOUsyRdeFqmLLFKnwizioB2atciWgQL+z/ejKr47TkOumn4
 q7SvLp3+vDSLULpxaF3+c2IbLjQM20V5Qab47Wg0ePNOVw6upVQUAVfME
 GNMtzI6xlycI1aW3KA8Cg03XPFNP7kqZrjYrr4O/+Y2mDmPUDJOXiKZWL Q==;
X-CSE-ConnectionGUID: 2Ot9Fiu2SG2+4q8XnR/X3Q==
X-CSE-MsgGUID: b4PSc7LfRSG20Rj+2fKqEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="78887851"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="78887851"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 15:03:11 -0700
X-CSE-ConnectionGUID: oyW5CnHgQpmVka3uRWMAHA==
X-CSE-MsgGUID: ZsNJXuZSQCCThkWhTR7vSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="162658762"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 15:03:11 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH] drm/xe/gsc: Don't create mei-gscfi aux device while running
 in VF mode
Date: Thu, 31 Jul 2025 15:01:24 -0700
Message-ID: <20250731220124.3113996-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.49.0
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

While running in SR-IOV VF mode inside a Guest Virtual Machine (VM),
we do not have to initialize and enable the mei-gscfi auxiliary
device. This is because communication with the GSC/CSC firmware,
which is the main purpose of the aux device, would not work in
this mode (as relevant MMIO registers cannot be accessed), and
can result in the following errors while loading the Xe driver:

[  762.274208] mei_gsc xe.mei-gscfi.24: H_RST is not set = 0x00000000
[  764.299203] mei_gsc xe.mei-gscfi.24: wait hw ready failed
[  764.300334] mei_gsc xe.mei-gscfi.24: hw_start failed ret = -62 fw status = 00000000 00000000 00000000 00000000 00000000 00000000
[  768.333706] mei_gsc xe.mei-gscfi.24: reset: reached maximal consecutive resets: disabling the device
[  768.334466] mei_gsc xe.mei-gscfi.24: reset failed ret = -19
[  768.334941] mei_gsc xe.mei-gscfi.24: link layer initialization failed.
[  768.335346] mei_gsc xe.mei-gscfi.24: init hw failure.

Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
v2: Reword commit message to clarify that the mei-gscfi aux device
    do not have to be created only while running in SR-IOV VF mode.
---
 drivers/gpu/drm/xe/xe_heci_gsc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 6d7b62724126..eb94fcb3f03b 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -13,6 +13,7 @@
 #include "xe_heci_gsc.h"
 #include "regs/xe_gsc_regs.h"
 #include "xe_platform_types.h"
+#include "xe_sriov.h"
 #include "xe_survivability_mode.h"
 
 #define GSC_BAR_LENGTH  0x00000FFC
@@ -176,6 +177,9 @@ int xe_heci_gsc_init(struct xe_device *xe)
 	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)
 		return 0;
 
+	if (IS_SRIOV_VF(xe))
+		return 0;
+
 	heci_gsc->irq = -1;
 
 	if (xe->info.platform == XE_BATTLEMAGE) {
-- 
2.49.0

