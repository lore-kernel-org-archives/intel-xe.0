Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70526C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 14:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A69F10E6DD;
	Wed, 15 Jan 2025 14:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZ5FmAax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E63F10E504
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 14:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736950131; x=1768486131;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O3yqwJ/0SkuB9A8O8Crjocjxgh3t9lUeqKP9EZ7tOrs=;
 b=MZ5FmAaxvAhdEwGFkRKHNMMbF2lzOlfvqDT19AaNChg6v4tDbUhR+2b0
 QP7oFkINVam0PqOyoH0m8RvcPeaZpdgObOIZXGrFO4ybuW8HN0huoSRdb
 b9e7sEyl/TOTCCUB/xDN+tIjEAzN7k7IZ1QppidxdwPK5Z/WOqxJdslaq
 /0mkG+ptjrskHUxv5X9L39X+5iua0S3D6pk7mPxXPt37WzA8HnRNguf8q
 AmX99yl+aD0quj9JUZcSJMmkqXpgFQ9z0/Dqlzz+0EMOxrVNzzPz8WtVu
 Q8ogrCvmm4SjkvtXK70Yg89a0MAyHe/G1/uMa1C7sYGJJlh2i0qtXWTM1 g==;
X-CSE-ConnectionGUID: j+nqsOTKSk267A3HezcDeA==
X-CSE-MsgGUID: 9YbIolKGSFCIK+7Al+W7Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="40096967"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="40096967"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 06:08:29 -0800
X-CSE-ConnectionGUID: MIzq83UQR+GprGyNigkUcw==
X-CSE-MsgGUID: c3hvEIQETwCdIwj7OJj4AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110281339"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.108.212])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 06:08:25 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Fix sort order of .o lists in Makefile
Date: Wed, 15 Jan 2025 11:08:04 -0300
Message-ID: <20250115140812.20799-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.48.0
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

The Makefile for xe asks us to keep the lists of object files sorted:

  # Please keep these build lists sorted!

Reshuffle the lists into the correct sort order. That was done by
filtering each unsorted list through 'LC_ALL=C sort'.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 5c97ad6ed738..34214400b8d1 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -34,8 +34,8 @@ xe-y += xe_bb.o \
 	xe_dma_buf.o \
 	xe_drm_client.o \
 	xe_exec.o \
-	xe_execlist.o \
 	xe_exec_queue.o \
+	xe_execlist.o \
 	xe_force_wake.o \
 	xe_ggtt.o \
 	xe_gpu_scheduler.o \
@@ -66,11 +66,11 @@ xe-y += xe_bb.o \
 	xe_guc_pc.o \
 	xe_guc_submit.o \
 	xe_heci_gsc.o \
+	xe_huc.o \
 	xe_hw_engine.o \
 	xe_hw_engine_class_sysfs.o \
 	xe_hw_engine_group.o \
 	xe_hw_fence.o \
-	xe_huc.o \
 	xe_irq.o \
 	xe_lrc.o \
 	xe_migrate.o \
@@ -90,8 +90,8 @@ xe-y += xe_bb.o \
 	xe_range_fence.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
-	xe_rtp.o \
 	xe_ring_ops.o \
+	xe_rtp.o \
 	xe_sa.o \
 	xe_sched_job.o \
 	xe_step.o \
@@ -102,8 +102,8 @@ xe-y += xe_bb.o \
 	xe_trace_bo.o \
 	xe_trace_guc.o \
 	xe_trace_lrc.o \
-	xe_ttm_sys_mgr.o \
 	xe_ttm_stolen_mgr.o \
+	xe_ttm_sys_mgr.o \
 	xe_ttm_vram_mgr.o \
 	xe_tuning.o \
 	xe_uc.o \
@@ -112,8 +112,8 @@ xe-y += xe_bb.o \
 	xe_vram.o \
 	xe_vram_freq.o \
 	xe_vsec.o \
-	xe_wait_user_fence.o \
 	xe_wa.o \
+	xe_wait_user_fence.o \
 	xe_wopcm.o
 
 xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
@@ -221,6 +221,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_display_wa.o \
 	i915-display/intel_dkl_phy.o \
 	i915-display/intel_dmc.o \
+	i915-display/intel_dmc_wl.o \
 	i915-display/intel_dp.o \
 	i915-display/intel_dp_aux.o \
 	i915-display/intel_dp_aux_backlight.o \
@@ -268,7 +269,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_vdsc.o \
 	i915-display/intel_vga.o \
 	i915-display/intel_vrr.o \
-	i915-display/intel_dmc_wl.o \
 	i915-display/intel_wm.o \
 	i915-display/skl_scaler.o \
 	i915-display/skl_universal_plane.o \
-- 
2.48.0

