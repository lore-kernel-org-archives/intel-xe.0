Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC39C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9997210E4A0;
	Wed, 26 Jul 2023 16:09:59 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B7610E49D
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690387798; x=1721923798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jI1mZTSWKhQJw1Xlvq0QqWX+aijbNbFLrDu8wLLhNDs=;
 b=eAbXK94ZXG7TAjrec7kE1BB5DQ9JD4SMBF1FIZM+Zthbqhb05fDs+x/4
 hU47mlZIAO/XU2VE2rBMcRf/480jLmNJ7NV9eICYibMwex3Ye3myUIpsz
 WPDJS/TQJloX4BR/u2L395ltgfxnfSpht2j8030+UeWmmtV2WuN/v7cbV
 YSU82rSdqNmUSXmEn3KLb70astSVS6fa2uZbgNxii1+EioTMUOfAoZduW
 cTEeVbg8VHd0AD38cqQfFLK2oW7CFVBJDMyiOvaboNPzAt1k3TYkm+Mwa
 JA5zVjNhdofXlHCnbvdvCF3i9M/1XVeDF6epMalBg5rR5ItDF4zw1Crrl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="398994890"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="398994890"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057279350"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="1057279350"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 09:06:58 -0700
Message-Id: <20230726160708.3967790-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 00/10] Fix stolen setup for MTL+
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
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With this we don't get pipe faults anymore and console is usable.

v2:
  - Include fixup to bo accounting previously sent as a standalone
    patch (https://patchwork.freedesktop.org/patch/545876/). This fixes
    the module removal with display enabled
  - A few fixes, dead code removal and cleanups that I noticed while
    fixing stolen
  - Fix the wopcm calculation as it was missing the * SZ_1M
  - Re-sort the xe_regs.h removing the exceptions

Lucas De Marchi (9):
  fixup! 57f0bc550693ad29726bf2a71d05af0dc2d0a542
  drm/xe: Fix checking for unset value
  drm/xe: Remove vma arg from xe_pte_encode()
  drm/xe: Decouple vram check from xe_bo_addr()
  drm/xe: Set PTE_DM bit for stolen on MTL
  fixup! drm/xe/display: Implement display support
  drm/xe: Fix MTL+ stolen memory mapping
  drm/xe: Carve out top of DSM as reserved
  drm/xe: Sort xe_regs.h

Maarten Lankhorst (1):
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/i915/display/intel_fb.c       | 10 ++-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  4 +-
 .../gpu/drm/i915/display/intel_frontbuffer.c  |  4 -
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  9 +--
 drivers/gpu/drm/xe/regs/xe_regs.h             | 75 ++++++++-----------
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                    | 30 +++++---
 drivers/gpu/drm/xe/xe_bo.h                    | 15 ++--
 drivers/gpu/drm/xe/xe_ggtt.c                  |  7 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 28 +++----
 drivers/gpu/drm/xe/xe_pt.c                    | 62 ++++-----------
 drivers/gpu/drm/xe/xe_pt.h                    |  4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        | 23 +++++-
 drivers/gpu/drm/xe/xe_vm.c                    | 10 ++-
 14 files changed, 125 insertions(+), 158 deletions(-)

-- 
2.40.1

