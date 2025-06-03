Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADAEC5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D09510E74E;
	Tue,  3 Jun 2025 18:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVTpPGmO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263D910E8F1
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748975075; x=1780511075;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0jKP7ajafdkv8PjOit5ufecyfenD65rYebmq4hx1aLs=;
 b=MVTpPGmOy285LkKwSPPqlJLiC1ZnQDYVzLpZ0Dfhn9r5cLXnp4h4oj1N
 dFMpww4ZO7bFQzxJAS+6vuvjC2LdGjzgq7IeUqVwi+cX+5PhxLwCyu1Ok
 jPUETLyVw5wjGJTjqjvAAtPHKJVpCi14Oi+B2hsTiKw6Alc5Sw3eQBSpL
 Nvm7gDEp50eOHnaEQQGt8ofEov7PnlJT3Wi6w5w7LqXu7rLVjjOL4OxJ0
 Jw8PvMS2gd4ay+bHy9VVLV8XaqRE3gkMgPFNIUYKxxrmxDuTWnQRAPoP7
 4VbeWBuPAnytV9qkiG2kF2Sob+kgulULmKSSgQZWCIP36/1g8x8yaXxnv Q==;
X-CSE-ConnectionGUID: n3SJTO6zQ++ak/afBNPvkg==
X-CSE-MsgGUID: nk/dQJsMQlq5U/QgSqDuHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54693854"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="54693854"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:24:34 -0700
X-CSE-ConnectionGUID: NeIyzsJIRx6pY6L2J6Xk9g==
X-CSE-MsgGUID: 3MsZ5KApSiSqEg2pTMcDIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145562019"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa007.jf.intel.com with ESMTP; 03 Jun 2025 11:24:34 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 0/6] Add WildCat Lake support
Date: Tue,  3 Jun 2025 23:54:24 +0530
Message-Id: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
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

Matt Atwood (2):
  drm/i915/xe3lpd: Update bandwidth parameters for display version 30.02
  drm/i915: Set max cdclk for display 30.02

Matt Roper (4):
  drm/i915/xe3lpd: Add support for display version 30.02
  drm/xe/xe3: Add support for graphics IP version 30.03
  drm/xe/xe3: Add support for media IP version 30.02
  drm/xe: Add Wildcat Lake device IDs to PTL list

 drivers/gpu/drm/i915/display/intel_bw.c          | 11 ++++++++++-
 drivers/gpu/drm/i915/display/intel_cdclk.c       |  4 +++-
 .../gpu/drm/i915/display/intel_display_device.c  |  1 +
 drivers/gpu/drm/xe/xe_pci.c                      |  2 ++
 drivers/gpu/drm/xe/xe_wa.c                       | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules               |  8 ++++++--
 include/drm/intel/pciids.h                       |  4 +++-
 7 files changed, 41 insertions(+), 5 deletions(-)

-- 
2.34.1

