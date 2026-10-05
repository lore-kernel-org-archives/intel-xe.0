Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64091CA5FFC
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 19:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1D910E5F5;
	Mon,  5 Oct 2026 19:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUq82Uw5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECFB10E1F6
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 19:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791227175; x=1822763175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lMoVtInyuINXtMc0LnEtw0KyjSejYw6FEebHSsUeddQ=;
 b=PUq82Uw52/oOKIn/FPca9wmezddbXpNLWgg3URCDH0yh1V/IB5qbOwVC
 pnJYBBDso0688T/uWk7DRijeaLS9ATYkzvyydSIzlGaeNV5ulaLf1Tu6c
 aTKldS8SIlfZf0r/kOQU5oUtGSgaZIV5xNeU4hyDoFBiWNjW1WlK1UK/O
 oF+/rkHLMpE+MOSkVkSA+KUo6vz0v38JgxAV/h0MJreErS1ocbE4tBYFe
 H3xNgQCf9xptsyKW7UPLGbmUsFUDyFk5AMe17e7rij99EdRdzOmzVELrU
 ZJ07o5s7YMYRrhjr+4fSHA4XSnlHV6zUi4gfMs0pgXr+mBlgE8I21vhK9 w==;
X-CSE-ConnectionGUID: /5+NMoY8SYKhLTZg6LwHHg==
X-CSE-MsgGUID: Gld9IczUQXunTSoJSc7Y4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102578415"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="102578415"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:14 -0700
X-CSE-ConnectionGUID: +aGgZvgjTLSHvIyExrBAaQ==
X-CSE-MsgGUID: +9aByyWySKiFc4h94jbqpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="274690852"
Received: from dut4435arlh.fm.intel.com ([10.105.8.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:15 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 00/15] Add new debug infrastructure for configfs
Date: Mon,  5 Oct 2026 19:06:10 +0000
Message-ID: <20261005190611.332940-17-stuart.summers@intel.com>
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
v3:
 - Address a couple of comments from Sashiko around GuC log level
   input checking and proper guard implementation.
v4:
 - More review feedback from Sashiko addressed...
v5:
 - Move the goto to a return (more Sashiko feedback) in the GuC
   log level setter before moving to the X-macro solution.
v6:
 - Make the autogenerated X-macro function names more specific to
   avoid naming collisions (Sashiko again).
v7:
 - Fix the couple of pre-existing bugs called out by Sashiko in
   the prior rev...
 - Make CONFIGFS_FS a required config for xe to avoid issues with
   stale values in the fallback getters.
 - Renamed disable_vram_page_offline to enable_vram_page_offline
   for a more consistent naming scheme (this was a new configfs
   entry added since the prior rev).
 - Converted survivability_mode to a u8 bitmap to allow for
   extendability in the future. Only bit 0 is defined, so the behavior
   should be the same.
 - Added an enable_media module parameter at the end of the series.
   gt_types_allowed is debug-only, so this gives production builds a
   supported way to leave the media GT alone. The modparam takes
   precedence over configfs.
 - Adjust the sorting to be alphabetical for the documentation
   specifically (Matt)
v8:
 - Revert the CONFIGFS_FS require change from the previous rev (Matt)
 - Rebase on the latest which adds a new ulls configfs that is going
   into the production list.
 - Use Assisted-by: LLM as documented on the latest kernel.org site for
   AI attribution.

Stuart Summers (15):
  drm/xe: Guard configfs attribute reads in getters
  drm/xe/configfs: Fix out-of-bounds read in parse_wa_bb_lines()
  drm/xe/configfs: Copy wa_bb out under the configfs lock
  drm/xe: Invert vram_page_offline configfs attribute
  drm/xe: Make survivability_mode configfs attribute a bitmap
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
  drm/xe: Add enable_media module parameter

 drivers/gpu/drm/xe/Makefile                   |    3 +
 drivers/gpu/drm/xe/abi/guc_log_abi.h          |    8 +
 drivers/gpu/drm/xe/xe_configfs.c              | 1110 ++---------------
 drivers/gpu/drm/xe/xe_configfs.h              |  105 +-
 drivers/gpu/drm/xe/xe_configfs_debug.c        |  899 +++++++++++++
 drivers/gpu/drm/xe/xe_configfs_debug.h        |   51 +
 drivers/gpu/drm/xe/xe_configfs_debug_params.c |  158 +++
 drivers/gpu/drm/xe/xe_configfs_debug_params.h |  194 +++
 drivers/gpu/drm/xe/xe_configfs_types.h        |   61 +
 drivers/gpu/drm/xe/xe_defaults.h              |    6 +
 drivers/gpu/drm/xe/xe_drm_ras_types.h         |    4 +-
 drivers/gpu/drm/xe/xe_guc.c                   |   14 +-
 drivers/gpu/drm/xe/xe_guc_ads.c               |    1 +
 drivers/gpu/drm/xe/xe_guc_log.c               |    3 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |    1 +
 drivers/gpu/drm/xe/xe_lrc.c                   |   39 +-
 drivers/gpu/drm/xe/xe_module.c                |    6 +
 drivers/gpu/drm/xe/xe_module.h                |    1 +
 drivers/gpu/drm/xe/xe_pci.c                   |   20 +-
 drivers/gpu/drm/xe/xe_psmi.c                  |    3 +-
 drivers/gpu/drm/xe/xe_ras.c                   |    9 +-
 drivers/gpu/drm/xe/xe_rtp.c                   |    3 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c    |    7 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |    2 +-
 24 files changed, 1646 insertions(+), 1062 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug_params.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug_params.h
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_types.h

-- 
2.43.0

