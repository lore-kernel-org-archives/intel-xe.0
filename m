Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E49CD343C
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 18:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6782110E78C;
	Wed, 12 Nov 2025 18:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHz0LTdm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D2E10E78C
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 18:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762971157; x=1794507157;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pXBpMbO7JwnkmEOYiY2bivPb05DBSARSwoGTpZiRGyU=;
 b=IHz0LTdmghS4wSCyOUzKl8PJAUo52/ykADQBcLLBdJB0nmsMFsko0L8W
 ufrYcu1r4qlmvUjM2N16HMHdb2Iwood4/CKIJ3rg/8boqNnqrxPYeaFqf
 cxcATTW7+r96MEfS2bwlYh2qfFQ+CBwNfH5SsZE/cs/tOdLU7fezEnLE9
 mAGmxI8HQsLx2efxUEX/ycp8T8qh86LqNSsgSdRr61bBcNXq8lu7kHn5v
 6PDBPSNNuW4zHjyVw4a6l2FPjPEhKqtVSb5a9HFYqImTMjJUL4kZ0oVYi
 agZrUIX35/COtWTrYttvUs1H0+zBYHiZX/kY+BdW/EjAMrlUBiTnHw8t7 A==;
X-CSE-ConnectionGUID: BkbmQDz7Tx+k4bMhoorF9g==
X-CSE-MsgGUID: OTRIQh02TIGidGqXSSI+Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64967137"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64967137"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:12:37 -0800
X-CSE-ConnectionGUID: c36GhNUJShWzqo0BEaTqdg==
X-CSE-MsgGUID: yaxx+PhBQhqhlwusnkxorw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="189061491"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa009.jf.intel.com with ESMTP; 12 Nov 2025 10:12:36 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, stable@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2] drm/xe: Prevent BIT() overflow when handling invalid
 prefetch region
Date: Wed, 12 Nov 2025 18:10:06 +0000
Message-ID: <20251112181005.2120521-2-shuicheng.lin@intel.com>
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

v2: Add Closes and Cc stable kernels. (Matt)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6478
Cc: <stable@vger.kernel.org> # v6.8+
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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

