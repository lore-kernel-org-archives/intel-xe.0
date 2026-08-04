Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FA6C55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 16:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF63D10E109;
	Tue,  4 Aug 2026 16:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQ0CJH6i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A91410E109
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 16:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785862265; x=1817398265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=49Sk+/Us6qtGTfKB332oTq2FI6aOK/AWu9JgHQxFinw=;
 b=lQ0CJH6isbT3HBd9gWWoBBxWXdZ+/aR7rS+MSzboJ1jzx8BC+mxMmHUb
 VgS/G73QEl8Dp6nlxFgSYogvIQygfld27IxelpHGq+kqGm7QAIZp/K2FG
 Umj8VwrGVQ611nCMd3KMkmrp4433zogN2ZFlG6zsA8M/spiq9DsC9tp18
 6msvcJLYGK+GuL9kldSIDkc01ZGeb5u/oDk0n2Yg1i7Htf4uXnKLPVRtn
 14BSm9jYcX2KtNI1KFq4B3T1cQjDAf58uzUz9IKueBpr8ngEFJ84c5ynW
 h0lJ5alvMIgMuYkhHtbb7qXZut06bweBp5PDNwwnZjtiRobe74bxCxDYX g==;
X-CSE-ConnectionGUID: GodyMpjBQySVBTPxo38BIQ==
X-CSE-MsgGUID: 6yQ85xscSb+EctdbMi4A7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97925414"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="97925414"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 09:51:04 -0700
X-CSE-ConnectionGUID: Pj3qGC18QPyOBJcsxD3cZQ==
X-CSE-MsgGUID: mvLMvuvUTjOzZiWkBJSVvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="265063680"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.44])
 by orviesa003.jf.intel.com with ESMTP; 04 Aug 2026 09:51:05 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>
Subject: [PATCH v8 0/3] drm/xe/guc_ads: allocate UM queues in a separate UC BO
Date: Tue,  4 Aug 2026 16:50:54 +0000
Message-ID: <20260804165057.129529-1-jia.yao@intel.com>
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

Changes in v7:
- Move specify round-up only on iGPU from patch 1 to patch 2

Changes in v8:
- Add a thing wrapper xe_bo_sg_is_contigous to make layer clear

Jia Yao (3):
  drm/xe/guc_ads: allocate UM queues in a separate BO
  drm/xe/guc_ads: allocate UM queues in VRAM on dGFX
  drm/xe/guc_ads: use uncached mapping for UM queue BO

 drivers/gpu/drm/xe/xe_guc_ads.c       | 100 +++++++++++++++++---------
 drivers/gpu/drm/xe/xe_guc_ads_types.h |   5 ++
 2 files changed, 73 insertions(+), 32 deletions(-)

-- 
2.43.0

