Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A204CD1284
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 12:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA87510FCED;
	Tue,  2 Apr 2024 12:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CiyYMbUR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F8210F7C9
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 12:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712062040; x=1743598040;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dojl6fD/saHtQE5j/s9TYNu4jC8w7tYPu7ixbC26MA4=;
 b=CiyYMbUR2zx6bbtJA9TeK25IIubWoviGkZvpSQjqXYidLNbAzb3eKeoq
 1EWOwXFN6O2R8M7wbZtxMnsrrwrRAIX4fjRl/zxAQY6dnq2u3JKAE1Ez/
 4VutTyz1wIV6Z8I/EHazh4ZcO45oPZqeSYijBKAOF13oUOr4KlRsNL6y/
 aP5jDq8cF2GRAaU0itX2F7XrX2s6jXOK6614rsd6BksKphFqLqvzgdhXP
 IN0J+ds0X20Bi3G+nLCNng/tss8+7ScffscQO87xq80sIg70HMRK+3PYi
 Q9gKN3Ck63T2FV2nv7jS08IBVEwck8mqEa6NKIOEX0w3FiTm928W8qLs3 g==;
X-CSE-ConnectionGUID: 0KLST99LR+a1cOX0Z6VSkQ==
X-CSE-MsgGUID: MrhQnO7HTAWNXPndl9wCxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7098058"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7098058"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:47:20 -0700
X-CSE-ConnectionGUID: LkieXeDvTSueLRHMTukQFw==
X-CSE-MsgGUID: 2CnPCW18TxmHsuZpc7PxwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18111152"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:47:18 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 00/11] Add Battlemage support
Date: Tue,  2 Apr 2024 18:17:13 +0530
Message-Id: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add basic support for Battlemage, which is a discrete graphics card
based on Xe2 architecture.
This series provides basic enabling support. This will be followed with
further patches series to enable display support and loading of required
firwares.

Akshata Jahagirdar (2):
  drm/xe/xe2hpg: Remove extra allocation of CCS pages for dgfx
  drm/xe/xe2hpg: Limit chunk size to 4MiB for vram

Balasubramani Vivekanandan (1):
  drm/xe/bmg: Add BMG mocs table

Gustavo Sousa (1):
  drm/xe/xe2hpm: Add initial set of workarounds

Haridhar Kalvala (1):
  drm/xe/xe2hpg: Add initial GT workarounds

Himal Prasad Ghimiray (1):
  drm/xe/xe2hpg: Determine flat ccs offset for vram

Matt Roper (4):
  drm/xe/xe2: Recognize Xe2_HPG IP
  drm/xe/xe2: Recognize Xe2_HPM IP
  drm/xe/bmg: Add BMG platform definition
  drm/xe/bmg: Program an additional discrete-specific PAT setting

Shekhar Chauhan (1):
  drm/xe/xe2hpg: Introduce performance tuning changes for Xe2_HPG.

 drivers/gpu/drm/xe/regs/xe_gt_regs.h   | 14 ++++
 drivers/gpu/drm/xe/xe_bo.c             |  3 +
 drivers/gpu/drm/xe/xe_migrate.c        |  2 +-
 drivers/gpu/drm/xe/xe_mmio.c           | 39 ++++++++++-
 drivers/gpu/drm/xe/xe_mocs.c           |  1 +
 drivers/gpu/drm/xe/xe_pat.c            |  7 ++
 drivers/gpu/drm/xe/xe_pci.c            | 13 +++-
 drivers/gpu/drm/xe/xe_platform_types.h |  1 +
 drivers/gpu/drm/xe/xe_reg_whitelist.c  |  4 ++
 drivers/gpu/drm/xe/xe_tuning.c         |  6 +-
 drivers/gpu/drm/xe/xe_wa.c             | 95 ++++++++++++++++++++++++++
 include/drm/xe_pciids.h                |  7 ++
 12 files changed, 184 insertions(+), 8 deletions(-)

-- 
2.25.1

