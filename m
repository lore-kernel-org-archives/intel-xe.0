Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BB5C07E8E
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 17:24:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF9A10FD2F;
	Wed, 24 Apr 2024 17:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nR/rm3RX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C0E10FD2F
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 17:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713979463; x=1745515463;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PJ1yNDyTVKDgyW5U9Aa/L26Xc5MydCbzuNAEucqajtc=;
 b=nR/rm3RXArjffTFxhkyyY9K2djQpsfDf4CYbAqz3tuSsZHmwdOKal9fW
 Idb9zLg4LfNhftnB4E23MRa/6UPrv/EwtAALHl5K+0sx9MJHZW/j37k4U
 MMRtjUNyBa+ooQbANix6mMr/uzsF81D1pWY6aAVyKD0ZKPdTGEuZ2WhL+
 ZC0Y9SFrqX4bNFmI5C+xSED0janBZLV8MxF1OD+nlQb3w2vQ/NdENoOA7
 rLCexWNTXyTcvjReH5PAzQTba+7nnjuxmU8EeKvwJxnKFi66eYdhh0TJm
 Sn9JJ4NDdXzy57UY5k3mXXIwIpC2MNJ8jSRcMXMVvJkLPtFGxCx5cx80O A==;
X-CSE-ConnectionGUID: pFgXUCYFSpCSgm30xaZw3w==
X-CSE-MsgGUID: g9cddqedTPugs/9+msPn3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="12561473"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="12561473"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 10:24:22 -0700
X-CSE-ConnectionGUID: LFgIUhr/SC+Napw45KOGuw==
X-CSE-MsgGUID: fd5XBH6/TnWr4JPXo+F9yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="24825479"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 10:24:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 00/13] Prep patches for 1 job per VM bind IOCTL
Date: Wed, 24 Apr 2024 10:23:39 -0700
Message-Id: <20240424172352.1704851-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Pacthes posted on [1] which have gone through a round of reviews.

Tested throughly on TGL which IGT suite.

v2:
 - Address Oak's feedback

Matt

[1] https://patchwork.freedesktop.org/series/125608/


Matthew Brost (13):
  drm/xe: Lock all gpuva ops during VM bind IOCTL
  drm/xe: Add ops_execute function which returns a fence
  drm/xe: Move migrate to prefetch to op_lock_and_prep function
  drm/xe: Add struct xe_vma_ops abstraction
  drm/xe: Use xe_vma_ops to implement xe_vm_rebind
  drm/xe: Simplify VM bind IOCTL error handling and cleanup
  drm/xe: Use xe_vma_ops to implement page fault rebinds
  drm/xe: Add some members to xe_vma_ops
  drm/xe: Add vm_bind_ioctl_ops_fini helper
  drm/xe: Move ufence check to op_lock_and_prep
  drm/xe: Move ufence add to vm_bind_ioctl_ops_fini
  drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use
    this
  drm/xe: Delete PT update selftest

 drivers/gpu/drm/xe/tests/xe_migrate.c       |  86 ---
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |  16 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  59 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |   3 +
 drivers/gpu/drm/xe/xe_pt.c                  |  25 +-
 drivers/gpu/drm/xe/xe_sync.c                |  15 +
 drivers/gpu/drm/xe/xe_sync.h                |   1 +
 drivers/gpu/drm/xe/xe_vm.c                  | 674 ++++++++++++--------
 drivers/gpu/drm/xe/xe_vm.h                  |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h            |  22 +-
 10 files changed, 527 insertions(+), 376 deletions(-)

-- 
2.34.1

