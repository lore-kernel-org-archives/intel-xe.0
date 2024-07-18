Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439C6C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 18:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA0C10EAC1;
	Thu, 18 Jul 2024 18:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4Ta5gKY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FD510EABD
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 18:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721328896; x=1752864896;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u1c84FnHqLJ8Tv/HmL6u+MJuhHmomuRVM9KFwfcHe6k=;
 b=G4Ta5gKYNyp2faNvXWxhDoeb+dipeQtuF27BgmQpSvTtdrk/Dp32bydQ
 rqWKRYjsaO2ZHCQMy2Frv/40/PZUBjAd0NfNQRU5XiTSO2zD5/EdlN6uA
 PSU794sgyUXuzrVZ/4cqCjBYcscnvKRG1ajzO/oFKLFtmaZlkFw3rzsT7
 5vYLI5PflsbvYXC/kaYKM6xLiOAJY0U5uovqLGYlpk17aUkAJ6lNcdtOr
 JT/BU2oQgQFddPl7QJ+bhFc4kD8r+xOGM2qUGy4HlZZtILnaUt//+V+IF
 Pa42mqra6FmMdx/hPZL4v8g/MVLBpKU0gJond2c1Qltao8xpUQnHxTGUR w==;
X-CSE-ConnectionGUID: V5zaHo81RDCCOEEBjayOVQ==
X-CSE-MsgGUID: PaMFYQJwSJ681Q2VHiZddQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="21816219"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="21816219"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 11:54:46 -0700
X-CSE-ConnectionGUID: Rvuug2qJQauQSkvykh/Pgg==
X-CSE-MsgGUID: ISYuHnoARRKtyeyo1e6KWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="51152676"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 11:54:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/4] Keep device awake TLB invalidations and G2H in flight
Date: Thu, 18 Jul 2024 11:55:27 -0700
Message-Id: <20240718185531.1500815-1-matthew.brost@intel.com>
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

Combine [1], [2] to fix PM issues

[1] https://patchwork.freedesktop.org/series/136226/
[2] https://patchwork.freedesktop.org/series/136219/

Matthew Brost (4):
  drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
  drm/xe: Drop xe_gt_tlb_invalidation_wait
  drm/xe: Hold a PM ref when GT TLB invalidations are inflight
  drm/xe: Build PM into GuC CT layer

 drivers/gpu/drm/xe/xe_device.c                |   4 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 201 ++++++++++--------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  12 +-
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |   4 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |  10 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |   4 +
 drivers/gpu/drm/xe/xe_pt.c                    |  26 +--
 drivers/gpu/drm/xe/xe_vm.c                    |  32 +--
 8 files changed, 160 insertions(+), 133 deletions(-)

-- 
2.34.1

