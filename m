Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA6ACCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 11:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B41310EA94;
	Fri,  7 Nov 2025 11:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSrifeqv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CB210EA94
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 11:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762514271; x=1794050271;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3xQ0rgIZMfCRjLZ3a9ss1ezshj+uDZPTnQHXMRS7ue0=;
 b=GSrifeqvpJmFvzSOTSo3J7Ws6pcVWUoZ7TToDiGLtdtYWIKHuP7xIX7G
 g8TxBaGp6EJgvUOImu6beNrKpXDlmXy9poucP8ifNEH2HNL/JYtCQrlcr
 imXb1gmElToxhtLfQIQMFjcrTSZEJqSI4vC90SLbLCSTaPPDlIEloPgpG
 Euf4uAjqkoMc3FL1i9e4AN3Cs2yGzL51tlrx4p4p18N+9d3z00mjUiqz3
 Fei6EEV5ToBVjsUlRy00VzCm6skeffRSJIy9EbCdch6x7BAyD7dL1oi/r
 DRxeyTf2jrQT/MHufdrLRnAIqqZj2mG4Y86HZQ/EerlUKPbo3u679R1vV g==;
X-CSE-ConnectionGUID: WdBKwOxOTou3AyP3QmgEcA==
X-CSE-MsgGUID: tff8kB7lQ+yvgQEPY2WkHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="68309999"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="68309999"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:17:51 -0800
X-CSE-ConnectionGUID: EoEFUjVYQ5m+pofbpXP0fw==
X-CSE-MsgGUID: pldp/U+1QaO20G5yHFxl5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="192107811"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa003.jf.intel.com with ESMTP; 07 Nov 2025 03:17:49 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: matthew.brost@intel.com
Cc: intel-xe@lists.freedesktop.org, matthew.auld@intel.com,
 michal.mrozek@intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v5 0/3] drm/xe: add VM_BIND DECOMPRESS support and on‑demand decompression
Date: Fri,  7 Nov 2025 17:17:58 +0530
Message-ID: <20251107114757.561671-5-nitin.r.gote@intel.com>
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

Tested with https://patchwork.freedesktop.org/series/154711/
which validates basic VM_BIND DECOMPRESS behavior for both
regular and FAULT_MODE VMs.

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
2.50.1

