Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279F7C7EE29
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 07:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86A510E594;
	Thu,  8 Jun 2023 07:40:05 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E718F10E594
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 07:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686210003; x=1717746003;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+N2Pr4qqgGTZ1QRoar9EXqBz/2p0trHKFUJCyNt9PWk=;
 b=GOtnH4cT1593WoO4YG1R5KIkbd2he/OQiHfC7R7s0mDOORdhiu3pMX3O
 jgaXcmAJfrdDtd6aF94ATNHitPvtrqkGlyoTYWrcgEs8ZQLg1RQhFuacj
 tnhw7JLgr7KrXQbdfKna41J4x4sSElx9i+zEWNmat5YfcyuBU4VJwSbTY
 t7AucFTQEJeAf/MOpMmPymdWjiw2+FArlo1Wtt8MrwD2y6ETY1+uB7fg3
 1k2SXvfx+zwhoz2O+nKzqgkK6a/kU389UWAhCv9tfROhuetXK3hZFHWIJ
 /XbXKTaeD4HGdP6udPrvD4LrV4sWG7Z/uLzKebOuw1GaiBidT9ga7zlxA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="357245673"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="357245673"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 00:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="660279560"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="660279560"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 08 Jun 2023 00:40:01 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  8 Jun 2023 13:15:41 +0530
Message-Id: <20230608074544.2186318-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V3 0/3] drm/xe: Add sysfs entry for tile and
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

V3 :
   - Make tile_sysfs_init return void and warn for errors
   - Exclude DG1 as it does not have TILE_ADDR_RANGE reg
   - Use sysfs_create_files -> sysfs_create_file
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
 drivers/gpu/drm/xe/xe_tile_sysfs.c       | 78 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile_sysfs.h       | 19 ++++++
 drivers/gpu/drm/xe/xe_tile_sysfs_types.h | 27 ++++++++
 9 files changed, 142 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs_types.h

-- 
2.25.1

