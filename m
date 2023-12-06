Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9FFC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 17:14:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC5110E112;
	Wed,  6 Dec 2023 17:14:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C5510E112
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 17:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701882844; x=1733418844;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cBJi9hGIBtfpG89KuWI7VKmW2LDEFjsCejpA5fnwR/0=;
 b=J03y5iyf8K5i/045eRt+Lw5Z11cVqBDppCgc3uE+YVqNtyvpxX7UO12t
 7pmHAGL5uZtJlKzCBJLexfhHEB5u3ULgu31wUhVCq4ZeTfBKiTZ3XUoMP
 jsF1YnPmgJ7vxV4SWofgkws9lMNI/f16ORiYA9Khw9/HbypM7HfLHD2/i
 47U1TT1rE02C4rN/5WHbJoWgT9YdqfovQLXO7b70O6OUY6DzYJMfPTvcn
 GRx5aNgT8gN3oMjf6XX9k5N+26S4iuh3kwNK/Fiyio9+Sfo+nAvqJiVNp
 M/nVZE0MC3iyqbyFkbI/amHNl45NcE9ryjowq+O5BhMx59OQRJmBNt0ye Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391262382"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="391262382"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 09:12:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1018631880"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="1018631880"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga006.fm.intel.com with ESMTP; 06 Dec 2023 09:12:41 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 22:50:18 +0530
Message-Id: <20231206172027.1184366-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/9] Enable compression handling on LNL.
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
 drivers/gpu/drm/xe/tests/xe_migrate.c     |   2 +-
 drivers/gpu/drm/xe/xe_bo.c                |  43 +++--
 drivers/gpu/drm/xe/xe_bo_types.h          |   4 +
 drivers/gpu/drm/xe/xe_device.c            |  31 +++-
 drivers/gpu/drm/xe/xe_migrate.c           | 198 +++++++++++-----------
 drivers/gpu/drm/xe/xe_pci.c               |   2 +-
 9 files changed, 187 insertions(+), 122 deletions(-)

-- 
2.25.1

