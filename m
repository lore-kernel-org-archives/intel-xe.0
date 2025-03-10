Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED53BC28B2E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 12:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B200610E416;
	Mon, 10 Mar 2025 12:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUWo9N13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F3010E416
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 12:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741609175; x=1773145175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mwhE3szQ8Kgsg/LIVkpbrJmpOlr4ta216GsZL7VgepE=;
 b=ZUWo9N13CP7328WqL4uPNcmccGbwCA9t1+0O7pWgKtKbY21iuwp8/IOE
 Cdy/sEBlJIv7TOBPKIsWydfjnMv2qDeoOkbDaq5fPxmPqhBoRS0CvUCLX
 k00HLAMhjmQsjfx+RvXGz9FBgnIm+iiSuuBd9kd2tFqUPt3tH09kiGUvp
 AwwkUbwWdjgpvFmLO/5cIJR9lmG8Yf0F3WQohDa1orw+eECxLGyvMTdfT
 TX6FquHJ8vu+GOCc/5pGUU9YzhfbJvaWyDGlMVD7gaVTgs/fitq2Fb7fN
 30GpPDczFKk6fVx7KVVgef7w04q+abfhnMr3e2uOykVkDwPL+f5sN5yBV g==;
X-CSE-ConnectionGUID: 138rbIyNQZuNKzUII7zpbQ==
X-CSE-MsgGUID: NGfFtlnzTF+bFcb7rhQfFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="65056405"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="65056405"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 05:19:35 -0700
X-CSE-ConnectionGUID: WNm5apTETo6fxmBS8D2ytg==
X-CSE-MsgGUID: Cs75oGoVQ06ZawHS3zmoSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="143179047"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2025 05:19:34 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 00/12] Prefetch Support for svm ranges
Date: Mon, 10 Mar 2025 18:13:29 +0530
Message-Id: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
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

This series builds upon the SVM work by Matt Brost and introduces the
ability to prefetch SVM ranges. The prefetch functionality utilizes the
existing ioctl vm_bind for the user interface.

Prefetching ensures that pages are populated in the requested region and
that PTEs are updated, thereby preventing GPU page faults.

Region 0: Ranges will remain in SMEM, and only PTE updates will occur.
Region 1: Ranges will migrate to VRAM, and PTEs will be updated
accordingly.

Himal Prasad Ghimiray (12):
  drm/xe: Introduce xe_vma_op_prefetch_range struct for prefetch of
    ranges
  drm/xe: Make xe_svm_alloc_vram public
  drm/xe/svm: Helper to add tile masks to svm ranges
  drm/xe/svm: Make to_xe_range a public function
  drm/xe/svm: Make xe_svm_range_* end/start/size public
  drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take an increment
    value
  drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
  drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
  drm/xe/svm: Allow unaligned addresses and ranges for prefetch
  drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
  drm/xe/svm: Implement prefetch support for SVM ranges
  drm/xe/vm: Add debug prints for SVM range prefetch

 drivers/gpu/drm/xe/xe_gt_pagefault.c |  24 +--
 drivers/gpu/drm/xe/xe_pt.c           |  81 ++++++---
 drivers/gpu/drm/xe/xe_svm.c          |  99 +++++++----
 drivers/gpu/drm/xe/xe_svm.h          |  79 +++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 252 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.h           |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h     |  15 ++
 7 files changed, 451 insertions(+), 101 deletions(-)

-- 
2.34.1

