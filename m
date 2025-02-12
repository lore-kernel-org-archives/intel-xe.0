Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FA0C021A6
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 19:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD71E10E976;
	Wed, 12 Feb 2025 19:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOf3fWqR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B6810E206
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 19:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739388994; x=1770924994;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ltNE4Pf/UrO94k3aewgnhYoID52zI+76WCHLMgYS5M0=;
 b=BOf3fWqR+vFJRGPa4rbpdvKP/1cndwMRF2Nq67emR2KDotHxmWrg0da0
 x+LUKuzfAwiUIdpfNMYTmj1PWem1RPJBg6orHiU9fAYGzNexXtX+Xk1cI
 i9Q3qgxraLCee+UFaAU6tD4Vk7wEMBB1UOrtoENd0HhBGfJb5ztJTKD6x
 B3CtL1gbA2UbkgKH3m9zxBNaO4o+BdMp/4aJRF1olInPtgTNgWzMRHNPb
 o1fqy7PRybg5G+WYm2ScqlgICuty07eo+FkD5+lqydNGOP5faA6dPXVs6
 ujtT/ZCfRx0WJsifB1NSM9A4oglYX8bH3MTT+G11PU0kWYy5x1DvvG1TP w==;
X-CSE-ConnectionGUID: +QIh7kh7Q+WRGjmbelG6Jg==
X-CSE-MsgGUID: Df4LVWrZSHiBGkskN6xOTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40184233"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40184233"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:34 -0800
X-CSE-ConnectionGUID: hRb30fW4SeqFa57QWVxRTQ==
X-CSE-MsgGUID: qDwUqFxmSYqfBMQq+5rvuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113437851"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:33 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 00/13] Cleanup error handling on probe
Date: Wed, 12 Feb 2025 11:35:47 -0800
Message-ID: <20250212193600.475089-1-lucas.demarchi@intel.com>
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

Tested on LNL, BMG and ADL-P with driver bind/unbind.

I have other changes on top of these that will make devm compatible.
That will need some drivers/base/ changes though, so it's probably good
to do it in parallel.

v2:
  - Add callback-based removed to overcome issue with gsc/mei
    integration: it can't be removed with devm.
  - More cleanups, adding drm_dev_unplug in the right place, fixing
    hwmon, pmu and oa
v3:
  - Drop the hwmon patch changing the mutex destroy: we can use drmm_
    only if we also migrate the hwmon allocation to drmm_, but
    there isn't much reason to do so

v4:
  - Move the callback infro to be the first patch and also use it
    for xe_display_fini()
  - Make our internal api similar to the devm API for easy conversion

Lucas De Marchi (13):
  drm/xe: Add callback support for driver remove
  drm/xe: Fix xe_display_fini() calls
  drm/xe: Fix error handling in xe_irq_install()
  drm/xe: Fix xe_tile_init_noalloc() error propagation
  drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
  drm/xe: Remove leftover pxp comment
  drm/xe: Cleanup unwind of gt initialization
  drm/xe: Cleanup extra calls to xe_hw_fence_irq_finish()
  drm/xe/oa: Move fini to xe_oa
  drm/xe: Move drm_dev_unplug() out of display function
  drm/xe/oa: Handle errors in xe_oa_register()
  drm/xe/pmu: Fail probe if xe_pmu_register() fails
  drm/xe/hwmon: Stop ignoring errors on probe

 drivers/gpu/drm/xe/display/xe_display.c |  22 ++--
 drivers/gpu/drm/xe/display/xe_display.h |   2 -
 drivers/gpu/drm/xe/xe_device.c          | 151 +++++++++++++++++-------
 drivers/gpu/drm/xe/xe_device.h          |   4 +
 drivers/gpu/drm/xe/xe_device_types.h    |  17 +++
 drivers/gpu/drm/xe/xe_gsc.c             |   9 --
 drivers/gpu/drm/xe/xe_gsc.h             |   1 -
 drivers/gpu/drm/xe/xe_gsc_proxy.c       |  63 +++++-----
 drivers/gpu/drm/xe/xe_gsc_proxy.h       |   1 -
 drivers/gpu/drm/xe/xe_gsc_types.h       |   1 +
 drivers/gpu/drm/xe/xe_gt.c              |  50 +++-----
 drivers/gpu/drm/xe/xe_gt.h              |   1 -
 drivers/gpu/drm/xe/xe_hwmon.c           |  31 ++---
 drivers/gpu/drm/xe/xe_hwmon.h           |   4 +-
 drivers/gpu/drm/xe/xe_irq.c             |  14 +--
 drivers/gpu/drm/xe/xe_oa.c              |  78 ++++++------
 drivers/gpu/drm/xe/xe_oa.h              |   4 +-
 drivers/gpu/drm/xe/xe_pci.c             |   4 +-
 drivers/gpu/drm/xe/xe_tile.c            |   4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c  |  17 +--
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h  |   2 +-
 drivers/gpu/drm/xe/xe_uc.c              |  13 --
 drivers/gpu/drm/xe/xe_uc.h              |   1 -
 23 files changed, 261 insertions(+), 233 deletions(-)

-- 
2.48.1

