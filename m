Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC74C38150
	for <intel-xe@archiver.kernel.org>; Sun,  7 Jul 2024 22:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC02710E069;
	Sun,  7 Jul 2024 22:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVq/53Ie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DC410E069
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Jul 2024 22:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720392107; x=1751928107;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C+nljAUW2iO7zatyOYquv+ROSRNAUYp1Yjdjt4CcoO4=;
 b=JVq/53IeBMIVTCZ4a4AJ2y4DTnTt3OF6CB1PGZ906RDpwyIncDtnqr1n
 uo6P8grk5Qo550PnfS69MYHCAESfFnNol1IFMQoDr+vWhAfEbQadMuwSN
 JXGVGNFhkxECR0d1xGUuo3JU8+uOGSnORpdaV+i53L681y/TuxDScPWlh
 7bHHwUlmwEKp1NEhmIWi6EV6m7KMX1jS9iXsD/h258IZzyMYu0zLuX22z
 dp3sg2yEoSbbHWJPWDU0gs6x0BxuaQ8fBdCuooq+g27OqRa1lwrUmvCgY
 /llecEB0RKl7zVLG9c1urtnKPHdLw2AjWNkxcDv7lr5agBW7rWYkZhM20 A==;
X-CSE-ConnectionGUID: EiGRdfimRCmiNUJ/a/QBxg==
X-CSE-MsgGUID: B0aGTnj7Q9+nn1GVfPgbwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17793170"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; d="scan'208";a="17793170"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 15:41:46 -0700
X-CSE-ConnectionGUID: egQ7Brn5RDqZ++Y0L4nhAg==
X-CSE-MsgGUID: hNjrM8oUROuTFVygoQU81w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; d="scan'208";a="47265672"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 15:41:46 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v2 0/1] Add support for EU stall sampling
Date: Sun,  7 Jul 2024 15:41:40 -0700
Message-ID: <20240707224141.2865472-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

 The following patch adds support for EU stall sampling, a new hardware
feature first added in PVC and is being supported in XE2 and later
architecture GPUs. This feature would enable capturing of EU stall
data which include the IP address of the instruction stalled and
various stall reason counts. More details are explained in the patch
commit message.

I am posting this patch as an RFC to get early feedback in the uAPI
while support for this feature is being added into Mesa. A new test
in the IGT repo: https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
is also under development to test this feature in the driver. This
patch has undergone basic testing with the new IGT test that is under
development.

The EU stall data from the driver include a header with additional
information about the data that follows the header. The header
includes flags one of which indicate if data has been dropped has
been dropped by the hardware due to buffer being full. While read
returns the total bytes read, any data dropped by the hardware will
be indicated in the flags. One feedback received so far is to make
read return an error when data has been dropped by the hardware
instead of setting a flag in the header. One suggestion received
is to consider two FDs per EU stall data stream with one fd to read
data and other fd to pass any errors. please comment on this idea
that's not represented in the code

Thank You.

v2: Rename xe perf layer as xe observation layer

Harish Chegondi (1):
  drm/xe/eustall: Add support for EU stall sampling

 drivers/gpu/drm/xe/Makefile                |    1 +
 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |   33 +
 drivers/gpu/drm/xe/xe_eustall_cntr.c       | 1005 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eustall_cntr.h       |   62 ++
 drivers/gpu/drm/xe/xe_gt.c                 |    3 +
 drivers/gpu/drm/xe/xe_gt_topology.c        |    9 +
 drivers/gpu/drm/xe/xe_gt_topology.h        |    3 +
 drivers/gpu/drm/xe/xe_gt_types.h           |    4 +
 drivers/gpu/drm/xe/xe_observation.c        |   14 +
 drivers/gpu/drm/xe/xe_trace.h              |   35 +
 include/uapi/drm/xe_drm.h                  |   77 ++
 11 files changed, 1246 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_eustall_cntr.c
 create mode 100644 drivers/gpu/drm/xe/xe_eustall_cntr.h

-- 
2.41.0

