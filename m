Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BABCCFA18
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 00:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F73A10E63B;
	Wed, 12 Nov 2025 00:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVbsnaxi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3411010E63B
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 00:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762907149; x=1794443149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+5VKbAO3yJIGnJpiQijz0+qAChg72K2VREpoNAuy9T4=;
 b=SVbsnaxi3CF5sfCWlsi6Pqtue6xXgn5vKBngN2e7UBZ52AlMv3CDz/ef
 52n9x4/Qp8uzIbW1D8Zq1tCUfVkjTVCXSfwTLePoGM9v3UegS8cKSKTkJ
 zkSOOtLhyW3ncgg6fobbmHEI74uNoXS7VEPj4cWu9yIlg/hkWl3a38ufI
 uToPcri2y572w4P25GdHPVOCHNFLKFswIxu7oJitYv7iEfTR/4Djhd03u
 +/QNNgqCBE7BzR2fY0FPoImDeyopkcHrs3l0sV5QQpZOOBcLxFmwX3nF6
 KhCHrYr5k2Cyzjph+qQOPRuFPnzNd1o0afFaZ2wVd48VdNV0BoIm1gpgf A==;
X-CSE-ConnectionGUID: fLgp5XqyRe6gULEKEyWCIQ==
X-CSE-MsgGUID: JNYoQkR+QuaLqXCsXyxAMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64674145"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="64674145"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 16:25:48 -0800
X-CSE-ConnectionGUID: ld6Xh6C+QViPZ01jLlY0JQ==
X-CSE-MsgGUID: NmhqyYiTSS+ej39bgTrm2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208";a="212473579"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa002.fm.intel.com with ESMTP; 11 Nov 2025 16:25:48 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Prevent BIT() overflow when handling invalid prefetch
 region
Date: Wed, 12 Nov 2025 00:23:32 +0000
Message-ID: <20251112002331.1897395-2-shuicheng.lin@intel.com>
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

If user provides a large value (such as 0x80) for parameter
prefetch_mem_region_instance in vm_bind ioctl, it will cause
BIT(prefetch_region) overflow as below:
"
 ------------[ cut here ]------------
 UBSAN: shift-out-of-bounds in drivers/gpu/drm/xe/xe_vm.c:3414:7
 shift exponent 128 is too large for 64-bit type 'long unsigned int'
 CPU: 8 UID: 0 PID: 53120 Comm: xe_exec_system_ Tainted: G        W           6.18.0-rc1-lgci-xe-kernel+ #200 PREEMPT(voluntary)
 Tainted: [W]=WARN
 Hardware name: ASUS System Product Name/PRIME Z790-P WIFI, BIOS 0812 02/24/2023
 Call Trace:
  <TASK>
  dump_stack_lvl+0xa0/0xc0
  dump_stack+0x10/0x20
  ubsan_epilogue+0x9/0x40
  __ubsan_handle_shift_out_of_bounds+0x10e/0x170
  ? mutex_unlock+0x12/0x20
  xe_vm_bind_ioctl.cold+0x20/0x3c [xe]
 ...
"
Fix it by validating prefetch_region before the BIT() usage.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8fb5cc6a69ec..7cac646bdf1c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3411,8 +3411,10 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, prefetch_region &&
 				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
-				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
+		    XE_IOCTL_DBG(xe, (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
+				      /* Guard against undefined shift in BIT(prefetch_region) */
+				      (prefetch_region >= (sizeof(xe->info.mem_region_mask) * 8) ||
+				      !(BIT(prefetch_region) & xe->info.mem_region_mask)))) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_UNMAP) ||
 		    XE_IOCTL_DBG(xe, (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET) &&
-- 
2.49.0

