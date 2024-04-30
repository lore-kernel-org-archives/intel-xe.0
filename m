Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CC8C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 16:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92893112CEA;
	Tue, 30 Apr 2024 16:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g9+aGYx0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86909112CEA
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 16:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714495212; x=1746031212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0+53YZSNaUVfHkSBU3b91H+Oqwtvl9mZRNVLrkQmMQs=;
 b=g9+aGYx08d/t+nLXyaaSrD0NtuCT85FN6Hr4nBmQgL1KArHfkpC06HxO
 udIyG46mgtH3OSqxZV93l0i9gfSkWMGMQoNrqV2w4q7tpKtvWsMB+5QuE
 w3+q2fATDizEbnBqSR0OAh5+JpnoGV1rbxTDjiw9b/ZSIpcgN4h0sX0o0
 /e2eGxOEdoiMf0nXgWlzpVLENLiyZB/fxW+pls7/qY2M0fIMHi/xloO8b
 oLbKJea8y3UNaUnAGLXk1HyNa5WajCaBhEVAXRK5ICjI7w4qUlB8u1Lf0
 UEYf1YD5Cg4t6DLSKpV7W2b7vpemysGnZXbOwkbGLj/amhVlSLXHibfAT g==;
X-CSE-ConnectionGUID: t6naT6fNRb28kxE7zvgP9w==
X-CSE-MsgGUID: XG86q+X+T0OxaTHjoO1Kew==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10073927"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10073927"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 09:40:12 -0700
X-CSE-ConnectionGUID: TstJjX3EQfaUFT2zo75VAQ==
X-CSE-MsgGUID: rWh77CAtTGmNtf/hRWLBSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="26519117"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 09:40:09 -0700
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
Subject: [PATCH v6 0/5] Refactor default device atomic settings
Date: Tue, 30 Apr 2024 18:25:24 +0200
Message-ID: <20240430162529.21588-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The default behavior of device atomics depends on the
VM type and buffer allocation types. Device atomics are
expected to function with all types of allocations for
traditional applications/APIs. Additionally, in compute/SVM
API scenarios with fault mode or LR mode VMs, device atomics
must work with single-region allocations. In all other cases
device atomics should be disabled by default. PVC needs special
care as it doesn't support device atomics on SMEM.

v6: Only check LR mode to determine compute API as fault
    mode requires LR mode(Jose)
    Set AE=1 on SMEM+LMEM allocation when a buffer is migrated 
    to LMEM from SMEM(Brian)

v5: Fix broken atomics on PVC from v4 changes.

v4: Previous assumption that device atomics should be disabled
    by default on SMEM only BO was wrong as traditional applications
    will not use such allocations for CPU atomics. So remove the
    VM bind flag and the query uAPI and instead refactor default device
    atomics settings as per VM type and buffer allocations.


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

Nirmoy Das (5):
  drm/xe: Introduce has_atomic_enable_pte_bit device info
  drm/xe: Move vm bind bo validation to a helper function
  drm/xe: Introduce has_device_atomics_on_smem device info
  drm/xe: Add function to check if BO has single placement
  drm/xe: Refactor default device atomic settings

 drivers/gpu/drm/xe/xe_bo.c           | 14 +++++
 drivers/gpu/drm/xe/xe_bo.h           |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++
 drivers/gpu/drm/xe/xe_pci.c          |  5 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 drivers/gpu/drm/xe/xe_pt.c           | 37 +++++++++++--
 drivers/gpu/drm/xe/xe_vm.c           | 79 ++++++++++++++++------------
 7 files changed, 103 insertions(+), 38 deletions(-)

-- 
2.42.0

