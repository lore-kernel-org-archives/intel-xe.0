Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A77C00A94
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 15:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3484C11265C;
	Mon, 15 Apr 2024 15:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5p3vbc9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC0711265C
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 15:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713193603; x=1744729603;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GOs7FcO545OmMyGlyr4tluTRW+bD6HDVykgHteZefdk=;
 b=T5p3vbc9a4tCjfXMVMFTib2c5zOVOeTJzo87W5nPH4B+5ZdAsZ3HXhKD
 +zPYYSBfQDUbxh+03b/DKpIpPWEwb4dSioxUKi5YkqAhmnw/3dkusIbqh
 q3r8NsA88R4EfWVUEAEbfnXFkAgUEbmZ9+h0EL5iClOQj6wvW8cTYxfP1
 fx5u/MqDQZ9a/J3+OMPvvSJ1dmv0SogkqqbMQ6vr/oiE8DD1yL1fQjx6A
 cDBeE9rSVHjCdBAFYOqsxwvQKo6v6BDLWni/fqpUKxPSF0lQJTnshyZZV
 U/3kf9ZmznuFJyyiptFVyHOBRr6o/ZVYEUPYdoBkb/6jRxPMh72unouKc A==;
X-CSE-ConnectionGUID: YSlsoM4FSsqXtHne3mg9aw==
X-CSE-MsgGUID: xWWH39duTpiI/DY6+M6F4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="20013290"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="20013290"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 08:06:40 -0700
X-CSE-ConnectionGUID: DIR7eYZkR/erv/Q84gkptQ==
X-CSE-MsgGUID: azbs4Fj8R1e+l4HPllZOMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22414837"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 08:06:37 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Brian Welty <brian.welty@intel.com>, Fei Yang <fei.yang@intel.com>,
 Jose Souza <jose.souza@intel.com>,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, Oak Zeng <oak.zeng@intel.com>,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 0/7] Enable device atomics with a VM bind flag
Date: Mon, 15 Apr 2024 16:52:07 +0200
Message-ID: <20240415145214.25641-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Currently device atomics in SMEM only buffer is not supported and
given that simultaneous usage of device atomics and CPU atomics on
the same SMEM buffer is not guaranteed to function without migration,
and UMD expects no migration for SMEM-only buffer objects, so this
provide a way to set device atomics when UMD is certain to use the
buffer only for device atomics.

v3: Capture ret value of xe_vm_bind_ioctl_validate_bo(Matt B).
    Remove redundant coh_mode param from xe_vm_bind_ioctl_validate_bo().
    Remove has_device_atomics_on_smem from xe_graphics_desc(Jose).
    Replace DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM with 
    config flag DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM(Jose).
    Mention that PTE_AE will not be applied to userptr(Matt R)

v2: Add BO helper func in xe_vm_bind_ioctl()(Matt B).
    Use XE_IOCTL_DBG for checks(Matt B).
    Move platform checks with help of adding flags in
    intel_device_info(Matt B).
    Add document for DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS(Matt B). 
    Create query uAPI for this newly added VM bind flag(Jose, Lionel).

Test-with: 20240415143528.4107-1-nirmoy.das@intel.com
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Jose Souza <jose.souza@intel.com>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>

Nirmoy Das (7):
  drm/xe: Introduce has_atomic_enable_pte_bit device info
  drm/xe: Consolidate setting PTE_AE into one place
  drm/xe: Add function to check if BO has single placement
  drm/xe: Move vm bind bo validation to a helper function
  drm/xe: Introduce has_device_atomics_on_smem device info
  drm/xe/uapi: Introduce VMA bind flag for device atomics
  drm/xe/uapi: Add a query flag for has_device_atomics_on_smem

 drivers/gpu/drm/xe/xe_bo.c           |  14 ++++
 drivers/gpu/drm/xe/xe_bo.h           |   1 +
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_pci.c          |   5 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
 drivers/gpu/drm/xe/xe_pt.c           |   4 +-
 drivers/gpu/drm/xe/xe_query.c        |   3 +
 drivers/gpu/drm/xe/xe_vm.c           | 106 +++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm_types.h     |   2 +
 include/uapi/drm/xe_drm.h            |  22 ++++--
 10 files changed, 116 insertions(+), 46 deletions(-)

-- 
2.42.0

