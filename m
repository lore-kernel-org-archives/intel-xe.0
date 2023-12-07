Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6CAC10DCE
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 09:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C6610E1B5;
	Thu,  7 Dec 2023 09:11:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB6010E1B4
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 09:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701940312; x=1733476312;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dtYst+oxLq48VSwZu9t3/ixguvjVIPayh2fyFTE0B8U=;
 b=VKJ5RY0KRbQhNuSyx6t9WDrrev+a2HpqWGhPfh4qPupKbCKIg/8140En
 CL5J/OGM1+bqp8R6h6LAn+4NImrfS0liUzzkt5aoJAEH/nMQZ9MNkJPIB
 iGaPbrG64Yz+luFxCBFChfcziL4MTXDuIZtruVe9FNEbreBa78NORwScL
 naFWOmnY5PMRN7Apw2tSiXX4lt6MdfVZgDAKGKhJh4739tRsBW23gFv4D
 +mY/oGsmyIhBkdUU5bKql5T8c/vjwyIWdqPoH7emhdtQpLcxNBZqrY/H1
 jgi0YAcrzwwiak1O2EsQl0TQ6hFSBs1xWf/28xr3TV3Yv/6dGAkIJg/zj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391373973"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="391373973"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:11:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="895067810"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="895067810"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 07 Dec 2023 01:11:37 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Dec 2023 14:49:13 +0530
Message-Id: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 0/9] Enable compression handling on LNL.
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

Series enables flat ccs on xe2 igfx platforms and handles clearing and copy 
of ccs metadata during bo creation and xe_bo_move respectively.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Himal Prasad Ghimiray (9):
  drm/xe/xe2: Determine bios enablement for flat ccs on igfx
  drm/xe/xe2: Allocate extra pages for ccs during bo create
  drm/xe/xe2: Updates on XY_CTRL_SURF_COPY_BLT
  drm/xe/xe_migrate: Use NULL 1G PTE mapped at 255GiB VA for ccs clear
  drm/xe/xe2: Update chunk size for each iteration of ccs copy
  drm/xe/xe2: Update emit_pte to use compression enabled PAT index
  drm/xe/xe2: Handle flat ccs move for igfx.
  drm/xe/xe2: Modify xe_bo_test for system memory
  drm/xe/xe2: Support flat ccs

 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |   3 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |   3 +
 drivers/gpu/drm/xe/tests/xe_bo.c          |  23 ++-
 drivers/gpu/drm/xe/tests/xe_migrate.c     |   6 +-
 drivers/gpu/drm/xe/xe_bo.c                |  47 +++--
 drivers/gpu/drm/xe/xe_bo_types.h          |   4 +
 drivers/gpu/drm/xe/xe_device.c            |  31 +++-
 drivers/gpu/drm/xe/xe_migrate.c           | 202 +++++++++++-----------
 drivers/gpu/drm/xe/xe_migrate.h           |   3 +-
 drivers/gpu/drm/xe/xe_pci.c               |   2 +-
 10 files changed, 196 insertions(+), 128 deletions(-)

-- 
2.25.1

