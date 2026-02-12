Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D551EE3695
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 16:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F85610E29C;
	Thu, 12 Feb 2026 16:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A9NC6g+z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF0C10E29C
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 16:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770914098; x=1802450098;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DYvucV0PATNec7INPO5XyStvlM+A0IfdAaPy5WYudxE=;
 b=A9NC6g+z7ZwrUs5OWhx4g6omWj90J8IzsNKPMX/9Sao8Rqfti4BJPG8+
 XZJOsGvDwkWPpGwDSPiWHY9iJ4hElCIkfV7m9L+k1AfNTA/l1NPzHeFdP
 MC5lvLtwKZBVmz3Zt1I/QJCSBTRYIZj0ExJn3C5Wlx10B5GFy8Ei1ttbs
 tV/BGSatw62YjBw60TIfgmO75BnbG6u5CqAtmAAhan8gKMDqK0s0GqjxY
 JXODZgsR1LlTU5KtD2ZCTUhViA/e5lmPKRlvjFbyXjm0nuBoTZUV1KHEW
 Q5UaudkgbgCXruvwwBT0JoXp0UanjrNA42e4mpht99j+BWgpMrKUkfqme g==;
X-CSE-ConnectionGUID: /LVYPeC7S66aej/XRQ3NeQ==
X-CSE-MsgGUID: hPh+cygKQHWXGCdhcE+hLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89498514"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="89498514"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 08:34:58 -0800
X-CSE-ConnectionGUID: S0TicHKRTBi1r6iSzYfbCA==
X-CSE-MsgGUID: 1gu/gtkeRryitcduT2MiJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="235634002"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 08:34:55 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH 0/7] Add memory page offlining support
Date: Thu, 12 Feb 2026 22:04:40 +0530
Message-ID: <20260212163439.1514363-9-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This functionality represents a significant step in making
the xe driver gracefully handle hardware memory degradation.
By integrating with the DRM Buddy allocator, the driver
can permanently "carve out" faulty memory so it isn't reused
by subsequent allocations.

This series adds memory page offlining support with following:
1. Add a helper to get vram region from physical address to used in second patch
2. drm/xe/svm: Use xe_vram_addr_to_region, avoid block->private usage
3. Link and track ttm BO's with physical addresses
4. Handle the generated physical address error by reserving addresses 4K page
5. Adds supporting debugfs to inject manual physcal address error
6. Add buddy block allocation dump for debuggin buddy related issues
7. Sysfs entry to provide statistics of bad gpu vram pages for user info


Opens:
1. dump_allocated_blocks() and xe_ttm_vram_addr_to_tbo() API will move under drm_buddy,
right now just to showcase concept its part of xe code

V2: 
- some fixes and clean up on errors
- Added xe_vram_addr_to_region helper to avoid other use of block->private (MattB)

Tejas Upadhyay (7):
  drm/xe: Add a helper to get vram region from physical address
  drm/xe/svm: Use xe_vram_addr_to_region
  drm/xe: Implement VRAM object tracking ability using physical address
  drm/xe: Handle physical memory address error
  drm/xe/cri: Add debugfs to inject faulty vram address
  drm/xe: Add routine to dump allocated VRAM blocks
  [DO NOT REVIEW]drm/xe/cri: Add sysfs interface for bad gpu vram pages

 drivers/gpu/drm/xe/xe_debugfs.c            |  49 +++
 drivers/gpu/drm/xe/xe_device_sysfs.c       |   2 +
 drivers/gpu/drm/xe/xe_svm.c                |   9 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 355 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   6 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  23 ++
 drivers/gpu/drm/xe/xe_vram.c               |  16 +
 drivers/gpu/drm/xe/xe_vram.h               |   1 +
 8 files changed, 453 insertions(+), 8 deletions(-)

-- 
2.52.0

