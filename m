Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB39F433C7
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 04:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3F410E179;
	Thu, 16 Apr 2026 04:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+3Ts+7S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2F010E179
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 04:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776315329; x=1807851329;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iTLRZ/f6923XUZeTV3RdQ2nHa5Dy65h9mxWJNXJYgaw=;
 b=W+3Ts+7SaUu+gh1P1r5SxWbwwII6DVO74+GwjzM2/rL4DM3scWsw8J80
 ghGaCT4ULPQly4C9+wUqCH6sq5X4fD3H3cjSkwUIqxbq755s7lDyP/dQG
 D8tSbHsooDkvHmYe4CcsWuA2iDzU/h+4ms8oXm7ZIY/UQaL6FnmQmKKKZ
 qoXU21mdA8K4Pg33ran3PXPBng5Kr8WvE4ex1nQU7aj5V1gObRHCSvs84
 dAmsIO7EuQtIChEUwwplBwDhpKe1+FRT44BGj5o7S705tpg/nErS9s4CN
 dR5dWpMGkJdslVb/N7ciyXhdrvhFTmYl8X3pZzYqv2vyTiFWAT2Vcx4et A==;
X-CSE-ConnectionGUID: 6dggfOeQSKOQK0VDZ+7+eA==
X-CSE-MsgGUID: N/KmTR6EQbGB5II1YN7qqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77487475"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77487475"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 21:55:28 -0700
X-CSE-ConnectionGUID: mpyrANf3Sby09/nAY2Ct+w==
X-CSE-MsgGUID: gAXwOCt7S7yHbvPPWUtgcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="232356470"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2026 21:55:27 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v5 0/3] drm/xe/pat: Type cleanup and invalid index hardening
Date: Wed, 15 Apr 2026 21:55:23 -0700
Message-ID: <20260416045526.536497-1-x.wang@intel.com>
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

Small follow-up series to harden the PAT subsystem:

Patch 1 fixes two remaining spots where pat_index was typed as u32/int
instead of u16, aligning with the rest of the driver.

Patch 2 defaults XE_CACHE_NONE_COMPRESSION to XE_PAT_INVALID_IDX (like
WB_COMPRESSION already does).

Patch 3 introduces xe_cache_pat_idx(), a macro helper that validates
cache_mode bounds and checks for XE_PAT_INVALID_IDX before returning the
PAT index. All 20 pat.idx[] read sites across the driver are converted.

Suggested-by: Matthew Auld <matthew.auld@intel.com>

v5:
- Patch 3: Use `struct xe_device *__xedev = (xe);` instead of `__xe` in
  the `xe_cache_pat_idx` macro to avoid shadowing/conflict with `__xe`
  used inside `xe_assert()` which caused a runtime pointer access error.

v4:
- Adopted a strictly decoupled approach for the `xe_cache_pat_idx()` macro
  helper. Dropped any new header dependencies (e.g. `xe_device_types.h`
  or `xe_pt_types.h`) from `xe_pat.h`, relying cleanly on the compilation
  contexts where the macro is expanded. Forward declarations are kept
  untouched.

v3:
- Rebased on latest drm-tip

v2:
- Dropped xe_assert() guards from xe_migrate that were added in v1 patch 2;
  the new helper in patch 3 now provides the same coverage uniformly across
  all call sites (Matthew Auld)
- New patch 3: xe_cache_pat_idx() helper with xe_assert() for every
  pat.idx[] read access, including bounds check on cache_mode


Xin Wang (3):
  drm/xe: Standardize pat_index to u16 type
  drm/xe/pat: Default XE_CACHE_NONE_COMPRESSION to invalid
  drm/xe/pat: Introduce xe_cache_pat_idx() macro helper

 drivers/gpu/drm/xe/display/xe_fb_pin.c | 11 ++++++-----
 drivers/gpu/drm/xe/tests/xe_migrate.c  |  3 ++-
 drivers/gpu/drm/xe/xe_device_types.h   |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c           |  7 ++++---
 drivers/gpu/drm/xe/xe_migrate.c        | 15 ++++++++-------
 drivers/gpu/drm/xe/xe_pat.c            |  1 +
 drivers/gpu/drm/xe/xe_pat.h            |  8 ++++++++
 drivers/gpu/drm/xe/xe_pt.c             |  3 ++-
 drivers/gpu/drm/xe/xe_vm.c             |  8 ++++----
 9 files changed, 36 insertions(+), 22 deletions(-)

-- 
2.43.0

