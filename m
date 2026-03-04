Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8425DEB7ED7
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 12:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E3F10E9F1;
	Wed,  4 Mar 2026 12:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpEcYoic";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2613810E9F5
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 12:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772626138; x=1804162138;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rn4ZXrA2iIb7rGXKJBDl2vMpRYh3nZxmwKIGiyT6YOY=;
 b=lpEcYoicdStivto1bu9/fM+bOo68et2tIOZ/kgZT507K7oMqAhPa3K3A
 8DjMXLPVEo3qVYVzv0CXGZ0dGcQWAvmJ97t5RGrqHvCKHQK2NTyTbMqIp
 ebsEglScFIA6kq0jHlH3U3i1cu5sOQGnBHbz0WGvAtDk1vWHYmi6tAaHY
 nYKQAfZJi785PSzUz0AO1YppYwivsAf0dBVlkte4AT2Q1vKKg6bMStO2I
 lmP1zez/GdiLPJyrUSfif8/NOTh2MH3lrjK09fCLwVEq1HDKpHRafVTst
 mcKVleUmIlwpHcsz+HqQaz5Afm7HAobMHUOC84QhqEzU4c5iUwvXLWHRR w==;
X-CSE-ConnectionGUID: LQunN3cRS/25V/3dzuDlgA==
X-CSE-MsgGUID: uCUCKe1MRtmnj3FdqQGS2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="96300606"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="96300606"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:04:46 -0800
X-CSE-ConnectionGUID: 0GQEkmfyRlOVE5ehAP+3xw==
X-CSE-MsgGUID: dZuiNsg6Si2zF2xZvAlz5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="244992767"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa001.fm.intel.com with ESMTP; 04 Mar 2026 04:04:39 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.auld@intel.com, michal.mrozek@intel.com,
 thomas.hellstrom@linux.intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v7 0/3] drm/xe: add VM_BIND DECOMPRESS support and on‑demand decompression
Date: Wed,  4 Mar 2026 18:07:59 +0530
Message-ID: <20260304123758.3050386-5-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

Compute PR: https://github.com/intel/compute-runtime/pull/898
Tested with IGT tests https://patchwork.freedesktop.org/series/157553/
which validates basic VM_BIND DECOMPRESS behavior for both
regular and FAULT_MODE VMs.

v7:
   - Add compute PR info and rebase to latest drm-tip
   - Fix kernel-doc warnings

v6: (Matt Auld)
   - Rebase as xe_pat_index_get_comp_en() is added in separate
     patch
   - Drop vm param from xe_bo_decompress(), instead of it
     extract tile from bo
   - Reject decompression on igpu instead of silent skipping
     to avoid any failure on Xe2+igpu as xe_device_has_flat_ccs()
     can sometimes be false on igpu due some setting in the BIOS
     to turn off compression on igpu.
   - Nits

v5: (Matt)
   - Correct the condition check of xe_pat_index_get_comp_en

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

 drivers/gpu/drm/xe/xe_bo.c       | 55 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h       |  2 +
 drivers/gpu/drm/xe/xe_migrate.c  | 90 ++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_migrate.h  |  4 ++
 drivers/gpu/drm/xe/xe_vm.c       | 37 +++++++++----
 drivers/gpu/drm/xe/xe_vm_types.h |  2 +
 include/uapi/drm/xe_drm.h        |  8 +++
 7 files changed, 162 insertions(+), 36 deletions(-)

-- 
2.50.1

