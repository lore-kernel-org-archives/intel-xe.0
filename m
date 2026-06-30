Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C562C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 19:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CA310E235;
	Tue, 30 Jun 2026 19:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNNIWWV4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1E810E235
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 19:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782847362; x=1814383362;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yKaFiGlADFTJOylkd95Hvd+UUFCI4DO2nW3F4oeGuzY=;
 b=JNNIWWV4d+EbDnVDOj17002OfB1aDCBtnhKe6PxRPnozMl1fYM1Bxmmp
 eGC0KsZR+P8xJz0XjlSi6rs+R7iIIhIb7mAh4W32ZWupa1SGFm8rsakHi
 N2NvOwWg+ri2HoJWH14ap+4WF1AQ53Q2tnQfP5Wdo9PCz8JL4m9PWFx7t
 tSK0QIrGWjPOrysqduEdq7tZYTcBVlutj/xxjTPHvs0oi7HX7fgatz8ys
 TStpAwVTZErWRNcaWk381cioveoG/tcTKU7piHEj7G/gzLX1cwg+FAZmC
 ciTpEHOU65VRshfbnXkyums7prGa28fbiDO01Cn8BT9xyZGFVjhYEvqp0 w==;
X-CSE-ConnectionGUID: S3jeEWYvRwGytMWSQRoSjg==
X-CSE-MsgGUID: dXdT0iwGT7mpBPGfhmD93w==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="93928676"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="93928676"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 12:22:41 -0700
X-CSE-ConnectionGUID: dxpZhmh2RfihHldeNEhCuw==
X-CSE-MsgGUID: gYE808FjQl+9zVOsTc/aOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="275577567"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jun 2026 12:22:40 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, kernel test robot <lkp@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/userptr: Stub notifier_lock helpers when DRM_GPUSVM=n
Date: Tue, 30 Jun 2026 19:22:21 +0000
Message-Id: <20260630192221.2998168-1-shuicheng.lin@intel.com>
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

When CONFIG_DRM_GPUSVM=n (e.g. um-allyesconfig), the only caller of
xe_pt_svm_userptr_notifier_lock() is compiled out, triggering:

  drivers/gpu/drm/xe/xe_pt.c:1418:13: warning:
    'xe_pt_svm_userptr_notifier_lock' defined but not used
    [-Wunused-function]

The helpers cannot simply be removed in this case: the matching
xe_pt_svm_userptr_notifier_unlock() is also referenced from
xe_pt_update_ops_run(), which lives outside any DRM_GPUSVM ifdef and is
gated only at runtime by pt_update_ops->needs_svm_lock. The symbol must
exist in all builds.

Provide empty static inline stubs for !DRM_GPUSVM, matching the pattern
used by xe_svm_notifier_lock()/_unlock() in xe_svm.h.

Fixes: 80ccbd97ffee ("drm/xe/userptr: Hold notifier_lock for write on inject test path")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606302210.QqcLbOEN-lkp@intel.com/
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 4f0f438d6b9b..20b9611e993b 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1406,6 +1406,7 @@ static int xe_pt_pre_commit(struct xe_migrate_pt_update *pt_update)
 				     pt_update_ops, rftree);
 }
 
+#if IS_ENABLED(CONFIG_DRM_GPUSVM)
 /*
  * Acquire/release the svm notifier_lock around xe_pt_svm_userptr_pre_commit()
  * and the matching late release in xe_pt_update_ops_run(). Read mode by
@@ -1432,6 +1433,10 @@ static void xe_pt_svm_userptr_notifier_unlock(struct xe_vm *vm)
 	xe_svm_notifier_unlock(vm);
 #endif
 }
+#else
+static inline void xe_pt_svm_userptr_notifier_lock(struct xe_vm *vm) { }
+static inline void xe_pt_svm_userptr_notifier_unlock(struct xe_vm *vm) { }
+#endif
 
 #if IS_ENABLED(CONFIG_DRM_GPUSVM)
 #ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
-- 
2.43.0

