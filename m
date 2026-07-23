Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAFFC531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A40510F166;
	Thu, 23 Jul 2026 16:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXsmD0Fj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E3710F15E
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 16:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823533; x=1816359533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+D2ahN3u7ppCrzcEYEixAuk2+bAopK8VSjQ7n6d6pzc=;
 b=LXsmD0FjNYzbyOJ15F+PZmmx/EEsPEqPXacJGZ/mxUdf2PzgbCOafcmu
 DoefNN79UJD9xtYIRAtxzG4QuQkPu1UZlifv8Qo5yw3NhwwGNoWY5NtEm
 ObNOUuYGakNG35lLwrr0tK/9qtEBFTUzo43+jZZPICQ3FEBsjsNFTM+YH
 EuDpxmRqbroxof9gYnePk0dCE/KbEmQN2+6Ty77st3klVlRnb1YoCsQQC
 VLh9yqTyY6RuPSvEXugUo327t2BJJeVsneco3ID85SKEMVVMC94WNWnBB
 uAIMyJ0tDVNSW/MrLNYST18PA9G97eV76WHI34OB70zPK//QptLY/G1hA A==;
X-CSE-ConnectionGUID: Pj/mBU60QxmzJaT+CYnPhg==
X-CSE-MsgGUID: x5AZDCHYRimU1nbAr9R9fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="88022898"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="88022898"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:18:53 -0700
X-CSE-ConnectionGUID: 1aITp/+KRtyP/TutzHBjjQ==
X-CSE-MsgGUID: s8cS3NuHTdKzfsUWxuyOUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="255086042"
Received: from lharel-mobl.ger.corp.intel.com (HELO
 soc-PF64PT41.clients.intel.com) ([10.245.129.67])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:18:50 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, meny.yossefi@intel.com,
 shuicheng.lin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, matthew.brost@intel.com
Subject: [PATCH v3 0/7] drm/xe/mmio_gem: fix fault handler and destroy path
Date: Thu, 23 Jul 2026 19:18:25 +0300
Message-ID: <20260723161832.137153-1-ilia.levi@intel.com>
X-Mailer: git-send-email 2.49.1
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

This series fixes several issues in xe_mmio_gem, introduced by
1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions"):
split VMA handling, WB/UC aliasing of the dummy page, a rb-tree
leak on destroy, dummy page accumulation, and use-after-free / MMIO
access after destroy. It also converts the existing PCI barrier mmap
to build on xe_mmio_gem now that the infrastructure is in place.

v3: (Matt Auld)
- New patch using the xe_mmio_gem infra for PCI barrier mmap
- New patch for rejecting VMA split
- Using dma_resv lock for synchronization
- SIGBUS instead of dummy page on access after destroy
- Some changes in patch splitting (e.g. the vm_pgoff handling now lives
  in the destroy-flow patch alongside the zap that needs it)

v2:
- New patch 1/5: fix dummy page WB/UC aliasing (Sashiko)
- Patch 2/5: no longer modifies xe_mmio_gem_vm_fault_dummy_page() (handled by 1/5)
- Patch 3/5: unchanged
- Patch 4/5: compute pfn inside scoped_guard
- Patch 5/5: adapt to xe_mmio_gem_vm_fault_dummy_page() signature change, fix "objecthas" typo

Ilia Levi (5):
  drm/xe/mmio_gem: forbid VMA split
  drm/xe/mmio_gem: use write-back mapping for dummy page
  drm/xe/mmio_gem: simplify fault handler loop
  drm/xe/mmio_gem: cache the dummy page per object
  drm/xe/mmio_gem: fix destroy flow

Matthew Auld (1):
  drm/xe: convert PCI barrier mmap to use xe_mmio_gem

Shuicheng Lin (1):
  drm/xe/mmio_gem: Revoke drm_vma_node on xe_mmio_gem destroy

 drivers/gpu/drm/xe/xe_bo.c           |  24 ++++--
 drivers/gpu/drm/xe/xe_bo.h           |   1 -
 drivers/gpu/drm/xe/xe_device.c       | 102 ++-----------------------
 drivers/gpu/drm/xe/xe_device_types.h |  12 +++
 drivers/gpu/drm/xe/xe_mmio_gem.c     | 108 ++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_mmio_gem.h     |   2 +-
 6 files changed, 112 insertions(+), 137 deletions(-)

-- 
2.49.1

