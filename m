Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E201ECD3437
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 04:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A202610E36F;
	Mon,  4 May 2026 04:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DeNd2QDD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60D310E366
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 04:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777869832; x=1809405832;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iTRF5jChPS3NIovPwXcPgkW44XNFX6YFsK73nKuaJv4=;
 b=DeNd2QDD5c1LdejEwEwtdC29f41cE+X9Zxi8Tz2Rtfg9MSucOHEh1+0j
 JOXrMB69QNVooAoAuSOEmglsLrJ3ARLKP1QMoTdnj33M1PzTyfd7FhQLV
 /WgJITA+pKtybj7Usgg//UK5ypdFDtfHkD7X7pSIeABbmWg0VUD4ucnvz
 UMXJ3irxcmOPLG3mKm33jLkgxElUdAvxk/i/udwqNv9o2ByG+5r8I7VxK
 VkRdrAneDn/me7MKOJ+G7ZQ6iRGuJGyjBT/M1VBte9tk8PlIzWElTDPO1
 AQMDvtzsROclPYm8DUMCWO0Si9WIKv+yW3Vvb1dxu2jX+vBuTRvN51B12 w==;
X-CSE-ConnectionGUID: zbCRSonuSsKPp2bP8SJecA==
X-CSE-MsgGUID: qlFJ37kpSW2xqEiCK+RcrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96293556"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="96293556"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:51 -0700
X-CSE-ConnectionGUID: CPgKLylMScKnR/2YporSeQ==
X-CSE-MsgGUID: MVkuFijuTVukuds41BDieQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="232773659"
Received: from dut4435arlh.fm.intel.com ([10.105.8.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:50 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/9] Add new debug infrastructure for configfs
Date: Mon,  4 May 2026 04:43:37 +0000
Message-ID: <20260504044348.209625-1-stuart.summers@intel.com>
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

In terms of the patches here, I'm also making a few organizational
changes like naming and sorting. I also know we have a few other
module parameters that could migrate here, but I didn't want to
overload this series too much, so the focus for now is on
the existing configfs entries and demonstrating the new structures
with the GuC log level and target parameters.

I used GitHub Copilot with Claude pretty extensively through the
process here and attributed as such. Happy to answer any questions
around this.

I also decided to drop John Harrison from the NPK patch. It has
been modified quite a bit from the original, but more importantly
John is no longer with Intel and that email address isn't available
any more. If it makes a difference here, John and I had both separately
implemented this same change at different occasions for debug. The
one I used to start that initial series was cherry-picked from his
latest variant.

Tested on BMG.

[1] https://patchwork.freedesktop.org/series/162087/

Stuart Summers (9):
  drm/xe: Rename survivability_mode to enable_survivability_mode
  drm/xe: Sort xe_config_device fields and defaults alphabetically
  drm/xe: Split out configfs data structures
  drm/xe: Add a new debug focused configfs group
  drm/xe: Move debug configfs entries to xe_configfs_debug.c
  drm/xe/guc: Add configfs support for guc_log_level
  drm/xe/guc: Add support for NPK as a GuC log target
  drm/xe: Add infrastructure for debug configfs parameters
  drm/xe: Migrate existing debug configfs entries to params
    infrastructure

 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/abi/guc_log_abi.h          |   8 +
 drivers/gpu/drm/xe/xe_configfs.c              | 952 ++----------------
 drivers/gpu/drm/xe/xe_configfs.h              |  23 -
 drivers/gpu/drm/xe/xe_configfs_debug.c        | 900 +++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs_debug.h        |  56 ++
 drivers/gpu/drm/xe/xe_configfs_debug_params.c | 112 +++
 drivers/gpu/drm/xe/xe_configfs_debug_params.h | 127 +++
 drivers/gpu/drm/xe/xe_configfs_types.h        |  73 ++
 drivers/gpu/drm/xe/xe_defaults.h              |   5 +
 drivers/gpu/drm/xe/xe_guc.c                   |  12 +-
 drivers/gpu/drm/xe/xe_guc_log.c               |   3 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                   |   1 +
 drivers/gpu/drm/xe/xe_pci.c                   |   1 +
 drivers/gpu/drm/xe/xe_psmi.c                  |   1 +
 drivers/gpu/drm/xe/xe_rtp.c                   |   1 +
 drivers/gpu/drm/xe/xe_survivability_mode.c    |   3 +-
 18 files changed, 1369 insertions(+), 912 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug_params.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug_params.h
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_types.h

-- 
2.43.0

