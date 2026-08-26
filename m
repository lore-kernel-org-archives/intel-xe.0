Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7B6C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EA010ED3F;
	Wed, 26 Aug 2026 13:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6U8dtvy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB51D10ED3F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 13:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787752333; x=1819288333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4t9nLVA/Q11jYjYzal9+RjT90LDPGvi+idPPobqeZr0=;
 b=k6U8dtvyFbgiW+PZlb4vilWP98t9ZL6xadDv6CLIXKweTF50KKw+OPf8
 gWuTOt5aFj/sys1eaU2pi0vNIgJu/pLFcVmgigvKBbUZwA2omkfMFEk6i
 CvJ36jUvaq66mUA//q7ejX9/z+8xPiYolezMxACA2clCRcpsVCjCroJ9M
 iIsu7XsS2QcFbj4rnF+r+fbtgBIomR+2HIGkisPaaLYQ6fE19/V/slYtf
 RZwG55E/HwSuZhdE7NxRjh640fhmEko05ae1j9WrP9r0Udx+YCk/cbJs6
 QxH6Ogch1yuqFn7vzDDeo52zHzGrGZQ8zD2NhHQVHnHMFeokEy48ViBhW g==;
X-CSE-ConnectionGUID: vZw9sEZdTrW49bqGGiB8iw==
X-CSE-MsgGUID: 91C8UBMqSMOOdvcwlHfg3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88251045"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88251045"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:52:13 -0700
X-CSE-ConnectionGUID: SCulXWaiSnODr0RMeEEl+g==
X-CSE-MsgGUID: QnvN2JcGQ3CqL4xx0sBc4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="269533518"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:52:10 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V18 10/14] drm/xe/ras: Cache bad_page_reservation policy at
 init
Date: Wed, 26 Aug 2026 19:21:45 +0530
Message-ID: <20260826135136.204044-26-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260826135136.204044-16-tejas.upadhyay@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The configfs bad_page_reservation attribute can only be set before
device bind, so its value is immutable at runtime. Cache it in
struct xe_drm_ras during xe_drm_ras_init() to avoid repeated configfs
lookups on every fault.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_ras_types.h | 3 +++
 drivers/gpu/drm/xe/xe_ras.c           | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
index 8d729ad6a264..83899cf04793 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
@@ -43,6 +43,9 @@ struct xe_drm_ras {
 
 	/** @info: info array for all types of errors */
 	struct xe_drm_ras_counter *info[DRM_XE_RAS_ERR_SEV_MAX];
+
+	/** @bad_page_reservation: cached configfs policy, immutable after init */
+	bool bad_page_reservation;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index d25d25f77531..c7e86ae0e8ad 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -3,6 +3,7 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include "xe_configfs.h"
 #include "xe_debugfs.h"
 #include "xe_device.h"
 #include "xe_drm_ras.h"
@@ -804,6 +805,10 @@ void xe_ras_init(struct xe_device *xe)
 {
 	int ret;
 
+	if (xe->info.platform == XE_CRESCENTISLAND)
+		xe->ras.bad_page_reservation =
+			xe_configfs_get_bad_page_reservation(to_pci_dev(xe->drm.dev));
+
 	xe_drm_ras_init(xe);
 
 	if (!xe->info.has_sysctrl)
-- 
2.52.0

