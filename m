Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0859C10DC3
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 13:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CA610E3F8;
	Mon, 11 Dec 2023 13:34:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBAC10E403
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702301667; x=1733837667;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bm3L1QNgr3LKNjHEhq+NXSp9pnyQ0PB7pWiej3TNs4c=;
 b=Uhb+FjJ3gsvSzNSBSPWNUHinS7AC3F2+UpYc1Z/GCdOPL7CtmkNtY4xd
 FaBYUsp8PkHQ/45CwuCw/IQERkm2/r43MK3WXHNA/JyMote9FXQ3cnE7V
 o34OVVQXlK54Av1dt58NMRGFDyqZ5UAu07Jm5ol68FZ1acv3ZuzWkOxsa
 t0UALq5L4WPJ4iAWA0W5jn0P3J3X6XeBbb8ku654a+6yYvLkn4NC9hs3U
 rOMviPAKJUGlOSYIOzjj5WWK0aT6uToSEJCzPV1G0EoX/SFwizdG1N8Aw
 ArzRRPs8ldNbcw0nEaklz/c/t9Da2XIh/UUk6UqETGfPP6afBaymdNId7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="461126575"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="461126575"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 05:33:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="722788032"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="722788032"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga003.jf.intel.com with ESMTP; 11 Dec 2023 05:33:32 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 00/10] *Enable compression handling on LNL.
Date: Mon, 11 Dec 2023 19:11:13 +0530
Message-Id: <20231211134123.1645793-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

xe2 igfx platform supports compression and firmware reserves 1/512th of 
system memory for ccs pool and programs the configuration registers.
The configuration register must be read during driver initialization and 
should notify via drm_dbg if compression is disabled.

The firmware allocated ccs pool is directly inaccesible to driver and can
only be read/write using XY_CTRL_SURF_COPY_BLT commands. To support ccs
metadata handling, driver allocates extra memory in bo. 

During bo creation the ccs region needs to be cleared for security.
During the eviction (buffer movement from gpu domain to system domain) 
ccs metadata is copied from flat ccs to extra memory allocated in bo and
during restore(buffer movement from system domain to gpu domain) ccs
metadata is copied from extra pages in bo to flat ccs region.

Series enables flat ccs on xe2 igfx platforms and handles clearing and
copy of ccs metadata during bo creation and xe_bo_move respectively.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Himal Prasad Ghimiray (10):
  drm/xe/xe2: Determine bios enablement for flat ccs on igfx
  drm/xe/xe2: Modify main memory to ccs memory ratio.
  drm/xe/xe2: Allocate extra pages for ccs during bo create
  drm/xe/xe2: Updates on XY_CTRL_SURF_COPY_BLT
  drm/xe/xe_migrate: Use NULL 1G PTE mapped at 255GiB VA for ccs clear
  drm/xe/xe2: Update chunk size for each iteration of ccs copy
  drm/xe/xe2: Update emit_pte to use compression enabled PAT index
  drm/xe/xe2: Handle flat ccs move for igfx.
  drm/xe/xe2: Modify xe_bo_test for system memory
  drm/xe/xe2: Support flat ccs

 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |   7 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |   3 +
 drivers/gpu/drm/xe/tests/xe_bo.c          |  44 +++--
 drivers/gpu/drm/xe/tests/xe_migrate.c     |   6 +-
 drivers/gpu/drm/xe/xe_bo.c                |  47 +++--
 drivers/gpu/drm/xe/xe_bo_types.h          |   4 +
 drivers/gpu/drm/xe/xe_device.c            |  32 +++-
 drivers/gpu/drm/xe/xe_migrate.c           | 202 +++++++++++-----------
 drivers/gpu/drm/xe/xe_migrate.h           |   3 +-
 drivers/gpu/drm/xe/xe_pat.c               |   1 +
 drivers/gpu/drm/xe/xe_pci.c               |   2 +-
 drivers/gpu/drm/xe/xe_pt_types.h          |   1 +
 12 files changed, 205 insertions(+), 147 deletions(-)

-- 
2.25.1

