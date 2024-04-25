Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E1AC19F53
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 04:54:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5766E11A0E8;
	Thu, 25 Apr 2024 04:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXKFlIrV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FF911A0E4
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 04:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714020883; x=1745556883;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PVS2yvYmPYc8Oi8tPuSoq47KkyeEqFAMSabLev8mW5k=;
 b=CXKFlIrV3fms7uIXE562jn6abmjfrn3mr3wpX97BMC2I6e7LKs38BXTH
 pT7fWUUOgAMvk4bENcKUpHeLer3dixgf7DA7Jhp8uYNaAt+O32Lit11aA
 x4tpIhYLqNyV3lhhSvZJkxeqaej8QDBmCDxTBo8Jpw8Igbhu/bW6rUlVv
 TBgMrZrk2zBLUh27llWF9jzUXZHMKEJaXD7zz8PLM6S6vb0UskqQAigMX
 KSWLLOtE9yMwuG5tTnYOBk/1c9OKES6X1yb8AVINK01my3CC55+zxhMIc
 4rU2sHlTud+8a85HC4REKxa6p3+DkthBznQfn+A1QWMaXjKFDdNnONNfH g==;
X-CSE-ConnectionGUID: cmq0+2VzSWe6UVlaNipo+w==
X-CSE-MsgGUID: rvBJ6a9uSbSLG9gejSFH1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20374868"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="20374868"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:54:42 -0700
X-CSE-ConnectionGUID: VN74d/+GSgGpNSxcDWybQA==
X-CSE-MsgGUID: 6qa4NTa8R1KDFytCFNnz5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="24996471"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:54:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 00/13] Prep patches for 1 job per VM bind IOCTL
Date: Wed, 24 Apr 2024 21:55:00 -0700
Message-Id: <20240425045513.1913039-1-matthew.brost@intel.com>
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
v3:
 - Fix CI failure

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

