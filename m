Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A35108B911
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 12:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8739610EA9E;
	Fri, 20 Mar 2026 12:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9SGSKx+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929E010EA9A
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 12:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774008716; x=1805544716;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N2MmakzrS2WiiqUbrFnxWbIqaorp3PYPDunaSbKnCGg=;
 b=V9SGSKx+Syv6ewm1c8zIYahAJ4xadDptmrl8vcwGNPD2SL7JZk/IhTJg
 uQ/cDdhYSE8rJ6s70QJ6zA49Unv6hOIuiub8OLKIeiROBBTh4KWiB3lyB
 ZVw6AYPdbc9GVwzNreQ6DJvMkxBEwyp1Ue2vhA7iPzmvVctNQh+bnnZak
 pSKc6JIapTbSRzr9cUFbRx5xQDI/hJa4hauCLLdV3C9e0HJr4GX3m6RJN
 W8I68lSY+tXXUpMag0KI1YtIcBATFLSA56m5g0/fJ4rPZtZMcxodc2RQT
 SFfrIQVeSvcjCeewGWzUPjkpX48vTMzadP+EBaKHzXOY0HQvod8R+u695 A==;
X-CSE-ConnectionGUID: eO/5ndi1RHCTXe1ayyoHdw==
X-CSE-MsgGUID: wYzIJMvHQaSviM8a1QuB7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="85717798"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="85717798"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 05:11:44 -0700
X-CSE-ConnectionGUID: LA0SF/IhT8azrsjQvHTmFw==
X-CSE-MsgGUID: MgIeQH2YTBKJ6ITn5vUH2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227399273"
Received: from ksatya-dev.iind.intel.com ([10.190.229.161])
 by orviesa003.jf.intel.com with ESMTP; 20 Mar 2026 05:11:42 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/3] USE drm mm instead of drm SA for CCS read/write
Date: Fri, 20 Mar 2026 12:12:28 +0000
Message-ID: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
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

Satyanarayana K V P (3):
  drm/xe/mm: add XE DRM MM manager with shadow support
  drm/xe/mm: Add batch buffer allocation functions for xe_drm_mm manager
  drm/xe/vf: Use drm mm instead of drm sa for CCS read/write

 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_bb.c                 |  67 +++++++
 drivers/gpu/drm/xe/xe_bb.h                 |   6 +
 drivers/gpu/drm/xe/xe_bo_types.h           |   3 +-
 drivers/gpu/drm/xe/xe_drm_mm.c             | 200 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_mm.h             |  55 ++++++
 drivers/gpu/drm/xe/xe_drm_mm_types.h       |  42 +++++
 drivers/gpu/drm/xe/xe_migrate.c            |  56 +++---
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  39 ++--
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |   2 +-
 10 files changed, 424 insertions(+), 47 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_drm_mm.c
 create mode 100644 drivers/gpu/drm/xe/xe_drm_mm.h
 create mode 100644 drivers/gpu/drm/xe/xe_drm_mm_types.h

-- 
2.43.0

