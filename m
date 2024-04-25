Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E23CC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 22:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D7C10ECDC;
	Thu, 25 Apr 2024 22:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPENZANd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAD610ECDC
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 22:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714084725; x=1745620725;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7yscvHMyFiXBmb6zEevQj7sxz9EGyunZPH8zVz8sLGE=;
 b=iPENZANdkbA/cJ/0gj49q/meryXvMh2HPM/KQyUtE1iUtmrciNakIvHl
 NWDdSnNNIcfgEIn0ZmpGLJHse6xfvuVf9OGpbw1I1Map/Ujw27d5tL5Fn
 FCrJNAbFSW0H/4DEKVfpq4NnGzPY2sBlSSHkx+DHGAT5LqjZ2ty+DWtEW
 2xwNP2MhdXu4RmBP5zFS82GyqhlZssGclsTGCuh/My+IFJGJyVHNNszuj
 8OIL+ZedO62pHLecz1DeVmYJaY6mIjQTqLun91jrgq0D1l5tdmQoblJS2
 QaohrtP0i4JKuazTocKE+ylxA9TSjfF+nlIs4iCcKvFW25z+1qg14CYn6 Q==;
X-CSE-ConnectionGUID: MBWePqQvTIO2aAXiCgz7qA==
X-CSE-MsgGUID: hFGEmgS8ToCoCT0uk4G4Ug==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="27325050"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="27325050"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 15:38:45 -0700
X-CSE-ConnectionGUID: h2guZ3jITpm8Fouvq4yL7g==
X-CSE-MsgGUID: Zq01uDGSRqWZ6CcNkpIuxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="56167307"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 15:38:42 -0700
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
Subject: [PATCH v4 0/5] Refactor default device atomic settings
Date: Fri, 26 Apr 2024 00:23:41 +0200
Message-ID: <20240425222346.13026-1-nirmoy.das@intel.com>
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
device atomics should be disabled by default.

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
 drivers/gpu/drm/xe/xe_pt.c           | 24 +++++++--
 drivers/gpu/drm/xe/xe_vm.c           | 80 ++++++++++++++++------------
 7 files changed, 90 insertions(+), 39 deletions(-)

-- 
2.42.0

