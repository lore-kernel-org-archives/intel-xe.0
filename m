Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B99C3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 17:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB56D10E872;
	Wed,  7 May 2025 17:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RWk7iKYs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF7410E872
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 17:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746640490; x=1778176490;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t/WBWWpWrZDy2FwaTf625iIRnvHMfFrAzmdpih89PzE=;
 b=RWk7iKYsUuiXahf/6VXzcTDXrKsCyjNkxnBLDQTBPgUz5LN6KXj2i3Ij
 n2qJCkxD7D7nqSnvtrsBgXOvE8dbCYYUM1+hui3KpIXJ7XDKT7SYSGLC/
 7a2foAALmrRuObK1N46CLMR8k15NkArmWghlHQiaJ5i9mL5I9PYMnJK2W
 7tYqhdw4BbXvWUuKe5aD6OuQf8iqaZdiUZpg/b/F020u6Ip2lz7kxR4AH
 ReGBOliQEe7I/DXVurrC/g+U0xsfGg0mC1bemH01bW4ahhXYh+IY26Xgq
 Z3FYW5EjqfMvqlVui40XQ2Cvo8i3J5OM54gHKp0/awTfsSgQ/KDYy6yJN A==;
X-CSE-ConnectionGUID: DRidSOTUQNeAJQ8cLoINJQ==
X-CSE-MsgGUID: oG3STc51R+2jw75DuVArtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59743746"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="59743746"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 10:54:50 -0700
X-CSE-ConnectionGUID: SazQxHRyTIOPdFo1YPbOmg==
X-CSE-MsgGUID: SEZVRB/ySz2lfJK8kMiorg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="135957881"
Received: from nvishwa1-desk1.sc.intel.com ([172.25.29.28])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 10:54:50 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Fix flushing of garbage collector work
Date: Wed,  7 May 2025 10:52:16 -0700
Message-ID: <20250507175215.2052470-2-niranjana.vishwanathapura@intel.com>
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

The svm garbage collector work structure is only initialized
if CONFIG_DRM_XE_GPUSVM is enabled. Add xe_svm_flush() and
use it to flush svm garbage collector work instead of directly
flushing it.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.h | 7 +++++++
 drivers/gpu/drm/xe/xe_vm.c  | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 3d441eb1f7ea..bd831f6104fe 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -87,6 +87,9 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 	return range->base.flags.has_dma_mapping;
 }
 
+#define xe_svm_flush(vm__) \
+	flush_work(&(vm__)->svm.garbage_collector.work)
+
 #define xe_svm_assert_in_notifier(vm__) \
 	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
 
@@ -170,6 +173,10 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
 {
 }
 
+static inline void xe_svm_flush(struct xe_vm *vm)
+{
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 80e56e232685..7f848491ada5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3332,7 +3332,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	/* Ensure all UNMAPs visible */
 	if (xe_vm_in_fault_mode(vm))
-		flush_work(&vm->svm.garbage_collector.work);
+		xe_svm_flush(vm);
 
 	err = down_write_killable(&vm->lock);
 	if (err)
-- 
2.43.0

