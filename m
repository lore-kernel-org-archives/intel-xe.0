Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD51C44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 14:13:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBF910F0CE;
	Wed, 15 Jul 2026 14:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCaAl/36";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E166110F0CE;
 Wed, 15 Jul 2026 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784124821; x=1815660821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z4u7U8dLopoo3psAhxternNFY8nvM+qeDWpUqndjhmE=;
 b=eCaAl/36LXOvaLrynSaMc1LlvIDkMXfZjJe0v18enldy0eBXi4JkZxuq
 WlP0Y9Wu1V1zhOPKvGb/C6CrBYkRaX0U97+VlH88H8xlsy+BDTkZ4svAa
 NG0u7Jg4a7aFWkVR3rPFIOphQUArl1c+JmpZU/4alJKIGnFpsqbMGK0n2
 hrGpA59YAQl8iBupdKy35fJWxfO0y5uaq/pgDRcd1w0vJUliOYeEcYuj9
 hQtPcf49YgFbTeJ3vXRJ2UMMPkUSWknXrlxBx3pyXTHtUaABwtxc3s0Ks
 /rJ4PfPrOgvS0VPJUSyNF4d4aLUP/av4nFNZoBRou+d8ceJvitE/NRlRP Q==;
X-CSE-ConnectionGUID: Q+Tm1q+sT1mTemNV6s7MmQ==
X-CSE-MsgGUID: UXqsX4HGSMOVmJQ5tTg1Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="110310297"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="110310297"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 07:13:40 -0700
X-CSE-ConnectionGUID: tik82MJlQhSg5KUEEoRsPw==
X-CSE-MsgGUID: VPDYcbPoTma1PsvWOEhRTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="260008528"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa004.jf.intel.com with ESMTP; 15 Jul 2026 07:13:39 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, suraj.kandpal@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 0/2] drm/i915/display: Implement Display Wa_16030862157
Date: Wed, 15 Jul 2026 20:02:41 +0530
Message-ID: <20260715143243.4141208-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
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

Interpret 0xF populated-channel count as 16. For 16-channel
configuration, BIOS programs 1111b. A programmed value of 1111b
must be interpreted as 16 channels for memory bandwidth calculations.
This series implements the workaround in driver.

v2:
  - Logical separation of changes
  - Limit WA to NVL

Uma Shankar (2):
  drm/i915/xe3p/dram: Interpret 0xF populated-channel count as 16
  drm/i915/xe3p/bw: Update bw calculation to account for 16 channels

 drivers/gpu/drm/i915/display/intel_bw.c       | 20 ++++++++++++++++---
 .../gpu/drm/i915/display/intel_display_wa.c   |  2 ++
 .../gpu/drm/i915/display/intel_display_wa.h   |  1 +
 drivers/gpu/drm/i915/display/intel_dram.c     | 14 ++++++++++++-
 4 files changed, 33 insertions(+), 4 deletions(-)

-- 
2.50.1

