Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E2EC5516F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 23:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF97F10E271;
	Fri, 31 Jul 2026 23:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2FJ0Ddv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6576210E26D
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 23:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785540429; x=1817076429;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xD1OEOczQyS8Sbg9M+VlhWSSX3ke+Xp66yYEXuBHmak=;
 b=Z2FJ0DdvmMlLpZruYuyZgOlsYmOGfPcy5okBlnc7suiWcMAc9I52+K62
 NfQtrogHYe9FnQcivDEKVuTQjtjKoGxfb2MHOqVYymjQ29zosmE+gU5c0
 +l7AWIeSljudNzroG8UhDmbhU9M5h1vbrW/gWFA1aCCeoEz5JCAFgT/7w
 JaZ0lWN1c1U1Q9iGGFy/gHZ/MB7HoCnAkt4SxlM2pmB7kLTIRtx2u/1QY
 E/NGsrBE1Tl0mdbGTExvfTSpN711Oeznxmmq/am+j8or8qYWMlg/P8p7L
 OHRz+ck6DgX4I+GOLBthvjQnDlb/s4abFsjbSk05AnTUUt1OU9Bi5fgCq w==;
X-CSE-ConnectionGUID: 01XAlORUSX+FMGnXx/VmFA==
X-CSE-MsgGUID: r2m0KDFRSIO4B6OwwNavWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="97326543"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; d="scan'208";a="97326543"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 16:22:49 -0700
X-CSE-ConnectionGUID: SxFLoyXEQvyTh21EFHuGPw==
X-CSE-MsgGUID: Ez9s0IP9RKuYu0EKR7SCCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; d="scan'208";a="261305759"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.54])
 by orviesa009.jf.intel.com with ESMTP; 31 Jul 2026 16:22:50 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>
Subject: [PATCH v6 0/1] drm/xe/guc_ads: allocate UM queues in a separate UC BO
Date: Fri, 31 Jul 2026 23:22:29 +0000
Message-ID: <20260731232232.548015-1-jia.yao@intel.com>
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

xe_guc_ads_populate() is called on every GT reset to reprogram the ADS
blob; it begins with a full memset() of the blob to zero.

GAM hardware writes fault descriptors to the queue via DPA - a
non-coherent path that bypasses the cache and writes directly to memory.
GuC reads the queue via GGTT (WB), which hit the cacheline polluted by CPU.
As a result GuC sees the stale zeroed data from the cache instead
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

== Reproduction ==

  # Requires a platform with has_usm (e.g. Xe3 iGFX)
  sudo xe_exec_reset --run-subtest gt-reset
  sudo xe_exec_system_allocator \
    --run-subtest threads-many-execqueues-mmap-new-race

  Symptom in dmesg:
    [xe] ASID: 0, Faulted Address: 0x0000000000000000, FaultType: 0

  The all-zero fault descriptor is the tell-tale sign of the stale
  cacheline race.

== Fix ==

Move the UM queues into a dedicated UC BO (ads->um_queue_bo) and avoid
CPU memset operations on it, which eliminates the CPU as a potential
cacheline-polluting agent and helps maintain consistency between GAM
writes and GuC reads.

On iGPU, the UM queue BO is allocated in system memory. On dGFX, the BO
was previously created in system memory and later reallocated in
xe_guc_realloc_post_hwconfig().  Allocate the UM queue BO directly in
VRAM on dGFX, where it is ultimately required.

On Pre-Xe3p platform, the GAM write the UM queue through DPA using UC.
if GuC reads the queue via GGTT (WB), stale data may be observed 
when the cacheline has been polluted by another agent.

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
inadvertent touch - can re-dirty the cacheline and reintroduce the
race.  UC mapping makes the correct behaviour unconditional and
self-documenting.

Changes in v4:
- Split the single v3 patch into three logically independent patches:
  1. Separate BO allocation
  2. VRAM placement on dGFX
  3. UC mapping

Changes in v5:
- Fix the patch conflict
- Update the ASCII block diagram of ads
- Simplify the contiguous memory check
- Improve code comments

Changes in v6:
- Only round up UM queue size for iGPU
- Revise commit message

Jia Yao (3):
  drm/xe/guc_ads: allocate UM queues in a separate BO
  drm/xe/guc_ads: allocate UM queues in VRAM on dGFX
  drm/xe/guc_ads: use uncached mapping for UM queue BO

 drivers/gpu/drm/xe/xe_guc_ads.c       | 100 +++++++++++++++++---------
 drivers/gpu/drm/xe/xe_guc_ads_types.h |   5 ++
 2 files changed, 73 insertions(+), 32 deletions(-)

-- 
2.43.0

