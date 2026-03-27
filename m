Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18F510ED64F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 10:11:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C8F10EC5E;
	Fri, 27 Mar 2026 10:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcfBeSPP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A3C10EC5E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 10:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774606317; x=1806142317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kmsKmUZxshqdXmpWhMova/sP+iXSlxnle33TspDmUSE=;
 b=fcfBeSPPgAhQlJ7MyPiR1MXL18Aq/YJbfKsk7Xga/AuuGuOA8v9JBqsq
 nRwWckqOEkh5YgBUGka0ehr4LdzmcfsF6x5veuS8BAERzz0JaqyBTl++T
 4Votj1flG1XQUzy+ZWP/TQyG/Dqaw580ji5rpQsPKStVc9y9TSMCKBP/e
 ZeXjvg97X19UwdjQ7Zya9rGKCcQjPcE0KkWKlA15uGniwhxy4xSmXvNIp
 0mzUFlp7WFp+pG3OjgHZijrqSYcN0x51gvMUSc4IhLceeZz7tRKG3Q+R5
 JfpMWsl7V3n8J2NPz+3+pK5vZQ8DcWjYDn3Qrt2QjGwWhdxFyk8JG50G5 Q==;
X-CSE-ConnectionGUID: bGwRuWKCRYSs6NIjxyukHw==
X-CSE-MsgGUID: G6ypiMN5Srms/g5ZPtVB+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75792669"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="75792669"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 03:11:56 -0700
X-CSE-ConnectionGUID: upfYTm8nS06efQDy4LBylw==
X-CSE-MsgGUID: 2SQgU5vGRS6quprw2KnVdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="230197943"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa005.jf.intel.com with ESMTP; 27 Mar 2026 03:11:56 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 0/3] USE drm mm instead of drm SA for CCS read/write
Date: Fri, 27 Mar 2026 10:11:47 +0000
Message-ID: <20260327101146.3826819-5-satyanarayana.k.v.p@intel.com>
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
V1 -> V2:
- Renamed xe_drm_mm to xe_mm_suballoc (Thomas)
- Removed memset from xe_drm_mm_bb_insert() (Matt).
- Removed memset during manager init and insert (Matt)

Satyanarayana K V P (3):
  drm/xe/mm: add XE MM SUBALLOC manager with shadow support
  drm/xe/mm: Add batch buffer allocation functions for xe_mm_suballoc
    manager
  drm/xe/vf: Use drm mm instead of drm sa for CCS read/write

 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_bb.c                 |  67 +++++++
 drivers/gpu/drm/xe/xe_bb.h                 |   6 +
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 +-
 drivers/gpu/drm/xe/xe_migrate.c            |  56 +++---
 drivers/gpu/drm/xe/xe_mm_suballoc.c        | 195 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mm_suballoc.h        |  55 ++++++
 drivers/gpu/drm/xe/xe_mm_suballoc_types.h  |  42 +++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  39 ++---
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |   5 +-
 10 files changed, 419 insertions(+), 50 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_mm_suballoc.c
 create mode 100644 drivers/gpu/drm/xe/xe_mm_suballoc.h
 create mode 100644 drivers/gpu/drm/xe/xe_mm_suballoc_types.h

-- 
2.43.0

