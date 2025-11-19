Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8E1CF258C
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 09:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203BC10E038;
	Wed, 19 Nov 2025 09:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GefY6V4S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B3D10E038
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 09:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763545746; x=1795081746;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rRQzgfzYWygIAGi54JZ5miOEJe7usfrfQBCdo9QN2xk=;
 b=GefY6V4S0cVyu/NTihCMqo6StkmrOPfObKXqrVEas+sM9EcIcvxK9IXx
 QxqJOQVEdfv3K+gk0O2wmVVCGbTu5XUoS5f/vrjq+42Xq9WpAuEvMZOfK
 UJpZqebm33smtIRUpCzKlRaB5X+3ZNo/ctjhWxmGOy5TShB2QSLGWvT/Q
 Xr1+0+AeARWQIGK4Wh+3RxAiiXc4gKw6/ODdAZNdOpHp9lcZs9zqICWVH
 D7IdQ/RNTzuZGPSfcRiFlvnWZ6J7b836mxlsmTWNQ+GLSk+rEtG8WHhyU
 dc05WRb6nERlbBU309c9ZXHjHQbJLLMVim7xNYEugjnmqB8chQqItfRzh w==;
X-CSE-ConnectionGUID: 0ov6glt0Scy8eHpGqz2dQw==
X-CSE-MsgGUID: W6nZxpDsTA2f0/zfbD0E1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76190434"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="76190434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 01:49:05 -0800
X-CSE-ConnectionGUID: Miw3uC5RTFqBarkhBJK33w==
X-CSE-MsgGUID: jnzAL15zRtKw3SWrvceVsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="195317194"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2025 01:49:04 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: matthew.brost@intel.com,
	matthew.auld@intel.com
Cc: intel-xe@lists.freedesktop.org, michal.mrozek@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v6 0/3] drm/xe: add VM_BIND DECOMPRESS support and on‑demand decompression
Date: Wed, 19 Nov 2025 15:49:05 +0530
Message-ID: <20251119101904.2456979-5-nitin.r.gote@intel.com>
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

Tested with IGT tests https://patchwork.freedesktop.org/series/157553/
which validates basic VM_BIND DECOMPRESS behavior for both
regular and FAULT_MODE VMs.

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

 drivers/gpu/drm/xe/xe_bo.c       | 55 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h       |  2 +
 drivers/gpu/drm/xe/xe_migrate.c  | 83 +++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_migrate.h  |  4 ++
 drivers/gpu/drm/xe/xe_vm.c       | 37 ++++++++++----
 drivers/gpu/drm/xe/xe_vm_types.h |  2 +
 include/uapi/drm/xe_drm.h        |  8 +++
 7 files changed, 155 insertions(+), 36 deletions(-)

-- 
2.50.1

