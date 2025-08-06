Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C216C87FD1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 06:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A019510E3A6;
	Wed,  6 Aug 2025 06:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="REa2MrAD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C1310E3A6
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 06:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754461368; x=1785997368;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SiaF+kYFDcnM7DjqTHdRx2BCZhrwc2aeGrNFDXiDuOI=;
 b=REa2MrADCLJRD8Cu1/3Ultpdhru8Q0BlH022jW3zO4LQusaTQIsZuW8l
 7N4m6X4zzTe0svpekV54Qs4JmFvVWZ7Z9Sf1F5/4t90pmPl+WAQaX+0Rv
 e3pBlaWvxH8ks7gOEW/QTJ4uuXja5IV8YEYne8E4oNmd9mww5DpDnGdbo
 d1b+f3poTEGQlGxJ/Efnsn2CpQwdS4T63xbdV3RLunRuEUsbjCZiREb/u
 yzC4C+04i17c0Yv8oa4ucW2kxi+K8jxpcfi7dOaMLj6MI+Q8lZ20PZmx6
 SzRRWoq7Fann/FAyeAlXrS9d+AO8MBUR5NMk81PO/aIuWVJg1Q4LkQPV8 g==;
X-CSE-ConnectionGUID: xeKOPBoFQ2+4pa8BWiD9Fg==
X-CSE-MsgGUID: yOEiWqE9S4WHm2kIWtRAcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="79316929"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="79316929"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
X-CSE-ConnectionGUID: yNe1G8AdQ5Ce/FyAGTpJDg==
X-CSE-MsgGUID: Uoi7W5HqTqW4uqqhU+Gsag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="201868933"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, michal.mrozek@intel.com
Subject: [PATCH 00/11] Pagefault refactor, fine grained fault locking,
 threaded prefetch
Date: Tue,  5 Aug 2025 23:22:31 -0700
Message-Id: <20250806062242.1090416-1-matthew.brost@intel.com>
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

We likely need multiple page fault producers feeding into a common
consumer backend. Additionally, our current page fault work queue
design—being per-GT rather than per-device—makes little sense. Clean
this up ahead of upcoming changes that introduce fine-grained fault
locking and threaded prefetching.

Fine-grained fault locking provides immediate benefits: it allows page
faults from the same VM to be processed in parallel (unless they target
the same range) and enables a sane multi-threaded prefetch
implementation. Longer term, it should help transition GPU SVM from a
per-VM model to a per-MM model, which scales better across multiple VMs
or devices.

Lastly, threaded prefetching enables efficient usage of copy engines.

Matt   

Matthew Brost (11):
  drm/xe: Stub out new pagefault layer
  drm/xe: Implement xe_pagefault_init
  drm/xe: Implement xe_pagefault_reset
  drm/xe: Implement xe_pagefault_handler
  drm/xe: Implement xe_pagefault_queue_work
  drm/xe: Add xe_guc_pagefault layer
  drm/xe: Remove unused GT page fault code
  drm/xe: Fine grained page fault locking
  drm/xe: Allow prefetch-only VM bind IOCTLs to use VM read lock
  drm/xe: Thread prefetch of SVM ranges
  drm/xe: Add num_pf_queue modparam

 drivers/gpu/drm/xe/Makefile             |   3 +-
 drivers/gpu/drm/xe/xe_device.c          |  20 +-
 drivers/gpu/drm/xe/xe_device_types.h    |  10 +
 drivers/gpu/drm/xe/xe_gt.c              |   8 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c    | 691 ------------------------
 drivers/gpu/drm/xe/xe_gt_pagefault.h    |  19 -
 drivers/gpu/drm/xe/xe_gt_types.h        |  65 ---
 drivers/gpu/drm/xe/xe_guc_ct.c          |   6 +-
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  94 ++++
 drivers/gpu/drm/xe/xe_guc_pagefault.h   |  13 +
 drivers/gpu/drm/xe/xe_hmm.c             |   4 +-
 drivers/gpu/drm/xe/xe_module.c          |   5 +
 drivers/gpu/drm/xe/xe_module.h          |   1 +
 drivers/gpu/drm/xe/xe_pagefault.c       | 480 ++++++++++++++++
 drivers/gpu/drm/xe/xe_pagefault.h       |  19 +
 drivers/gpu/drm/xe/xe_pagefault_types.h | 125 +++++
 drivers/gpu/drm/xe/xe_svm.c             | 114 ++--
 drivers/gpu/drm/xe/xe_svm.h             |  38 ++
 drivers/gpu/drm/xe/xe_vm.c              | 261 +++++++--
 drivers/gpu/drm/xe/xe_vm.h              |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h        |  28 +-
 21 files changed, 1131 insertions(+), 875 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.c
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h

-- 
2.34.1

