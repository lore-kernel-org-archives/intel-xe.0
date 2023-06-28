Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E403EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 07:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3290A10E363;
	Wed, 28 Jun 2023 07:09:22 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FE910E0C7
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 07:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687936160; x=1719472160;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ne1BBdXMZgWY8gITBAvxuddRL5sqUlSHLYisFxbN3aU=;
 b=U4bhZszr7iDOpOJxAV7qsi3Ja82Qn+qSe7lN1wCvVCIWYhf6Ie7gIMIp
 ypDO+iyXQzCs0oPLJs4korrnlGLB1+Jsb03tjFE4dyLgvx21jnR4NMdWa
 DeKaDiDINDQ9AJvSdMbCWBza7hsZK2nzftnhi8sX+hhDdfCfsN90Vce2Q
 /wCnoNFesFCJxTOwTYcpiUyvle3gdtOv81n9toWFOwMTAjXIfm/ZWoTr6
 vQCwu1CqfjdOJoelwcqzcAAjytkOrE/g+vv8x5DKHefYcTDJxrXXfGb4Y
 Ly/iR9aX1V1uKZd+coO8aLnV8b/D4KistnRXGSa5OT0okGRdfqySvTg4K Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="427777658"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="427777658"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 00:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="666984047"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="666984047"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 28 Jun 2023 00:09:18 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jun 2023 12:45:23 +0530
Message-Id: <20230628071527.3579428-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V5 0/4] drm/xe: Add sysfs entry for tile and
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

V5 :
   - Rename vram struct member size to usable size - Lucas
   - define ktype struct to const - Himal
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

Tejas Upadhyay (4):
  drm/xe: Add sysfs entry for tile
  drm/xe: Add GTs under respective tile sysfs
  drm/xe: Add sysfs entry to report per tile memory size
  drm/xe: Make usable size of VRAM readable

 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h          | 19 ++++-
 drivers/gpu/drm/xe/xe_gt_sysfs.c              |  4 +-
 drivers/gpu/drm/xe/xe_mmio.c                  |  7 +-
 drivers/gpu/drm/xe/xe_query.c                 |  2 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  5 +-
 drivers/gpu/drm/xe/xe_tile.h                  |  2 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c            | 78 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile_sysfs.h            | 19 +++++
 drivers/gpu/drm/xe/xe_tile_sysfs_types.h      | 27 +++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  3 +-
 13 files changed, 159 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs_types.h

-- 
2.25.1

