Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3504BC27C65
	for <intel-xe@archiver.kernel.org>; Sun,  9 Jun 2024 19:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B331810E239;
	Sun,  9 Jun 2024 19:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UGB6Auln";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D56D10E22D
 for <intel-xe@lists.freedesktop.org>; Sun,  9 Jun 2024 19:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717961329; x=1749497329;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BTAHNnpKOrsm3KrEnbNArleJZcsBD6Jqpt6niMqKt3M=;
 b=UGB6AulnnxIIEnGZ6PJ+auxHvnzeR+aTmLrc3Ynhaz0raRuf9ggzqTOu
 sLFHjN5PzJ1dTMelxfCnaPwDnG1yAFXZQt6EROVtsLfZJpoFiY52FSqNV
 vxgMv0+6rwDqsBPiCNBZWzGo7UDmuZWTKPpu+OiCv96UA/0PfPvxl3vLC
 iiuFRh1yXYr+iCFvO5GyKmma4EiFY3hQx49MGebeq0ljsjND7bJV3/18e
 7bW3L2T8mAwg03C2AjfwoFZmjmL9Qz9k9mr0b/f3sXBRvNF1vZ+b2NhGU
 eexMzFwx11fZDFbjy8UDXmzbSoRVHw+4uFlj9EhIgrBv6/vmNS8Wq146z Q==;
X-CSE-ConnectionGUID: BrxfQ8/ET2iu0g/IkvASmA==
X-CSE-MsgGUID: oh+T0xoYTKGMB/IgskeZUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14740073"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="14740073"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 12:28:48 -0700
X-CSE-ConnectionGUID: uu1DJIxFRJGQ4FXsbszyrw==
X-CSE-MsgGUID: Yt1WXwW0QYOgchxKv2bOMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="43276462"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 12:28:47 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 00/11] Xe + TTM bo shrinker
Date: Sun,  9 Jun 2024 21:28:26 +0200
Message-ID: <20240609192837.77035-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

Testing the xe shrinker with power management.

Thomas Hellström (11):
  drm/ttm: Allow TTM LRU list nodes of different types
  drm/ttm: Slightly clean up LRU list iteration
  drm/ttm: Use LRU hitches
  drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist
    moves
  drm/ttm: Provide a generic LRU walker helper
  drm/ttm: Use the LRU walker helper for swapping
  drm/ttm: Use the LRU walker for eviction
  drm/ttm: Add a virtual base class for graphics memory backup
  drm/ttm/pool: Provide a helper to shrink pages
  drm/ttm: Use fault-injection to test error paths
  drm/ttm, drm/xe: Add a shrinker for xe bos

 drivers/gpu/drm/Kconfig                |  10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |   4 +
 drivers/gpu/drm/ttm/Makefile           |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c | 137 ++++++++
 drivers/gpu/drm/ttm/ttm_bo.c           | 463 ++++++++++++-------------
 drivers/gpu/drm/ttm/ttm_bo_util.c      | 214 ++++++++++++
 drivers/gpu/drm/ttm/ttm_device.c       |  29 +-
 drivers/gpu/drm/ttm/ttm_pool.c         | 412 +++++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c     | 264 +++++++++++---
 drivers/gpu/drm/ttm/ttm_tt.c           |  37 ++
 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c       | 118 +++++++
 drivers/gpu/drm/xe/tests/xe_bo_test.c  |   1 +
 drivers/gpu/drm/xe/tests/xe_bo_test.h  |   1 +
 drivers/gpu/drm/xe/xe_bo.c             | 139 +++++++-
 drivers/gpu/drm/xe/xe_bo.h             |   4 +
 drivers/gpu/drm/xe/xe_device.c         |   8 +
 drivers/gpu/drm/xe/xe_device_types.h   |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c       | 287 +++++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h       |  18 +
 drivers/gpu/drm/xe/xe_vm.c             |   4 +
 include/drm/ttm/ttm_backup.h           | 136 ++++++++
 include/drm/ttm/ttm_bo.h               |  48 ++-
 include/drm/ttm/ttm_pool.h             |   5 +
 include/drm/ttm/ttm_resource.h         |  99 +++++-
 include/drm/ttm/ttm_tt.h               |  20 ++
 26 files changed, 2090 insertions(+), 373 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.44.0

