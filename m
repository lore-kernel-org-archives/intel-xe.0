Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ED4C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 20:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FD310E194;
	Thu, 12 Jun 2025 20:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hhnrKamj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6555710E191;
 Thu, 12 Jun 2025 20:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749760494; x=1781296494;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QYCYtRisRSxOuTqA9xEGllD+zu4tr132YkXXNLKDvXk=;
 b=hhnrKamjYJQmwaw2J+zcOg1QxVsPkX50ziTxfA0+NXLUBkaZwhgog5a/
 g6qeooWgy81YKZX8Lw6iQHp80B0BFEwH4jOOMM7FpgSYUUM5eUWvPfiQe
 ilN2gHL02bFNMeX/mAM1h57UfzEUQ+vpuLJKdOQjt/94NiqgDnDbpAGcR
 fZOl6NjMtK8qg6soOQjsUo/c7LTHbfsCaNR/bdHZhWtrqSwzxReMQF51P
 BmdOuynfdaw0S49F0iKMM2ETt5Ui6ws94a0PQlVV0q8lfOhzYs2b6pDDq
 bnJsYvjoTi37+YQx2Bc5Ohg91RjpSAY6UUO2N9TB6IAXvEdjkXU1rTHPa Q==;
X-CSE-ConnectionGUID: imyqOXSpRHeuU3ewdf4rYw==
X-CSE-MsgGUID: +JERRMUuSmmh5pKGj/UA1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52106965"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="52106965"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 13:34:52 -0700
X-CSE-ConnectionGUID: oiqoOxKaTcu6kagym/CBVw==
X-CSE-MsgGUID: mtwSWA+eQmmJz7ux03GSWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="148520039"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa009.fm.intel.com with ESMTP; 12 Jun 2025 13:34:50 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v5 0/9] Add WildCat Lake support
Date: Fri, 13 Jun 2025 02:04:39 +0530
Message-Id: <20250612203448.2948795-1-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
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

Enable Wildcat Lake by adding PCI IDs and add the initial support GT, Media
and Display workarounds.

-v5: Resolved conflict and address the few feedbacks.

Dnyaneshwar Bhadane (3):
  drm/i915/xe3lpd: Extend DMC load path for display version 30.02
  drm/i915/wcl: C10 phy connected to port A and B
  drm/i915/xe3lpd: Extend WA 16023981245 for display 30.02

Matt Atwood (2):
  drm/i915/xe3lpd: Update bandwidth parameters for display version 30.02
  drm/i915: Set max cdclk for display 30.02

Matt Roper (4):
  drm/i915/xe3lpd: Add support for display version 30.02
  drm/xe/xe3: Add support for graphics IP version 30.03
  drm/xe/xe3: Add support for media IP version 30.02
  drm/xe: Add Wildcat Lake device IDs to PTL list

 .../gpu/drm/i915/display/intel_atomic_plane.c    |  3 ++-
 drivers/gpu/drm/i915/display/intel_bw.c          | 11 ++++++++++-
 drivers/gpu/drm/i915/display/intel_cdclk.c       |  4 +++-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c     |  8 +++++++-
 .../gpu/drm/i915/display/intel_display_device.c  |  1 +
 drivers/gpu/drm/i915/display/intel_dmc.c         |  3 ++-
 drivers/gpu/drm/xe/xe_pci.c                      |  2 ++
 drivers/gpu/drm/xe/xe_wa.c                       | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules               |  6 ++++++
 include/drm/intel/pciids.h                       |  4 +++-
 10 files changed, 52 insertions(+), 6 deletions(-)

-- 
2.34.1

