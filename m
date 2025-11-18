Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AD1CED631
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 12:07:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238EC10E490;
	Tue, 18 Nov 2025 12:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJrbX5V5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE54710E490
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 12:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763467670; x=1795003670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vr8CizESIdmrLhhYzYpEQzzwRzFtCTZvrgU2cwWd7zA=;
 b=CJrbX5V5HVUq8bBXww3mYdy0unXLyICOoAXAQuoH1rZkC2rcei8ZckTs
 2R1+WL04Yf60xatIZbvWWJr98lJozMruJB/7qPDGrXw3TmHXbJggJIQ14
 nTM9yjNlMbmAw7Hc3bbVi01X/O17yd4d6NB1YsJOBnXCvdHA+p4IijT1N
 cFfu5Jk8xShQpNJIAiQycd5kc1Ws5O7Xq6oA9ELCd2RO+pfqzypKLAAZc
 2iq1vLBTwU1ljz+5mB/R9IN3Cy7BaY7IxR9jISniqqFaOn0s2Lw1mB2nD
 d35UgVQsUTcg+4gqoSm1OyitZSQctAGJz8aofFL5SyaE/bPvKBuHZyqug g==;
X-CSE-ConnectionGUID: 9zuUWYhrTYidB/Iy5coyJA==
X-CSE-MsgGUID: h1DQvApuQqGAody0aEZ2ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69338884"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="69338884"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 04:07:49 -0800
X-CSE-ConnectionGUID: n8Psf37+Tiarx+PlqFdNHw==
X-CSE-MsgGUID: 6yW3PQK6Reyyff1bIw/rJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190898083"
Received: from gsd-build.iind.intel.com ([10.190.229.175])
 by orviesa008.jf.intel.com with ESMTP; 18 Nov 2025 04:07:48 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v3 0/2] Improve CCS save/restore series (cont...)
Date: Tue, 18 Nov 2025 12:07:43 +0000
Message-ID: <20251118120745.3460172-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

CCS copy command consist of 5-dword sequence. If vCPU halts during
save/restore operations while these sequences are being programmed,
incomplete writes can cause page faults during IGPU CCS metadata saving.

Use shadow buffer management to prevent partial write issues during
CCS operations.

---
V2 -> V3:
- Removed `goto` in xe_migrate_ccs_rw_copy() and returned error as guard
mutex is used here(Matt B).

V1 -> V2:
- Updated xe_sa_bo_swap_guard_lock() to use guard(mutex) class (Michal W).
- Moved xe_device_wmb() into xe_sriov_vf_ccs_rw_update_bb_addr() (Matt B).
- Added kernel doc for xe_sa_bo_swap_shadow() and xe_sa_bo_sync_shadow()
functions (Matt B).
- Removed xe_sa_bo_swap_guard_lock() and xe_sa_bo_swap_guard_unlock() and
created xe_sa_bo_swap_guard() to which return mutex. (Michal W).


Satyanarayana K V P (2):
  drm/xe/sa: Shadow buffer support in the sub-allocator pool
  drm/xe/vf: Shadow buffer management for CCS read/write operations

 drivers/gpu/drm/xe/xe_guc_buf.c      |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c      | 57 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_migrate.h      |  3 ++
 drivers/gpu/drm/xe/xe_sa.c           | 67 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sa.h           | 20 ++++++++-
 drivers/gpu/drm/xe/xe_sa_types.h     |  3 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 22 +++++++--
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
 8 files changed, 164 insertions(+), 11 deletions(-)

-- 
2.43.0

