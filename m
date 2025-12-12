Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42194D49237
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 21:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1C510E968;
	Fri, 12 Dec 2025 21:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVNYP9md";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97A210E075
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 21:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765575151; x=1797111151;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MRw834NP/GPe98TnQxKh2AuXZPwY00X7+71iiVMc8fs=;
 b=FVNYP9mdL1ynmsb4ttXuhE5+wamquMzXewik/tMKPYFflvrGkqb8OdwA
 IyH/zxxEzWIQK55SdgMzWzkdJ7I38iacOnsCOhnLuH1yJKWZ2vVV1FM5O
 YHW25DRngCWujRmP5mRjBYyxcyGQ2rM00A8C8w8ZdDZZKKn63bGMojuNz
 OhMyyjIgAqkAUy9rH0vOQt4qKz6du44jaDIjoke1lCMdzq3ANE4e6NzLu
 EkQNDrY9XKmvTVYwhex6EnDbNiR3e9nnfbMKUeczWmY6trpYy9bGkxlkO
 9XrXFp2L32vk+BBlfUuKi/yYKqKGU5DGJRou2UjK/wSy2PHUgPPJt1fg8 A==;
X-CSE-ConnectionGUID: fvBjbPUtTbi0av+Lo+TddQ==
X-CSE-MsgGUID: v4N8mAPrRS6XIepF4ugANg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67541885"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="67541885"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 13:32:30 -0800
X-CSE-ConnectionGUID: y38un8M4SJC2EFK7sp4tJw==
X-CSE-MsgGUID: JcmtnkMqTH6hA8ixMXNRBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="228244666"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 13:32:28 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v6 00/10] Page Reclamation Support for Xe3p Platforms
Date: Sat, 13 Dec 2025 05:32:26 +0800
Message-ID: <20251212213225.3564537-12-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

  This series introduces a hardware-assisted page reclamation support on Xe3p
platforms, integrating with the KMD's existing TLB invalidation workflow and
adding the ability to perform selective Private Physical Cache (PPC) flushing
rather than always forcing the default full PPC flush.

Currently as of Xe2, Xe TLB invalidations trigger a full Private Physical Cache
flush to guarantee non-coherent memory correctness. New HW (Xe3p and beyond)
supports a page reclamation feature, which we selectively enable on platforms
with a flag in device info.

The driver can provide a “Page Reclaim List” (PRL), tracking the physical pages
used that correspond to an unmap/unbind operation and let hardware perform selective
cache line eviction. If reclamation succeeds, we skip the full PPC flush entirely
otherwise we fall back to our current process of full PPC flush with the TLB
invalidation.

Thanks,
Brian

v2:
 - General refactor to remove additional variables from
   tlb fences (flush_cache and PRL ptr). (Matthew B)
 - Removed lock from xe_tlb_inval_reset_timeout and moved 
   into xe_tlb_inval_done_handler. (Matthew B)
 - Removed page reclaim variables out of tlb fences (Matthew B)
 - Add FW check for page reclaim support. (Shuicheng, Matthew B)
 - Moved PRL max entries overflow handling out from
   generate_reclaim_entry to caller. (Shuicheng)
 - Fix one off error with NULL terminated PRL.
 - Add xe_page_reclaim_list_init for clarity. (Matthew B)
 - Invalidate PRL on early abort page walks.
 - Allocate PRL bo size to num_entries. (Matthew B)
 - Move PRL bo allocation to tlb_inval run_job. (Matthew B)
 - Modify debugfs to expose file only if page reclaim supported by
   default instead of previous behavior to return an ENODEV
   and thus no need to move xe_match_desc from configfs (Michal)
 - Compacted warning checking, update commit message,
   spelling, moved variables, etc. (Shuicheng, Matthew B, Michal)
 - Remove unused function. (Shuicheng)
 - Fix various missing kernel doc input.

v3:
 - Removed MEDIA_IS_ON due to racy condition. (Matthew A)
 - Move l3 policy access to xe_pat. (Matthew A)
 - Add vm_dbg prints for PRL generation and invalidation. (Matthew B)
 - Add comments for PRL tile handling and flush behavior with medai. (Matthew B)
 - Modify reclaim_entry to QW and adjust bitfields accordingly. (Matthew B)
 - Add missing shift of PTE for page address in reclaim entry. (Matthew B)
 - Fix NULL pointer dereference check.
 - s/ifence/fence for kernel doc.
 - Squashed dependent patch.
 - Update erroneous comments

v4:
 - s/GEN_MASK/GEN_MASK_ULL, s/BIT/BIT_ULL for xe_guc_reclaim_entry (CI)
 - Revised comments to current changes (Tejas)
 - Moved PAT macros back to original place.

v5:
 - Add a new xe_page_reclaim_list_is_new() function that will
   indicate PRL has never been allocated. This is to avoid continuously
   allocating new PRL if there are multiple failed unbinds. Once a PRL is
   invalidated, the tlb inval range should fallback to default behavior
   and not allocate on scratch.
 - Add xe_page_reclaim_list_entries_put into xe_page_reclaim_list_invalidate.
   Modify code accordingly to accomadate change.
 - Use xe_page_reclaim_list_valid() helper for clarity. (Matthew B)
 - Remove unnecessary null check on put in tlb inval job. (Matthew B)

v6:
 - Rebase and checkpatch fixes.

Suggested-by: Matthew Brost <matthew.brost@intel.com>

Brian Nguyen (8):
  drm/xe/xe_tlb_inval: Modify fence interface to support PPC flush
  drm/xe/guc: Add page reclamation interface to GuC
  drm/xe: Create page reclaim list on unbind
  drm/xe: Suballocate BO for page reclaim
  drm/xe: Prep page reclaim in tlb inval job
  drm/xe: Append page reclamation action to tlb inval
  drm/xe: Optimize flushing of L2$ by skipping unnecessary page reclaim
  drm/xe: Add debugfs support for page reclamation

Matthew Brost (1):
  drm/xe: Do not forward invalid TLB invalidation seqnos to upper layers

Oak Zeng (1):
  drm/xe: Add page reclamation info to device info

 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |   2 +
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h    |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c          |  41 +++++++
 drivers/gpu/drm/xe/xe_device_types.h     |   9 ++
 drivers/gpu/drm/xe/xe_guc.c              |   4 +
 drivers/gpu/drm/xe/xe_guc_ct.c           |  17 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h         |   1 +
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c    |  37 ++++--
 drivers/gpu/drm/xe/xe_page_reclaim.c     | 136 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_page_reclaim.h     | 105 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pat.c              |   8 ++
 drivers/gpu/drm/xe/xe_pat.h              |  10 ++
 drivers/gpu/drm/xe/xe_pci.c              |   1 +
 drivers/gpu/drm/xe/xe_pci_types.h        |   1 +
 drivers/gpu/drm/xe/xe_pt.c               | 135 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pt_types.h         |   5 +
 drivers/gpu/drm/xe/xe_tile.c             |   5 +
 drivers/gpu/drm/xe/xe_tlb_inval.c        |  27 ++++-
 drivers/gpu/drm/xe/xe_tlb_inval.h        |   2 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c    |  36 +++++-
 drivers/gpu/drm/xe/xe_tlb_inval_job.h    |   4 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h  |   5 +-
 drivers/gpu/drm/xe/xe_vm.c               |   4 +-
 24 files changed, 581 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.c
 create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h

-- 
2.52.0

