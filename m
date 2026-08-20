Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B935C5DF86
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 20:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D287310E5FF;
	Thu, 20 Aug 2026 20:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RbQM+ZM/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3857510E3B5
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 20:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787256449; x=1818792449;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t6y2ZIlgEESo4BlwanUeP+50G2BfZlXI2bMbkkNoV6k=;
 b=RbQM+ZM/pNsXJh3vG3UbkRGmCmqRRl3hlYSVDZQMJxB7NGNWXQwRhrpr
 GBIfya/lATZ+cek7WxIFycBgvVyYJG5w9ObiX5hqiN3yrtCnRSYNeTU/K
 7kEp8w+lBgHsfocI7fhxO2OUBoIerUH9SayAltgnkVFBeE3AJOktRV+Yx
 moyDOxL/M6c7OfC5/GY6iPD24BiII+dGtP6a67UCwm0hqtmzAclWblnfi
 DhqsQ4XwQqL5bZ1pG8ln+tBbS+tqJ3596l06Frnbx6XRP3N3nRqej4coO
 0jf0U8aXQnmR2tZIenDl5dWXvJtw4yYUTLrwZ3lQ8enm0JtNeUy8P90nP w==;
X-CSE-ConnectionGUID: L31ummr4TTeRxR+mnt50mw==
X-CSE-MsgGUID: v0YvYqSPSkCp4KvE0T1byw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="98139244"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="98139244"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 13:07:28 -0700
X-CSE-ConnectionGUID: JUT8LL4rQ6G/bHSdkpaegQ==
X-CSE-MsgGUID: HLWvmWpQTLWTeAIjJ4FqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="262410736"
Received: from dut4475arls.fm.intel.com ([10.105.8.198])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 13:07:27 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 00/10] Add new debug infrastructure for configfs
Date: Thu, 20 Aug 2026 20:07:17 +0000
Message-ID: <20260820200719.84681-12-stuart.summers@intel.com>
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

Stuart Summers (10):
  drm/xe: Guard configfs attribute reads in getters
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
 drivers/gpu/drm/xe/xe_configfs_debug.c        |  872 ++++++++++++++
 drivers/gpu/drm/xe/xe_configfs_debug.h        |   48 +
 drivers/gpu/drm/xe/xe_configfs_debug_params.c |  158 +++
 drivers/gpu/drm/xe/xe_configfs_debug_params.h |  193 ++++
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
 19 files changed, 1494 insertions(+), 986 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug_params.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug_params.h
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_types.h

-- 
2.43.0

