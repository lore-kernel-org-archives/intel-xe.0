Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0A4EB64D8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 07:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA31110E4D8;
	Thu, 22 Jun 2023 07:22:37 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6D010E4D9
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 07:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687418555; x=1718954555;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OF6XzaTj3NZoo30HVzau+APckQPJbK4ZXR/G3b584Vg=;
 b=bCUCGaNeyHUn78R9kDYjorsW9azdtz/RdlMOOYv86NF+SbBPMT7Rl4tP
 QIrffpT4RTAPgW2FqmDgpVcMeX/g3grtLx8MvmZRDPxzYvLrYy6onfhnd
 RtR9ZoEKaz2+M/cDCKAPD7XsLAs4sQEFZNJFtdCi2NvHj6UVSgw0MKGaD
 h05+ml2IGnofcE0JBn1gK0couvtuPlpboBpJDf2x5zay0JWtjON7jf6NM
 XpFjC1opA+uXr/jOY7CI3N014nf0ildoptCMxwZ8vQNIUZj7f/dAndDoM
 7eVUrtth75vG69fZga/UoIcMKh8rfVW38ZqwAMZ42gEWAWffM+F/DdyId w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="350150261"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; d="scan'208";a="350150261"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 00:22:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="664939997"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; d="scan'208";a="664939997"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 22 Jun 2023 00:22:17 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 22 Jun 2023 12:58:15 +0530
Message-Id: <20230622072818.3182423-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V4 0/3] drm/xe: Add sysfs entry for tile and
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With the separation of xe_tile and xe_gt, We now consider
a PCI device (xe_device) to contain one or more tiles (struct xe_tile).
Each tile will contain one or more GTs (struct xe_gt).

Sysfs entries also needs to be aligned as follows:

drm/xe: Add sysfs entry per tile - Adds tile sysfs infrastructure
drm/xe: Add GTs under respective tile sysfs - Relates GTs to each tile
sysfs
drm/xe: Add sysfs entry to report per tile memory size - Reports actual
physical memory per respective tile

Sysfs entries will be as follows:
cat /sys/class/drm/card1/device/tileN/physical_vram_size_bytes

V4 :
   - %s/addr_range/physical_vram_size_byes, make it
     user readable name - Joonas/Aravind
   - Display in bytes - Joonas/Aravind
   - Reorder headers and modify s/LMEM/VRAM - Matt/Aravind
V3 :
   - Make tile_sysfs_init return void and warn for errors
   - Exclude DG1 as it does not have TILE_ADDR_RANGE reg
   - Use sysfs_create_files -> sysfs_create_file
V2 :
   - Address review comments

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

