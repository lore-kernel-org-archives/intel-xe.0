Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28463C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 14:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD77E10E1DB;
	Thu,  7 Dec 2023 14:12:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D226E10E1D6
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 14:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701958328; x=1733494328;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3oKxiVE/4JPdNRVMzb0pHKLIhc/HyiIUs7DvqrA9MyE=;
 b=KpDqi5izmxBkKuW1TdViOlNMHl2kGjlemOv9avYph4Lg4DSUsPqtTEO+
 bf7T4lGjhKBc0giZS9ChjjBlN+r6IHV0wEkdDk9nD2atZo5sAoIsOKBXu
 twJr9gipWNflput5a4nVnoVpThHgSLhCwLQehxRGdFpWpN9d+whQz6KC6
 +Ab3SnxUULt37vDwVFFbvixGaSJLnqNT8vIzYXthdyA8HD6TrcLubg8ic
 QlDU7a++ZhVHwx8nS1tzIjU6XPvaRrxLu6ChhK1OccjlNL+ShtS+dG/YP
 pBB7OQI3DUiGOsqLM4Dhnr+kbx9HEicYZ9L/QwmNXNWW6+ZFqaRsO9ztE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="12947497"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="12947497"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:12:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721479720"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721479720"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.234])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:12:06 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/16] drm/xe: Adjust to DRM GPUVM changes
Date: Thu,  7 Dec 2023 15:11:40 +0100
Message-ID: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

The needed changes for a rebase on top of the latest GPUVM updates.
We need to convert the xe changes to fixups, and a follow up-series
will make uses of the added GPUVM utilities once we have rebased.

Note that the drm/xe changes *all* need to be applied for the code to
compile.

Danilo Krummrich (11):
  drm/gpuvm: convert WARN() to drm_WARN() variants
  drm/gpuvm: don't always WARN in drm_gpuvm_check_overflow()
  drm/gpuvm: export drm_gpuvm_range_valid()
  drm/nouveau: make use of drm_gpuvm_range_valid()
  drm/gpuvm: add common dma-resv per struct drm_gpuvm
  drm/nouveau: make use of the GPUVM's shared dma-resv
  drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
  drm/nouveau: separately allocate struct nouveau_uvmm
  drm/gpuvm: reference count drm_gpuvm structures
  drm/gpuvm: add an abstraction for a VM / BO combination
  drm/gpuvm: track/lock/validate external/evicted objects

Thomas Hellström (5):
  drm/xe: Adjust to "drm/gpuvm: add common dma-resv per struct
    drm_gpuvm"
  drm/xe: Adjust to commit "drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm"
  drm/xe: Adjust to commit drm/gpuvm: reference count drm_gpuvm
    structures
  drm/xe: Adjust to commit "drm/gpuvm: add an abstraction for a VM/BO
    combination"
  drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm

 drivers/gpu/drm/drm_gpuvm.c            | 1131 ++++++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_bo.c   |   11 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h   |    5 +
 drivers/gpu/drm/nouveau/nouveau_drm.c  |    5 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h  |   10 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c  |   10 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  170 ++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.h |    8 -
 drivers/gpu/drm/xe/xe_bo.c             |   28 +-
 drivers/gpu/drm/xe/xe_bo.h             |   11 +-
 drivers/gpu/drm/xe/xe_exec.c           |    4 +-
 drivers/gpu/drm/xe/xe_migrate.c        |    4 +-
 drivers/gpu/drm/xe/xe_pt.c             |    6 +-
 drivers/gpu/drm/xe/xe_vm.c             |  164 ++--
 drivers/gpu/drm/xe/xe_vm.h             |   26 +-
 drivers/gpu/drm/xe/xe_vm_types.h       |    8 -
 include/drm/drm_gem.h                  |   32 +-
 include/drm/drm_gpuvm.h                |  521 ++++++++++-
 18 files changed, 1859 insertions(+), 295 deletions(-)

-- 
2.42.0

