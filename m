Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BD0C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 13:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B85E10EFC4;
	Tue,  7 May 2024 13:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HDBWSH3F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0576B10F0FD
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 13:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715087712; x=1746623712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KqIwQSWyEmHUxe6Q6KbQIpw0H5VQFj1Kf8W6fjvZLIw=;
 b=HDBWSH3FvXeICFhCKRLJUOxYOs4B10HxpmWnLZ36yBOcD1PojxAKqr0N
 gEG9zfK2FLtL58bNqKr8n0gmTOjwFW/D9PDfeN11jGXuLEuVLc12PpFhI
 PuScRnCgBHFK3ghqNJQdLjBBG0CNXpKj37qHJeLlvqJgQ5K4HbSseyXq5
 G3yR7aIB+fAExieZ0j/baw1unE++znR/a6mJpbHkH16qsSEVL8+fz1fUr
 HeetPMNxeGNYdJrVeTP/qrijFPJ/WYxhVWK+1UOX3TvbzqlVSthwENC4Q
 fFEhkBGE2C4LKDMzQDhuh3wjEW3DnoJxLR+FDLcOV+OLTbH3jqgb2J0sn w==;
X-CSE-ConnectionGUID: CwJ1cDxgS2+EvEnILAzzbg==
X-CSE-MsgGUID: Y3MvZcxiS0yBv9XhPoKR8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="11039195"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="11039195"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 06:15:11 -0700
X-CSE-ConnectionGUID: R+mSlPzLStm10RqW1aFteQ==
X-CSE-MsgGUID: /nwjdpvEQ+uyf0YRNfWQ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="28488359"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.61])
 by fmviesa008.fm.intel.com with ESMTP; 07 May 2024 06:15:00 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix UBSAN shift-out-of-bounds failure
Date: Tue,  7 May 2024 13:04:11 +0000
Message-Id: <20240507130411.630361-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240507080456.613786-1-shuicheng.lin@intel.com>
References: <20240507080456.613786-1-shuicheng.lin@intel.com>
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
For num_fences == 0 case, drm_exec_prepare_obj is the same as drm_exec_lock_obj in
function, so call drm_exec_lock_obj instead to solve it.

Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d17192c8b7de..c5b1694b292f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2692,7 +2692,7 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 
 	if (bo) {
 		if (!bo->vm)
-			err = drm_exec_prepare_obj(exec, &bo->ttm.base, 0);
+			err = drm_exec_lock_obj(exec, &bo->ttm.base);
 		if (!err && validate)
 			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
 	}
@@ -2777,7 +2777,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 	struct xe_vma_op *op;
 	int err;
 
-	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 0);
+	err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
 	if (err)
 		return err;
 
-- 
2.25.1

