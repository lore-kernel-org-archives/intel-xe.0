Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D262CD1297
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 17:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6B1112DDC;
	Wed, 10 Apr 2024 17:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwX3nnjY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81644112C29
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712769435; x=1744305435;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SQ8vrjw5zmLbyA+pgfPqRGJR4lFtRB+FXozfhobf+dM=;
 b=fwX3nnjYVXllL2g6PpodRUXi+JS5LZxr7PcUn64rCaa+XbD9DA+27Mgg
 Y49jsVAX2gREcagivEqHJeur3AY3qn2ytlqFlQqFUgravGXkNJSrXWixX
 yv4ndwZqFzFr4YQXCaRhJPgi9V6NJgLVkEI9KwTeCNdrzQdR0RKpK5u1t
 Y4w/X5lm3rQIF5lmZ5oVIULNiHwlCRH3ffz1LCzSQEJ2ESi7ZYsYxLRnJ
 BT31jg0kDzF43yzt1IhM9flWvKtUUczsFnxzx1gptHnvaBc/RpEURhxTo
 ljxWJa97fqDBKAu3nFSfY7VEc0mRv7721HQ2I8EVw2Vy7EN9cZhR0tR9Z Q==;
X-CSE-ConnectionGUID: Q4LVBNc6QYOpJdDaZ3oyEA==
X-CSE-MsgGUID: 1LJnZgjLTJCOf8FOWMHkMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8009729"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8009729"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:17:07 -0700
X-CSE-ConnectionGUID: FZFVOjC0QjmrANEUtmQrUA==
X-CSE-MsgGUID: HeaFJ2yUTIqPRZLejGr35w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20717869"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:17:04 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Brian Welty <brian.welty@intel.com>, Fei Yang <fei.yang@intel.com>,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, Oak Zeng <oak.zeng@intel.com>,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 0/3] Enable device atomics with a VM bind flag
Date: Wed, 10 Apr 2024 19:03:05 +0200
Message-ID: <20240410170308.409-1-nirmoy.das@intel.com>
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

Test-with: 20240410170041.24963-1-nirmoy.das@intel.com
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>

Nirmoy Das (3):
  drm/xe: Consolidate setting PTE_AE into one place
  drm/xe: Add function to check if BO has single placement
  drm/xe/uapi: Introduce VMA bind flag for device atomics

 drivers/gpu/drm/xe/xe_bo.c       | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h       |  1 +
 drivers/gpu/drm/xe/xe_pt.c       |  4 +---
 drivers/gpu/drm/xe/xe_vm.c       | 32 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 include/uapi/drm/xe_drm.h        |  9 +++++----
 6 files changed, 51 insertions(+), 11 deletions(-)

-- 
2.42.0

