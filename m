Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF111D3B9B7
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 01:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD9D10E236;
	Wed, 10 Dec 2025 01:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7dwmmyq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345B810E236
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 01:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765331122; x=1796867122;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nU5BCG2ODN7D0XgEZT75wtrB/HadORpdisB/J2Y+YWo=;
 b=S7dwmmyqG/qb/recqHhJnvEXfq+RhN8uw5Qa8sjuCUpQYGSaNXSFJmko
 ihoUs40zWxPDHTZ9LvPgv/P1c8p9CFFaK2SqBwBD0Qok5SIHtUbrlyjEV
 SXTMZOpT8/J27IOWQ9f/5R+CIz9Xm1nJ4iD+L7LWnXrNpOaO4WBIBJKeg
 gmIS3annkoyxGPpn2W+ZILRU0m/6y6UCBBa9QJtwGldkDKzefx+EE+w89
 m9NqLNroomZ4BkkcAjIIXugLSbKaA2+jkmSRjyM4IDQqREGyWdaz9A7ql
 PBwAFFq6qD+qf+Y4r+Pp780hGmk51ayZKsGw4tJ7KlN/3i0x9qzyQM/bK g==;
X-CSE-ConnectionGUID: FjuYShf7Sueo4VC0W7XNlA==
X-CSE-MsgGUID: OVyTpjEoRcmiRD043O2opw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66302093"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="66302093"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 17:45:22 -0800
X-CSE-ConnectionGUID: yWvHUdHZTdWHlb3Oo2H8/A==
X-CSE-MsgGUID: lCNq9EVtT2GnhQzEIKrWOQ==
X-ExtLoop1: 1
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa003.fm.intel.com with ESMTP; 09 Dec 2025 17:45:20 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com
Subject: [PATCH v5 00/10] Page Reclamation Support for Xe3p Platforms
Date: Wed, 10 Dec 2025 09:45:18 +0800
Message-ID: <20251210014517.3184135-12-brian3.nguyen@intel.com>
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

