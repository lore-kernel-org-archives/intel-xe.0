Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A83FC83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 21:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C672810E054;
	Tue, 15 Jul 2025 21:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VxgaI9Fc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352AD10E68D
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 21:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752614497; x=1784150497;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dFU84al8ix/E2JXICp1/XX/q4YDiQRFaimp5UQZhu3Y=;
 b=VxgaI9Fc2F7fdl7d6Ummf1ArVO9+sFZh9tEOwbdKfkDrltXaWXLvzBAk
 QQL0pSar6ygPh8sf9CAVyvsxFTxDHznTar+1s92QOzyBk/Efv1RdJvIOl
 aa/ybRvKyrxEsxDgjSWYlZBPxaX3RhXygyD9TGfXyIPfh0Zrc0bEe0I4I
 7oEJ9jP9/wMQ1WdnTdJpBZMtNt3+fO95T099eRyohl+OMH/bnwsoIAIQ+
 aLIpb7169KixFj400dk/WeCzV+EgonmV+TFoOm1Rj+iiHXZA91JeOKfw8
 4D6t1of1BxM/x7YXJozxkTTGHTqFjAgN/KhPvSXutNVkMT6DDA+UyiMAf Q==;
X-CSE-ConnectionGUID: X4nvqjNlTMeb4hwkOQgR5Q==
X-CSE-MsgGUID: yICRQbvESNurYW9wkihZ7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54999481"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="54999481"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:21:36 -0700
X-CSE-ConnectionGUID: B1LJsZX6RgyZgpYa8mMiAA==
X-CSE-MsgGUID: Ixy6qeMKSCiCDyjkBLJ3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="156733517"
Received: from dut158arls.fm.intel.com ([10.105.23.70])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:21:36 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, matthew.auld@intel.com,
 maarten.lankhorst@linux.intel.com, intel-xe@lists.freedesktop.org,
 stuartsummers <stuart.summers@intel.com>
Subject: [PATCH 0/4] Basic TLB inval refactor
Date: Tue, 15 Jul 2025 21:21:21 +0000
Message-Id: <20250715212125.337195-1-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Just a few refactors for the TLB invalidation related
files written by Matt. Couple of these have already been
reviewed and I did some small rebasing on the latest.

Working on building some of his other recent changes
plus a few others that have been floating around on
top of this. Doing this series explicitly first since
this is a reduced overall scope.

Matthew Brost (4):
  drm/xe: Explicitly mark migration queues with flag
  drm/xe: Remove unused GT TLB invalidation trace points
  drm/xe: s/tlb_invalidation/tlb_inval
  drm/xe: Add xe_tlb_inval structure

 drivers/gpu/drm/xe/Makefile                   |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |   2 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |   6 +-
 drivers/gpu/drm/xe/xe_gt.c                    |   8 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |   1 -
 ...t_tlb_invalidation.c => xe_gt_tlb_inval.c} | 239 +++++++++---------
 drivers/gpu/drm/xe/xe_gt_tlb_inval.h          |  40 +++
 drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h    |  62 +++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  40 ---
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  32 ---
 drivers/gpu/drm/xe/xe_gt_types.h              |  31 +--
 drivers/gpu/drm/xe/xe_guc_ct.c                |   8 +-
 drivers/gpu/drm/xe/xe_lmtt.c                  |  12 +-
 drivers/gpu/drm/xe/xe_migrate.c               |   6 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +-
 drivers/gpu/drm/xe/xe_pci_types.h             |   2 +-
 drivers/gpu/drm/xe/xe_pt.c                    |  61 ++---
 drivers/gpu/drm/xe/xe_svm.c                   |   4 +-
 drivers/gpu/drm/xe/xe_trace.h                 |  40 +--
 drivers/gpu/drm/xe/xe_vm.c                    |  64 +++--
 drivers/gpu/drm/xe/xe_vm.h                    |   4 +-
 22 files changed, 325 insertions(+), 349 deletions(-)
 rename drivers/gpu/drm/xe/{xe_gt_tlb_invalidation.c => xe_gt_tlb_inval.c} (62%)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h

-- 
2.34.1

