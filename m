Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF05C0219D
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 22:22:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D779610EBB5;
	Fri,  7 Feb 2025 22:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d+AO+R3M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105BF10EBB5
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 22:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738966802; x=1770502802;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5hC3ho8vgTg/mTbgGiXVlhJznrBY4mCZUVAncy67Vuw=;
 b=d+AO+R3MruLnAt7lfq4JArbDt43BDjPE2SOTzgO1c5UeS0WnV+LP5b9/
 BDgJej8MYh7Xxe2/71X+imDBjK/wEWMxs24TkBlx1tqpVwW2VmTN5yxJ6
 NYyItPjsq/DlHkkMPVL/RxoaUpZykDVTf2x3rpMjdlIb8z7HL5BUunmBU
 MDjJ+mspn0QyebW6jhDqH90AUP7qw8lNc82dNK5xDv2wx9HPXZj+Iu+qc
 aiCnZPAzhR4rsOue73HMcuYTxL2LJydHfYq70yRv+o0AcMxO3c3xEuch1
 3DwAnzULaLpzbtulbgCcJIFDpTwl/IyYgTpW62HusMfri9GE7vRQ0Vgak w==;
X-CSE-ConnectionGUID: OVeHVHcORgOZ8ygNl0pJiw==
X-CSE-MsgGUID: kCqFi0bcSWiWfDlIF5KDng==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51050678"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51050678"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:20:01 -0800
X-CSE-ConnectionGUID: Av7nFdhLRNW/nsOScuwR+g==
X-CSE-MsgGUID: 2Xz9nh7dQ0eRiifY5pT5oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="112158388"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:20:00 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 00/13] Cleanup error handling on probe
Date: Fri,  7 Feb 2025 14:19:32 -0800
Message-ID: <20250207221945.2878241-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
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

Mixing style with goto and devm_add_action_or_reset() is very confusing
and error prone. Clean that up. The only missing one is one of the
display calls, but that can be done in parallel to the review of these
first patches.

This received limited load/unload tests on LNL and BMG and should have a
good coverage.

v2:
  - Add callback-based removed to overcome issue with gsc/mei
    integration: it can't be removed with devm.
  - More cleanups, adding drm_dev_unplug in the right place, fixing
    hwmon, pmu and oa
v3:
  - Drop the hwmon patch changing the mutex destroy: we can use drmm_
    only if we also migrate the hwmon allocation to drmm_, but
    there isn't much reason to do so

Lucas De Marchi (13):
  drm/xe: Fix xe_display_fini() calls
  drm/xe: Fix error handling in xe_irq_install()
  drm/xe: Fix xe_tile_init_noalloc() error propagation
  drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
  drm/xe: Remove leftover pxp comment
  drm/xe: Add callback support for driver remove
  drm/xe: Cleanup unwind of gt initialization
  drm/xe: Cleanup extra calls to xe_hw_fence_irq_finish()
  drm/xe: Move oa fini to xe_oa
  drm/xe: Move drm_dev_unplug() out of display function
  drm/xe/oa: Handle errors in xe_oa_register()
  drm/xe: Fail probe if xe_pmu_register() fails
  drm/xe/hwmon: Stop ignoring errors on probe

 drivers/gpu/drm/xe/display/xe_display.c      |  22 +--
 drivers/gpu/drm/xe/display/xe_display.h      |   2 -
 drivers/gpu/drm/xe/xe_device.c               | 133 ++++++++++++-------
 drivers/gpu/drm/xe/xe_device.h               |   4 +
 drivers/gpu/drm/xe/xe_device_remove_action.h |  24 ++++
 drivers/gpu/drm/xe/xe_device_types.h         |  15 +++
 drivers/gpu/drm/xe/xe_gsc.c                  |   9 --
 drivers/gpu/drm/xe/xe_gsc.h                  |   1 -
 drivers/gpu/drm/xe/xe_gsc_proxy.c            |  63 +++++----
 drivers/gpu/drm/xe/xe_gsc_proxy.h            |   1 -
 drivers/gpu/drm/xe/xe_gsc_types.h            |   3 +
 drivers/gpu/drm/xe/xe_gt.c                   |  50 +++----
 drivers/gpu/drm/xe/xe_gt.h                   |   1 -
 drivers/gpu/drm/xe/xe_hwmon.c                |  31 ++---
 drivers/gpu/drm/xe/xe_hwmon.h                |   4 +-
 drivers/gpu/drm/xe/xe_irq.c                  |  14 +-
 drivers/gpu/drm/xe/xe_oa.c                   |  78 +++++------
 drivers/gpu/drm/xe/xe_oa.h                   |   4 +-
 drivers/gpu/drm/xe/xe_pci.c                  |   4 +-
 drivers/gpu/drm/xe/xe_tile.c                 |   4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c       |  17 +--
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h       |   2 +-
 drivers/gpu/drm/xe/xe_uc.c                   |  13 --
 drivers/gpu/drm/xe/xe_uc.h                   |   1 -
 24 files changed, 267 insertions(+), 233 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_remove_action.h

-- 
2.48.1

