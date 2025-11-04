Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AF3CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 10:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3945F10E5A9;
	Tue,  4 Nov 2025 10:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axyyFGLM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0768A10E5A8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 10:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762251775; x=1793787775;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Zqsjq63XkAqsEY9wB85oheJOYNYJ6bKKE4g0CLI3WQ=;
 b=axyyFGLMC6eUFDbIroyikcobj2ypNSZRrgkr/MT+Z4hjcq5+eZnC5/TY
 vZw2mb4C/P1vsBCiCx7+TuLbmEe0jaZ/66hoqZjpudWeW47wYE4cTXtVI
 zmn3R+2r2JWTCJ0S8nxgbS8mOF0rYZHbmpVpr2rV0H4AmKYr3FFeQ7Usl
 Le3kIf0In4OdZMPRi2dYWPWJscKwp/NctGzfPa5FvfdK6ioiZBNmHlwry
 /tVa5P6vgaCrH+NI7nAfdnqUHiYWnnOlB49X5MHVpyHDiTTGK+DJ/yVKj
 k32O84iashbEqKcIuHOL/PpoMRJAiZp6Mv/HL97xPtIkujQ5+xl6IQISd w==;
X-CSE-ConnectionGUID: mQ5N3+u0Tk6mYJtpMrsxlg==
X-CSE-MsgGUID: mzDsqCLXRn2RbRSBGpNDfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75693022"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="75693022"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:22:54 -0800
X-CSE-ConnectionGUID: dMiE0eqATtifG23X8EyVxQ==
X-CSE-MsgGUID: FaX4pevbRuG4407vdLT4Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="186810861"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa009.jf.intel.com with ESMTP; 04 Nov 2025 02:22:52 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: matthew.auld@intel.com, michal.mrozek@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v4 0/3] drm/xe: add VM_BIND DECOMPRESS support and on‑demand decompression
Date: Tue,  4 Nov 2025 16:23:02 +0530
Message-Id: <20251104105305.2100460-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
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

This series implements VM_BIND decompression support in the XE driver
for both non-fault mode and fault mode.

Tested with https://patchwork.freedesktop.org/series/154711/
which validates basic VM_BIND DECOMPRESS behavior for both
regular and FAULT_MODE VMs.

v4: (Matt)
  - Simplify xe_migrate_resolve(), use single BO/resource;
    remove copy_only_ccs argument as it's always false.
  - Introduce xe_pat_index_get_comp_en(), which checks
    XE2_COMP_EN for the pat_index
  - .interruptible should be true, everything else false
 
v3: (Matt)
   - s/xe_bo_schedule_decompress/xe_bo_decompress
   - skip the decrompress step if the BO isn't in VRAM
   - start/size not required in xe_bo_schedule_decompress
   - Use xe_bo_move_notify instead of xe_vm_invalidate_vma
     with respect to invalidation.
   - Nits

v2:
   - Add kernel doc (Matt)
   - Move decompression work out of vm_bind ioctl. (Matt)
   - Put that work in a small helper at the BO/migrate layer invoke it
     from vma_lock_and_validate which already runs under drm_exec.
   - Move lightweight checks to vm_bind_ioctl_check_args (Matthew Auld)


Nitin Gote (3):
  drm/xe: add VM_BIND DECOMPRESS uapi flag
  drm/xe: add xe_migrate_resolve wrapper and is_vram_resolve support
  drm/xe: implement VM_BIND decompression in vm_bind_ioctl

 drivers/gpu/drm/xe/xe_bo.c       | 52 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h       |  2 +
 drivers/gpu/drm/xe/xe_migrate.c  | 83 +++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_migrate.h  |  4 ++
 drivers/gpu/drm/xe/xe_pat.c      |  6 +++
 drivers/gpu/drm/xe/xe_pat.h      | 10 ++++
 drivers/gpu/drm/xe/xe_vm.c       | 40 ++++++++++-----
 drivers/gpu/drm/xe/xe_vm_types.h |  2 +
 include/uapi/drm/xe_drm.h        |  8 +++
 9 files changed, 169 insertions(+), 38 deletions(-)

-- 
2.25.1

