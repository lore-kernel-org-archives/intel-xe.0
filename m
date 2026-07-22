Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76D4C4453A
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 21:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1AE10E4E2;
	Wed, 22 Jul 2026 21:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bn0kPUlb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EA710E09A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 21:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784756819; x=1816292819;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XTBwb7cg6JJIHjqvBWw5wcVZPVbVlaMq5furtFBWY3o=;
 b=Bn0kPUlbBFSTObLI0YOlyRqXUCqsrjzr3xp/2ErWEDMalgkh7MJ8yjNB
 cWORB/ayOONO0ZLvBLwHN2PPhIyiO/aesMEVWB1zF5h9q2C33Fc7P1c4W
 GXvldPKiaZZ3mCCE8s6b4bWrYZOe4E54b65pnzOVw2Gu5MII98EJ5gudb
 c5I+7RJiZPOl3zHbBWLK9sMCOmS5PvDVh0i/MRIYYACfpys8iT0LHbu70
 tmPv/aSs4OMEIoOclbMdKuYLTRop06YeHYFCBS6ViR57fmJOdcsqRSr3F
 3nQQKuBUwqw0k1U/kAeepMwU5ZPnbv/RbhfW8j9kjfuo6dRqcqNUYxhmW A==;
X-CSE-ConnectionGUID: VybeCouzS16qH6QZcBJd9Q==
X-CSE-MsgGUID: rm+HMiHfRLyWnTfen5kfJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="87944936"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="87944936"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 14:46:58 -0700
X-CSE-ConnectionGUID: xGgdRJEkRvufPvd65R3FMw==
X-CSE-MsgGUID: Jh9GF95DQbuZ/xlVJIhmdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="262540653"
Received: from dut4402arlh.fm.intel.com ([10.105.10.136])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 14:46:58 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/9] Add new debug infrastructure for configfs
Date: Wed, 22 Jul 2026 21:46:56 +0000
Message-ID: <20260722214656.107936-11-stuart.summers@intel.com>
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

Add a new configfs debug group. The intent of this structure is
to allow us to separate ABI facing configfs entries from those
which are purely for debug purposes. And it allows us more flexibility
in how we define those parameters used for debug.

Add a new infrastructure to this debug configfs group that lets us
easily define the parameters in a quick list. This is primarily
useful for simple, single-type parameters such as enable/disable
features or simple values passed. For more complex parameters,
we will still need to define these separately.

Pull the GuC target related changes from [1] to fit within
this new structure and add a new definition for guc_log_level
on top of the existing module parameter (to ensure we aren't
impacting existing users of the module parameter).

Note that the debug parameters here are all to be used "at your
own risk". Without having in depth knowledge of how these impact
the software and hardware, there could be unforeseen consequences
of setting them. As such, they are all wrapped in a
CONFIG_DRM_XE_DEBUG configfs option.

In terms of the patches here, I'm sorting the existing parameters
by name/type. I know we have a few other module parameters that
could migrate here, but I didn't want to overload this series
too much, so the focus for now is on the existing configfs entries
and demonstrating the new structures with the GuC log level and
target parameters.

I used GitHub Copilot with Claude pretty extensively through the
process here and attributed as such. Happy to answer any questions
around this. Took a bit of time getting back to this series around
other work, and in that time I was playing around with a few different
models, hence some of the patches are showing multiple of them. I
tried to attribute each as I was implementing the changes.

I also decided to drop John Harrison from the NPK patch. It has
been modified quite a bit from the original, but more importantly
John is no longer with Intel and that email address isn't available
any more. If it makes a difference here, John and I had both separately
implemented this same change at different occasions for debug. The
one I used to start that initial series was cherry-picked from his
latest variant.

v2:
 - In this second revision I did confirm that the guc_log_level
   module parameter is taking precedence over the configfs parameter
   and ensured the other parameters seem to be autogenerating and
   working as expected.
 - I tried to address all the review feedback from the first
   revision, [2].
 - I also did another pass on the sorting since there were a few
   discrepancies I noticed in the first revision. I kept Gustavo's
   R-B on that one, but would like an ack before merging at least
   to confirm the patch is sane.
 - And finally I moved the getter functions into the X-macro
   generators so we can autogenerate more of the similar functions
   between the different parameters in that debug param list.

[1]: https://patchwork.freedesktop.org/series/162087/
[2]: https://patchwork.freedesktop.org/series/165879/

Stuart Summers (9):
  drm/xe: Sort xe_config_device fields
  drm/xe: Split out configfs data structures
  drm/xe: Add a new debug focused configfs group
  drm/xe: Move debug configfs entries to xe_configfs_debug.c
  drm/xe/guc: Add configfs support for guc_log_level
  drm/xe/guc: Add support for NPK as a GuC log target
  drm/xe: Add infrastructure for debug configfs parameters
  drm/xe: Migrate existing debug configfs entries to params
    infrastructure
  drm/xe: Taint kernel when debug configfs parameters are set

 drivers/gpu/drm/xe/Makefile                   |    2 +
 drivers/gpu/drm/xe/abi/guc_log_abi.h          |    8 +
 drivers/gpu/drm/xe/xe_configfs.c              | 1017 +----------------
 drivers/gpu/drm/xe/xe_configfs.h              |   90 +-
 drivers/gpu/drm/xe/xe_configfs_debug.c        |  870 ++++++++++++++
 drivers/gpu/drm/xe/xe_configfs_debug.h        |   48 +
 drivers/gpu/drm/xe/xe_configfs_debug_params.c |  151 +++
 drivers/gpu/drm/xe/xe_configfs_debug_params.h |  192 ++++
 drivers/gpu/drm/xe/xe_configfs_types.h        |   59 +
 drivers/gpu/drm/xe/xe_defaults.h              |    5 +
 drivers/gpu/drm/xe/xe_guc.c                   |   14 +-
 drivers/gpu/drm/xe/xe_guc_ads.c               |    1 +
 drivers/gpu/drm/xe/xe_guc_log.c               |    3 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |    1 +
 drivers/gpu/drm/xe/xe_lrc.c                   |    1 +
 drivers/gpu/drm/xe/xe_pci.c                   |    1 +
 drivers/gpu/drm/xe/xe_psmi.c                  |    3 +-
 drivers/gpu/drm/xe/xe_rtp.c                   |    3 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c    |    1 +
 19 files changed, 1484 insertions(+), 986 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug_params.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug_params.h
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_types.h

-- 
2.43.0

