Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5533C35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C78210EA37;
	Fri, 15 Dec 2023 15:46:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F9710EA37
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702655168; x=1734191168;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Uzo9FBelbkZ01bx+NtKuZFnDZO09seQOx4Tf7MBUFqM=;
 b=OcjKreLo5kXdbS9VhxaBBFUOBvKeYwpkCRoZnhjnNxZwv+lIhTWEn3KX
 /h2q+gD+C40XrYjU1xHdPwcBrWD6IWm7S3s4j4/ox/X2eLivGdcbNpBtI
 V1QVD11wUXIW2XUbXuuQcF/hr7bKfvLIUvbm7otW+k1xxVPIGzeIM6Kw1
 gDfdx6BiTBlMiYsNG7slxD8NIadDAzELTz42+zQOWpJyQ7BepzL9bGMoE
 7XzUtxRiEv9uI+afThZZqVqZR237kdoNK0ycHBI86Z76pR5nH9qOq9WfZ
 5p/txPNZia3r/4xvjXPbuW4m+NNpxIQbbFsHM8HsjJTZWQe5zd+yjnrVP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2141840"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2141840"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="16324356"
Received: from sdiolatz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.48.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:03 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 00/21] uAPI Alignment - More cleanup before upstream
Date: Fri, 15 Dec 2023 15:45:32 +0000
Message-Id: <20231215154553.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is a combined submission of series which have been sent and
reviewed separately:

https://patchwork.freedesktop.org/series/127365/
https://patchwork.freedesktop.org/series/127440/
https://patchwork.freedesktop.org/series/127593/
https://patchwork.freedesktop.org/series/127598/
https://patchwork.freedesktop.org/series/127764/
https://patchwork.freedesktop.org/series/127780/
https://patchwork.freedesktop.org/series/127495/
https://patchwork.freedesktop.org/series/127865/

Ashutosh Dixit (1):
  drm/xe/pmu: Remove PMU from Xe till uapi is finalized

Bommu Krishnaiah (2):
  drm/xe/uapi: add exec_queue_id member to drm_xe_wait_user_fence
    structure
  drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl

Francois Dugast (12):
  drm/xe/uapi: Remove DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
  drm/xe/uapi: Remove DRM_XE_UFENCE_WAIT_MASK_*
  drm/xe/uapi: Add a comment to each struct
  drm/xe/uapi: Add missing documentation for struct members
  drm/xe/uapi: Document use of size in drm_xe_device_query
  drm/xe/uapi: Document drm_xe_query_config keys
  drm/xe/uapi: Document DRM_XE_DEVICE_QUERY_HWCONFIG
  drm/xe/uapi: Make constant comments visible in kernel doc
  drm/xe/uapi: Add block diagram of a device
  drm/xe/uapi: Add examples of user space code
  drm/xe/uapi: Move CPU_CACHING defines before doc
  drm/xe/uapi: Move DRM_XE_ACC_GRANULARITY_* where they are used

Matthew Brost (1):
  drm/xe/uapi: Remove sync binds

Rodrigo Vivi (5):
  drm/xe/uapi: Ensure every uapi struct has drm_xe prefix
  drm/xe/uapi: Order sections
  drm/xe/uapi: More uAPI documentation additions and cosmetic updates
  drm/xe/uapi: Document the memory_region bitmask
  drm/xe/uapi: Remove reset uevent for now

 drivers/gpu/drm/xe/Makefile              |   2 -
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   5 -
 drivers/gpu/drm/xe/tests/xe_dma_buf.c    |   2 +
 drivers/gpu/drm/xe/xe_device.c           |   2 -
 drivers/gpu/drm/xe/xe_device_types.h     |   4 -
 drivers/gpu/drm/xe/xe_exec_queue.c       |   9 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   4 +-
 drivers/gpu/drm/xe/xe_execlist.c         |   7 +
 drivers/gpu/drm/xe/xe_gt.c               |  20 -
 drivers/gpu/drm/xe/xe_guc_submit.c       |  10 +
 drivers/gpu/drm/xe/xe_module.c           |   5 -
 drivers/gpu/drm/xe/xe_pmu.c              | 645 ------------------
 drivers/gpu/drm/xe/xe_pmu.h              |  25 -
 drivers/gpu/drm/xe/xe_pmu_types.h        |  68 --
 drivers/gpu/drm/xe/xe_query.c            |  19 +
 drivers/gpu/drm/xe/xe_vm.c               |  75 +--
 drivers/gpu/drm/xe/xe_vm_types.h         |  13 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c  |  91 +--
 include/uapi/drm/xe_drm.h                | 820 ++++++++++++++---------
 19 files changed, 601 insertions(+), 1225 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 delete mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 delete mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.34.1

