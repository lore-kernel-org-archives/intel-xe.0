Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E9CCCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 14:19:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEC110E0D7;
	Mon, 13 Oct 2025 14:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8+Di9ZX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3D810E0D7
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760365170; x=1791901170;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CcTKT4VSSfaQZ/x4OB3ptUPyauY9fB0MTjK6Hxga9L0=;
 b=c8+Di9ZX+Mxs76PSSwyjsnDbEfWvguGtqsjMIEnp3AFWo4gJ3aGGJuC/
 kGg6PVkBtUsaYsIVcGIfQWzU2b/aK/Jm9Tx21goD6EAvGIEcu6tpbHQqw
 loYb273kcfrikXVEgFYlrBZXAQEtlwgLjorVvxlOqi/Yn4Cvji1KvCFrR
 wxsuAe5yyO8wmu0J4V77tCdHfJD6dK60Lt0vFtAluH2FW9CMc3uQWt4+6
 +ngX2x8dk6zF+DC5NRgglIk8IdZNA04EMhgRIgll4ZNhYRCHToHYbDc9H
 zEYJTiajdxL54TAZ+sWd/kvoEpO6v0rUm0W/IHac3oC0NY1lPegBvA1yD Q==;
X-CSE-ConnectionGUID: a0mq5PovQBa3fJ3LpCEIkQ==
X-CSE-MsgGUID: lsA3tvTBR6ibxYEpm7IipQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73185536"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73185536"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 07:19:30 -0700
X-CSE-ConnectionGUID: KYx730Q4T2OmZzbdFUjgTA==
X-CSE-MsgGUID: Q0U/uIRuQPeAPwAst5DMYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="218726146"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa001.jf.intel.com with ESMTP; 13 Oct 2025 07:19:28 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.auld@intel.com,
 thomas.hellstrom@intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v2 0/3] drm/xe: add VM_BIND DECOMPRESS support and on‑demand decompression
Date: Mon, 13 Oct 2025 20:18:47 +0530
Message-Id: <20251013144850.757438-1-nitin.r.gote@intel.com>
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

 drivers/gpu/drm/xe/xe_bo.c       | 53 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h       |  3 ++
 drivers/gpu/drm/xe/xe_migrate.c  | 90 ++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_migrate.h  |  7 +++
 drivers/gpu/drm/xe/xe_vm.c       | 48 ++++++++++++-----
 drivers/gpu/drm/xe/xe_vm_types.h |  2 +
 include/uapi/drm/xe_drm.h        |  8 +++
 7 files changed, 170 insertions(+), 41 deletions(-)

-- 
2.25.1

