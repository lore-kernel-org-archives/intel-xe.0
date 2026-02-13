Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA78EDF027
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 09:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6323210E7E1;
	Fri, 13 Feb 2026 09:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHKEvA4L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF6B10E7E1
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 09:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770974781; x=1802510781;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dIrKQ8i+VB3201ZzTLsvAXaqQJipjKP9Zky8Xjl60/w=;
 b=fHKEvA4LQdqnyZ9E1UjhImqwD6qevUxYnRmodUAz+cUhH0iXmxfuUpxQ
 vDxpWgb+Hpnwy0HePF4KKKsZ19/vM/37x4IbWbXnuFmWej5jc/80kANww
 Na0sqI2q4GvNvGO/Jwvo4GanimtxXntW9tdKmPFVGFgwuj2qj82fIn6iJ
 84vIjCrK00UN0FXk3uHzuvIYKdShf24jklbbbgith8V5n+l+GS9PqX9uk
 +l+ythjKjYNixsE5GgF035mBXqe24ZufAqOPoWzHxecp5UdDne3sXR2Bi
 nSl7/htEmdqSvH47SNpBPpIyC3B/NQ3747CfY9/7cfCmUX5eURjMPFW/5 Q==;
X-CSE-ConnectionGUID: F6ja/8UOSB6aONYAHot06Q==
X-CSE-MsgGUID: o+7EBz2MT+ud0/2hOIiN7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="97615839"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="97615839"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:26:20 -0800
X-CSE-ConnectionGUID: yGlx5C+wTq2RNutY1mwrrg==
X-CSE-MsgGUID: EUP9pKyiRnuujJhssDdxQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212121229"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:26:18 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH 0/6] Add memory page offlining support
Date: Fri, 13 Feb 2026 14:55:53 +0530
Message-ID: <20260213092552.1527799-8-tejas.upadhyay@intel.com>
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
1. drm/xe/svm: Use xe_vram_addr_to_region, avoid block->private usage
2. Link and track ttm BO's with physical addresses
3. Handle the generated physical address error by reserving addresses 4K page
4. Adds supporting debugfs to inject manual physcal address error
5. Add buddy block allocation dump for debuggin buddy related issues
6. Sysfs entry to provide statistics of bad gpu vram pages for user info


Opens:
1. dump_allocated_blocks() and xe_ttm_vram_addr_to_tbo() API will move under drm_buddy,
right now just to showcase concept its part of xe code

V3: use res_to_mem_region to avoid use of block->private (MattA)
V2:
- some fixes and clean up on errors
- Added xe_vram_addr_to_region helper to avoid other use of block->private (MattB)

Tejas Upadhyay (6):
  drm/xe/svm: Use res_to_mem_region
  drm/xe: Implement VRAM object tracking ability using physical address
  drm/xe: Handle physical memory address error
  [DO NOT REVIEW]drm/xe/cri: Add debugfs to inject faulty vram address
  drm/xe: Add routine to dump allocated VRAM blocks
  [DO NOT REVIEW]]drm/xe/cri: Add sysfs interface for bad gpu vram pages

 drivers/gpu/drm/xe/xe_bo.c                 |   2 +-
 drivers/gpu/drm/xe/xe_bo.h                 |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c            |  49 +++
 drivers/gpu/drm/xe/xe_device_sysfs.c       |   2 +
 drivers/gpu/drm/xe/xe_svm.c                |   8 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 355 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   6 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  23 ++
 8 files changed, 437 insertions(+), 9 deletions(-)

-- 
2.52.0

