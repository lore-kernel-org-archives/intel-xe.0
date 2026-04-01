Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF4210F6FD9
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 16:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B304E10E26A;
	Wed,  1 Apr 2026 16:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAM32RZU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F1010E26A
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 16:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775060081; x=1806596081;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/GESJgjTnLv2iTVRP2nOF7DSyMeZF/1LvPQqeszyNwU=;
 b=jAM32RZUAcx7YaxdYjJncnWsDYEUnFxIAClzaY+zBtdOdt7W5fhSLaHe
 MQ47A/YHkYW320fhtBK5aLMUMH2YhPI5JiKzmKLHnytjd2soaQh5MeqQr
 Ugvrr7p+Zzk1C8CXMTbwuKnFJXolFKrDJhoHhTf2ZQ21czh4/VtdXM4+x
 +wwI8Blm3+rrhrPpZG56/Z6e0inWwj78mjLo4A4p/b2uZS3mfcbkr0bEc
 qLZAvFNQBg6+jM6+6SnyarErXzwzoVPT8/4tHepVkQZXeeyPmu7Gwt7aN
 0Hmi9INf9Zg931XFWtVAbTgcw9sTgWg3OBHV0zCOj+wjTZUSbLOdMRIab w==;
X-CSE-ConnectionGUID: LfCIOd25RIeC7iruVDeX4Q==
X-CSE-MsgGUID: mWGWuKAdToKUic6V6jBLgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="98717125"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="98717125"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 09:14:40 -0700
X-CSE-ConnectionGUID: vYidhZoTT+6TQQcFhyDBpQ==
X-CSE-MsgGUID: GzTNQGpUS7mFwLidc/ylAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="222354391"
Received: from ksatya-dev.iind.intel.com ([10.190.229.161])
 by fmviesa010.fm.intel.com with ESMTP; 01 Apr 2026 09:14:39 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v3 0/3] USE drm mm instead of drm SA for CCS read/write
Date: Wed,  1 Apr 2026 16:15:25 +0000
Message-ID: <20260401161528.1990499-1-satyanarayana.k.v.p@intel.com>
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

Satyanarayana K V P (3):
  drm/xe/mm: add XE MEM POOL manager with shadow support
  drm/xe/mm: Add batch buffer allocation functions for xe_mem_pool
    manager
  drm/xe/vf: Use drm mm instead of drm sa for CCS read/write

 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_bb.c                 |  58 ++++
 drivers/gpu/drm/xe/xe_bb.h                 |   6 +
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 +-
 drivers/gpu/drm/xe/xe_mem_pool.c           | 379 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mem_pool.h           |  33 ++
 drivers/gpu/drm/xe/xe_mem_pool_types.h     |  30 ++
 drivers/gpu/drm/xe/xe_migrate.c            |  56 +--
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  48 ++-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |   5 +-
 10 files changed, 563 insertions(+), 56 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_mem_pool.c
 create mode 100644 drivers/gpu/drm/xe/xe_mem_pool.h
 create mode 100644 drivers/gpu/drm/xe/xe_mem_pool_types.h

-- 
2.43.0

