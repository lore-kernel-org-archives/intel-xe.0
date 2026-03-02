Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B440EA4E3E
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 16:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F2F10E1D1;
	Mon,  2 Mar 2026 16:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lsoG8VWl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6A510E1D1;
 Mon,  2 Mar 2026 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772469190; x=1804005190;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kfMIc0OUpsgkTCkMzSFFXGItn5Z0YPAU5KqBEO/YCjU=;
 b=lsoG8VWlRy+Macip9u3P6P6+EERt1GbLDghKcCUrDnSDb9GU31evyfjp
 vByxg1iyitZ2jc/gb2Lvi5AiuXiD8/GEPAO9+Uf4ahQqaf84Wn5SyvzlD
 3u51tahZeNyQMHA/wxE+HsyshBzFqVYrLe67POzcwD0KDFnx69jr12aOw
 49RUTchIPJplDTQSuSacY45UDw4D+F2JDd8VfqkakpJoibita7ANsNcQS
 3j9QW5tHgOaSKwSDqmf4loYwT7besXxm4ZB5YqWc3xmOYsGZTaYMX5NH2
 Fqq/0SLtYcXUmjLanayRcahh9pvfWPseEJZMaYdefrocJAHG8h865x48l w==;
X-CSE-ConnectionGUID: 8+jGs6PCSruU3juXvdAwsQ==
X-CSE-MsgGUID: zVQN2xAoSD+TY6v5Q74DCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73447814"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73447814"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 08:33:09 -0800
X-CSE-ConnectionGUID: vr/4G302QFOqlxJOv5pghQ==
X-CSE-MsgGUID: zDQUWEPnTW23jzI2q1uvMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="255564508"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.81])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 08:33:07 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2 0/4] Two-pass MMU interval notifiers 
Date: Mon,  2 Mar 2026 17:32:44 +0100
Message-ID: <20260302163248.105454-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

GPU use-cases for mmu_interval_notifiers with hmm often involve
starting a gpu operation and then waiting for it to complete.
These operations are typically context preemption or TLB flushing.
    
With single-pass notifiers per GPU this doesn't scale in
multi-gpu scenarios. In those scenarios we'd want to first start
preemption- or TLB flushing on all GPUs and as a second pass wait
for them to complete.

This also applies in non-recoverable page-fault scenarios to
starting a preemption requests on GPUs and waiting for the GPUs 
to preempt so that system pages they access can be reclaimed.
    
One can do this on per-driver basis multiplexing per-driver
notifiers but that would mean sharing the notifier "user" lock
across all GPUs and that doesn't scale well either, so adding support
for two-pass in the core appears like the right choice.

So this series does that, with pach 1 implementing the core support
and also describes the choices made.

The rest of the patches implements a POC with xeKMD userptr
invalidation and potential TLB-flushing. A follow-up series
will extend to drm_gpusvm.

v2 hightlights:
- Refactor the core mm patch to use the struct
  mmu_interval_notifier_ops for the invalidate_finish() callback.
- Rebase on xe driver tlb invalidation changes.
- Provide an initial implementation for userptr instead of drm_gpusvm.
  The intent is to handle drm_gpusvm in a follow-up series.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: <dri-devel@lists.freedesktop.org>
Cc: <linux-mm@kvack.org>
Cc: <linux-kernel@vger.kernel.org>

Thomas Hellström (4):
  mm/mmu_notifier: Allow two-pass struct mmu_interval_notifiers
  drm/xe/userptr: Convert invalidation to two-pass MMU notifier
  drm/xe: Split TLB invalidation into submit and wait steps
  drm/xe/userptr: Defer Waiting for TLB invalidation to the second pass
    if possible

 drivers/gpu/drm/xe/xe_svm.c             |   6 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c       |  82 ++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h       |   6 ++
 drivers/gpu/drm/xe/xe_tlb_inval_types.h |  14 +++
 drivers/gpu/drm/xe/xe_userptr.c         | 136 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_userptr.h         |  32 ++++++
 drivers/gpu/drm/xe/xe_vm.c              |  99 ++++++-----------
 drivers/gpu/drm/xe/xe_vm.h              |   5 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c      |   9 +-
 drivers/gpu/drm/xe/xe_vm_types.h        |   1 +
 include/linux/mmu_notifier.h            |  38 +++++++
 mm/mmu_notifier.c                       |  64 +++++++++--
 12 files changed, 389 insertions(+), 103 deletions(-)

-- 
2.53.0

