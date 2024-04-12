Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96158C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 09:37:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1778210F546;
	Fri, 12 Apr 2024 09:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJcJG8Qr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1973F10F546
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 09:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712914618; x=1744450618;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FN3bfoUjnattpvzR6US3qQtGf/ooM5T3sVdRegHbExk=;
 b=IJcJG8QroRPbPnw0uQXkWpKb43FtpFXYDApNJLFdZyfWiIT6yhTCzDxa
 qo+OTqvOfk1AGLbswal4X46zS9zg4Twzjkcv0w3pcicgNC8TyRAb3ErtX
 pknINHb1Pxa/lmuyRJQFveobSkUJx74N4LWADrSCztyrs8UEzqrOLqecD
 LvHVC1vKxuhQCXR5llD7zvYctMkv05ZU69f2y6vgfsUlvxxdrMaC+tnwx
 SV4+MyvQdjY/flzKoOUbgxkBCc4fLKZ1wfRCL04kK2FXzrqeyCm1+MYYq
 /IJK/LLJAbdQ2IFg6smFGUp3Q0rQ+jMUxxAZkHLMaXDZg3fz5qpLuZQ84 A==;
X-CSE-ConnectionGUID: lt1GHhsnQp6LCWlgtvl57Q==
X-CSE-MsgGUID: 7OFKs3oJT8GXrD0vw6d4KQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19075932"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="19075932"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:36:58 -0700
X-CSE-ConnectionGUID: qD70WWFKSNG8tQ7vy1tOCw==
X-CSE-MsgGUID: PmJP6d30RGKKAQ1ZVgAjwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="52342138"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:36:55 -0700
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
Subject: [PATCH v2 0/7] Enable device atomics with a VM bind flag
Date: Fri, 12 Apr 2024 11:22:42 +0200
Message-ID: <20240412092249.3636-1-nirmoy.das@intel.com>
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

v2: Add BO helper func in xe_vm_bind_ioctl()(Matt B).
    Use XE_IOCTL_DBG for checks(Matt B).
    Move platform checks with help of adding flags in
    intel_device_info(Matt B).
    Add document for DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS(Matt B). 
    Create query uAPI for this newly added VM bind flag(Jose, Lionel).

Test-with: 20240412090117.32727-1-nirmoy.das@intel.com
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
 drivers/gpu/drm/xe/xe_device_types.h |   4 ++
 drivers/gpu/drm/xe/xe_pci.c          |   5 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |   2 +
 drivers/gpu/drm/xe/xe_pt.c           |   4 +-
 drivers/gpu/drm/xe/xe_query.c        |   4 +-
 drivers/gpu/drm/xe/xe_vm.c           | 101 +++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm_types.h     |   2 +
 include/uapi/drm/xe_drm.h            |  20 ++++--
 10 files changed, 113 insertions(+), 44 deletions(-)

-- 
2.42.0

