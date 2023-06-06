Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B2CC77B7A
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 11:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2488E10E21E;
	Tue,  6 Jun 2023 11:07:18 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBC310E21E
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 11:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686049636; x=1717585636;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uHqk1ZYmGIWoTEsqAlW7rLlJzCJkMbJgQqtLMB4beTU=;
 b=MPweBryBhhRwgN9MXVV9ysXc0vXnUyCE4qm2aYeKaVJc/1TFyqUhgRiE
 vkW/wMxnxHjTHH4pW65mgH4Mg5ZpWvhe7Z/P4a3SDP92O08ILafAWjrua
 mQsal4rx99DPJQQY0vIDzwo+GeDHwl8d8+D5l1GN/UF3yk1F9G7Xr8xY/
 pQp8zvRcWxS8GyucGpiqaTzfR3pEvHxVTjorddxMI1c9NNGZ7Aih4Ki7M
 BPVtpQHr203vH0jXj+uDzImkG7ZBMKQYVSrZe8wNCHZK5gKRf6YCa7n25
 K8VsCEhonaJxfvPiBrW35k1UTXMCscjN/vKz58mhMnhzk4zSnXKVkRR96 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="443013952"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="443013952"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="955711812"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="955711812"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga006.fm.intel.com with ESMTP; 06 Jun 2023 04:07:14 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 16:42:52 +0530
Message-Id: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] drm/xe: Add sysfs entry for tile and relate
 it to GTs
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
Each tile will contain one or two GTs (struct xe_gt).

Sysfs entries also needs to be aligned as follows:

drm/xe: Add sysfs entry per tile - Adds tile sysfs infrastructure
drm/xe: Add GTs under respective tile sysfs - Relates GTs to each tile
sysfs
drm/xe: Add sysfs entry to report per tile memory size - Reports actual
physical memory per respective tile

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Tejas Upadhyay (3):
  drm/xe: Add sysfs entry per tile
  drm/xe: Add GTs under respective tile sysfs
  drm/xe: Add sysfs entry to report per tile memory size

 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/xe_device_types.h     |   8 ++
 drivers/gpu/drm/xe/xe_gt_sysfs.c         |   4 +-
 drivers/gpu/drm/xe/xe_mmio.c             |   1 +
 drivers/gpu/drm/xe/xe_tile.c             |   3 +
 drivers/gpu/drm/xe/xe_tile.h             |   2 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c       | 105 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile_sysfs.h       |  19 ++++
 drivers/gpu/drm/xe/xe_tile_sysfs_types.h |  27 ++++++
 9 files changed, 168 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sysfs_types.h

-- 
2.25.1

