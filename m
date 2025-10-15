Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1F0CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 10:17:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EA810E288;
	Wed, 15 Oct 2025 10:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kt8hjrov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A7810E288
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 10:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760523445; x=1792059445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=840Eb8jaeTjmtXMjL/R7aJ4jwqJuSJ4azTC1/VDSJds=;
 b=kt8hjrovpuVZRy4TukixteudEJeAl97VQCsnfVliWXbdZRhnayG9MxK1
 w1C31zo5XefORpHBZodd21Z7GwcQXlUj1XvzHhltTw6gm43WWAD2pJUEu
 nR2me0K6R8KxECajtURG8MsqZOrNcCIjHEM/eFWeZNURWQRQA7/IQo0bF
 wfjpY6arorR85H9ImVhNdLhXGg5FqDELhTtJyCaskpQLhl6yVeo3PEwNU
 Qi7geUZvs8BDFqnxNckerpsAw2etVqD79UBKf+GsFLqahTzyLQg8hWiFr
 9eh8me7rpEbyzReSnt0E/alsZxkoBzOPyuclmVt0yD240176hpuKEg/P8 A==;
X-CSE-ConnectionGUID: Ff+j0LVmSQSJehhbl0iTQA==
X-CSE-MsgGUID: mdiCI7ayQie7MrzisqpLCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62733045"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="62733045"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 03:17:24 -0700
X-CSE-ConnectionGUID: nUod0r4KTLezsnJDvW7egg==
X-CSE-MsgGUID: 7k46TUP5RtukrJwCvfLTtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="187437729"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2025 03:17:23 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.auld@intel.com,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v3 0/3] drm/xe: add VM_BIND DECOMPRESS support and on‑demand decompression
Date: Wed, 15 Oct 2025 16:17:06 +0530
Message-Id: <20251015104709.44476-1-nitin.r.gote@intel.com>
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

 drivers/gpu/drm/xe/xe_bo.c       | 50 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h       |  2 +
 drivers/gpu/drm/xe/xe_migrate.c  | 90 ++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_migrate.h  |  7 +++
 drivers/gpu/drm/xe/xe_vm.c       | 40 ++++++++++----
 drivers/gpu/drm/xe/xe_vm_types.h |  2 +
 include/uapi/drm/xe_drm.h        |  8 +++
 7 files changed, 161 insertions(+), 38 deletions(-)

-- 
2.25.1

