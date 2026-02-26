Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E4BFD4618
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 04:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BCC10E0FF;
	Thu, 26 Feb 2026 04:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1CjQetn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE0C10E0FF
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 04:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772080119; x=1803616119;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1QzvFHNX88BKM2WUwpR9o5Jt2QW4T18tHfBGiUD5zEQ=;
 b=J1CjQetn11rb2/mdoO2JRx0/SCkGs3zUO2Povldni0MIbmIL55XwcmRJ
 iWzJDk+RTjZXtdxt/YpsAkMTDdMYHjgaeV5vgccxP20Xg+Fnqck7ZZUKL
 bfLoCxNnZtuq8Uq4Fjl2Fpt4A3iSATXQkvBkac6KxI+rkur7i6kVO+t57
 CsWFnX13R5KhpgDIH0jwgCr9B9jVEUL5m/K41vbTf2qDxkN0W8a2+PIz4
 /Tsle+2aoHkc1DTpfmVMBA3Ph56FfK6s/kDyULgw9zCje2nkG1X/spBKc
 dCrcXjKHw3vqQKTz8WBhVJG7wm3Un8fmHUfnu01+iYdVKjydcrwLGSEYz w==;
X-CSE-ConnectionGUID: he1V49huR3SW/TeFeggNmg==
X-CSE-MsgGUID: Pi8rgAnmR1OI25sNsRXLGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="98603126"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="98603126"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:28:38 -0800
X-CSE-ConnectionGUID: 7BV3ZfMOSYu03DlZYJQx3A==
X-CSE-MsgGUID: BI7RuOGqTu+9xcbjj0Mn2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="216334139"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:28:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v4 00/12] Fine grained fault locking, threaded prefetch,
 storm cache
Date: Wed, 25 Feb 2026 20:28:22 -0800
Message-Id: <20260226042834.2963245-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Fine-grained fault locking provides immediate benefits: it allows page
faults from the same VM to be processed in parallel (unless they target
the same range) and enables a sane multi-threaded prefetch
implementation. UMD prefetch benchmarks see 10% to 50% improvement in
prefetch performance on BMG depending on PCIe bus speed.

Once parallel fault processing is available, the pagefault queue can be
unified into a single queue with multiple workers pulling faults to
process. A single queue then allows a sensible pagefault cache to be
implemented, so that multiple faults targeting the same region can be
batched together and acknowledged in, ideally, a single pass. This saves
CPU cycles during pagefault handling and improves overall throughput of
the fault handler.

Significant improvements in UMD pagefault benchmarks can be seen when
utilizing this caching.

v3:
 - Fix kunit build (CI)
v4:
 - Actually fix kunit build (CI)

Matt

Matthew Brost (12):
  drm/xe: Fine grained page fault locking
  drm/xe: Allow prefetch-only VM bind IOCTLs to use VM read lock
  drm/xe: Thread prefetch of SVM ranges
  drm/xe: Use a single page-fault queue with multiple workers
  drm/xe: Add num_pf_work modparam
  drm/xe: Engine class and instance into a u8
  drm/xe: Track pagefault worker runtime
  drm/xe: Chain page faults via queue-resident cache to avoid fault
    storms
  drm/xe: Add pagefault chaining stats
  drm/xe: Add debugfs pagefault_info
  drm/xe: batch CT pagefault acks with periodic flush
  drm/xe: Track parallel page fault activity in GT stats

 drivers/gpu/drm/drm_gpusvm.c            |   2 +-
 drivers/gpu/drm/xe/xe_debugfs.c         |  11 +
 drivers/gpu/drm/xe/xe_defaults.h        |   1 +
 drivers/gpu/drm/xe/xe_device.c          |  17 +-
 drivers/gpu/drm/xe/xe_device_types.h    |  17 +-
 drivers/gpu/drm/xe/xe_gt_stats.c        |   7 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h  |   7 +
 drivers/gpu/drm/xe/xe_guc_ct.c          |  94 +++-
 drivers/gpu/drm/xe/xe_guc_ct.h          |  35 +-
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  35 +-
 drivers/gpu/drm/xe/xe_guc_types.h       |   6 +
 drivers/gpu/drm/xe/xe_module.c          |   4 +
 drivers/gpu/drm/xe/xe_module.h          |   1 +
 drivers/gpu/drm/xe/xe_pagefault.c       | 675 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_pagefault.h       |  74 +++
 drivers/gpu/drm/xe/xe_pagefault_types.h | 109 +++-
 drivers/gpu/drm/xe/xe_svm.c             | 129 +++--
 drivers/gpu/drm/xe/xe_svm.h             |  59 ++-
 drivers/gpu/drm/xe/xe_userptr.c         |  20 +-
 drivers/gpu/drm/xe/xe_vm.c              | 215 ++++++--
 drivers/gpu/drm/xe/xe_vm_types.h        |  37 +-
 21 files changed, 1309 insertions(+), 246 deletions(-)

-- 
2.34.1

