Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C45DC36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 16:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2BD10E177;
	Fri, 21 Mar 2025 16:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mENyRWGT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24D210E177
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 16:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742574871; x=1774110871;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g4ksK8DHZchOguBJzFyzZB+NN1MNCj0rXwEuZkP+5Hc=;
 b=mENyRWGT80Ui66KPp4ICLrgQpiE7l+oWzC8JhZ/Yz00aFA5ExSg0Ob10
 wf7pC9dJwVW6VJdARnID44FrO5HkX14+Htfpl/tkq1SaFg8yQtEnbc2om
 0ehQkmoGYchjrSvlK90CVxGewqKNBWWP0/F5RFYMDQp/VW4DfQlldA4hE
 MmikLQClqWF3nlPO7xtds9kd+64be6czZf9vVkVjR4ZEMhqySLErAJiyK
 iDe8RldXQn0xbqmCPp6mrwhF42Ieosg7NKZcKPFiB7jIcRkS4S47FiHko
 Fd2DseXaLzoRq2OzRqmXl1mjla+rR2eeIEUlQcWD+Oio3+WTjF8zibb5h A==;
X-CSE-ConnectionGUID: WUUUph0dTpyEJ2pguGw4Bw==
X-CSE-MsgGUID: Km5YCJOASBq4FtfEnNkr0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43725615"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="43725615"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 09:34:31 -0700
X-CSE-ConnectionGUID: l3IRDPOMRO+Gz2jL2iunMw==
X-CSE-MsgGUID: JYhcPTGnTL2xwvos9my5GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="128665372"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 09:34:29 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 0/5] drm/xe: xe-only patches from the multi-device GPUSVM
 series 
Date: Fri, 21 Mar 2025 17:34:11 +0100
Message-ID: <20250321163416.45217-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

A collection of misc patches that are prerequisites for the multi-device GPUSVM
series but that are xe-only and can be merged separately.

Patch 1
- Improved conditional compilation for the Xe GPUSVM support
Patch 2
- Fix a pontential UAF
Patch 3
- Adds a bo remove callback. In addition to GPUSVM this will improve
  on our device unbind support.
Patch 4
- A small fix for multi-gpu-svm support
Patch 5
- A change in implicit UAPI and needed for multi-gpu-svm support.

v2:
- Address review comments for Patch 3 (Matthew Auld)
- Fix system memory atomic access in Patch 5 (Intel CI)

Thomas Hellström (5):
  drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
  drm/xe/svm: Fix a potential bo UAF
  drm/xe/bo: Add a bo remove callback
  drm/xe/migrate: Allow xe_migrate_vram() also on non-pagefault capable
    devices
  drm/xe/uapi, drm/xe: Make the PT code handle placement per PTE rather
    than per vma / range

 drivers/gpu/drm/xe/Kconfig           |  16 +++-
 drivers/gpu/drm/xe/Makefile          |   2 +-
 drivers/gpu/drm/xe/xe_bo.c           |  66 +++++++++++++---
 drivers/gpu/drm/xe/xe_bo.h           |   2 +
 drivers/gpu/drm/xe/xe_bo_evict.c     |  62 ++++++++++++++-
 drivers/gpu/drm/xe/xe_bo_evict.h     |   1 +
 drivers/gpu/drm/xe/xe_device.c       |   6 +-
 drivers/gpu/drm/xe/xe_device_types.h |  12 ++-
 drivers/gpu/drm/xe/xe_migrate.c      |   8 +-
 drivers/gpu/drm/xe/xe_pt.c           | 112 +++++++++++++--------------
 drivers/gpu/drm/xe/xe_query.c        |   2 +-
 drivers/gpu/drm/xe/xe_svm.c          |  22 +++++-
 drivers/gpu/drm/xe/xe_svm.h          |  72 ++++++++++++-----
 drivers/gpu/drm/xe/xe_vm.c           |   2 +-
 14 files changed, 278 insertions(+), 107 deletions(-)

-- 
2.48.1

