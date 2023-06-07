Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657ECC7EE2E
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 10:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB6E10E4B4;
	Wed,  7 Jun 2023 10:05:27 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3052110E4AF
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 10:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686132324; x=1717668324;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=65VAbDr9SADDmVQ6x1PoJAfzW5kYd5KBpuWGyJJMPAs=;
 b=VKD8/6GMwugekLReCLD5lkUP2AmGqxWYVpaVJEMi7O1o0pVudg5zQqIh
 eAksNWHkhm+TvAl+Dja5hwfTiKU8+GumshEGM8CnBet45/XVVt86s1uxw
 mibceZT/OK7RynKjWCnT2mW4gA96F0RP/6cHGp+jE+VDJJ5ujVHuz3mp+
 anPDQKoqxlk/I4nuj2khx4XC6Ap0Ik+YQHGlOcUD1a8mgQfAMxlVqUFiU
 w1v10pWMGwp0tcAO38DXvgC7rvnwvgfOtB0PnubTQ7nU/yZ+mTlnycUr+
 x5FezORu5vcP8mwunqv8wunEeEFJCK6GbO5kmmtecbk1uXyBOKRZM5v13 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="356954266"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="356954266"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 03:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="1039539846"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="1039539846"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2023 03:05:21 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  7 Jun 2023 15:41:00 +0530
Message-Id: <20230607101103.2127088-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 0/3] drm/xe: Add sysfs entry for tile and
 relate it to GTs
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
Cc: Ghimiray@freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With the separation of xe_tile and xe_gt, We now consider
a PCI device (xe_device) to contain one or more tiles (struct xe_tile).
Each tile will contain one or two GTs (struct xe_gt).

Sysfs entries also needs to be aligned as follows:

drm/xe: Add sysfs entry per tile - Adds tile sysfs infrastructure
drm/xe: Add GTs under respective tile sysfs - Relates GTs to each tile
sysfs
drm/xe: Add sysfs entry to report per tile memory size - Reports actual
physical memory per respective tile

Sysfs entries will be as follows:
cat /sys/class/drm/card1/device/tileN/addr_range

V2 : 
   - Address review comments

Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Tejas Upadhyay (3):
  drm/xe: Add sysfs entry for tile
  drm/xe: Add GTs under respective tile sysfs
  drm/xe: Add sysfs entry to report per tile memory size

 drivers/gpu/drm/xe/Makefile              |  1 +
 drivers/gpu/drm/xe/xe_device_types.h     |  9 +++
 drivers/gpu/drm/xe/xe_gt_sysfs.c         |  4 +-
 drivers/gpu/drm/xe/xe_mmio.c             |  1 +
 drivers/gpu/drm/xe/xe_tile.c             |  3 +
 drivers/gpu/drm/xe/xe_tile.h             |  2 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c       | 82 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile_sysfs.h       | 19 ++++++
 drivers/gpu/drm/xe/xe_tile_sysfs_types.h | 27 ++++++++
 9 files changed, 146 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs_types.h

-- 
2.25.1

