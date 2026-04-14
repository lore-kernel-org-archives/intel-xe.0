Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D3CF9D0EE
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 18:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5848210E063;
	Tue, 14 Apr 2026 18:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGIu4AWB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A29E10E063
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 18:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776190531; x=1807726531;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x2XYU/FQo1hDEuYdmbnUtE5O00FD/GvXS/8DqSUgDfQ=;
 b=oGIu4AWBVCrJqkTHwawZ+n/ZJNMHeVljzDoX/Mwi2zcYTkDHX391V58s
 O1/gXAfBxKf9FxTiFgWhBIk1oNpP0z4bM+TYoERn8QlIFOl4RK2yPfGad
 LMQ8SrweacRl1ssaL/xZR2AZfhQ4HzcTIShw5A6oWsVALcLWWY+hx9Biq
 tjhA97LyRmYm0NMT84I1SqfuzdWKmC/S+5WXnQ1zFMuaGJN0tGnHm2Jnp
 LsGtPSoyqmvNNZqwHrbMRtlEw4Y+DrfzyCb6Tu8NXNoQgoV2inMZM7GGI
 YdhH71BPae8KsG5NB539Zz2OhQ5IoKXNN5Z8aYiMxKkouAC+oe9x8pz83 A==;
X-CSE-ConnectionGUID: RWVAaeVXT3CgMOLAg4hUOg==
X-CSE-MsgGUID: QSyHHDVwQwCuhLVmyhpd1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="87464705"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="87464705"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 11:15:31 -0700
X-CSE-ConnectionGUID: McuQ5SORQ4m0TD7U/dZl+g==
X-CSE-MsgGUID: hwC+GaAcRH+YwCAZ++gDqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253387931"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa002.fm.intel.com with ESMTP; 14 Apr 2026 11:15:31 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 0/3] drm/xe/pat: Type cleanup and invalid index hardening
Date: Tue, 14 Apr 2026 11:15:25 -0700
Message-ID: <20260414181528.282398-1-x.wang@intel.com>
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

Patch 3 introduces xe_cache_pat_idx(), an inline helper that validates
cache_mode bounds and checks for XE_PAT_INVALID_IDX before returning the
PAT index.  All 20 pat.idx[] read sites across the driver are converted.

Suggested-by: Matthew Auld <matthew.auld@intel.com>

v2:
- Dropped xe_assert() guards from xe_migrate that were added in v1 patch 2;
  the new helper in patch 3 now provides the same coverage uniformly across
  all call sites (Matthew Auld)
- New patch 3: xe_cache_pat_idx() helper with xe_assert() for every
  pat.idx[] read access, including bounds check on cache_mode

Xin Wang (3):
  drm/xe: Standardize pat_index to u16 type
  drm/xe/pat: Default XE_CACHE_NONE_COMPRESSION to invalid
  drm/xe/pat: Introduce xe_cache_pat_idx() helper

 drivers/gpu/drm/xe/display/xe_fb_pin.c | 11 ++++++-----
 drivers/gpu/drm/xe/tests/xe_migrate.c  |  3 ++-
 drivers/gpu/drm/xe/xe_device_types.h   |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c           |  7 ++++---
 drivers/gpu/drm/xe/xe_migrate.c        | 15 ++++++++-------
 drivers/gpu/drm/xe/xe_pat.c            |  1 +
 drivers/gpu/drm/xe/xe_pat.h            | 24 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pt.c             |  3 ++-
 drivers/gpu/drm/xe/xe_vm.c             |  8 ++++----
 9 files changed, 51 insertions(+), 23 deletions(-)

-- 
2.43.0

