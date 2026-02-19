Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD94E9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 09:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E98810E140;
	Thu, 19 Feb 2026 09:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eimSK/JA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CF510E140
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 09:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771492405; x=1803028405;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bXTrAq7QTp4iT1UESgptiF/GGOZMXeBuluyFABbOuMw=;
 b=eimSK/JAf3oH9VxzuB58iZrZMa0ch/o3iIpJUt9eh5lI3KFDUkU3QKE3
 37c5lEzDI+NZ32ditZnOUwkSD423asI4gOBFDf4HBMft1mVnMl4LoOX70
 eUI9pk0ufx4QkK5SIn1xpLRamfC2zgc4iqnx0Ywtuakb/sPUU9XqQ3YxS
 91iERHXGhohmfNRgA4Wcrlo8BpEuzciDBYOLERsGauHV44vHW8vMFmEu0
 1ztNy6DnWpIilzCgbvgKd6tg4D0f4mNojG7GOxT/zU2nnv85JeCqbT6vf
 zNtFJTfD4lYTsRYEl+PBUeTD1cfSYrEemJQrW2K3q0fu2Gi6kOFrc5C7X w==;
X-CSE-ConnectionGUID: U3EFddb7Q+uKx12EjQQhxw==
X-CSE-MsgGUID: KdmxiVwJTRuWvFz35Pk32Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72637303"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72637303"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:13:25 -0800
X-CSE-ConnectionGUID: 78Y99iZaSTqsLJa0Juc0kQ==
X-CSE-MsgGUID: CXb1tiz4RsyFTy186MNdAA==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:13:24 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC 0/7] drm/xe/svm: Add MMU notifier-based madvise autoreset on
 munmap
Date: Thu, 19 Feb 2026 14:43:05 +0530
Message-ID: <20260219091312.796749-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series implements automatic reset of GPU memory attributes when userspace
unmaps memory (munmap), ensuring non-default attributes don't persist after
CPU mappings are freed.

The implementation uses MMU interval notifiers to detect munmap events on
CPU-only VMAs (not yet GPU-faulted). When detected, work is queued to reset
their attributes to defaults. GPU-touched VMAs continue using existing SVM
notifiers and are not affected by this series.

The autoreset is best-effort. The CPU_AUTORESET_ACTIVE flag serves as the
authoritative state - if notifier delivery fails, the GPU page table zapping
path checks this flag directly, ensuring correctness regardless of notifier
delivery.

Key aspects:
- CPU_AUTORESET_ACTIVE flag tracks CPU-only vs GPU-touched state
- Notifier callbacks queue work (cannot take vm->lock due to lock ordering)
- Workqueue processes resets under vm->lock, serializing with VM operations
- Mempool prevents allocation failures in atomic context
- Clean teardown: closing flag + SRCU sync + workqueue drain

Patch organization:
1. Add CPU_AUTORESET_ACTIVE flag definition
2. Propagate flag across GPUVA operations (map/remap/split)
3. Clear flag on GPU touch (one-way CPU-only → GPU-touched transition)
4. Add MMU notifier + workqueue infrastructure
5. Deactivate notifier optimization (avoid overhead after GPU touch)
6. Wire notifiers into VM lifecycle (init/fini/teardown)
7. Fix partial unmap attribute reset handling

Arvind Yadav (6):
  drm/xe/vm: Add CPU_AUTORESET_ACTIVE VMA flag
  drm/xe/vm: Preserve CPU_AUTORESET_ACTIVE across GPUVA operations
  drm/xe/svm: Clear CPU_AUTORESET_ACTIVE on first GPU fault
  drm/xe/vm: Add madvise autoreset interval notifier worker
    infrastructure
  drm/xe/vm: Deactivate madvise notifier on GPU touch
  drm/xe/vm: Wire MADVISE_AUTORESET notifiers into VM lifecycle

Himal Prasad Ghimiray (1):
  drm/xe/svm: Correct memory attribute reset for partial unmap

 drivers/gpu/drm/xe/xe_svm.c        |  78 +++-
 drivers/gpu/drm/xe/xe_svm.h        |  10 +
 drivers/gpu/drm/xe/xe_vm.c         |  50 ++-
 drivers/gpu/drm/xe/xe_vm.h         |  18 +
 drivers/gpu/drm/xe/xe_vm_madvise.c | 553 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm_madvise.h |  10 +
 drivers/gpu/drm/xe/xe_vm_types.h   |  51 +++
 7 files changed, 749 insertions(+), 21 deletions(-)

-- 
2.43.0

