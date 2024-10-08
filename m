Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF2DCED24E
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 01:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B816E10E347;
	Tue,  8 Oct 2024 01:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VazOLqSi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923BC10E07D
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 01:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728351315; x=1759887315;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P1rMr79CHM7qxN2FkuSgQ1eZO+6mRdHE9f7Un5Gjs/c=;
 b=VazOLqSiPNPmqX73oan9u60kFq7fUnOUwbTvfsVJakODzY+4ZoiKG/8g
 w2i8NTXVwCfe/9p+XksEiK0dbFV8HJw7NChUWvmTI0Hbj64uybGedN11w
 GiCgzU2L8ZpuPgfEZW7pS3+b1KZ4Adun2t3cepOhL7Vnry81PNVgmfiFI
 SXbA5gqqHjQdi08cuj/USpSXBIPTTLvHfdl84HIEBw3RfgZIlVaU1he5C
 Zo9UOVxkeJteLjzwvEfNE1h8Wr34glpeT0tjoKsIj1AUrAK5mEkttLdmi
 syY6vD6SFRK5wy1NxawKdzNK6+3yJAgulwTVbvxKCwncxgI3h38Apr+/5 w==;
X-CSE-ConnectionGUID: EUQ+x3lLQvW9ng5Fcs52pQ==
X-CSE-MsgGUID: TEbfGtm2SpCU2QqqNgDvPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38652972"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="38652972"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 18:35:15 -0700
X-CSE-ConnectionGUID: CgT7pg+SRmyv8dMzLpcY8g==
X-CSE-MsgGUID: FJbC9zJFSsqoOTlBdkBrvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="80454293"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.117])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 18:35:14 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 0/6 v3] Add Xe3 and Panther Lake support
Date: Mon,  7 Oct 2024 18:35:03 -0700
Message-ID: <20241008013509.61233-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
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

v2: Drop several patches in favor of a more lightweight approach,
address feedback on the remainder, reorder.

v3: reuse xe2_graphics defintion, merge steering entries where
appropriate, fix mistake in stepping for 2 workarounds.

Gustavo Sousa (1):
  drm/xe/xe3: Add initial set of workarounds

Haridhar Kalvala (3):
  drm/xe/xe3: Define Xe3 feature flags
  drm/xe/ptl: PTL re-uses Xe2 MOCS table
  drm/xe/ptl: Add PTL platform definition

Matt Roper (2):
  drm/xe/xe3: Xe3 uses the same PAT settings as Xe2
  drm/xe/xe3lpm: Add new "instance0" steering table

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  3 ++
 drivers/gpu/drm/xe/xe_gt_mcr.c           | 17 +++++++-
 drivers/gpu/drm/xe/xe_mocs.c             |  1 +
 drivers/gpu/drm/xe/xe_pat.c              |  2 +-
 drivers/gpu/drm/xe/xe_pci.c              | 16 +++++++-
 drivers/gpu/drm/xe/xe_platform_types.h   |  1 +
 drivers/gpu/drm/xe/xe_wa.c               | 49 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  3 +-
 include/drm/intel/xe_pciids.h            | 11 ++++++
 10 files changed, 99 insertions(+), 5 deletions(-)

-- 
2.45.0

