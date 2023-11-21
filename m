Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFF1C5ACB3
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 09:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B863710E257;
	Tue, 21 Nov 2023 09:53:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FB410E257
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 09:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700560433; x=1732096433;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lEeWS8uNlj8V2C+5xVceEQRVB8k+4Iu6sR+RyrBaa1c=;
 b=DULoZIU8RuZORBwEII/rmbY9WzqC13AYdF4J8nFTyFB4DpbSRUG4lJRl
 ogVaZ/vrTa9Dg/+dK1cINwd8G2RnruQIw1ZUZ/iduuWd8gJ3IYeU1MClG
 61qiY5pqb+xyoHpum+BM3yvhimU8HddBatBRuLNLRgRDp3uGZxKdAAZKS
 AKyCEwfqIozM6uv+ahurFtLCn1srNBAF1bXd5bPbMBN544LH4AYAulbEa
 YvTKWmZ5UfESyW0gG7xNs/rNpjVz2eRxETdReqnVr0vAA7IpdSezGzmkq
 tFu2iPyzBcwBhekWOeCAIUYO8jDu5LZQWE1seUVWgeAuRT7tRscmocjJH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="376841002"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="376841002"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 01:53:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="766586326"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="766586326"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga002.jf.intel.com with ESMTP; 21 Nov 2023 01:53:49 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Nov 2023 15:31:11 +0530
Message-Id: <20231121100117.3584066-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 0/6] Enable compression handling on LNL.
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

Himal Prasad Ghimiray (6):
  drm/xe/xe2: Support flat ccs.
  drm/xe/xe2: Determine bios enablement for flat ccs on igfx.
  drm/xe/xe2: Allocate extra pages for ccs during bo create.
  drm/xe/xe2: Updates on XY_CTRL_SURF_COPY_BLT
  drm/xe/xe_migrate.c: Use NULL 1G PTE mapped at 255GiB VA for ccs
    clear.
  drm/xe/xe2: Handle flat ccs move for igfx.

 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |   3 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |   3 +
 drivers/gpu/drm/xe/xe_bo.c                |  40 ++++---
 drivers/gpu/drm/xe/xe_bo_types.h          |   2 +
 drivers/gpu/drm/xe/xe_device.c            |  34 +++++-
 drivers/gpu/drm/xe/xe_migrate.c           | 139 +++++++++-------------
 drivers/gpu/drm/xe/xe_pci.c               |   2 +-
 7 files changed, 121 insertions(+), 102 deletions(-)

-- 
2.25.1

