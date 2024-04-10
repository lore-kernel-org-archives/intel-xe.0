Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E74CD1299
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 05:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056E0113179;
	Wed, 10 Apr 2024 05:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hksWGYWw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACD2113173
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 05:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712727633; x=1744263633;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2M52C/iS3AbFRYuaKredPQuMA3zNsrlHrhuIUGQoX14=;
 b=hksWGYWwdNQw4MXbuKNJsrs1RiKyMo9EJMpoXMgfD6SWz6neaZH50y9E
 NxT9NHNZ4buw5VQQxFRDvTIJxNHBABmOrYt+OcmUfxfofYTp3LiF/jMkW
 oVmBYaA8N7ZR9LKB+kt6aFvE1Sin1p414vFaLFobMHN1HZuLZyFF5+zml
 /X+eFt5Cc2ThXuNIqMzhzl8beLRfOFOuN90JDUhjANkSU2x2LaUTUzgdb
 K124Nlo+z6yuKlPiPdJT8LPtopVMI4a31t8nBHveGq0xJ+IJkyqBSTMwn
 awUyHUFCE/BVo0AGtdSvMSc1yMWOjfMNYzZ/OIwCs02CTIdP+t9Nh8mlj w==;
X-CSE-ConnectionGUID: P8cno8rZRhyeDnPcQEZ2xg==
X-CSE-MsgGUID: e1j3300fSJetqrmYIWdBLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18679998"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18679998"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:40:32 -0700
X-CSE-ConnectionGUID: G0PcDeKpQnuaLOel2OeN2Q==
X-CSE-MsgGUID: gKQIsaDdTYGDpIc66sbO2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20536816"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:40:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 00/13] Prep patches for 1 job per VM bind IOCTL
Date: Tue,  9 Apr 2024 22:40:43 -0700
Message-Id: <20240410054056.478023-1-matthew.brost@intel.com>
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
  drm/xe: Move ufence check to op_lock
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
 drivers/gpu/drm/xe/xe_vm.c                  | 673 ++++++++++++--------
 drivers/gpu/drm/xe/xe_vm.h                  |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h            |  22 +-
 10 files changed, 526 insertions(+), 376 deletions(-)

-- 
2.34.1

