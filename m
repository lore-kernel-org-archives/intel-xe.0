Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD447C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 08:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AC210EEB9;
	Tue,  7 May 2024 08:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3648pqK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545BC10E171
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 08:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715069702; x=1746605702;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d1habnLJziTNQJIoC0MB+W1k7KB+AXj1kpy5amIY6OE=;
 b=L3648pqKoBq54x1Mk1GO+U3HVCdlLuRETbtxAvmv3Z9YF7cojabRt10I
 APE3N66GjUShVhCp/pRLg/s3aXie2caTaVGT7OPoWiFpRmMqXI8VsKbHM
 i5n4/SAvlGUKXknUX5KzvszAfLFzanoIUudLQO9TxPidM6zRh6fDU2b4y
 1tZ294WAhpNP3CMaXkMwTvNv6pOaGXuxlU3ykIwR3HQHGcACCIm4p5ADF
 KT/THqqWeYH6bpLdxdjuCk5nqt3HzTNPD27aO3BR4v1rcYzLB/kLIeM/I
 Xy2LFmtmgloy2vSZO3VWIRezrPEANVZNiVHmW7/GIx27Q94cxpaTgPSXL g==;
X-CSE-ConnectionGUID: +8ziaZuiSv2MhKnfAb+tFA==
X-CSE-MsgGUID: yIJTrE9bR6OkYWPgOI6Yaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="11003647"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="11003647"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 01:15:01 -0700
X-CSE-ConnectionGUID: MgQ99iMoTjuMAUPfit74qA==
X-CSE-MsgGUID: LfBn/OUrTcW3qm7IKxCBKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="28964152"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.61])
 by orviesa007.jf.intel.com with ESMTP; 07 May 2024 01:14:59 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix UBSAN shift-out-of-bounds failure
Date: Tue,  7 May 2024 08:04:56 +0000
Message-Id: <20240507080456.613786-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

Here is the failure stack:
[   12.988209] ------------[ cut here ]------------
[   12.988216] UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
[   12.988232] shift exponent 64 is too large for 64-bit type 'long unsigned int'
[   12.988235] CPU: 4 PID: 1310 Comm: gnome-shell Tainted: G     U             6.9.0-rc6+prerelease1158+ #19
[   12.988237] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.3301.A02.2208050712 08/05/2022
[   12.988239] Call Trace:
[   12.988240]  <TASK>
[   12.988242]  dump_stack_lvl+0xd7/0xf0
[   12.988248]  dump_stack+0x10/0x20
[   12.988250]  ubsan_epilogue+0x9/0x40
[   12.988253]  __ubsan_handle_shift_out_of_bounds+0x10e/0x170
[   12.988260]  dma_resv_reserve_fences.cold+0x2b/0x48
[   12.988262]  ? ww_mutex_lock_interruptible+0x3c/0x110
[   12.988267]  drm_exec_prepare_obj+0x45/0x60 [drm_exec]
[   12.988271]  ? vm_bind_ioctl_ops_execute+0x5b/0x740 [xe]
[   12.988345]  vm_bind_ioctl_ops_execute+0x78/0x740 [xe]

It is caused by the value 0 of parameter num_fences in function drm_exec_prepare_obj.
And lead to in function __rounddown_pow_of_two, "0 - 1" causes the shift-out-of-bounds.
For the num_fences, it should be 1 at least.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d17192c8b7de..96cb4d9762a3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2692,7 +2692,7 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 
 	if (bo) {
 		if (!bo->vm)
-			err = drm_exec_prepare_obj(exec, &bo->ttm.base, 0);
+			err = drm_exec_prepare_obj(exec, &bo->ttm.base, 1);
 		if (!err && validate)
 			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
 	}
@@ -2777,7 +2777,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 	struct xe_vma_op *op;
 	int err;
 
-	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 0);
+	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 1);
 	if (err)
 		return err;
 
-- 
2.25.1

