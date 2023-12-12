Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BBBC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 18:17:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB7810E04C;
	Tue, 12 Dec 2023 18:17:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EA110E04C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 18:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702405063; x=1733941063;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RVJqio7BEMTlseUawLaCCqwyi23yZLBtY80I7cD7UmI=;
 b=ESGjiurfmg1/6rNLRrEKFPL9lMPe/mYQKfCTb5p67wjo+pZZoNYGmvSP
 z0+CTxsV3EKUnocZmlgEvbJ5pYZekhdDd0nQCkUuRAVfRlXDn01V/0Fci
 h+8tv5c9u9xf0aFa3bWPC6D+/71phL+AiA9aI58wFbvJFg6IVvmIcwTBe
 DQzXEO73kYUFoVWPn9x9jIADqcgMoUPVvSKwvimEG/paGUVtCwtDwn9Zs
 VuXCJrBRZXddhFMudNexV56qOLrp2CGGf/f5BOPGr72ugqKEjlA8Fi1jf
 boapqwHzZRm2S3Ux6mjVIbU/CYD0o3oCZGKf3+LlSG4XwcwgL/guvJ3Yv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="425967985"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="425967985"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 10:17:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="749806337"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="749806337"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga006.jf.intel.com with ESMTP; 12 Dec 2023 10:17:40 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 00/10] Enable compression handling on LNL.
Date: Tue, 12 Dec 2023 23:55:23 +0530
Message-Id: <20231212182533.1722705-1-himal.prasad.ghimiray@intel.com>
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
 drivers/gpu/drm/xe/xe_bo.c                |  56 +++---
 drivers/gpu/drm/xe/xe_bo_types.h          |   4 +
 drivers/gpu/drm/xe/xe_device.c            |  32 +++-
 drivers/gpu/drm/xe/xe_migrate.c           | 202 +++++++++++-----------
 drivers/gpu/drm/xe/xe_migrate.h           |   3 +-
 drivers/gpu/drm/xe/xe_pat.c               |   1 +
 drivers/gpu/drm/xe/xe_pci.c               |   2 +-
 drivers/gpu/drm/xe/xe_pt_types.h          |   1 +
 12 files changed, 210 insertions(+), 151 deletions(-)

-- 
2.25.1

