Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E9BE6FE4B
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BCB10EB28;
	Sat,  7 Sep 2024 00:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EUiqoNyi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F6110EB27
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667676; x=1757203676;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=njGNgSKnPfsd+tL02wLdnIb/4WQeBEGcdtB2xsZo6qM=;
 b=EUiqoNyie8XVC9+2jkxF7GUIwRCjAOOe9G5bU6mhRAWEEgPd7SgprPUm
 Nf4wso5VLeUnB+fvbUvbqkXz++jl/7pRGJmJ2paGF8fIaon9GH3wDnm9x
 Nxge9e68947VGFjnwmJTSa1eSjCIhVEjdElHuAxWxorpyGc393V5n+W1Q
 aZTGU54fJNaIWQMQNa/E/kcastnHvXqzB7YprhbyKIH7BcKL3k7G0tpTb
 NQ+gxLKXs3j+RBbZUgGKOyPnMfLG6jKfa5sEulUy0TKtSqpd3KiC67Unb
 2YurZgBNEGXWwqjU0Po56euhYGXjrPPGXw18Ne2LfqY2DNhwEiuVKofmn Q==;
X-CSE-ConnectionGUID: b1JFAH/3SFubYxL1XcI+aQ==
X-CSE-MsgGUID: d2tFo1MRR221qhU5vhjHtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855290"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855290"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: LB6Odow2QTWAurwnwqOeQw==
X-CSE-MsgGUID: OWl39Sj5TzmiCizC9J2XQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792615"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 00/43] Stop using xe_gt as a register MMIO target
Date: Fri,  6 Sep 2024 17:07:49 -0700
Message-ID: <20240907000748.2614020-45-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
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

For register MMIO operations, the things that truly matter are:
 * Where the MMIO region is mapped for CPU access.
 * Any extra offset that should be "automatically" added to some
   xe_reg offsets.  (e.g., the 0x380000 offset for GSI registers in the
   media GT)
 * Extra metadata for size, valid/invalid subregions of the map, etc.
   that can be utilized by debug builds to perform extra checks and
   assertions to catch coding mistakes.

Let's add a dedicated 'xe_mmio' structure that encapsulates this
specific information and can be used as a target for MMIO operations.
For now an xe_mmio structure is present inside every xe_gt and xe_tile,
and can be used as the target for GT and non-GT operations respectively.
In the future additional xe_mmio substructures can be added for other
specific cases.

Note that there's a (currently unused) "mmio_ext" infrastructure in the
driver that appears to be an attempt to work around the GT-centric way
the driver has been doing register MMIO.  That infrastructure is simply
replaced with an additional instance of "struct xe_mmio" that lives at
the tile level.  This will allow standard register access logic for
accessing non-GT registers that exist in a very different BAR region
and/or reside in a different iomap.  Once code actually shows up to use
"mmio_ext" it will probably get renamed and accessed via "xe_foo->mmio"
or "xe_mmio_for_foo(xe)."

Once this general refactor lands, a follow-up will be add some extra
checking in debug builds to catch cases where the driver might be
performing MMIO accesses incorrectly (for example, accessing GT
registers through a non-GT MMIO which wouldn't apply proper GSI
offsets).

Since converting the entire driver from xe_gt to xe_mmio for register
access operations is a lot of churn, the original conversion includes
some _Generic compatibility defines to temporarily allow either xe_gt or
xe_mmio to be used.  This allows individual parts of the driver to be
converted in separate patches for ease of review.  The compatibility
macros are removed again at the end of the series.


v2:
 - Assorted naming and kerneldoc tweaks suggested during review (Lucas,
   Michal).
 - Store xe_tile backpointer instead of xe_device in xe_mmio since we
   can still get to the device from it, but all register MMIO is
   currently tile-centric so this could let us do better debug logging
   and such.  (Michal).
 - Keep an actual GT backpointer for the SRIOV special case rather than
   an SRIOV backpointer.  But name it so that it's very clear that it
   can only be used for SRIOV VF purposes and won't be set otherwise.
   (Michal)


Matt Roper (43):
  drm/xe: Move forcewake to 'gt.pm' substructure
  drm/xe: Create dedicated xe_mmio structure
  drm/xe: Clarify size of MMIO region
  drm/xe: Move GSI offset adjustment fields into 'struct xe_mmio'
  drm/xe: Populate GT's mmio iomap from tile during init
  drm/xe: Switch mmio_ext to use 'struct xe_mmio'
  drm/xe: Add xe_tile backpointer to xe_mmio
  drm/xe: Adjust mmio code to pass VF substructure to SRIOV code
  drm/xe: Switch MMIO interface to take xe_mmio instead of xe_gt
  drm/xe/irq: Convert register access to use xe_mmio
  drm/xe/pcode: Convert register access to use xe_mmio
  drm/xe/hwmon: Convert register access to use xe_mmio
  drm/xe/vram: Convert register access to use xe_mmio
  drm/xe/compat-i915: Convert register access to use xe_mmio
  drm/xe/lmtt: Convert register access to use xe_mmio
  drm/xe/stolen: Convert register access to use xe_mmio
  drm/xe/device: Convert register access to use xe_mmio
  drm/xe/pci: Convert register access to use xe_mmio
  drm/xe/wa: Convert register access to use xe_mmio
  drm/xe/uc: Convert register access to use xe_mmio
  drm/xe/guc: Convert register access to use xe_mmio
  drm/xe/huc: Convert register access to use xe_mmio
  drm/xe/gsc: Convert register access to use xe_mmio
  drm/xe/query: Convert register access to use xe_mmio
  drm/xe/mcr: Convert register access to use xe_mmio
  drm/xe/mocs: Convert register access to use xe_mmio
  drm/xe/hw_engine: Convert register access to use xe_mmio
  drm/xe/gt_throttle: Convert register access to use xe_mmio
  drm/xe/pat: Convert register access to use xe_mmio
  drm/xe/wopcm: Convert register access to use xe_mmio
  drm/xe/oa: Convert register access to use xe_mmio
  drm/xe/topology: Convert register access to use xe_mmio
  drm/xe/execlist: Convert register access to use xe_mmio
  drm/xe/gt_clock: Convert register access to use xe_mmio
  drm/xe/reg_sr: Convert register access to use xe_mmio
  drm/xe/gt: Convert register access to use xe_mmio
  drm/xe/sriov: Convert register access to use xe_mmio
  drm/xe/tlb: Convert register access to use xe_mmio
  drm/xe/gt_idle: Convert register access to use xe_mmio
  drm/xe/forcewake: Convert register access to use xe_mmio
  drm/xe/ggtt: Convert register access to use xe_mmio
  drm/xe/ccs_mode: Convert register access to use xe_mmio
  drm/xe/mmio: Drop compatibility macros

 .../drm/xe/compat-i915-headers/intel_uncore.h |  36 ++---
 drivers/gpu/drm/xe/tests/xe_mocs.c            |   4 +-
 drivers/gpu/drm/xe/xe_assert.h                |   2 +-
 drivers/gpu/drm/xe/xe_device.c                |  37 +++--
 drivers/gpu/drm/xe/xe_device.h                |   3 +-
 drivers/gpu/drm/xe/xe_device_types.h          |  56 ++++++--
 drivers/gpu/drm/xe/xe_execlist.c              |  19 +--
 drivers/gpu/drm/xe/xe_force_wake.c            |   4 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |   8 +-
 drivers/gpu/drm/xe/xe_gsc.c                   |  23 +--
 drivers/gpu/drm/xe/xe_gsc_proxy.c             |   4 +-
 drivers/gpu/drm/xe/xe_gt.c                    |  10 +-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c           |   2 +-
 drivers/gpu/drm/xe/xe_gt_clock.c              |   6 +-
 drivers/gpu/drm/xe/xe_gt_freq.c               |   2 +-
 drivers/gpu/drm/xe/xe_gt_idle.c               |  21 +--
 drivers/gpu/drm/xe/xe_gt_mcr.c                |  39 ++---
 drivers/gpu/drm/xe/xe_gt_printk.h             |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   |   6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   4 +-
 drivers/gpu/drm/xe/xe_gt_throttle.c           |   4 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   |   8 +-
 drivers/gpu/drm/xe/xe_gt_topology.c           |   8 +-
 drivers/gpu/drm/xe/xe_gt_types.h              |  22 +--
 drivers/gpu/drm/xe/xe_guc.c                   |  60 ++++----
 drivers/gpu/drm/xe/xe_guc_ads.c               |   2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |  34 ++---
 drivers/gpu/drm/xe/xe_huc.c                   |   6 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |  29 ++--
 drivers/gpu/drm/xe/xe_hwmon.c                 |  16 +--
 drivers/gpu/drm/xe/xe_irq.c                   |  63 ++++----
 drivers/gpu/drm/xe/xe_lmtt.c                  |   2 +-
 drivers/gpu/drm/xe/xe_mmio.c                  | 134 +++++++++---------
 drivers/gpu/drm/xe/xe_mmio.h                  |  35 +++--
 drivers/gpu/drm/xe/xe_mocs.c                  |  16 +--
 drivers/gpu/drm/xe/xe_oa.c                    |  48 ++++---
 drivers/gpu/drm/xe/xe_pat.c                   |  14 +-
 drivers/gpu/drm/xe/xe_pci.c                   |  24 +++-
 drivers/gpu/drm/xe/xe_pcode.c                 |   4 +-
 drivers/gpu/drm/xe/xe_query.c                 |   7 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                |  17 +--
 drivers/gpu/drm/xe/xe_sriov.c                 |   2 +-
 drivers/gpu/drm/xe/xe_trace.h                 |   7 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   8 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                 |  17 +--
 drivers/gpu/drm/xe/xe_vram.c                  |   7 +-
 drivers/gpu/drm/xe/xe_wa.c                    |   4 +-
 drivers/gpu/drm/xe/xe_wopcm.c                 |  12 +-
 49 files changed, 490 insertions(+), 414 deletions(-)

-- 
2.45.2

