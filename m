Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A489FC54E67
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 09:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586941123A2;
	Thu, 28 Mar 2024 09:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SADVViBx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B8E1123A2
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 09:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711619123; x=1743155123;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZZ+GX6WUBKhH9Wy0u3VTFhIyz5PpBZzRUeO5JV+JGts=;
 b=SADVViBxqnkkjYw28/w2r2Z2EnS6VCK26OBXtkE2B/FJ17hAtuodyDBQ
 xpN3WkvNCyHVe84eryuwbJoHaHKj6sllKYZ59umErUU6OkYMKxxzsMseM
 iyAfp5fyhEX7upIUFT5v6OpIyEsEcvkmYvFqDXLV3cvVC0lWyBg1HBXI9
 AhDtijV2h95MD2Z9hKo4mnt3LxBYnlnQmnVIzecN0HOOr6m+rE1i6VHRV
 GuOWEOl30o3snIzKZOf5gPV78xcKU40lP2qHvBfa1iht2fNBmQ13m0oQL
 FpL1qYDnOwu4ziPJEBBQqH+SieNXB5wiqrj/znmuFjkB+Ztk55S0RPWHC w==;
X-CSE-ConnectionGUID: /EqJKPuiSlu6G5jO6zMUPA==
X-CSE-MsgGUID: 17/1rqZPRMC0kS8C0gbgkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6615427"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6615427"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:45:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="16611721"
Received: from djustese-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.185])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:45:22 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 0/8] drm/ttm, drm/xe: Shrinker support
Date: Thu, 28 Mar 2024 10:44:46 +0100
Message-ID: <20240328094454.272050-1-thomas.hellstrom@linux.intel.com>
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

Replace the system memory watermark accounting with a shrinker.

Thomas Hellström (8):
  drm/ttm: Allow TTM LRU list nodes of different types
  drm/ttm: Use LRU hitches
  drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist
    moves
  drm/ttm: Allow continued swapout after -ENOSPC falure
  drm/ttm: Add a virtual base class for graphics memory backup
  drm/ttm/pool: Provide a helper to shrink pages.
  drm/xe, drm/ttm: Provide a generic LRU walker helper
  drm/xe: Add a shrinker for xe bos

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |   4 +
 drivers/gpu/drm/ttm/Makefile           |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c | 122 ++++++++
 drivers/gpu/drm/ttm/ttm_bo.c           |   1 +
 drivers/gpu/drm/ttm/ttm_device.c       |  33 ++-
 drivers/gpu/drm/ttm/ttm_pool.c         | 388 ++++++++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c     | 231 ++++++++++++---
 drivers/gpu/drm/ttm/ttm_tt.c           |  32 ++
 drivers/gpu/drm/xe/Makefile            |   2 +
 drivers/gpu/drm/xe/xe_bo.c             | 106 +++++--
 drivers/gpu/drm/xe/xe_bo.h             |   3 +
 drivers/gpu/drm/xe/xe_device.c         |   8 +
 drivers/gpu/drm/xe/xe_device_types.h   |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c       | 204 +++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h       |  18 ++
 drivers/gpu/drm/xe/xe_ttm_helpers.c    | 166 +++++++++++
 drivers/gpu/drm/xe/xe_ttm_helpers.h    |  36 +++
 drivers/gpu/drm/xe/xe_vm.c             |   4 +
 include/drm/ttm/ttm_backup.h           |  48 +++
 include/drm/ttm/ttm_device.h           |   2 +
 include/drm/ttm/ttm_pool.h             |   4 +
 include/drm/ttm/ttm_resource.h         |  96 +++++-
 include/drm/ttm/ttm_tt.h               |  12 +
 23 files changed, 1433 insertions(+), 91 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.c
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.44.0

