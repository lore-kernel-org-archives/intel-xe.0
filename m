Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B95AC6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 15:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA1010E06D;
	Fri, 17 Mar 2023 15:36:12 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0FF10E06D
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 15:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679067370; x=1710603370;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GCxXd1qCAU6fkDlN/LGa0a3f7x2caT+wlkBK+LT8iPc=;
 b=JeGNk0Kpy1PymHsNDgNGftATE/lN2SSeHmYBAxL0g+koz3S+H4g01nJ1
 aOSUH/4WCkLLOpkCwRXhxGwnm8ueyahXlUciSPTF86lztm4vW+T4VBVbC
 MboF0az9/YttVH5eFrW3duKq/NLtC6x4kBBLn4121MVTcKIgc9/gXm1Lk
 x0vG/g0u/rUvTQPeM5/dt5h7TeTyoVj2FsMyRbyvg3ADvNhm3VI8wu0vN
 kd/54hcWDMZdje7wSgzymp+jNnm1eVowK0lLLVZkhkoXSTQ4Rpy9zRQOd
 78xi6ECRe7vLoOlWr73Hb6Y5y57ZL4jgxGD0OhoqcP4jXbAJKePinvREq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="424557332"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="424557332"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 08:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="926186997"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="926186997"
Received: from ambatirx-mobl2.gar.corp.intel.com (HELO
 bvivekan-mobl.fritz.box) ([10.215.117.35])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 08:35:48 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Mar 2023 21:05:29 +0530
Message-Id: <20230317153531.1011865-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/2] drm/xe: Skip XY_FAST_COLOR instruction on
 link copy engines
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use MEM_SET instructions as alternative on platforms with link copy
engines which does not support the XY_FAST_COLOR instruction.

v5:
  - Modified xe_migrate_clear() function to stop accepting values for
    setting. This function now only clears the memory region to 0. (Lucas)

v4:
  - Modified the patch such that when using MEM_SET instruction, only
    allow clearing the memory region, setting of value is not supported.
  - Adapt migrate sanity kunit tests for platforms with link copy
    engines (Niranjana).

v3:
  - bitmask definitions reorder with most significant bit first (Lucas)
  - s/GRAPHICS_VERx100(gt->xe)/GRAPHICS_VERx100(xe) (Niranjana)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Balasubramani Vivekanandan (2):
  drm/xe: Stop accepting value in xe_migrate_clear
  drm/xe: Skip XY_FAST_COLOR instruction on link copy engines

 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  9 +++
 drivers/gpu/drm/xe/tests/xe_bo.c          |  2 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c     | 16 +++---
 drivers/gpu/drm/xe/xe_bo.c                |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h      |  2 +
 drivers/gpu/drm/xe/xe_migrate.c           | 69 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_migrate.h           |  3 +-
 drivers/gpu/drm/xe/xe_pci.c               |  4 ++
 8 files changed, 83 insertions(+), 24 deletions(-)

-- 
2.25.1

