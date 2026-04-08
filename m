Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD771073C98
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 11:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FAA10E60F;
	Wed,  8 Apr 2026 11:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFssbXX1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A539B10E60F
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 11:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775646117; x=1807182117;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fDlDdpuh6P5ZAyIgH4eeVB4tl2WNrNJf9m2+CqvCYVY=;
 b=GFssbXX1ZiMr2KlrZypUwu61yUNRpRUUXQgF6NWoveCG9k47q7iL9geK
 sZkX+k5oAhWMUgSsLTs8wj1fL9QHHEnqk6LoEBMdDUPobhHlGn6POd3mL
 4DsvBCIIzJ82FAe+k4j2RxRryf3R8tAWF5Tl9522YyoAbduRIa/QWf1nU
 /O2QhMMCKP3u4mQgAnRAFJj066Lx+JUg/nW7atvlHoGKSA1/tr/l26LpN
 Ey7fU64p9u04PZheTpaaFuXvAoVgcb3fao+aYPQ0sym+u7tI32hrz9pF2
 DvLBsYi7VHi/VJJbJbtGVzhWXHsiRIvP0ZSaCm/JsdTp7cqxU2QMTDRgD Q==;
X-CSE-ConnectionGUID: CT/KbXKZSfml82mRIt3eiQ==
X-CSE-MsgGUID: cPYyVBMXRnGeUKs7Df+9zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87252019"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="87252019"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 04:01:55 -0700
X-CSE-ConnectionGUID: jAc5U1wmT1e2xKzymNrDmw==
X-CSE-MsgGUID: RvC060fYRVKJM/2cJ0URpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="232806051"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by orviesa004.jf.intel.com with ESMTP; 08 Apr 2026 04:01:55 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v4 0/2] USE drm mm instead of drm SA for CCS read/write
Date: Wed,  8 Apr 2026 11:01:46 +0000
Message-ID: <20260408110145.1639937-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

The suballocator algorithm tracks a hole cursor at the last allocation
and tries to allocate after it. This is optimized for fence-ordered
progress, where older allocations are expected to become reusable first.

In fence-enabled mode, that ordering assumption holds. In fence-disabled
mode, allocations may be freed in arbitrary order, so limiting allocation
to the current hole window can miss valid free space and fail allocations
despite sufficient total space.

Use DRM memory manager instead of sub-allocator to get rid of this issue
as CCS read/write operations do not use fences.

Used drm mm instead of drm sa based on comments from
https://lore.kernel.org/all/bbf0d48d-a95a-46e1-ac8f-e8a0daa81365@amd.com/

---
V3 -> V4:
- Cleaned documentation.
- Squashed chnages from xe_bb.c to xe_mem_pool.c
- Made xe_mem_pool_shadow_init() local.
- Renamed the xe_mem_pool_manager to xe_mem_pool.
- Fixed some other review comments.
- Cached iomem status in mem_pool, as the pool->cpu_addr need to be freed
in xe_mem_pool_fini() which is part of drm cleanup, but the BO is part of
devm cleanup.

V2 -> V3:
- Used xe_mem_pool_init() and xe_mem_pool_shadow_init() to allocate BB
pools.
- Renamed xe_mm_suballoc to xe_mem_pool_manager
- Splitted xe_mm_suballoc_manager_init() into xe_mem_pool_init() and
xe_mem_pool_shadow_init() (Michal)
- Made xe_mm_sa_manager structure private. (Matt)
- Introduced init flags to initialize allocated pools.

V1 -> V2:
- Renamed xe_drm_mm to xe_mm_suballoc (Thomas)
- Removed memset from xe_drm_mm_bb_insert() (Matt).
- Removed memset during manager init and insert (Matt)

Satyanarayana K V P (2):
  drm/xe: Add memory pool with shadow support
  drm/xe/vf: Use drm mm instead of drm sa for CCS read/write

 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 +-
 drivers/gpu/drm/xe/xe_mem_pool.c           | 403 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mem_pool.h           |  35 ++
 drivers/gpu/drm/xe/xe_mem_pool_types.h     |  21 ++
 drivers/gpu/drm/xe/xe_migrate.c            |  56 +--
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  54 +--
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |   5 +-
 8 files changed, 523 insertions(+), 55 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_mem_pool.c
 create mode 100644 drivers/gpu/drm/xe/xe_mem_pool.h
 create mode 100644 drivers/gpu/drm/xe/xe_mem_pool_types.h

-- 
2.43.0

