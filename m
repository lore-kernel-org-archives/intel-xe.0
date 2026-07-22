Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79995C4452D
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 05:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F35910E617;
	Wed, 22 Jul 2026 05:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSQRddTs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DB110E617
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 05:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784698511; x=1816234511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Sf0q+wgyjUKpmWSZJaiCdUig4ZoqapH+3ySSKMujaRk=;
 b=XSQRddTsUpItaZCgMMAoTEk9lqpH6GwB+qbVmAgQcYPd61/n74nF9xRC
 F6JstJ+Cbkht6qvuG1Z+5vKUyQCAuK28pGSFOVGqw/28xqOFnlwfzzv7i
 GnSn8o9cor3QFtW1xdG5XfExtxWrGa2UIt1Qq54LwphA5iTXygKHo+Ysd
 prGaJiLjWBTHVP+kk8YwFfB4y6u0BtPvad9BzUumfCO6ksQpgm+FJ5yPK
 Eo2sanS0h14AOJvw55Tp8ze52jAgtkqYZv9haerIYwylXrETXGWAT/x5U
 QVtQMwmAxBLNu1Bvo9H5Er1hwbGr4+ulfkqOXv1/XVXmjo853Aak5NhYK A==;
X-CSE-ConnectionGUID: 0ty1HQ9fR62EosXHeIlfxQ==
X-CSE-MsgGUID: xhYicNUKRh6VqFRxkjxCVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="88998394"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="88998394"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 22:35:11 -0700
X-CSE-ConnectionGUID: Tllw3lqMTDCLShJKpQ5n3Q==
X-CSE-MsgGUID: Xzi0jJsxTzC4LhXszrCGOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="262266036"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.54])
 by orviesa005.jf.intel.com with ESMTP; 21 Jul 2026 22:35:08 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>
Subject: [PATCH v3 0/1] drm/xe/guc_ads: allocate UM queues in a separate UC BO
Date: Wed, 22 Jul 2026 05:34:09 +0000
Message-ID: <20260722053410.2767369-1-jia.yao@intel.com>
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

== Problem ==

On platforms with Unified Shared Memory (USM), the xe driver maintains
three hardware page-fault queues (PAGE_FAULT, PAGE_FAULT_RESPONSE,
ACCESS_COUNTER) inside the GuC Additional Data Structures (ADS) blob.
The ADS blob is mapped WB on the CPU side.

xe_guc_ads_populate() is called on every GT reset to reprogram the ADS
blob; it begins with a full memset() of the blob to zero.  The zeroed
cache lines for the UM queue region reside in the CPU cache (LLC, WB)
but are not immediately written back to DRAM.

GAM hardware writes fault descriptors to the queue via DPA - a
non-coherent path that bypasses the CPU cache and writes directly to
memory.  GuC reads the queue via GGTT (WB), which hits the CPU cache.
As a result GuC sees the stale zeroed data from the CPU cache instead
of the descriptor written to DRAM by GAM.  The driver then receives an
all-zero fault descriptor and returns -EINVAL, causing an unnecessary
engine reset.

This is documented in HSD as:
  "When Fault queue is updated by the SW (Buffer zeroed), it can reside
   in the CPU cache (L4:WB). A non coherent write from GAM HW would not
   consult the CPU cache and it will eventually get written into the
   memory (depends upon eviction/flushes) and CPU cache has stale data.
   When GUC HW reads the fault queue it gets it from the CPU cache,
   which is stale data."

The window is narrow but reliably reproducible: run xe_exec_reset
--run-subtest gt-reset followed immediately by
xe_exec_system_allocator --run-subtest
threads-many-execqueues-mmap-new-race.

== Reproduction ==

  # Requires a platform with has_usm (e.g. Xe3 iGFX)
  sudo xe_exec_reset --run-subtest gt-reset
  sudo xe_exec_system_allocator --run-subtest threads-many-execqueues-mmap-new-race

  Symptom in dmesg:
    [xe] ASID: 0, Faulted Address: 0x0000000000000000, FaultType: 0

  The all-zero fault descriptor is the tell-tale sign of the stale
  cache line race.

== Fix ==

Allocate the UM queues in a dedicated UC BO (ads->um_queue_bo).  UC
mapping on the CPU side ensures the memset bypasses the cache and the
zeroed data lands in DRAM immediately.  GuC's non-coherent read then
goes to DRAM and sees the correct descriptor written by GAM.

A separate BO also eliminates the secondary race where a descriptor
written by the GPU between GDRST and GuC restart could be zeroed by the
next call to xe_guc_ads_populate().

On dGFX, VRAM placement is used so the DPA is derived from
vram_region_gpu_offset, avoiding the IOVA aliasing issue seen on
platforms with limited DRAM (e.g. BMG 4 GB) where a SYSTEM BO's DMA
address can alias a PCI MMIO reserved window.

Why not just flush the cache after memset?

An earlier approach called drm_clflush_virt_range() on the UM queue
region immediately after the memset to evict the stale zero lines from
LLC.  This reduces the failure rate significantly but does not fully
eliminate the race for two reasons.

First, the Linux kernel maintains a WB direct mapping (linear map) that
covers all physical memory.  Even after flushing the vmap alias, the
CPU can speculatively prefetch the same physical page through the WB
direct-map alias, silently repopulating the cache with zeros.  LNL is
known to be particularly susceptible to this speculative prefetch
behaviour.  XE_BO_FLAG_NEEDS_UC calls set_memory_uc() which updates
both the vmap PTE and the direct-map PTE to UC, closing this aliasing
window entirely.

Second, the flush approach leaves the memory mapped WB on the CPU side
permanently.  Any future SW access - a debug read, a tracing hook, an
inadvertent touch - can re-dirty the cache line and reintroduce the
race.  UC mapping makes the correct behaviour unconditional and
self-documenting.

Jia Yao (1):
  drm/xe/guc_ads: allocate UM queues in a separate UC BO

 drivers/gpu/drm/xe/xe_guc_ads.c       | 64 ++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_guc_ads_types.h |  8 +++-
 2 files changed, 46 insertions(+), 26 deletions(-)

-- 
2.43.0

