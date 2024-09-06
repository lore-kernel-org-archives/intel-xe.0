Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7536BE6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389B210EAFF;
	Fri,  6 Sep 2024 21:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oEqbgoHk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232CE10EAFF
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725659519; x=1757195519;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YC4rEVP7JznHH8hFlvErmeKJcoW6H4UCU/gIeuaAenA=;
 b=oEqbgoHkEcd7kbkr2SVyzT1NTPF4iP4K1ai1TmzeAfdwJyaoUIZgYz7E
 JDhAFSEBVjZ2I6MsBuq3YUJdNJbhY592+0JFO5ZtgUmVp+0kPuw2A5uqm
 Xi5Kmkp7hLHYDHw5LMmYZXMK4gHIVNhmcsV6/S1IPJOi4ZKBZ/oElKzkZ
 kNZmhNONU4zU4MzVxKRUvTYPTKk3zZco4osd55onaVYKUM3FEsmwa22ae
 3vtb2e6V6cA0xnLYWjt5vAlZy4ZrS5d7/NKJXJJkuLAKjdlgQb5o4i6VO
 yXc7L53pGdYQkdQ9JfvtYe5hX2RCugyXp5FzLP3UxdySizCXJk+HVIt+U A==;
X-CSE-ConnectionGUID: GgppWCtVS022yM3zEGmKHA==
X-CSE-MsgGUID: LLehJA8KRIueUVC57Bxy2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24580554"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24580554"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:51:59 -0700
X-CSE-ConnectionGUID: EipkKCJpR8KueDa0g+PTqA==
X-CSE-MsgGUID: VTtgQ3+4SdaqnTNRgJX8Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="70656305"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.176])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:51:58 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 0/9] Add Xe3 and Panther Lake support
Date: Fri,  6 Sep 2024 14:51:44 -0700
Message-ID: <20240906215153.31210-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.44.0
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

Add the basic enabling for Xe3 gt and media and add the Panther Lake
platform definition. This defines the Xe3 feature flags and initial GT
workarounds.

Display support will follow later. 

Francois Dugast (1):
  drm/xe/xe3: Generate and store the L3 bank mask

Gustavo Sousa (1):
  drm/xe/xe3: Add initial set of workarounds

Haridhar Kalvala (3):
  drm/xe/xe3: Define Xe3 feature flags
  drm/xe/ptl: PTL re-uses Xe2 MOCS table
  drm/xe/ptl: Add PTL platform definition

Matt Roper (3):
  drm/xe/xe3: Xe3 uses the same PAT settings as Xe2
  drm/xe/xe3lpm: Add new "instance0" steering table
  drm/xe/ptl: Add performance tuning settings for PTL

Tejas Upadhyay (1):
  drm/xe/xe3: Extend wa_15015404425 for xe3

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  6 ++++
 drivers/gpu/drm/xe/xe_gt_mcr.c           | 17 ++++++++-
 drivers/gpu/drm/xe/xe_gt_topology.c      | 11 +++++-
 drivers/gpu/drm/xe/xe_mmio.c             | 12 +++----
 drivers/gpu/drm/xe/xe_mocs.c             |  1 +
 drivers/gpu/drm/xe/xe_pat.c              |  2 +-
 drivers/gpu/drm/xe/xe_pci.c              | 31 +++++++++++++++-
 drivers/gpu/drm/xe/xe_platform_types.h   |  1 +
 drivers/gpu/drm/xe/xe_tuning.c           |  6 ++--
 drivers/gpu/drm/xe/xe_wa.c               | 46 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
 include/drm/intel/xe_pciids.h            | 11 ++++++
 13 files changed, 133 insertions(+), 13 deletions(-)

-- 
2.44.0

